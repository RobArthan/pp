/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: pterm.c,v 2.7 2000/01/04 16:04:24 rda Exp rda $
 *
 * pterm.c -  pseudo-terminal operations for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993, 1994
 * 
 * This implements the  pseudo-terminal in which the interactive program is
 * run.
 *
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _pterm
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>

#ifndef LINUX
#include <stropts.h>
#include <sys/filio.h>
#include <sys/termio.h>
#else
#include <termio.h>
#endif

#include <signal.h>

#include <sys/termios.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#include "X11/cursorfont.h"
#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define STDIN 0
#define STDOUT 1
#define STDERR 2

#ifdef LINUX
#define sigset signal
#endif

/* For the following see "Data transfer to application" below */
#define MAX_Q_LEN 40000		/* see "Data transfer to application" below */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * global, static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

extern int errno;

static int control_fd;

static pid_t child_pid;

static XtInputId app_ip_req;

static Boolean listening;

/* For the following three see "Data transfer to application" below */
static char queue[MAX_Q_LEN];
static NAT q_length = 0;
static NAT q_head = 0;

/* Messages for various purposes */

static char *cmd_too_long_message = 
"The command is too long (%d bytes supplied; max. %d bytes).";

static char* signal_handled_message1 =
"system error reported";

static char* signal_handled_message2 =
"attempting to save the editor text";

static char* signal_handled_message3 =
"apparently during X initialisation";

static char* send_error_message = 
"A system error occurred writing to the application.";

static char* carry_on_waiting_message = 
"The application does not seem to have responded to the interrupt."
" Do you want to continue waiting for a response?";



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Pseudo-terminal initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


