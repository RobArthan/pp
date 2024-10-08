/* **** **** **** **** **** **** **** **** **** **** **** ****
 * pterm.c,v 2.64 2014/01/23 17:19:42 rda Exp
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
 PLATFORM-DEPENDENT ISSUES

The platform-dependent parts of xpp are localised in this file. The
code has evolved over the years to work with new platforms and new
versions of old platforms. Some notes are in order to help with any
future changes.

The purpose of pterm.c is to implement a full duplex communication channel
between xpp and the application it is running. The services and the functions
that implement them are:

Initialisation: get_pty - this sets up a full duplex communication channel
between xpp and the application.

Data transfer from application to xpp: get_from_application

Data transfer from xpp to application: send_to_application, send_nl

Control of the application: application_alive (test), interrupt_application,
restart_application.

The initialisation step (also used to re-initialise in restart_application) has
several OS-dependent aspects. Data transfer from and to the application as
coded here is not OS-dependent, but care has had to be taken to ensure that
it doesn't deadlock and to ensure that it doesn't swamp interaction with the
user. The control functions are less problematic but they do interact with data
transfer.  Both data transfer and the control functions have to be careful
about the possibility of signals.

To localise the potential system dependencies, this file also provides the
following services which are required in both edit-only and command sessions:

Starting a new xpp session: new_editor, new_command_session - fork and exec a
new xpp session.

Handling signals: handle_sigs - set up signal handlers to help preserve
the user's work.

INITIALISATION

The communication channel between xpp and the application is via  UN*X
pseudo-terminal devices. A pseudo-terminal comprises a pair of entries in /dev
which are linked by the operating system so that reads and writes by one
process accessing one /dev entry appear as writes and reads to another process
accessing the other one. The initialisation involves the following stages:

1) Open the two pseudo-terminal devices giving two file descriptors, control
and slave.

2) Fork

3a) Parent (xpp) closes the slave file descriptor, sets itself up to do
non-blocking I/O on the control file descriptor and arranges to listen for
input from it. Subsequent data transfers to the application are writes to the
control file descriptor.

3b) Child (the application-to-be) sets the signal handling back to the
defaults, then closes the control file descriptor, then duplicates the slave
file descriptor to become the standard input, output and error channels and
finally execs the application.

There are several complications. The main one is that to avoid the
application starting to do output before xpp is listening, they need to
synchronise. This is done by having the child process do a blocking
read for a byte of data on its file descriptor, which the parent sends
when it is ready. Also, the pseudo-terminal, which has very similar
characteristics to a real terminal needs to be configured, e.g., to
stop it doing input-line buffering or unwanted character conversions.

In addition, there are several OS-dependent aspects:

Under SVR4-like systems like Solaris and now under Unix98 and later
versions of POSIX compliant systems there are special interfaces
grantpt and unlockpt which give access to the two /dev files as an
atomic operation, via a pseudo-pseudo-device called /dev/ptmx.

On BSD-like systems, there is an interface called openpty which may
give better results than the fallback option, which is just to look for
a free matching pair of control/slave devices in /dev and pray that a
competing process doesn't interfere by opening the slave device between
your opens of the control device and the slave.

Also on some systems, the pseudo-terminal configuration has to be done
in the child rather than the parent if xpp is started in the background
This is probably historical now.

There is also variation on how the configuration is done i.e., with
POSIX interfaces or with ioctl.

On MacOS X (and possibly FreeBSD generally) you have to put the pseudo-terminal
into exclusive to make restarting the application reliable. If this is not
done, the OS appears to attempt to recycle the old control (master)
pseudo-device before the old slave is ready to be reopened.



DATA TRANSFER FROM APPLICATION

Data transfer from the application is handled using an input callback
procedure, get_from_application. However, the obvious approach of just having
the input callback procedure always alert does not work - if the application is
generating a lot of data fast, it will swamp the Xt input queue and the user
interface will freeze (apart from updating the display of the data). The
solution chosen is to have the input callback read a small block of data, and
if it fills the block to unregister itself and register a work procedure to
check for further data. This lets Xt give due priority to user interactions.  A
function listening_state is used to keep a close track on whether an input
callback procedure is currently registered or not and to deal with some
abnormal situations (e.g., when the application has died unexpectedly, but
there's still some data from it left to process).

DATA TRANSFER TO APPLICATION

The code that transfers data to the application is actually quite
simple. The main complication is that, while it is generally only asked
to transfer just a small amount of data, say 10-10,000 bytes, it is
sometimes required to deal very large amounts, say 1,000,000 bytes
or more. When a large data transfer is requested, if we tried to send
the data all at once, the write might block. So we have to be prepared
to try writing ever smaller amounts of data until we can get something
through and then register a work procedure to deal with the residue.
Since the user could try to transfer some more data before the work
procedure is done, we need to maintain a queue of outgoing data.

The code that deals with all this looks rather odd at first glance: it
seems to be writing successive blocks of outgoing data into successive
positions in the malloced array that represents the queue and
reallocing more space at the end of the queue when new requests arrive.
I.e., it looks as if the queue array is growing endlessly. It also
looks as if each new arrival is processed completely as soon as it
arrives. In fact what happens is as follows: old and new data is
processed and dequeued until the application would block; if the queue
is still too full to deal with a new arrival, then the queue contents
are all shifted along in an attempt to make room before trying to
realloc; and, finally, if the work procedure succeeds in draining the
queue, it reallocs it back to its initial size. The performance
characteristics of this algorithm seem to be very good in practice.

STARTING NEW XPP SESSIONS

This is straightforward. We arrange to do the exec in a grand-child of
a suicidal child so that the new session ends up being owned by init
and so will be reaped when it dies.

SIGNAL HANDLING

We adopt a table-driven approach: sig_infos defined below is a table of
signal numbers and corresponding actions. See below. We also allow for
the SUS V3 real-time signals. We check for the existence of the SIGxxx
macros before using them.


 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _pterm

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * OS-independent include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <sys/ioctl.h>
#include <signal.h>
#include <sys/termios.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

#include "X11/cursorfont.h"
#include "xpp.h"


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * OS dependencies (macros calculated here based on LINUX/MACOSX/SOLARIS
 * etc. unless otherwise specified):
 *
 * How to do ioctls and to get/set termio attributes:
 *	USE_STREAMS - Solaris style STREAMS
 *	USE_POSIX_TERMIO - use POSIX tcgetattr/tcsetattr
 *	else ioctls direct on the file descriptor
 * How to get a pseudo-terminal:
 *	USE_GRANTPT - SUSv3 grantpt/unlockpt (calculated in make file xpp.mkf)
 *	USE_OPENPTY - BSD openpty
 *	else hunt in /dev
 * When to set termio attributes:
 *	SET_ATTRS_IN_PARENT
 *	else do it in the child
 * Whether to use cfmakeraw
 *	USE_CFMAKERAW (defined if so)
 * Whether this OS has the SUS V3 real-time signals:
 *	HAS_RTSIGNALS (defined if it does)
 * Whether to put the slave pseudo-terminal into exclusive mode
 * 	USE_TIOCEXCL
 * We now define the combinations to be used for the supported OSs.
 * We make no claim that other combinations that these
 * combinations will work on other OSs even if they compile OK.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#ifdef LINUX
	#undef  USE_STREAMS
	#undef  USE_POSIX_TERMIO /* historical: we probably could on recent versions */
	#define SET_ATTRS_IN_PARENT
	#undef  USE_CFMAKERAW /* again historical: we probably could now */
 	#undef  USE_TIOCEXCL
