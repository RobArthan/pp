/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: pterm.c,v 2.18 2002/08/13 07:35:50 rda Exp $
 *
 * pterm.c -  pseudo-terminal operations for the X/Motif ProofPower
 * Interface
 *
 * pterm.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
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
#include <stdlib.h>

#include "X11/cursorfont.h"
#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define STDIN 0
#define STDOUT 1
#define STDERR 2

/* For the following see "Data transfer from application" below */
#define XFER_SIZE 8


/* For the following see "Data transfer to application" below */
#define INIT_Q_LEN 40000

/* The following is the name of an environment variable used */
/* in the ProofPower system initialisation. */

#define PPLINELENGTH "PPLINELENGTH"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * global, static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static int control_fd;

static pid_t child_pid;

static XtInputId app_ip_req;

static XtSignalId sigid;

/* For the following see "Data transfer to application" below */
static char *queue = 0;
static int q_size, q_head, q_tail;

/* Messages for various purposes */

static char *queue_malloc_failed_message = 
"Could not allocate memory for application transfer queue.";

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
 * Listening to the application: the following function
 * is used to toggle between the state where xp is listening
 * for output from the application being run and the state
 * where it is not. The state changes needs to be protected
 * against signals.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void get_from_application(INPUT_CALLBACK_ARGS);
static Boolean get_from_app_work_proc(XtPointer);
/*
 * The argument to get_from_app_work_proc is one of the following two:
 */
#define	CONTINUE_LISTENING	0
#define	STOP_LISTENING		1

/*
 * Listening states:
 */
#define	LISTEN	10
#define	IGNORE	20
#define	QUERY	30
#define DEAD	40