void get_pty()
{
	char c;
	int one = 1;
	int slave_fd;
	char *slavename;
	char *ptsname();
	int i;
	static void get_from_application();
	struct termios tio;

#ifndef LINUX
/* On non-Linux (i.e., SVR4) we use the grantpt/lockpt interfaces */
/* and do the termio set-up in the child process */
	if ((control_fd = open("/dev/ptmx", O_RDWR)) < 0) {
		msg("system error", "no pseudo-terminal devices available (1)");
		perror("xpp");
		exit(1);
	};
	if(	grantpt(control_fd) < 0
	||	unlockpt(control_fd) < 0
	||	(slavename = ptsname(control_fd)) == NULL
	||	(slave_fd = open(slavename, O_RDWR)) < 0 ) {
		msg("system error", "cannot access pseudo-terminal slave device (2)");
		perror("xpp");
		exit(2);
	};
#else 
/* On Linux we have to look for a pseudo-terminal ourselves */
/* We do the termio set-up prior to the fork. */
	char line[32];
	for(control_fd = -1, c = 'p'; control_fd < 0 && c <= 's'; c++) {
		for(i = 0; control_fd < 0 && i < 16; i++) {
			sprintf(line, "/dev/pty%c%x", c, i );
	      		control_fd = open(line, O_RDWR);
	      		if(control_fd >= 0) {
	          		line[sizeof "/dev/" - 1] = 't';
				slave_fd = open(line, O_RDWR);
				if(slave_fd < 0) {
/* no good - can't access slave side, go round again */
	          			line[sizeof "/dev/" - 1] = 'p';
					close(control_fd);
					control_fd = -1;
				}
			}
		}
	}

	if( control_fd < 0) {
		msg("system error", "no pseudo-terminal devices available (1)");
		perror("xpp");
		exit(1);
	}

	if(ioctl(slave_fd, TCGETS, &tio) < 0 ) {
		msg("system error", "ioctl on slave fd failed (11)");
		perror("xpp");
		exit(11);
	}
	tio.c_lflag |= ISIG;
	tio.c_lflag |= ICANON;
	tio.c_lflag &= ~ECHO;
	tio.c_lflag &= ~PENDIN;
	tio.c_lflag &= ~NOFLSH;
	tio.c_lflag &= ~TOSTOP;
	tio.c_oflag &= ~OLCUC;
	tio.c_oflag &= ~ONLCR;
	tio.c_oflag &= ~XTABS;
	tio.c_oflag |= OCRNL;
	tio.c_cc[VINTR] = CINTR;
	if(ioctl(slave_fd, TCSETS, &tio) < 0 ) {
		msg("system error", "ioctl on slave fd failed (12)");
		perror("xpp");
		exit(12);
	}
#endif

	child_pid = fork();
	if (child_pid < 0) { /* Cannot do */
		msg("system error", "fork failed");
		perror("xpp");
		exit(5);
	} else if (child_pid > 0) { 
 /******************************************************************/
 /* Parent */
 /******************************************************************/
		close(slave_fd);
		if(fcntl(control_fd, F_SETFL, O_NDELAY) < 0) {
			msg("system error", "fcntl on application would not permit non-blocking i/o");
			perror("xpp");
			exit(7);
		};
		if(ioctl(control_fd, FIONBIO, &one) < 0) {
			msg("system error", "ioctl on control fd failed");
			perror("xpp");
			exit(8);
		};
		app_ip_req = XtAppAddInput(app,
			control_fd, (XtPointer) XtInputReadMask,
			get_from_application, NULL);
		listening = True;
		write(control_fd, "\n", 1);	/* Tell child to exec */

	} else { 
 /******************************************************************/
 /* Child */
 /******************************************************************/
		char	buf;
		char **arglist;
		int tty_fd;
		close(control_fd);
		dup2(slave_fd, STDIN);
		dup2(slave_fd, STDOUT);
		dup2(slave_fd, STDERR);
		if (slave_fd > 2) {
			close(slave_fd);
		};
		if((tty_fd = open("/dev/tty", O_RDWR)) >= 0){
		    ioctl(tty_fd, TIOCNOTTY, 0);
		    close(tty_fd);
		}
		if(setsid() < 0) {
			msg("system error", " setsid failed");
			perror("xpp");
			exit(9);
		};
		read(STDIN, &buf, 1);		/* Wait until told */
#ifndef LINUX
		if(	ioctl(STDIN, I_PUSH, "ptem") < 0
		||	ioctl(STDIN, I_PUSH, "ldterm") < 0 
		||	ioctl(STDIN, I_PUSH, "ttcompat") < 0
		||	ioctl(STDIN, TCGETS, &tio) < 0 ) {
			msg("system error", "ioctl on slave fd failed");
			perror("xpp");
			exit(10);
		};
		tio.c_lflag |= ISIG;
		tio.c_lflag |= ICANON;
		tio.c_lflag &= ~ECHO;
		tio.c_lflag &= ~PENDIN;
		tio.c_lflag &= ~NOFLSH;
		tio.c_lflag &= ~TOSTOP;
		tio.c_oflag &= ~OLCUC;
		tio.c_oflag &= ~ONLCR;
		tio.c_oflag &= ~XTABS;
		tio.c_oflag |= OCRNL;
		tio.c_cc[VINTR] = CINTR;
		if(ioctl(STDIN, TCSETS, &tio) < 0 ) {
			msg("system error", "ioctl on slave fd failed");
			perror("xpp");
			exit(11);
		}
#endif

		arglist = get_arg_list();
		execvp(arglist[0], arglist);
	/* **** error if reach here **** */
		msg("system error", "could not exec");
		exit(1);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Test whether the application is alive.
 * Also does some tidy-up:
 *	1) non-blocking wait to reap child if it has died.
 *	2) if child has died, and Xt is still listening for it
 *	   then tell it to stop.
 *	3) close the control and slave file descriptors.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean application_alive()
{
	if(child_pid) {
		waitpid(child_pid, NULL, WNOHANG);
		if( kill(child_pid, 0) < 0 ) {
			if(listening) {
				XtRemoveInput(app_ip_req);
				listening = False;
			};
			close(control_fd);
			return False;
		} else {
			return True;
		}
	} else {
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer from application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void get_from_application(
	XtPointer	unused_p,
	int		*unused_source,
	XtInputId	*unused_id)
{
	int ct;
	char buf[BUFSIZ + 1]; /* allow for null-termination in scroll_out */
	static Boolean get_from_app_work_proc();
	if((ct = read(control_fd, buf, BUFSIZ)) > 0) {
		scroll_out(buf, ct, False);
	}
	if(ct == BUFSIZ) { /* Probably more to do */
		XtRemoveInput(app_ip_req);
		XtAppAddWorkProc(app, get_from_app_work_proc, (XtPointer) NULL);
	}		
}

static Boolean get_from_app_work_proc(XtPointer unused_p)
{
	int ct;
	char buf[BUFSIZ+1]; /* allow for null-termination in scroll_out */
	if((ct = read(control_fd, buf, BUFSIZ)) > 0) {
		scroll_out(buf, ct, False);
	}
	if(ct == BUFSIZ) { /* Probably more to do */
		return False;	/* arrange to be called again */ 
	} else	{
		app_ip_req = XtAppAddInput(app,
			control_fd, (XtPointer) XtInputReadMask,
			get_from_application, NULL);
		return True;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer to application:
 * To cope with executing long command line sequences, this
 * is done using a (currently fixed size) queue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dequeue tries to write out the command line at the head of the
 * queue. To simplify the coding and particularly the memory
 * management, if the line to be written out cross the boundary
 * at the end of the cyclic buffer containing the queue data,
 * the line is taken to end at that boundary.
 * It returns true iff. it reduced the size of the queue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean dequeue()
{
	long int bytes_written, line_len, i, top;
	Boolean sent_something = False;
	Boolean sys_error = False;

/* nothing to do if the queue is empty */
	if(q_length == 0) {
		return False;
	};

/* no way of emptying the queue if there's no application running: */

	if(!application_alive()) {
		return False;
	};

/* something to do; find the next command line:*/

	top = ((i = q_head + q_length) > MAX_Q_LEN ? MAX_Q_LEN : i);

	for(i = q_head; i < top && queue[i] != '\n'; ++i) {
		continue;
	};

	line_len = (i < top ? i - q_head + 1 : i - q_head);

/* try to send the command line: */
	while(!sent_something && !sys_error && line_len) {
		bytes_written = write(control_fd, queue + q_head, line_len);
		sent_something = bytes_written > 0;

		if(bytes_written < 0) {
			if(errno = EWOULDBLOCK) {
/* try to send a bit less */
				--line_len;
			} else {
				perror("xpp");
				sys_error = True;
				ok_dialog(root, send_error_message);
			}
		}
	};

/* display what was sent, if anything: */

	if(sent_something)  {
		scroll_out(queue + q_head, bytes_written, True);
		q_head = (q_head + bytes_written) % MAX_Q_LEN;
		q_length -= bytes_written;
	};

	return sent_something;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * enqueue tries to add its argument text to the queue. First
 * it attempts to dequeue things.
 * It returns true if it got its argument onto the queue.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static Boolean enqueue(buf, siz)
char *buf;
NAT siz;
{
	NAT buf_i, q_i;
/* Make room, if we can: */

	while(dequeue()) {
		continue;
	};
/* If no room now, there's no hope: */

	if(siz > MAX_Q_LEN - q_length) {
		return False;
	};

	q_i = (q_head + q_length) % MAX_Q_LEN;

/* Put data onto the queue: */

	for(buf_i = 0; buf_i < siz && q_i < MAX_Q_LEN; ++buf_i) {
		queue[q_i++] = buf[buf_i];
	};

	for(q_i = 0; buf_i < siz; ++q_i) {
		queue[q_i] = buf[buf_i++];
	};

	q_length += siz;

/* Have a go at flushing the queue: */

	while(dequeue()) {
		continue;
	}

	return True;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Time-out function for draining the queue when it can't
 * be emptied immediately by enqueue
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void try_drain_queue(w)
Widget w;
{
/* If there's something in the queue try to process it */
	if(q_length) {
		while(dequeue()) {
			continue;
		}
	};

/* If there's still something in the queue ask to be called again: */

	if(q_length) {
		XtAppAddTimeOut(app, 25,
			(XtTimerCallbackProc)try_drain_queue, w);
	};
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * clear_queue clears out the queue by reinitialising q_length.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static void clear_queue ()
{
	q_length = 0;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Send commands to the application via the queue
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void send_to_application (buf, siz)
char *buf;
NAT siz;
{

/* Check there's something listening: */
	if(!application_alive()) {
		return;
	};

/* Check if the command could never fit in the queue: */

	if(siz > MAX_Q_LEN) {
		char msg[256];
		sprintf(msg, cmd_too_long_message, siz, MAX_Q_LEN);
		ok_dialog(root, msg);
		return;
	};

/* Send it off: */

	enqueue(buf, siz);

/* Call the timeout function to arrange to drain the queue if needed: */

	try_drain_queue(root);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interrupt the applications (as with Cntl-C): 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void interrupt_application ()
{
	clear_queue();
	if(application_alive()) {
#ifndef LINUX
		ioctl(control_fd, I_FLUSH, FLUSHW);
#endif
		kill((pid_t)(-child_pid), SIGINT);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interrupt the application (as with Cntrl-C) and then poll
 * for the interrupt prompt and send the reply set up for
 * abandoning command execution. 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void interrupt_and_abandon ()
{
	static Boolean wait_for_prompt();
	interrupt_application();
	if(	application_alive()
	&&	*(global_options.abandon_reply)
	&&	wait_for_prompt()) {
		send_to_application(
			global_options.abandon_reply,
			strlen(global_options.abandon_reply));
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Get output from the application looking for the interrupt prompt.
 * Ask the user what to do if no prompt is found within about 10 seconds.
 * If the user wants to carry on waiting,it asks the user what to do about
 * every 30 seconds after the first try.
 * Returns True if the prompt is found; False if the user says to
 * give up trying.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean wait_for_prompt()
{
	int ct, prompt_len, tries, delay;
	Boolean got_prompt, result;
	XmTextPosition last;
	char buf[BUFSIZ + 1]; /* allow for null-termination in scroll_out */
	char * prompt_buf;

	prompt_len = strlen(global_options.interrupt_prompt);

	if(prompt_len == 0) {
		return True;
	}
	if( !(prompt_buf = XtMalloc(prompt_len+1)) ) {
		return False;
	}
	got_prompt = result = False;
	tries = 0;
	delay = 10;
	while(True) {
		if((ct = read(control_fd, buf, BUFSIZ)) > 0) {
			scroll_out(buf, ct, False);
			last = XmTextGetLastPosition(journal);
			got_prompt =
					last > prompt_len
				&&	XmTextGetSubstring(journal,
						last - prompt_len,
						prompt_len,
						prompt_len+1,
						prompt_buf) == XmCOPY_SUCCEEDED
				&&	!strcmp(prompt_buf,
						 global_options.interrupt_prompt);
		}
		if(got_prompt) {
			result = True;
			break;
		}
		if(++tries >= delay) {
			if(!yes_no_dialog(root, carry_on_waiting_message)) {
				result = False;
				break;
			}
			XFlush(XtDisplay(root));
			tries = 0;
			delay = 30;
		} else {
			sleep(1);
		}
	}
	XtFree(prompt_buf);
	return result;	
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Send new line to the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void send_nl ()
{
	char *buf = "\n";

	send_to_application(buf, 1);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Kill the application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void kill_application ()
{
	clear_queue();
	if(application_alive()) {
		if(listening) {
			XtRemoveInput(app_ip_req);
			listening = False;
		};
		kill((pid_t)(-child_pid), SIGKILL);
		kill(child_pid, SIGKILL);
		waitpid(child_pid, NULL, WUNTRACED);
		close(control_fd);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Restart the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void restart_application () {
	kill_application();
	get_pty();
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Ctrl-C Signal handling for the controller process.
 * Following treats Ctrl-C similarly to window close
 * or selection of quit from the command menu.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sigint_handler(int sig)
{
	XtAppAddTimeOut(app, 0, (XtTimerCallbackProc) check_quit_cb, root);
#ifdef LINUX
	sigset(SIGINT, sigint_handler);
#endif
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * panic_exit: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void panic_exit(char * m, NAT code)
{
	if(application_alive()) {
		kill_application();
	}
	if(script) {
		msg(m, signal_handled_message2);
		panic_save(script);
	} else {
		msg(m, signal_handled_message3);
	}
	exit(code);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Other signal handling for the controller process.
 * Try to save the editor text if the widget's there then bomb out.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sigother_handler(int sig)
{
	panic_exit(signal_handled_message1, (NAT)sig);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * xt_error_handler
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void xt_error_handler(char * m)
{
	panic_exit(m, 2);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * handle signals and Xt errors: the derivation of the following list
 * of OS signals to handle not very scientific, but seems to catch
 * the common problems.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void handle_sigs()
{
	sigset(SIGINT, sigint_handler);
	sigset(SIGSEGV, sigother_handler);
	sigset(SIGBUS, sigother_handler);
	sigset(SIGFPE, sigother_handler);
#ifndef LINUX
	sigset(SIGSYS, sigother_handler);
#endif
	XtAppSetErrorHandler(app, xt_error_handler);
}