#endif

#ifdef MACOSX
	#undef  USE_STREAMS
	#define USE_POSIX_TERMIO
	#define SET_ATTRS_IN_PARENT
	#define USE_CFMAKERAW
 	#define USE_TIOCEXCL
#endif

#ifdef CYGWIN
	#undef  USE_STREAMS
	#define USE_POSIX_TERMIO
	#define SET_ATTRS_IN_PARENT
	#define USE_CFMAKERAW /* again historical: we probably could now */
 	#undef  USE_TIOCEXCL
#endif

#ifdef SOLARIS
	#define USE_STREAMS
	#undef  USE_POSIX_TERMIO /* maybe we could */
	#undef  SET_ATTRS_IN_PARENT
	#undef  USE_CFMAKERAW
 	#undef  USE_TIOCEXCL
#endif
/*
 * MacOS X doesn't define some of the termio input and output control
 * flags that are (or were) needed on Linux/Solaris.
 * We define the missing ones as zero (which works with the usual idioms for adding
 * them in and taking them out).
 * MacOS X also currently (up to 10.3.6) doesn't have grantpt but does
 * have openpty.
 */
#ifdef MACOSX
#define XTABS (OXTABS)
#define OLCUC (0)
	#ifndef USE_GRANTPT
		#define USE_OPENPTY
	#endif
