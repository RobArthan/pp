=IGN
********************************************************************************
usr031.doc: this file is part of the PPXpp system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%
% This document includes some screen snapshots; these
% are obtained as follows (on Linux):
% 1) Set up xpp session to be snapped
% 2) Use:
%	xwd -screen -out usr031a.wd
%    or:
%	xwd -screen -out usr031b.wd
%    or:
%	xwd -screen -out usr031c.wd
%    or:
%	xwd -screen -out usr031d.wd
%    to get the snapshots in X Window Dump format
%    (Note: -screen causes xwd to include any windows that are over the selected
%     window in the image. This doesn't work on XQuartz.)
% 3) Then convert to encapsulated PostScript via portable anymap format:
%	xwdtopnm usr031a.wd | pnmtops -noturn -scale 0.5 >usr031a.eps
%	xwdtopnm usr031b.wd | pnmtops -noturn -scale 0.5 >usr031b.eps
%	xwdtopnm usr031c.wd | pnmtops -noturn -scale 0.5 >usr031c.eps
%	xwdtopnm usr031d.wd | pnmtops -noturn -scale 0.4 >usr031d.eps
%     (You will likely need to experiment with the scale factor.)
%
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\def\Xpp{{\tt xpp}}
\def\XPP{{\tt Xpp}}
\def\XppExt{{\tt xppext}}
\def\XPPEXT{{\tt Xppext}}
\def\FigRef#1{\ref{#1} on page \pageref{#1}}
\def\FreeMono{{\bf FreeMono}}
\def\FreeSerif{{\bf FreeSerif}}
\def\ProofPowerMono{{\bf ProofPowerMono}}
\def\ProofPowerSerif{{\bf ProofPowerSerif}}

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ ProofPower --- {\XPP} User Guide }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document is the user guide for {\Xpp} --- the X Windows interface
for the {\Product} specification and proof tools.}
\end{center}}