Boolean listening_state(int req)
{
	static Boolean listening = False;
	sigset_t now, before;
	sigfillset(&now);
	sigprocmask(SIG_BLOCK, &now, &before);
	switch(req) {
		case LISTEN:
			if(application_alive() && !listening) {
				app_ip_req = XtAppAddInput(app,
					control_fd, (XtPointer) XtInputReadMask,
					get_from_application, NULL);
				listening = True;
			}
			break;
		case IGNORE:
			if(listening) {
				XtRemoveInput(app_ip_req);
				listening = False;
			};
			break;
		case QUERY:
			break;
		case DEAD:
			if(listening) {
	/* Set up work proc to see if there is any final output from app */
				XtAppAddWorkProc(app,
						get_from_app_work_proc,
						(XtPointer) STOP_LISTENING);
			};
			break;
	}
	sigprocmask(SIG_SETMASK, &before, 0);
	return listening;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Pseudo-terminal initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void default_sigs(void);

void get_pty(void)
{
	char c;
	int one = 1;
	int slave_fd;
	char *slavename;
	char *ptsname(int);
	int i;
	struct termios tio;
	short line_length;
#ifndef LINUX
/* On non-Linux (i.e., SVR4) we use the grantpt/lockpt interfaces */
/* and do the termio set-up in the child process */
	child_pid = 0; 
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
	child_pid = 0; 
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

/*
 * Get the width of the journal window if PPLINELENGTH is not
 * already set in the environment.
 * Do this before fork to avoid any problems with concurrent X calls.
 */
	if(getenv(PPLINELENGTH) == 0) {
		XtVaGetValues(journal,
			XmNcolumns, &line_length,
			NULL);
	} else {
		line_length = 0;
	}
/*
 * We are now ready to fork:
 */
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
		listening_state(LISTEN);
		write(control_fd, "\n", 1);	/* Tell child to exec */

	} else { 
 /******************************************************************/
 /* Child */
 /******************************************************************/
		char	buf;
		char **arglist;
		int tty_fd;
		default_sigs();
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

/*
 * The 16 below allows for shorts of up to 32 bits.
 * We use the horrid putenv, because Solaris doesn't have setenv.
 * The memory allocation issues for putenv are irrelevant as we're
 * about to do an exec.
 */
		if(line_length != 0) {
			char txt[sizeof PPLINELENGTH + 16];
			sprintf(txt, PPLINELENGTH "=%d", (int) line_length);
			putenv(txt);
		}
/*
 * Now get the command line options for the command and exec it:
 */
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

Boolean application_alive(void)
{
	if(child_pid) {
		waitpid(child_pid, NULL, WNOHANG);
		if( kill(child_pid, 0) < 0 ) {
			listening_state(DEAD);
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
	char buf[XFER_SIZE + 1]; /* allow for null-termination in scroll_out */
	if((ct = read(control_fd, buf, XFER_SIZE)) > 0) {
		scroll_out(buf, ct, False);
	}
	if(ct == XFER_SIZE) { /* Probably more to do; stop listening to give X a chance */
		listening_state(IGNORE);
		XtAppAddWorkProc(app,
				get_from_app_work_proc,
				(XtPointer) CONTINUE_LISTENING);
	}		
}

static Boolean get_from_app_work_proc(XtPointer continue_flag)
{
	int ct;
	char buf[XFER_SIZE+1]; /* allow for null-termination in scroll_out */
	if((ct = read(control_fd, buf, XFER_SIZE)) > 0) {
		scroll_out(buf, ct, False);
	}
	if(ct == XFER_SIZE) { /* Probably more to do */
		return False;	/* arrange to be called again */ 
	} else	{
		switch((int)continue_flag) {
			case CONTINUE_LISTENING:
				listening_state(LISTEN);
				break;
			case STOP_LISTENING:
				listening_state(IGNORE);
				break;
		}
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
static Boolean dequeue(void)
{
	long int bytes_written, line_len, i, top;
	Boolean sent_something = False;
	Boolean sys_error = False;

/* nothing to do if the queue is empty */
	if(queue == 0 || q_tail < q_head) {
		return False;
	};

/* no way of emptying the queue if there's no application running: */

	if(!application_alive()) {
		return False;
	};

/* something to do; find the next command line. */

	for(i = q_head; i < q_tail && queue[i] != '\n'; ++i) {
		continue;
	}

	/* i now is index of last byte in command to send */

	line_len = i - q_head + 1;

/* try to send the command line: */
	while(!sent_something && !sys_error && line_len) {
		bytes_written = write(control_fd, queue + q_head, line_len);
		sent_something = bytes_written > 0;

		if(bytes_written < 0) {
			if(errno == EWOULDBLOCK) { /* try to send a bit less: */
				--line_len;
			} else if (errno == EINTR) { /* have another go: */
				continue;
			} else { /* some other problem */
				perror("xpp");
				sys_error = True;
				ok_dialog(root, send_error_message);
			}
		}
	};

/* display what was sent, if anything: */

	if(sent_something)  {
		scroll_out(queue + q_head, bytes_written, True);
		q_head = (q_head + bytes_written);
	};

	return sent_something;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * enqueue tries to add its argument text to the queue. First
 * it attempts to dequeue things.
 * It returns true if it got its argument onto the queue.
 * Caller is expected to call try_drain_queue after this
 * to drain the queue and resize it as appropriate.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static Boolean enqueue(char *buf, NAT siz)
{
	NAT buf_i, q_i;
/* start the queue off if it's empty: */
	if(queue == 0) {
		queue = XtMalloc(INIT_Q_LEN);
		if(queue == 0)  {
			ok_dialog(root, queue_malloc_failed_message);
			return False;
		}
		q_size = INIT_Q_LEN;
		q_head = 0;
		q_tail = -1;
	}

/* Make room, if we can: */

	while(dequeue()) {
		continue;
	}


/* If no room, first move things up and see if that makes enough room: */

	if(q_tail + siz + 1 > q_size) {
		if(q_head > 0) {
			memmove(queue, queue + q_head, q_tail - q_head + 1);
			q_tail = q_tail - q_head;
			q_head = 0;
		}

/* if still not enough room, realloc: */

		if(q_tail + siz + 1 > q_size) {
			queue = XtRealloc(queue, q_tail + siz + 1);
			if(queue == 0) {
				ok_dialog(root, queue_malloc_failed_message);
				return False;
			}
			q_size = q_tail + siz + 1;
		}
	}

/* Put data onto the queue: */

	memmove(queue + q_tail + 1, buf, siz);

	q_tail += siz;

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

static void try_drain_queue(Widget w)
{
/* If there's something in the queue try to process it */
	while(dequeue()) {
		continue;
	}

/* If there's still something in the queue ask to be called again: */

	if(queue != 0 && q_tail >= q_head) {
		XtAppAddTimeOut(app, 25,
			(XtTimerCallbackProc)try_drain_queue, w);
	} else if(queue != 0 && q_size > INIT_Q_LEN) {

/* If not, reclaim space if appropriate: */

		queue = XtRealloc(queue, INIT_Q_LEN); 
		if(queue == 0)  { /* weird, but ... */
			ok_dialog(root, queue_malloc_failed_message);
		}
		q_size = INIT_Q_LEN;
		q_head = 0;
		q_tail = -1;
	}
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * clear_queue clears out the queue by reinitialising q_head and q_tail.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static void clear_queue (void)
{
	q_head = 0;
	q_tail = -1;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Send commands to the application via the queue
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void send_to_application (buf, siz)
char *buf;
NAT siz;
{

/* Check there's something to talk to: */

	if(!application_alive()) {
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
void interrupt_application (void)
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
static Boolean wait_for_prompt(void);
void interrupt_and_abandon (void)
{
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
static Boolean wait_for_prompt(void)
{
	int ct, prompt_len, tries, delay;
	Boolean got_prompt, result;
	XmTextPosition last;
	char buf[XFER_SIZE + 1]; /* allow for null-termination in scroll_out */
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
		if((ct = read(control_fd, buf, XFER_SIZE)) > 0) {
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
void send_nl (void)
{
	char *buf = "\n";

	send_to_application(buf, 1);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Kill the application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void kill_application (void)
{
	clear_queue();
	if(application_alive()) {
		listening_state(IGNORE);
		kill((pid_t)(-child_pid), SIGKILL);
		kill(child_pid, SIGKILL);
		waitpid(child_pid, NULL, WUNTRACED);
		close(control_fd);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Restart the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void restart_application (void) {
	kill_application();
	get_pty();
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Ctrl-C Signal handling for the controller process.
 * Following treats Ctrl-C similarly to window close
 * or selection of quit from the command menu.
 * We use the new X11R6 signal handling functions.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sigint_handler(int sig)
{
	XtNoticeSignal(sigid);
}

static void sigint_callback(XtPointer c_ignored, XtSignalId *s_ignored)
{
	XtAppAddTimeOut(app, 0, (XtTimerCallbackProc) check_quit_cb, root);
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
 * This does no X windows work, so the Xt signal handling functions
 * do not need to be used.
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
 * of OS signals to handle is not very scientific, but seems to catch
 * the common problems. Earlier versions of this code also used to
 * catch SIGSYS on Solaris, but this has been removed since it's not
 * portable and there is no evidence that the SIGSYS signal ever occurred.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void handle_sigs(void)
{
	struct sigaction acts;
	acts.sa_handler = sigint_handler;
	sigemptyset(&acts.sa_mask);
	acts.sa_flags = 0;
	sigaction(SIGINT, &acts, 0);
	sigid = XtAppAddSignal(app, sigint_callback, (XtPointer) SIGINT);
	acts.sa_handler = sigother_handler;
	sigaction(SIGSEGV, &acts, 0);
	sigaction(SIGBUS, &acts, 0);
	sigaction(SIGFPE, &acts, 0);
	XtAppSetErrorHandler(app, xt_error_handler);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * restore signal handling to defaults:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void default_sigs(void)
{
	struct sigaction acts;
	acts.sa_handler = SIG_DFL;
	sigfillset(&acts.sa_mask);
	acts.sa_flags = 0;
	sigaction(SIGINT, &acts, 0);
	sigaction(SIGSEGV, &acts, 0);
	sigaction(SIGBUS, &acts, 0);
	sigaction(SIGFPE, &acts, 0);
}