#endif

#if defined(SIGRTMIN) && defined(SIGRTMAX)
#define HAS_RTSIGNALS
#else
#undef HAS_RTSIGNALS
#endif
/*
 * Macro to push required modules onto the pseudo-terminal device stack if
 * if we're using STREAMS. It's an expression evaluating to 0 if all is OK.
 */
#ifdef USE_STREAMS
#define PUSH_MODULES(FD) (\
		ioctl(FD, I_PUSH, "ptem") < 0 \
		||	ioctl(FD, I_PUSH, "ldterm") < 0 \
		||	ioctl(FD, I_PUSH, "ttcompat") < 0)
#else
#define PUSH_MODULES(FD) (0)
#endif
/*
 * Now macro to get & set the terminal attributes. Again these are
 * expressions that evaluate to 0 if all is OK
 */
#ifdef USE_POSIX_TERMIO
#define GET_ATTRS(FD, TIO) (tcgetattr(FD, TIO) < 0)
#define SET_ATTRS(FD, TIO) (tcsetattr(FD, TCSANOW, TIO) < 0)
#else
#define GET_ATTRS(FD, TIO) (ioctl(FD, TCGETS, TIO) < 0)
#define SET_ATTRS(FD, TIO) (ioctl(FD, TCSETS, TIO) < 0)
#endif

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * OS-specific include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#ifdef USE_STREAMS
#include <stropts.h>
#include <sys/filio.h>
#include <sys/termio.h>
#else
#include <termios.h>
#endif

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define STDIN 0
#define STDOUT 1
#define STDERR 2

/* For the following see "Data transfer from application" below */
#define XFER_SIZE 100


/* For the following see "Data transfer to application" below */
#define INIT_Q_LEN 40000

/* Environment variable used in the ProofPower system initialisation. */

#define PPLINELENGTH "PPLINELENGTH"

/*
 * The argument to get_from_app_work_proc is one of the following two:
 */

enum {CONTINUE_LISTENING, STOP_LISTENING};

/*
 * The argument to listening_state is one of the following four:
 */

enum {LISTEN, IGNORE, QUERY, DEAD};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * global, static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static int control_fd;

static pid_t child_pid;

static XtInputId app_ip_req;

/* For the use of following see "Data transfer to application" below.
 * The contents of the queue is the substring queue[q_head ... q_tail]
 * (inclusive) so q_tail == q_head - 1 for an empty queue. queue is
 * malloced and realloced as necessary and always contains a spare byte
 * so that the string can be null-terminated if needed. q_size is the
 * total size malloced, of which q_tail - q_head + 1 bytes is occupied
 * (not including the spare byte).
 */
static char *queue = 0;
static int q_size, q_head, q_tail;

/* Messages for various purposes */

static char *queue_malloc_failed_message =
"Could not allocate memory for application transfer queue.";

static char* signal_handled_message =
"fatal error: signal %d: %s";

static char* attempt_to_save_message =
"attempting to save the editor text";

static char* no_changes_message =
"no changes to be saved";

static char* initialisation_error_message =
"apparently during X initialisation";

static char* xt_error_handled_message =
"X Toolkit Intrinsics error";

static char* x_error_handled_message =
"X protocol error";

static char* x_io_error_message =
"connection failure";

static char* signal_in_signal_handler_message =
"fatal error in signal handler";

static char* send_error_message =
"A system error occurred writing to the application.";

/*
 * The following data types are used to define our disposition of the various signals in a table.
 */
typedef enum {
	H_DEFAULT,	/* default using SIG_DFL */
	H_CHECK_QUIT,	/* ask the user if they want to quit */
	H_FATAL,	/* attempt to save the editor text and die */
	H_IGNORE	/* ignore it using SIG_IGN */
} handler_info;

typedef struct  {
	char		*desc;
	int		number;
	handler_info	disposition;
	XtSignalId	signal_id;} sig_info;