\def\Reference{LEMMA1/XPP/USR031}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge ProofPower\\---\\{\XPP} User Guide } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{$Revision: 1.39 $%
}
\def\Date{\FormatDate{$Date: 2011/07/30 14:23:12 $%
}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents
\newpage
\subsection{List of Figures}
\listoffigures
%%%%% REFERENCES:

\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY: - see RCS History.

%%%%%  CHANGES FORECAST:

%\subsection{Changes Forecast}

%None at this release.

%%%%% DISTRIBUTION LIST

%\subsection{Distribution}
%\begin{center}
%\begin{tabular}{ll}
%Rob Arthan & Lemma 1\\
%Gill Prout & Home \\
%Roger Jones & Home
%\end{tabular}
%\end{center}


\newpage

%%%%% NOW THE CREATIVE BIT:

\section{INTRODUCTION}

This document is the User Guide for {\Xpp}.
{\XPP} provides a convenient way to prepare, check and execute {\Product} scripts.
It combines a general purpose text editor with a command interface for operating the
{\Product} tools such as the {\ProductHOL} and {\ProductZ} systems.

{\XPP} includes a help system that explains each of its
user interface features. This document supplements the
information in the help system.

{\XPP} is configured by default to work with UTF-8 encoded text files.
Earlier versions of {\Product} worked with a bespoke 8-bit encoding for
mathematical symbols referred to as the ``extended character set''.
For backwards compatibility, {\Xpp} has a variant, {\XppExt}, that is
configured to work with the extended character set. Most of this document
applies to both {\Xpp} and {\XppExt}. Appendix~\ref{XPPEXT} describes
the differences between {\XppExt} and {\Xpp}.


\section{OVERVIEW OF \Xpp}\label{OVERVIEW}
{\XPP} supports interactive development of {\Product} documents.
As you develop a document, you can process it with the appropriate {\Product}
tool to type-check your specifications, develop proofs, browse the theory hierarchy,
or indeed carry out any other function supported by the {\ProductML} interface to
the tool in question.

{\XPP} works with UTF-8 encoded text files. Fonts are provided that allow it to display the majority of the
mathematical symbols supported by {\Product} much as they appear on the printed page\footnote{
See {\it {\Product} Document Preparation} \cite{DS/FMU/IED/USR001} for information on the
facilities for using {\LaTeX} to typeset your documents.}. See section~\ref{unicode} for more information
on the fonts.

{\XPP} sessions come in two guises: edit-only sessions and command interface sessions.
An edit-only session with {\Xpp} is shown in figure~\FigRef{fig1}. Examples of command interface
session are shown in figure~\FigRef{fig2}, figure~\FigRef{fig3} and figure~\FigRef{fig4}.

In an edit-only session, you are just editing a {\Product} document.
There are several features to help you work with the document as a document.
For example,
the more common mathematical symbols can easily be entered in your script using a Palette Tool,
or via the keyboard using special shift characters.
For some languages, such as, {\ProductZ}, the Template Tool gives you a quick way
of entering common constructs, such as schema boxes.

In a command interface session you are both editing a {\Product} document and running
an interactive session typically with one of the {\ProductML}-based tools, such
as {\ProductHOL} or {\ProductZ}.
The main window of a command interface session contains two main text areas
(see figure~\FigRef{fig2}): the {\em script window}, where
you edit your {\Product} document and the {\em journal window}
which displays a record of your transactions with the other tool ({\ProductHOL} in the
example in figure~\ref{fig2}).
{\XPP} supports two layouts for the two windows: the vertical layout shown in figure~\FigRef{fig2}
and the horizontal layout shown in figure~\FigRef{fig3}.


\begin{figure}
\begin{center}
\leavevmode
\epsffile{usr031a.eps}
\end{center}
\caption{An Example {\Xpp} Edit-Only Session}\label{fig1}
\end{figure}

\begin{figure}
\begin{center}
\leavevmode
\epsffile{usr031b.eps}
\end{center}
\caption{An Example {\Xpp} Command Interface Session (i)}\label{fig2}
\end{figure}

\begin{figure}
\begin{center}
\leavevmode
\epsffile{usr031d.eps}
\end{center}
\caption{An Example {\Xpp} Command Interface Session (ii)}\label{fig3}
\end{figure}

\section{USING \Xpp}\label{USING}
\subsection{Starting {\Xpp}}
{\XPP} is started from a Unix or Linux shell (command line) using the command
{\Xpp}.
The command line syntax for {\Xpp} is:

\begin{verbatim}
    xpp [Standard X Toolkit options] [xpp options]
\end{verbatim}

The  Standard X Toolkit options allow you to control many aspects
of the behaviour and appearance of {\Xpp}, e.g., if you are logged in to a remote system,
you can tell {\Xpp} to use your local keyboard and screen (your ``display'', to use the X
Windows Systems term) by using the {\tt -display} option.
Please consult the main {\tt man} page for the X Windows System for detailed information
about these options (which are called the ``X Toolkit Intrinsics options'' in that {\tt man} page).
On most systems, one of the commands {\tt man X} or {\tt man X11} should display
this {\tt man} page.

The {\Xpp} options are described in the following table:

\begin{tabular}{lp{4in}}
 {\tt -b} & ``blocking'': run in the foreground not in the background;\\
 {\tt -c command [arg ...]} & ``command line'': run {\tt command} with the specified arguments, if any;\\
 {\tt -d database[\#theoryname]} &  ``database'': run {\Product} on the specified database making the specified theory (if supplied) the current theory at the start of the run;\\
 {\tt [-f] name} & ``file'': open file {\tt name} for editing;\\
 {\tt -h} & ``have fonts'': do not attempt to load any fonts;\\
 {\tt -i files} & ``include files'': include the specified comma-separated list of files into the {\Product} run by executing them in turn before executing commands interactively;\\
 {\tt -r} & ``read only'': start with the read-only option turned on.\\
 {\tt -- ml\_flags} & ``ML flags'': pass everything after ``{\tt --}'' as flags to the Standard ML compiler in a {\Product} run.
\end{tabular}

In the form with {\tt -c command} everything after {\tt command} is taken as
comprising the argument list {\tt [arg ...]}. {\tt -f} may be omitted if {\tt name} is not
itself an option or part of an option.



If neither {\tt -d database} nor  {\tt -c command [args ...]} is
specified, then {\Xpp} will run an editor session.
If {\tt -d database} is specified, {\Xpp} will run the program {\tt pp} in a command session passing it any relevant options.
If {\tt -c command} is specified, {\Xpp} will run the command specified in a command session.
It is an error to specify {\tt -d database} and then {\tt -c command} (if {\tt -d database} appears after {\tt -c command} it will be treated as part of the argument list for the command).


For example, the command line
\verb"xpp myfile.doc -d hol" will start {\Xpp} editing
the file {\tt myfile.doc} and running a {\Product} session with the {\tt hol} database.

If the file specified on the command line does not exist, {\Xpp} will put up a dialogue box with
buttons labelled ``New'' and ``Quit''. If you click New, {\Xpp} will start up with the script window
empty and with the file name set to what you specified on the file name. {\Xpp} will then try to create
the file when you first save your work. If you click Quit, then {\Xpp} will quit immediately.

If you specify an empty string either for the file name or for command and args, {\Xpp} will
start up displaying a dialogue box inviting you to enter the missing information interactively.

By default, {\Xpp} runs in the background, i.e., when you call {\Xpp} from the shell,
the {\Xpp} user interface starts asynchronously and control returns immediately to the shell.
If you want it to run in the foreground, specify {\tt -b} on the command line.

The command line interface to {\Xpp} is configurable.
The above description applies to the usual configuration to run {\Product} sessions.
The command options are recognised using an option description string configured into {\Xpp}.
See section~\ref{OtherSettings} below for more information on this.
If you are customising the configuration of {\Xpp} to run other commands, we recommend that you provide a separate script to run it with your variant configuration.

\subsection{Working with the {\Xpp} Interface}

Figure~\FigRef{fig2} shows {\Xpp} being used to work with a {\ProductHOL} specification.
The user is incrementally type-checking a specification.
An HOL constant {\it concl} has just been entered and type-checked and then the
user has used the Command Line tool, to enter a fragment of {\ProductML}
to find out more information about the types that have been inferred.
The user has then selected the next paragraph of the specification, which
is therefore highlighted in the script window. The next step will be to use
Execute from the Command menu to enter the paragraph into {\ProductHOL} to
be type-checked.

Figure~\FigRef{fig4} shows {\Xpp} being used to develop a proof interactively
with the subgoal package. The user has used the Command Line tool
to load in a specification from a file, has then set up the goal by executing
the line beginning {\it set\_goal} and has just executed the first
tactic (the line that is selected in the journal window).

Consult the {\Xpp} help system for further information about working with the {\Xpp} interface.
The Tutorial or Help items in the Help menu are the best place to start.
Many {\Xpp} functions are provided by tools windows, such as the Command Line tool that
can be seen in figure~\FigRef{fig2}.
In most of these windows, there is a Help button that you can press to get help with
using that window.

\begin{figure}
\begin{center}
\leavevmode
\epsffile{usr031c.eps}
\end{center}
\caption{Example {\Xpp} Command Interface Session (iii)}\label{fig4}
\end{figure}
\newpage
\section{CUSTOMISING \Xpp}\label{CUSTOMISING}
\subsection{Resource Settings}

{\XPP} is customisable via its resource file (application defaults file).
This resource file is a text file called {\XPP} which you can edit with
any text editor (e.g., {\Xpp} itself!) to change the appearance and
behaviour of {\Xpp}.
The location of the resource files depends on your local X Windows System configuration.
Typically, it will be in a subdirectory {\tt app-defaults} of your \verb"$HOME"
directory. Please consult either the README file for {\tt Xpp} or your local systems
administrator for more information.

An example resource file for {\Xpp} is provided in the subdirectory
{\tt app-defaults} of the {\Product} installation directory. The example resource  file uses \verb"#include"
directives to include the files {\tt XppFonts}, {\tt XppKeyboard} and {\tt XppTemplates}
which define the fonts and font sizes used in text windows, the keyboard layout and the appearance of the Templates Tool.
{\tt XppTemplates} is set up as a symbolic link.

If you want to customise the example resource files, then it is best to copy the
{\tt app-defaults} directory preserving the symbolic links. To do this create
a directory \verb"$HOME/app-defaults" and copy the contents of the {\tt app-defaults} directory  
in the {\Product} installation directory into it.

A typical entry in the resource file has the form:
\begin{verbatim}
    Xpp[<sep><widget name>].<resource name>:        <value>
\end{verbatim}

Here the leading \verb"Xpp" is the application class name for {\Xpp}.
The optional \verb"<sep><widget name>" may identify the part of {\Xpp} whose behaviour
is being controlled, \verb"<sep>" is either an asterisk or a dot,
\verb"<resource name>" identifies the attribute you want to change and
\verb"<value>" is the value you want to give to the attribute.
Sometimes \verb"<value>" has to be a long text string, and in that case
it can be split over several lines using a back-slash character at
the end of each line but the last.

Some resource settings, referred to as application resources, are specific to {\Xpp}.
The other resource settings in the example resource file are widget
resources, i.e., they affect generic attributes of the Motif widgets that make up {\Xpp}.
The application resources and the widget resources that are particularly significant
in {\Xpp} are discussed in more
detail in section~\ref{XppResources} below.
Users familiar with setting up
resource files for Motif applications are cautioned that the treatment of
{\tt translations} resources for text and text field widgets is special in {\Xpp},
because it arranges for these widget types to have a consistent behaviour.
See section~\ref{OtherSettings} for details.

Users typically configure {\Xpp} by adjusting the \verb"<value>" settings
in the example resource file supplied.
For reference, a listing of the complete widget hierarchy for {\Xpp} is provided in the file {\tt widgets.txt}.
This may be used to control
the appearance of {\Xpp} in fine detail, e.g., to set the colour of individual menu entries.
Consult the Motif manual pages for the various widget classes for more information.

\subsection{{\XPP}-Specific Resources}\label{XppResources}

\subsubsection{Options Settings}\label{OptionsSettings}
The following resource settings correspond to options that you can also change
while {\Xpp} is running using the Options Tool that you can bring up with the
Tools menu.

\begin{description}
\item[{\tt Xpp*take-backups.set}]
Allowed values: ``True'' or ``False''.
See section~\ref{Backups} below.
\item[{\tt Xpp*delete-backups.set}]
Allowed values: ``True'' or ``False''.
See section~\ref{Backups} below.
\item[{\tt Xpp*ignore-case.set}]
Allowed values: ``True'' or ``False''.
When this option is ``True'', the Search and Replace Tool will ignore
the case of letters when matching the search pattern with the text (i.e.,
`a' and `A' will be considered to be equal, etc.).
\item[{\tt Xpp*journal-max.value}]
Allowed values: a decimal integer.
In a command interface session, this limits the number of bytes of data that
is remembered in the journal window\footnote{
If you scroll to the top of the journal window, you will see a message
like ``{\tt **** Text lost when buffer exceeded 20000 bytes ****}'' if the
limit has been exceeded.}.
Values less than 2000 are mapped to 2000.
\item[{\tt Xpp*read-only.set}]
Allowed values: ``True'' or ``False''.
When this option is ``True'', you will be warned if you try to make changes to
the text in the script window or try to save the file.
This option may be set from the {\tt \Xpp} command line using the {\tt -readonly}
option keyword.
See section~\ref{ReadOnlyOption} for more details.
\item[{\tt Xpp*use-regular-expressions.set}]
Allowed values: ``True'' or ``False''.
When this option is ``True'', the Search and Replace Tool will interpret
the search pattern as a regular expression.
See section~\ref{RegularExpressions} for more details.
\item[{\tt Xpp.addNewLineMode}]
Allowed values: a decimal integer.
In a command interface session,
if the text selection does not end in a new-line character when you try
to execute it, {\Xpp} may take special action depending on the value of
this resource. 0 causes {\Xpp} automatically to add a new-line;
1 causes {\Xpp} to put up a dialogue box asking you what to do;
2 causes {\Xpp} to execute the selection unchanged without any intervention
on your part.
Values outside the range 0, 1, 2 are mapped to the nearest value in that range.
\end{description}

\subsubsection{Geometry Settings}\label{GeometrySettings}
The following settings are processed when {\Xpp} first starts running
and may be changed later either by resizing windows or using the
Window menu. The Show Geometry item in the Window menu displays the
current value of these settings.

\begin{description}
\item[{\tt Xpp.orientation}] Allowed values: ``VERTICAL'' or
``HORIZONTAL''.  In a command session, this resource determines whether the script window and journal
window are initially positioned one above the other or side by side. If you do not
specify this resource explicitly, the value is taken as ``VERTICAL'', i.e., the
windows are positioned one above the other.
This resource has no effect in an edit-only session.

\item[{\tt Xpp.totalRows, Xpp.totalColumns}] Allowed values: decimal integers.
In an edit-only session, these resources just give the desired number of rows
and columns in the script window.  In a command session with the vertical
layout, {\tt Xpp.totalRows} gives the number of rows to be divided between the
script and journal windows and {\tt Xpp.totalColumns} gives the number of
columns in the script window.  In a command session with the horizontal layout,
{\tt Xpp.totalRows} gives the number of rows in the journal window and {\tt
Xpp.totalColumns} gives the number of columns to be divided between the script
and journal windows.  Values outside the range $2\ldots1000$ are mapped to the
nearest value in that range.

\item[{\tt Xpp.journalRatio}] Allowed values: a decimal floating point number.
In a command session with the vertical layout,
this specifies the ratio of the number of rows in the journal window to
the total number of rows in the script and journal windows.
In a command session with the horizontal layout,
this specifies the ratio of the number of rows in the journal window to
the total number of rows in the script and journal windows.
When you select the Toggle Geometry item in the Window menu,
the ratio used is the value specified when {\Xpp} started.
Values outside the range $0.2\ldots0.9$ are mapped to the nearest value in that range.
\end{description}

\subsubsection{Other Settings}\label{OtherSettings}
The following settings are processed when {\Xpp} first starts running
and are not changeable via the Options Tool later.

\begin{description}

\item[{\tt Xpp.commandLineList}] Allowed values: a list of text strings
separated by ``\verb"\n"''.  The Command Line Tool maintains a list of useful
commands that you can add to as you go along. This resource specifies the
initial contents of the list.

\item[{\tt Xpp*command-text.translations}] Allowed values: a string
representing what is known a translation table in the X Toolkit Intrinsics
library (see the example files for the format).  A translation table associates
``actions'' with key strokes.  The text field containing the command in the
Command Line Tool maintains a history of up to 40 commands that have been
exeuted. To allow you to scroll through this history, {\Xpp} provides actions
``{\tt command-history-down}'' and ``{\tt command-history-up}'' in addition to
the repertoire of standard Motif actions for a text field widget.  These
actions are assigned to the Page Down and Page Up keys in the example resource
files.

\item[{\tt Xpp*journal.editable}] Allowed values: ``True'' or ``False''.  In a
command session, this resource controls what happens if you try to enter text
into the journal window. If the resource is false, the journal window will
never get the keyboard input focus and any text typed will go into the script
you are editing.  If the resource is true, then the command line tool will pop
up and the text will be diverted to the text area in the command line tool.
Setting the resource to true may not work well with some window manager
configurations, so you may need to experiment to see which setting is best for
your configuration.  The resource is set to false in the supplied example
resource file.

\item[{\tt Xpp*startup-command-line.value}] Allowed values: any
string that is a valid UN*X command line, e.g., {\tt pp -d hol}.  When you
start {\Xpp} from the New Command Session item in the Tools menu or by
specifiying an empty string as the value of the {\tt -command} line option, it
starts up displaying a dialogue box asking you to type in the command to run.
This resource gives a default value for the command line, which you can edit or
just accept when you see this dialogue.


\item[{\tt Xpp.templates}] Allowed
values: a list of triples each comprising a bitmap file name, an insertion text
string and a description text string; the values within each triple and the
triples are separated by slash characters.  This resource defines the behaviour
of the Templates Tool.  Each triple defines one button in the Templates Tool.
The bitmap gives the icon used as the label for the button, the insertion text
is the text that is entered into the script window when the button is pressed,
and the description string is the descriptive text associated with that icon in
the Templates Tool help dialogue.

The Templates Tool is limited to a maximum of 100 template buttons. If you
specify more, entries after the first 100 will be ignored.  The library
function {\tt XmGetPixmap} used to load the bitmap files has a rather complex
search algorithm.  If the environment variable {\tt XBMLANGPATH} is set, then
it gives a search path listing directories to be searched.  If this environment
variable is not set, a somewhat long list of directories including
subdirectories of the directory identified by the environment variable {\tt
XAPPLRESDIR}, if set, is used.  If neither of these environment variables is
set, then the directories \verb"$HOME" and \verb"$HOME/bitmaps" will be
searched as well as some other directories in the X Windows installation.
If all else fails, {\Xpp} will look for the bitmaps in the bitmaps subdirectory
of the {\Product} installation directory.

\item[{\tt Xpp.textTranslations}]
Allowed values: a string representing what is known a translation table in the
X Toolkit Intrinsics library (see the example files for the format).  A
translation table associates ``actions'' with key strokes.  This resource is
used to override the translation table for all the various text areas used for
text that may include mathematical symbols.

This resource is used in {\Xpp} to give keyboard short-cuts for entering text
(typically mathematical symbols) and for executing commands.  For the latter
purpose, {\Xpp} adds an additional action ``{\tt execute}'' to the repertoire
of standard Motif actions in the script window widget.  With no parameters this
action causes the text selected in the script window to be executed (just like
Execute Selection in the Command menu).  With parameters, the action executes
the text given as parameters.

The example resource file uses a \verb"#include" directive to include the file named {\tt XppKeyboard}.
See section~\ref{KeyboardLayout} below for more
information.

\item[{\tt Xpp.defaultCommand}]
Allowed values: a string giving a UNIX command line to
be executed if {\Xpp} is invoked with command line options other than
the X WIndows toolkit options or the options defined for {\Xpp}.
The example resource file sets this to {\tt pp}, so that, for example,
if called with the command line \verb"xpp -d hol", {\Xpp} will take
\verb"pp -d hol" as the command line to run.

\item[{\tt Xpp.argumentChecker}]
Allowed values: a string giving a UNIX command line to
be executed if {\Xpp} is invoked with command line options other than
the X WIndows toolkit options or the options defined for {\Xpp}.
The other options are appended to this string and the result is
executed as a UNIX command line before bringing up the graphical
user interface. {\Xpp} exits if the command line exits with a non-zero response
code. The intention is that the command line supplied should validate
the options and exit with a non-zero response if the command line specified
by the resource {\tt Xpp.defaultCommand} is likely to fail. The example
resource file sets this to \verb"pp -V".

\item[{\tt Xpp.optionString}]
Allowed values: a string specifying the {\Xpp} and command option syntax
in the {\tt getopts(1)} format.
The default is appropriate for the {\Product} program {\tt pp}.
This string must include ``{\tt bcf:hr}'' so that the {\Xpp} options
are recognised correctly.


\end{description}

\subsection{Keyboard Layout}\label{KeyboardLayout}
The X Windows system defines a number of logical modifier keys: keys that affect
the interpretation of other keys.
By setting up suitable modifier keys and, if necessary, adjusting the
resource setting {\tt Xpp.textTranslations}, you can arrange to enter all the mathematical
symbols in the {\Product} extended character set using the keyboard.
The mapping of physical keys on your keyboard
to modifier keys can be displayed and changed using the {\tt xmodmap} program.

As keyboard layouts vary widely and some subsystems, such as window
managers, impose constraints on the use of some keys, you may need to experiment
a little to get a workable layout. With most modern keyboards, it is possible to
arrange for four extended character shift key combinations (so that each
key can generate six different symbols).
The supplied resource files include an example file {\tt XppKeyboard} that gives a mapping that works well with many keyboards.

If you run it with no command line options, {\tt xmodmap} will display the current settings
for the eight logical modifier keys supported by X Windows.

The keyboard layout {\tt XppKeyboard} provided as the default is shown in figure~\ref{fig5}.
Each key cap in the diagram is labelled with the characters which that key
can produce. The ``Shift+key'' combination is not shown, since it will be specific
to the keyboard for the numeric keys.
The bottom right part of the diagram shows which combination of modifier
keys produce which character. Since the four shift combinations give some
spare capacity, some keys have been mapped to multiple character sequences
as shown in the table at the bottom left of the diagram.
The example
uses the logical modifier keys ``Mod4'', ``Mod5'' and ``Shift'' to give four extended character shift combinations.
See the comments in the file {\tt XppKeyboard} for some hints on how to proceed on systems with keyboards that offer more limited possibilities for
the modifier keys.
You may wish to change the details of the assignments of
symbols to key combinations in {\tt XppKeyboard}. The octal codes
you will need for this purpose are shown in the table in section~\ref{FONTS} below.

%\clearpage

\input{usr001A.tex}

\begin{figure}
\begin{center}
\KEYBOARD
\par\vspace{0.25in}
\KEYBOARDKEY
\end{center}
\caption{Example Keyboard Layout: {\tt XppKeyboard}}\label{fig5}
\end{figure}

\section{SYSTEM INTERFACES}

Section~\ref{InvocationAndEnvironment} to~\ref{RegularExpressions} below
explain some of the interactions between {\Xpp},
the operating system and the X Windows System.

\subsection{Invocation and Environment}\label{InvocationAndEnvironment}
The behaviour of {\Xpp} and can be influenced by environment variables and by the configuration of the X server.
These can be set up before {\Xpp} is invoked, but if {\Xpp} is installed in the normal way, it will provide defaults which should be suitable for most users.
This process is explained in more detail below.

If the variable {\tt PPHOME} has not been set in the calling environment, {\Xpp} will attempt to locate the {\Product} installation directory and then set up its {\tt PATH} environment variable by prefixing the setting in the calling environment with the full path name of the {\tt bin} subdirectory of the installation directory.
If {\tt PPHOME} has been set, {\Xpp} will use its value as the name of the installation directory in any subsequent actions that require it, but will leave the {\tt  PATH} environment variable unchanged.

{\raggedright
If neither of the environment variables {\tt XUSERFILESEARCHPATH}  or {\tt XAPPLRESDIR} has been set in the calling environment, {\Xpp} will set {\tt XUSERFILESEARCHPATH} in its environment to the value
\verb"$HOME/app-defaults/%N:$HOME/%N:<inst_dir>/app-defaults/%N", where \verb"<inst_dir>" stands the name of the installation directory as determined above.
This means that if the calling environment has not set {\tt XUSERFILESEARCHPATH}  or {\tt XAPPLRESDIR}, the resource file for this run of {\Xpp} will be found by searching for a file named {\tt Xpp} in the {\tt app-defaults} directory of the user's home directory, then in the user's home directory, then in the  {\tt app-defaults} subdirectory of  the installation directory.

} %\raggedright

{\Xpp} attempts to load the bitmaps for the templates tool as discussed in section~\ref{OtherSettings} above using the {\tt bitmaps} subdirectory of the installation directory as the default location for any bitmap that is not found by the standard {\tt XmGetPixmap} search algorithm.

\subsection{Backups}\label{Backups}
When you select the Save function in the file menu,
{\Xpp} may take a backup copy before it overwrites your file.
Note that this only applies to the Save function, the Save As
and Save Selection As functions will always prompt you before
overwriting an existing file, but will not take a backup for
you if you decide to overwrite the file.

{\raggedright What {\Xpp} does depends on the value of the resources named
{\tt Xpp*take-backups.set} and {\tt Xpp*delete-backups.set}.
Both these resources are set to ``True'' in the example resource file supplied with {\Xpp}
and these are the recommended settings for normal use.
See section~\ref{OptionsSettings} for how to change these settings, if you need to.

}

If {\tt Xpp*take-backups.set} is``True'', the Save
function will take backups.
{\Xpp} derives the name of the backup file
by appending ``{\tt .xpp.backup}'' to the name of your file.

If {\tt Xpp*delete-backups.set} is ``True'', the Save function
will delete the backup file if your file has been successfully
overwritten. The backup file will not be deleted if {\Xpp}
was unable to overwrite your file (e.g., if the file system is full).

Some Unix and Linux file system types, e.g., MS-DOS file systems,
may not support the file names that {\Xpp} uses for its backup files.
{\Xpp} will detect this situation and prompt you for confirmation
if the backup cannot be taken for this reason.

\subsection{Signals}\label{Signals}
This section assumes you know a little about Unix and Linux signals.
E.g., see the {\tt man} page for {\tt kill(1)}.
{\XPP} recognises all the signals supported on your operating
sytem that are defined by the Single UNIX Standard (SUS V3)
and also some others that are specific to particular operating systems.
The response of {\Xpp} to various types of signal is shown in the following
table.

\begin{center}
\begin{tabular}{|l|p{4in}|}\hline
\multicolumn{2}{|c|}{\bf Non-fatal signals:}\\\hline
SIGINT
 &
{\XPP} behaves as if you had selected the Quit function from the file
menu, i.e., if the file you are editing has not been saved or
if the application is still running, {\tt Xpp}
will ask you for confirmation whether to quit, and will exit with a 0 return status.
if you choose to quit.
\\\hline
SIGHUP
&
{\XPP} ignores this signal.
\\\hline
\begin{tabular}[t]{@{}l@{}}
SIGTSTP\\SIGWINCH\\Etc.
\end{tabular} &
{\XPP} takes the default action specified by the operating system for the signal in question.\\\hline
\multicolumn{2}{|c|}{\bf Fatal signals:}\\\hline
\begin{tabular}[t]{@{}l@{}}
SIGBUS\\SIGFPE\\SIGSEGV\\SIGSYS\\Etc.
\end{tabular} &
{\XPP} will try to make an emergency backup of your file.
The emergency backup file will have a name of the form ``{\tt xpp.panic.\it XXXXXX}'' where
``{\tt \it XXXXXX}'' is some combination of letters and numbers.
{\XPP} will then send an error message, including the name of the emergency backup file
to the standard error channel and exit with a non-zero return status.\\\hline
\end{tabular}
\end{center}

\subsection{Application-Modal Dialogues}\label{ModalDialogues}

Often {\Xpp} puts up a dialogue, e.g., to ask you to select
a file, and you must respond to the dialogue before {\Xpp} can do anything else.
These are called {\em application-modal dialogues} in the X Windows System terminology.

Most window managers ensure that application-modal dialogues are never obscured by
any other window in the application itself. However, some window managers can be
configured in such a way that an application-modal dialogue can get hidden behind another
{\Xpp} window. When this happens {\Xpp} will appear to freeze. You can solve this by sliding
the visible {\Xpp} windows to the edge of the screen until you find the hidden dialogue
window.

\subsection{Read-only Option and File Access Permissions}\label{ReadOnlyOption}

{\Xpp} has a read-only option which is intended to help you work with files for which
you do not have write access. You can also use this option to protect against accidental
changes to files that you do not wish to change.
This option can be set when you start {\Xpp} using the {\tt -readonly} option keyword
or interactively using the Options Tool.
The option can also be set in the resource file (see section~\ref{CUSTOMISING}) and
doing so is equivalent to setting it on the command line.
The option is set automatically by {\Xpp} when you open a file for which you do not have write access.

When the read-only option is turned on you will be warned if you try
to make a change to the text in the script window or if you try to save the file
using Save in the File menu. You will not be warned if you save the file under a new
name using Save As in the File menu.

If you do not specify {\tt -readonly} when you start {\Xpp},
you will be warned whenever you open a file for which you do
not have write access.
The read-only option will be set automatically to match
your write access for the file you are currently editing. When you save a file
using Save As in the File menu, the read-only option is automatically turned off if
the save operation succeeds.

If you are planning to work with several files for which you do not
have write access and do not wish to be warned every time you open one of them,
specifying {\tt -readonly} when you start {\Xpp} will suppress the warnings.
If you do this, turning the read-only option off using the Options Tool will enable the warnings.

Some editors have a facility for overriding the access permissions
of a file (e.g., the {\tt w!} command in {\tt vi}). This kind of facility is not provided by
{\Xpp}, which never attempts to change the access permissions of a file. If you need to change
permissions, then use the {\tt chmod(1)} command from the Unix or Linux shell.

If you are running as the super-user, {\Xpp} will consider any file you open to be read-only
unless it is owned by the super-user and has owner write-permission.
\subsection{Working with Microsoft and Apple Macintosh Files}\label{FileTypes}

{\Xpp} lets you work with text files created using the Microsoft  and the Apple Macintosh operating systems
as well as with text files created on Unix.
The three text file formats are distinguished by the characters used to terminate lines of text (line-feed on Unix, carriage-return on Macintosh, and carriage-return/line-feed pairs on Microsoft operating systems).

When a file is opened, {\Xpp} checks the line terminators to determine the type of the file, which is recorded as
one of ``Unix'', ``MS-DOS'' or ``Macintosh'' in the File Type menu in the Options Tool.
If the file being opened uses a mixture of line terminatiors, {\Xpp} will report the problem
and record the file type as ``Unix''.
When a file is saved, {\Xpp} uses the setting of the File Type menu  in the Options Tool
to select which line terminators to use. You may change this setting to convert between the different formats.


\subsection{Working with Binary Files}\label{BinaryFiles}

{\Xpp} is not designed as an editor for files containg binary data: i.e., control characters other than
tab, line-feed and carriage return. It can be used to inspect such files, but any uneditable characters
are converted into question mark characters and will be saved as question mark characters if you save
the file. This is intended, for example, to let you recover text from a file that has been partially corrupted.
If you open a file containing binary data, you will be warned that the uneditable characters have been
changed and the read-only option will be set to remind you that saving the file may cause problems.

\subsection{Regular Expressions}\label{RegularExpressions}

When the option {\tt Xpp*use-regular-expressions.set} is ``True'',
{\Xpp} treats the search pattern in the Search and Replace Tool as
a regular expression. {\Xpp} uses the POSIX-compliant regular
expression library supplied with your system. Some of the more useful
regular expressions forms are shown in the following table:


\begin{center}

\begin{tabular}{|c|p{5in}|}\hline
$c$ &
	matches the character $c$,
	provided $c$ is a character, such as a letter, digit, space, tab or
	new-line that does not have a special meaning.
\\\hline
\verb"\"$c$ &
	matches the character $c$, whether or not $c$ is a character
	such as {\tt *} which would otherwise have a special meaning.
\\\hline
{\tt .} & matches any character other than new-line.
\\\hline
{\tt [}{\it list}{\tt ]} &
	matches any character in {\it list}. {\it list} may include character
	ranges such as {\tt a-z} and character classes such as \verb"[:alpha:]",
	and \verb"[:digit:]".
\\\hline
\verb"[^"{\it list}{\tt ]} &
	matches any character other than new-line that is not in {\it list}.
\\\hline
\verb"^" &
	matches the empty string at the beginning of a line.
\\\hline
\verb"$" &
	matches the empty string at the end of a line.
\\\hline
$e${\tt *} &
	matches zero or more occurrences of the regular expression {\it e}.
\\\hline
$e${\tt +} &
	matches one or more occurrences of the regular expression $e$.
\\\hline
$e${\tt \{}{\it m}{\tt ,}{\it n}{\tt \}} &
	matches any sequence of at least {\it m} and at most {\it n} occurrences
	of the regular expression $e$.
\\\hline
$e_1$\verb"|"$e_2$ &
	matches anything that matches either or both of the regular
	expressions $e_1$ and $e_2$. The \verb"|" operator has lower
	precedence than the postfix operators {\tt *}, etc.
\\\hline
{\tt (}$e${\tt )} &
	matches anything that matches the regular expression $e$.
	Brackets enable you to control the operator precedence.
	E.g., \verb"a|b*" matches either a single `a' or any string
	of `b's, whereas \verb"(a|b)*" matches any string
	of `a's and `b's.
\\\hline
\end{tabular}

\end{center}

In {\Xpp}, matches with empty strings are only allowed for sub-expressions
of the search pattern.
The Search and Replace Tool considers a search operation that matches an empty string
to be unsuccessful.

In replace operations in {\Xpp}, `\verb"&"' and `\verb"\"' have special meanings
in the replacement text when regular expression searching is turned on.
The character `\verb"&"' stands for a copy of the text being replaced.
{\tt Xpp} has a set of registers numbered 0 to 9 to hold information
about the last successful search. The contents of these registers
can be included in the replacement text using a `\verb"\"' followed by
the register number.
After a search,
register 0 holds the entire matched text (so `\verb"\0"' is the same as `\verb"&"' immediately after a search),
while registers 1, 2, \ldots and 9 hold the
string that matched the first, second, \ldots, and ninth bracketed
sub-expressions of the search pattern.
If $c$ is not a decimal digit, then
`\verb"\"$c$' stands for the character $c$, so that you
can include a backslash or an ampersand in your replacement using `\verb"\\"' or `\verb"&"'.


Consult your local UNIX or Linux manual pages (typically under
{\tt regex(5)} or {\tt regex(7)}) for more information on the
regular expression syntax supported on your system. {\Xpp} uses
the POSIX extended regular expression syntax.

\newpage
\section{FONTS AND UNICODE}\label{unicode}
{\Product} provides two TrueType fonts, {\ProofPowerMono} and {\ProofPowerSerif},
that provide glyphs for the mathematical symbols needed
for the supported object languages. These have been derived from fonts in the GNU FreeFont
font collection.

{\ProofPowerMono} is derived from the GNU {\FreeMono} font. It is a fixed width font with
the glyphs needed for all the {\Product} object languages, but with limited support
for the mathematical symbols defined in Unicode with codes above 0x00FFFF, e.g., only
the blackboard bold letters used in the {\Product} object languages are provided.

{\ProofPowerSerif} is derived from the GNU {\FreeSerif} font. It is a variable width font
with a comprehensive range of mathematical symbols. Unfortunately, it requires a patch
to Motif to work well with {\Xpp}.

In both {\ProofPowerMono} and {\ProofPowerSerif}, type quotations, ML quotations and
Z quotations are supported by assigning non-standard glyphs to the codepoints for
some of the circled letter codes as shown in the following table:

\begin{center}
\begin{tabular}{|l|l|c|}\hline
{\bf Codepoint} & {\bf Name} & Glyph \\\hline
0x0024E3 & CIRCLED LATIN SMALL LETTER T & \PrJE \\\hline
0x0024DC & CIRCLED LATIN SMALL LETTER M & \PrJB \\\hline
0x0024E9 & CIRCLED LATIN SMALL LETTER Z & \PrPB \\\hline
\end{tabular}
\end{center}

Glyphs that are not supported are usually displayed like this: $\begin{array}{|@{\,}c@{\,}|}\hline?\\\hline\end{array}$.
An item ``Identify Unicode'' is provided in the {\Xpp} Edit menu
to help you if your file contains glyphs that are not supported by the font
you are using. If you select some text in the script
window and choose ``Identify Unicode'', {\Xpp} will bring up a window
displaying the Unicode codepoints and names of the characters in
your selection.

\newpage
\appendix
\section{{\tt XPPEXT}}\label{XPPEXT}
\subsection{Introduction}
This section describes the differences between the {\XppExt}
variant of {\Xpp} and {\Xpp} itself. The two programs actually
only differ in the resource files they select.

While {\Xpp} uses standard UTF-8 encoded fonts, {\XppExt} uses
a bespoke 8-bit extended character set supported by custom X Windows fonts.
This allows {\XppExt} to diplay the most common mathematical symbols supported by {\Product}
on the screen much as they appear on the printed page. The fonts are described
in section~\ref{FONTS} below.

The ``Identify Unicode'' item is not available in {\XppExt}.

\subsection{Font Management}
{\Xpp} configures Motif to use the FontConfig library for font management, while {\XppExt}
configures it to use the traditional X Windows font selection system.
By default, {\XppExt} will attempt to ensure that the fonts supporting
the extended character set is available.
This is not done if the {\tt -havefonts} option is specified.
If the {\tt -havefonts} option has not been specified, {\Xpp} will check if the {\Product} fonts are available and if not, will add the {\tt fonts} subdirectory of the installation directory to the font search path (by making the library calls equivalent to an {\tt xset(1)} command with an appropriate {\tt fp} option).
If the {\tt -havefonts} option has been specified, {\Xpp} will not change the font search path.


\subsection{Resource Settings}
The resource file (application defaults file) for {\XppExt}
is called \verb"XppExt" and it is supported by the files
\verb"XppExtFonts", \verb"XppExtKeyboard" and \verb"XppExtTemplates" that it includes.

The application class name for {\XppExt} is \verb"XppExt" so
a typical entry in the resource file has the form:
\begin{verbatim}
    XppExt[<sep><widget name>].<resource name>:        <value>
\end{verbatim}


\subsection{The Extended Character Set}\label{FONTS}
{\XPPEXT} is supplied with three fonts which each provide the same mathematical character set:
{\tt holnormal} is a 16-point Roman font; {\tt holsans10} is a 10-point
sans-serif font and {\tt holdouble} is a 32-point Roman font. The character codes
and their corresponding images are shown in the following table:

{ % beginning of Font display macros:
\newdimen\ColHeight
\parsep 0pt plus 5pt

\def\SHOWIT#1#2#3{\hbox{\hbox to 3em{#1\hfil}\hbox to 3em{#2\hfil}\hbox to 4em{#3\hfill}}\par}
\def\COLHEAD{\SHOWIT{Hex}{Octal}{Image}\bigskip\ignorespaces}

\makeatletter
\def\@undef#1{[spare]}
\makeatother

\newbox\AllChars
\newbox\ColA
\newbox\ColB
\newbox\ColC

\setbox\AllChars=\vbox{{
	\makeatletter
	\ShowAllImages
	\makeatother
    \SHOWIT{80}{200}{\PrIA}
    \SHOWIT{81}{201}{\PrIB}
    \SHOWIT{82}{202}{\PrIC}
    \SHOWIT{83}{203}{\PrID}
    \SHOWIT{84}{204}{\PrIE}
    \SHOWIT{85}{205}{\PrIF}
    \SHOWIT{86}{206}{\PrIG}
    \SHOWIT{87}{207}{\PrIH}
    \SHOWIT{88}{210}{\PrII}
    \SHOWIT{89}{211}{\PrIJ}
    \SHOWIT{8A}{212}{\PrIK}
    \SHOWIT{8B}{213}{\PrIL}
    \SHOWIT{8C}{214}{\PrIM}
    \SHOWIT{8D}{215}{\PrIN}
    \SHOWIT{8E}{216}{\PrIO}
    \SHOWIT{8F}{217}{\PrIP}
    \SHOWIT{90}{220}{\PrJA}
    \SHOWIT{91}{221}{\PrJB}
    \SHOWIT{92}{222}{\PrJC}
    \SHOWIT{93}{223}{\PrJD}
    \SHOWIT{94}{224}{\PrJE}
    \SHOWIT{95}{225}{\PrJF}
    \SHOWIT{96}{226}{\PrJG}
    \SHOWIT{97}{227}{\PrJH}
    \SHOWIT{98}{230}{\PrJI}
    \SHOWIT{99}{231}{\PrJJ}
    \SHOWIT{9A}{232}{\PrJK}
    \SHOWIT{9B}{233}{\PrJL}
    \SHOWIT{9C}{234}{\PrJM}
    \SHOWIT{9D}{235}{\PrJN}
    \SHOWIT{9E}{236}{\PrJO}
    \SHOWIT{9F}{237}{\PrJP}
    \SHOWIT{A0}{240}{\PrKA}
    \SHOWIT{A1}{241}{\PrKB}
    \SHOWIT{A2}{242}{\PrKC}
    \SHOWIT{A3}{243}{\PrKD}
    \SHOWIT{A4}{244}{\PrKE}
    \SHOWIT{A5}{245}{\PrKF}
    \SHOWIT{A6}{246}{\PrKG}
    \SHOWIT{A7}{247}{\PrKH}
    \SHOWIT{A8}{250}{\PrKI}
    \SHOWIT{A9}{251}{\PrKJ}
    \SHOWIT{AA}{252}{\PrKK}
    \SHOWIT{AB}{253}{\PrKL}
    \SHOWIT{AC}{254}{\PrKM}
    \SHOWIT{AD}{255}{\PrKN}
    \SHOWIT{AE}{256}{\PrKO}
    \SHOWIT{AF}{257}{\PrKP}
    \SHOWIT{B0}{260}{\PrLA}
    \SHOWIT{B1}{261}{\PrLB}
    \SHOWIT{B2}{262}{\PrLC}
    \SHOWIT{B3}{263}{\PrLD}
    \SHOWIT{B4}{264}{\PrLE}
    \SHOWIT{B5}{265}{\PrLF}
    \SHOWIT{B6}{266}{\PrLG}
    \SHOWIT{B7}{267}{\PrLH}
    \SHOWIT{B8}{270}{\PrLI}
    \SHOWIT{B9}{271}{\PrLJ}
    \SHOWIT{BA}{272}{\PrLK}
    \SHOWIT{BB}{273}{\PrLL}
    \SHOWIT{BC}{274}{\PrLM}
    \SHOWIT{BD}{275}{\PrLN}
    \SHOWIT{BE}{276}{\PrLO}
    \SHOWIT{BF}{277}{\PrLP}
    \SHOWIT{C0}{300}{\PrMA}
    \SHOWIT{C1}{301}{\PrMB}
    \SHOWIT{C2}{302}{\PrMC}
    \SHOWIT{C3}{303}{\PrMD}
    \SHOWIT{C4}{304}{\PrME}
    \SHOWIT{C5}{305}{\PrMF}
    \SHOWIT{C6}{306}{\PrMG}
    \SHOWIT{C7}{307}{\PrMH}
    \SHOWIT{C8}{310}{\PrMI}
    \SHOWIT{C9}{311}{\PrMJ}
    \SHOWIT{CA}{312}{\PrMK}
    \SHOWIT{CB}{313}{\PrML}
    \SHOWIT{CC}{314}{\PrMM}
    \SHOWIT{CD}{315}{\PrMN}
    \SHOWIT{CE}{316}{\PrMO}
    \SHOWIT{CF}{317}{\PrMP}
    \SHOWIT{D0}{320}{\PrNA}
    \SHOWIT{D1}{321}{\PrNB}
    \SHOWIT{D2}{322}{\PrNC}
    \SHOWIT{D3}{323}{\PrND}
    \SHOWIT{D4}{324}{\PrNE}
    \SHOWIT{D5}{325}{\PrNF}
    \SHOWIT{D6}{326}{\PrNG}
    \SHOWIT{D7}{327}{\PrNH}
    \SHOWIT{D8}{330}{\PrNI}
    \SHOWIT{D9}{331}{\PrNJ}
    \SHOWIT{DA}{332}{\PrNK}
    \SHOWIT{DB}{333}{\PrNL}
    \SHOWIT{DC}{334}{\PrNM}
    \SHOWIT{DD}{335}{\PrNN}
    \SHOWIT{DE}{336}{\PrNO}
    \SHOWIT{DF}{337}{\PrNP}
    \SHOWIT{E0}{340}{\PrOA}
    \SHOWIT{E1}{341}{\PrOB}
    \SHOWIT{E2}{342}{\PrOC}
    \SHOWIT{E3}{343}{\PrOD}
    \SHOWIT{E4}{344}{\PrOE}
    \SHOWIT{E5}{345}{\PrOF}
    \SHOWIT{E6}{346}{\PrOG}
    \SHOWIT{E7}{347}{\PrOH}
    \SHOWIT{E8}{350}{\PrOI}
    \SHOWIT{E9}{351}{\PrOJ}
    \SHOWIT{EA}{352}{\PrOK}
    \SHOWIT{EB}{353}{\PrOL}
    \SHOWIT{EC}{354}{\PrOM}
    \SHOWIT{ED}{355}{\PrON}
    \SHOWIT{EE}{356}{\PrOO}
    \SHOWIT{EF}{357}{\PrOP}
    \SHOWIT{F0}{360}{\PrPA}
    \SHOWIT{F1}{361}{\PrPB}
    \SHOWIT{F2}{362}{\PrPC}
    \SHOWIT{F3}{363}{\PrPD}
    \SHOWIT{F4}{364}{\PrPE}
    \SHOWIT{F5}{365}{\PrPF}
    \SHOWIT{F6}{366}{\PrPG}
    \SHOWIT{F7}{367}{\PrPH}
    \SHOWIT{F8}{370}{\PrPI}
    \SHOWIT{F9}{371}{\PrPJ}
    \SHOWIT{FA}{372}{\PrPK}
    \SHOWIT{FB}{373}{\PrPL}
    \SHOWIT{FC}{374}{\PrPM}
    \SHOWIT{FD}{375}{\PrPN}
    \SHOWIT{FE}{376}{\PrPO}
    \SHOWIT{FF}{377}{\PrPP}
}}

\vbadness=10000

\ColHeight=\ht\AllChars
\advance\ColHeight by \dp\AllChars
\divide\ColHeight by 4

\setbox\ColA=\vsplit\AllChars to \ColHeight
\setbox\ColB=\vsplit\AllChars to \ColHeight
\setbox\ColC=\vsplit\AllChars to \ColHeight

\hbox to \textwidth{%
	\vtop{\COLHEAD\unvbox\ColA}\hfill
	\vtop{\COLHEAD\unvbox\ColB}\hfill
	\vtop{\COLHEAD\unvbox\ColC}\hfill
	\vtop{\COLHEAD\unvbox\AllChars}
}

} % end of font display stuff.

\end{document}