/*
 * Now the table covering all the signals defined by SUS V3 or common
 * in the supported operating systems that can be caught or ignored.
 * Some of these are guaranteed  to be defined by ANSI C, but by no means all,
 * so we defend ourselves against them not being defined (but not against against an
 * implementation which uses an enum to define them, which would be very unusual).
 * We attempt to handle or ignore all catchable signals that default to terminating the process.
 *
 * SIGHUP has to be ignored because if this xpp is running detached (i.e., it has
 * been started from the New Command Session menu item in another instance
 * of xpp) the close of the control file descriptor which occurs when the user
 * kills or restarts the application will cause the kernel to send a SIGHUP).
 */
static sig_info	sig_infos []  = {
#ifdef SIGABRT
	{"abort",			SIGABRT,		H_FATAL, },
#endif
#ifdef SIGALRM
	{"alarm clock",		SIGALRM,	H_FATAL, },
#endif
#ifdef SIGBUS
	{"bus error",		SIGBUS,		H_FATAL, },
#endif
#ifdef SIGCHLD
	{"child stopped or exited",	SIGCHLD,	H_DEFAULT, },
#endif
#ifdef SIGCONT
	{"continue",		SIGCONT,	H_DEFAULT, },
#endif
#ifdef SIGFPE
	{"floating point exception",	SIGFPE,		H_FATAL, },
#endif
#ifdef SIGHUP
	{"hangup",		SIGHUP,		H_IGNORE, },
#endif
#ifdef SIGILL
	{"illegal instruction",		SIGILL,		H_FATAL, },
#endif
#ifdef SIGINT
	{"interrupt",		SIGINT,		H_CHECK_QUIT, },
#endif
/* SIGKILL cannot be caught or ignored */
#ifdef SIGPIPE
	{"broken pipe",		SIGPIPE,		H_FATAL, },
#endif
#ifdef SIGQUIT
	{"quit",			SIGQUIT,		H_FATAL, },
#endif
#ifdef SIGSEGV
	{"memory fault",		SIGSEGV,	H_FATAL, },
#endif
/* SIGSTOP cannot be caught or ignored */
#ifdef SIGTERM
	{"terminated",		SIGTERM,	H_FATAL, },
#endif
#ifdef SIGTSTP
	{"stopped",		SIGTSTP,		H_DEFAULT, },
#endif
#ifdef SIGTTIN
	{"stopped (tty input)",	SIGTTIN,		H_DEFAULT, },
#endif
#ifdef SIGTTOU
	{"stopped (tty output)",	SIGTTOU,		H_DEFAULT, },
#endif
#ifdef SIGUSR1
	{"user-defined signal 1",	SIGUSR1,	H_FATAL, },
#endif
#ifdef SIGUSR2
	{"user-defined signal 2",	SIGUSR2,	H_FATAL, },
#endif
#ifdef SIGPOLL
	{"pollable event",		SIGPOLL,	H_FATAL, },
#endif
/* SIGPROF is left to the calling environment to decide so that gprof and the like work */
#ifdef SIGSYS
	{"bad system call",		SIGSYS,		H_FATAL, },
#endif
#ifdef SIGTRAP
	{"trace trap",		SIGTRAP,		H_IGNORE, },
#endif
#ifdef SIGURG
	{"urgent i/o condition",	SIGURG,		H_DEFAULT, },
#endif
#ifdef SIGVTALRM
	{"virtual timer expired",	SIGVTALRM,	H_FATAL, },
#endif
#ifdef SIGXCPU
	{"CPU time limit exceeded",	SIGXCPU,	H_FATAL, },
#endif
#ifdef SIGXFSZ
	{"file size limit exceeded",	SIGXFSZ,	H_FATAL, },
#endif
/* Non-SUS V3 signals: */
#ifdef SIGWINCH
	{"window size change",	SIGWINCH,	H_DEFAULT, },
#endif
#ifdef SIGSTKFLT
	{"stack fault",		SIGSTKFLT,	H_FATAL, },
#endif
#ifdef SIGEMT
	{"emulation trap",	SIGXFSZ,	H_FATAL, },
#endif
#ifdef SIGLOST
	{"resource lost",	SIGXFSZ,	H_FATAL, },
#endif
};
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Pseudo-terminal initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void default_sigs(void);
static Boolean listening_state(int req);
static void set_pty_attrs(int fd, void die(int));

void get_pty(void)
{
	int one = 1;
	int slave_fd;
	char *slavename;
	char *ptsname(int);
	short line_length;
#ifdef USE_GRANTPT
/* I can't persuade stdlib.h to yield up the prototypes: */
	int grantpt(int);
	int unlockpt(int);
/* When available, e.g., on SVR4, we use the grantpt/lockpt interfaces */
	if ((control_fd = open("/dev/ptmx", O_RDWR)) < 0) {
		msg("system error", "no pseudo-terminal devices available");
		perror("xpp");
		exit(1);
	}
	if(	grantpt(control_fd) < 0
	||	unlockpt(control_fd) < 0
	||	(slavename = ptsname(control_fd)) == NULL
	||	(slave_fd = open(slavename, O_RDWR)) < 0 ) {
		msg("system error", "cannot access pseudo-terminal slave device");
		perror("xpp");
		exit(2);
	}
#else
#ifdef USE_OPENPTY
	if( openpty(&control_fd, &slave_fd, NULL, NULL, NULL) < 0 ) {
		msg("system error", "no pseudo-terminal devices available");
		perror("xpp");
		exit(3);
	}
#else
/* we have to look for a pseudo-terminal ourselves */
	char c;
	char line[32];
	for(control_fd = -1, c = 'p'; control_fd < 0 && c <= 'z'; c++) {
		int i;
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
		msg("system error", "no pseudo-terminal devices available");
		perror("xpp");
		exit(3);
	}
#endif /* ifdef USE_OPENPTY */
#endif /* ifdef USE_GRANTPT */

#ifdef SET_ATTRS_IN_PARENT
	set_pty_attrs(slave_fd, exit);
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

	if (child_pid < 0) { /* Cannot fork */
		msg("system error", "fork failed");
		perror("xpp");
		exit(6);
	} else if (child_pid > 0) {
 /******************************************************************/
 /* Parent */
 /******************************************************************/
		close(slave_fd);

		if(fcntl(control_fd, F_SETFL, O_NONBLOCK) < 0) {
			msg("system error", "fcntl on application would not permit non-blocking i/o");
			perror("xpp");
			exit(7);
		}

		if(ioctl(control_fd, FIONBIO, &one) < 0) {
			msg("system error", "ioctl on control fd failed");
			perror("xpp");
			exit(8);
		}

		listening_state(LISTEN);

		(void) write(control_fd, "\n", 1); /* Tell child to exec */

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

		read(STDIN, &buf, 1);	/* Wait until told */

		if (slave_fd > 2) {
			close(slave_fd);
		}

		if(setsid() < 0) {
			msg("system error", "setsid failed");
			perror("xpp");
			_exit(9);
		}

#ifdef TIOCNOTTY
		if((tty_fd = open("/dev/tty", O_RDWR)) >= 0){
		    ioctl(tty_fd, TIOCNOTTY, 0);
		    close(tty_fd);
		}
#endif

#ifndef SET_ATTRS_IN_PARENT
		set_pty_attrs(STDIN, _exit);
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
 * Stop apps that check the TERM environment variable mistreating us:
 */
		unsetenv("TERM");
/*
 * Now get the command line options for the command and exec it:
 */
		arglist = get_arg_list(global_options.command_line);
		execvp(arglist[0], arglist);
	/* **** error if reach here **** */
		fprintf(stderr, "xpp: could not exec: \"%s\"\n", global_options.command_line);
		perror("xpp");
		_exit(12);
	}
}

/*
 * Set the terminal attributes in the pseudo-terminal
 */
static void set_pty_attrs(int fd, void die(int))
{
	struct termios tio;
	if(	PUSH_MODULES(fd)
	||	GET_ATTRS(fd, &tio)) {
		msg("system error", "I/O control operation on pseudo-terminal failed (GET in parent)");
		perror("xpp");
		die(4);
	}

#ifdef USE_CFMAKERAW
	(void) cfmakeraw(&tio);
#else
	tio.c_lflag |= ISIG;
	tio.c_lflag &= ~ICANON;
	tio.c_lflag &= ~ECHO;
	tio.c_lflag &= ~PENDIN;
	tio.c_lflag &= ~NOFLSH;
	tio.c_lflag &= ~TOSTOP;
	tio.c_oflag &= ~OPOST;
	tio.c_oflag |= OCRNL;
	tio.c_cc[VINTR] = CINTR;
	tio.c_cc[VMIN] = 1;
	tio.c_cc[VTIME] = 0;
#endif

	if(SET_ATTRS(fd, &tio)) {
		msg("system error", "I/O control operation on pseudo-terminal failed (SET in parent)");
		perror("xpp");
		die(5);
	}
#ifdef	USE_TIOCEXCL
	ioctl(fd, TIOCEXCL, 0);
#endif
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
 *
 * Data transfer from application:
 *
 * The point of most of the complication is to stop big data transfers
 * from the application swamping the user interface. The input callback proc,
 * get_from_application, reads just a small amount of data (XFER_SIZE)
 * and if it looks like there's more, removes the input request and
 * sets up a work proc get_from_app_work_proc to finish off the transfer
 * in further little chunks, rescheduling itself if necessary.
 * When it looks like there's no more input for now, the work proc
 * arranges for the input callback request to be set up again if
 * appropriate.
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void get_from_application(INPUT_CALLBACK_ARGS);
static Boolean get_from_app_work_proc(XtPointer);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *
 * listening_state is used to toggle between the state where xpp is listening
 * for output from the application being run and the state
 * where it is not. The state changes needs to be protected
 * against signals.
 * The listening state returned is a flag which is true when we have Xt
 * polling for input from control_fd.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean listening_state(int req)
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
			}
			break;
		case QUERY:
			break;
		case DEAD:
			if(listening) {
	/* Set up work proc to see if there is any final output from app */
				XtRemoveInput(app_ip_req);
				listening = False;
				XtAppAddWorkProc(app,
						get_from_app_work_proc,
						(XtPointer) STOP_LISTENING);
			}
			break;
	}
	sigprocmask(SIG_SETMASK, &before, 0);
	return listening;
}

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
	} else if(ct <= 0) { /* application may have died; if so, tidy up. */
		(void) application_alive();
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
		switch((int) (uintptr_t) continue_flag) {
			case CONTINUE_LISTENING:
				listening_state(LISTEN);
				break;
			case STOP_LISTENING:
				break;
		}
		return True;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer to application:
 * To cope with executing long command line sequences, this
 * is done using a queue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dequeue tries to write out the command line at the head of the
 * queue. It returns true iff. it reduced the size of the queue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean dequeue(void)
{
	long int bytes_written, line_len, i;
	Boolean sent_something = False;
	Boolean sys_error = False;

/* nothing to do if the queue is empty */
	if(queue == 0 || q_tail < q_head) {
		return False;
	}

/* no way of emptying the queue if there's no application running: */

	if(!application_alive()) {
		return False;
	}

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
	}

/* update queue head, and optionally display what was sent, if anything: */

	if(sent_something)  {
		if(global_options.echo_executed_text) {
			scroll_out(queue + q_head, bytes_written, True);
		}
		q_head = (q_head + bytes_written);
	}

	return sent_something;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * enqueue tries to add its argument text to the queue. First
 * it attempts to dequeue things.
 * It returns true if it got its argument onto the queue.
 * Caller is expected to call try_drain_queue after this
 * to drain the queue and resize it as appropriate.
 * The queue always has a spare byte beyond queue + q_tail to allow
 * for scroll_out null-terminating a string right at the end.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static Boolean enqueue(char *buf, Cardinal siz)
{
/* start the queue off if it's empty: */
	if(queue == 0) {
		queue = XtMalloc(INIT_Q_LEN+1);
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
			queue = XtRealloc(queue, q_tail + siz + 2);
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

static void try_drain_queue(void);
static void try_drain_queue_time_out_proc(
		XtPointer	unused_p,
		XtIntervalId	*unused_id)
{
	try_drain_queue();
}

static void try_drain_queue(void)
{
/* If there's something in the queue try to process it */
	while(dequeue()) {
		continue;
	}

/* If there's still something in the queue ask to be called again: */

	if(queue != 0 && q_tail >= q_head) {
		XtAppAddTimeOut(app, 25, try_drain_queue_time_out_proc, root);
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

void send_to_application (char *buf, Cardinal siz)
{

/* Check there's something to talk to: */

	if(!application_alive()) {
		return;
	}

/* Send it off: */

	enqueue(buf, siz);

/* Try to drain the queue: */

	try_drain_queue();
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interrupt the applications (as with Cntl-C):
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void interrupt_application (void)
{
	clear_queue();
	if(application_alive()) {
#ifdef USE_STREAMS
		ioctl(control_fd, I_FLUSH, FLUSHW);
#endif
		kill((pid_t)(-child_pid), SIGINT);
	}
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
		close(control_fd);
		kill((pid_t)(-child_pid), SIGKILL);
		kill(child_pid, SIGKILL);
		waitpid(child_pid, NULL, WUNTRACED);
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
 * get_sig_desc: give the description of a signal as stored
 * in the table sig_infos:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *sig_desc(int sig)
{
	int i;
	for(i = 0; i < XtNumber(sig_infos); i += 1) {
		if(sig_infos[i].number == sig) {
			return sig_infos[i].desc;
		}
	}
	return
#ifdef	HAS_RTSIGNALS
	SIGRTMIN <= sig && sig <= SIGRTMAX ? "real-time signal"  :
#endif
	"unknown signal";
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Signal handling for the controller process:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * sig_notice_handler uses the new X11R6 signal handling functions
 * to arrange to notice a signal that has an associated callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sig_notice_handler(int sig)
{
	int i;
	for(i = 0; i < XtNumber(sig_infos); i += 1) {
		if(sig_infos[i].number == sig) {
			XtNoticeSignal(sig_infos[i].signal_id);
			break;
		}
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * check_quit_scb: check_quit packaged as a signal callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void check_quit_scb(XtPointer cbd_ignored, XtSignalId *s_ignored)
{
	check_quit();
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * panic_exit:
 * save the editor text if the widget's there then bomb out.
 * This does no X windows work, so the Xt signal handling functions
 * does not need to be used (and we trust that the panic_save function
 * and the Motif functions it calls don't do anything silly).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static int panic_exit(char * m, Cardinal code)
{
	static Boolean recursive = False;
	if(recursive) {
		msg(m, signal_in_signal_handler_message);
		exit(code);
	} else {
		recursive = True;
	}
	if(application_alive()) {
		kill_application();
	}
	if(script) {
		if(get_modified()) {
			msg(m, attempt_to_save_message);
			panic_save(script);
		} else {
			msg(m, no_changes_message);
		}
	} else {
		msg(m, initialisation_error_message);
	}
	exit(code);
	return -1; /* C library broken! */
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * sig_panic_handler: handle an unmasked signal by exiting with
 * an error message identifying the signal.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sig_panic_handler(int sig)
{
	char msg_buf[80];
	sprintf(msg_buf, signal_handled_message, sig, sig_desc(sig));
	(void) panic_exit(msg_buf, 15);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * xt_error_handler also calls panic_exit ...
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static _X_NORETURN void xt_error_handler(char * m)
{
	msg(xt_error_handled_message, m);
	(void) panic_exit("exiting", 16);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * as does x_error_handler ...
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static int x_error_handler(Display *d, XErrorEvent *ev)
{
	char error_text[100];
	XGetErrorText(d, ev->error_code, error_text, 100);
	msg(x_error_handled_message, error_text);
	return panic_exit("exiting", 17);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * and x_io_error_handler ...
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static int x_io_error_handler(Display *d)
{
	msg(x_error_handled_message, x_io_error_message);
	return panic_exit("exiting", 17);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * handle signals and Xt errors:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void handle_sigs(void)
{
	struct sigaction acts;
	int i;
	sigfillset(&acts.sa_mask);
	acts.sa_flags = SA_RESTART;
	for (i = 0; i < XtNumber(sig_infos); i += 1) {
		switch(sig_infos[i].disposition) {
			case H_DEFAULT:
				acts.sa_handler = SIG_DFL;
				sigaction(sig_infos[i].number, &acts, 0);
				break;
				break;
			case H_CHECK_QUIT:
				acts.sa_handler = sig_notice_handler;
				sigaction(sig_infos[i].number, &acts, 0);
				sig_infos[i].signal_id = XtAppAddSignal(app,
					check_quit_scb, (XtPointer) 0);
				break;
			case H_FATAL:
				acts.sa_handler = sig_panic_handler;
				sigaction(sig_infos[i].number, &acts, 0);
				break;
			case H_IGNORE:
				acts.sa_handler = SIG_IGN;
				sigaction(sig_infos[i].number, &acts, 0);
				break;
		}
	}
#ifdef HAS_RTSIGNALS
	acts.sa_handler = sig_panic_handler;
	for(i = SIGRTMIN; i <= SIGRTMAX; i += 1) {
		sigaction(i, &acts, 0);
	}
#endif		
	XtAppSetErrorHandler(app, xt_error_handler);
	(void) XSetErrorHandler(x_error_handler);
	(void) XSetIOErrorHandler(x_io_error_handler);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * restore signal handling to defaults:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void default_sigs(void)
{
	struct sigaction acts;
	int i;
	acts.sa_handler = SIG_DFL;
	sigemptyset(&acts.sa_mask);
	acts.sa_flags = 0;
	for (i = 0; i < XtNumber(sig_infos); i += 1) {
		sigaction(sig_infos[i].number, &acts, 0);
	}
#ifdef HAS_RTSIGNALS
	for(i = SIGRTMIN; i <= SIGRTMAX; i += 1) {
		sigaction(sig_infos[i].number, &acts, 0);
	}
#endif		
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * new_session: run a program. either synchronously
 * or asynchronously as determined by Bollean parameter.
 *
 * If asynchronous, we actually fork a child which then forks again and
 * the grand-child becomes the new xpp process. The
 * child then exits, which makes init rather than this xpp
 * be the parent of the new xpp process. This saves us having
 * to look after its funeral arrangements if it predeceases us,
 * without which we would be spawning a generation of zombies.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

int new_session(char *argv[], Boolean async)
{
	pid_t new_pid;
	new_pid = fork();

	if(async) { /* asynchronous */
		if (new_pid < 0) { /* Cannot fork */
			msg("system error", "fork failed");
			perror("xpp");
			exit(18);
		} else if (new_pid == 0) {
			new_pid = fork();
			if (new_pid < 0) { /* Cannot fork */
				msg("system error", "fork failed");
				perror("xpp");
			} else if (new_pid == 0) {
				 /* Grandchild */
				 /* become session leader */
				if(setsid() < 0) {
					msg("system error", "setsid failed");
					perror("xpp");
					_exit(13);
				}
				/* exec argv[0] "" */
				execvp(argv[0], argv);
				/* **** error if reach here **** */
				msg("system error", "could not exec");
				perror("xpp");
				exit(19);
			} else {
				/* Child - exit */
				_exit(0);
			}
		} else {
			/* Parent - wait for the child */
			waitpid(new_pid, 0, 0);
			return 0;
		}
	} else { /* synchronous */
		if (new_pid < 0) { /* Cannot fork */
			msg("system error", "fork failed");
			perror("xpp");
			exit(20);
		}
		if(new_pid == 0) { /* Child */
			/* become session leader */
			if(setsid() < 0) {
				msg("system error", "setsid failed");
				perror("xpp");
				exit(13);
			}
			/* exec argv[0] "" */
			execvp(argv[0], argv);
			/* **** error if reach here **** */
			msg("system error", "could not exec");
			perror("xpp");
			_exit(22);
		} else  {
			int status;
			/* Parent - wait for the child */
			waitpid(new_pid, &status, 0);
			if(WIFEXITED(status)) {
				return(WEXITSTATUS(status));
			} else {
				return 255;
			}
		}
	}
	return 255; /* something is desperately wrong if we get here */
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * new_editor_session: start an edit-only session
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void new_editor_session(void)
{
	static char *argv[] = {"-f", "", "-b", 0};
	argv[0] = argv0;
	new_session(argv, True);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * new_command_session: start a command session
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void new_command_session(void)
{
	static char *argv[] = {"", "-b", "-f", "", "-c", "", 0};
	argv[0] = argv0;
	new_session(argv, True);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 *  run_in_background: fork and then have the parent exit.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void  run_in_background(void)
{
	pid_t new_pid;
	new_pid = fork();

	if (new_pid < 0) { /* Cannot fork */
		msg("system error", "fork failed");
		perror("xpp");
		exit(14);
	} else if (new_pid > 0) {
		_exit(0);
	}
}

