=IGN
********************************************************************************
usr004.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr004.doc   %A%
=IGNORE
           % U s e f u l C o m m a n d s

cp  ~ied/rel001/latest/sun3hol.db example.db; chmod +w example.db

% the style file USR.sty is held in usr024.doc and may be extracted as follows:
docsml usr024.doc ; mv usr024.sml USR.sty

pp -d demo
awk 'length($0) >255 {print NR, $0}' <usr004.doc
rm -f *.aux *.dvi *.idx *.log *.sid
rm usr004.mkf; sieve sml < wrk026.doc > usr004.mkf
make -f usr004.mkf prevubook
doctex usr004
texdvi usr004
texdvi usr004
bibtex usr004
texdvi usr004
dvipage usr004

=TEX
% COPYRIGHT (c) Lemma 1 Ltd.

% \documentstyle[hol1,11pt,fleqn,USR]{book}
\documentclass[a4paper,11pt]{book}
\usepackage{ppusr}
\usepackage{ProofPower}
\usepackage{fleqn}


\def\SCCSversion{\VCVersion}
\def\SCCSdate{\VCDate}

\USRmanual{Introductory Tutorial}
\USRref{USR004}
%\USRdate{\SCCSdate}
\USRisbns{1514208261}
\USRisbnl{978-1514208267}

\raggedbottom
\ftlinepenalty=9999
\makeindex

\title{\Product}
\author{ }

\setcounter{tocdepth}{2}
\begin{document}

\makeUSRfrontpage

\long\def\ignore#1{}
\ignore{
=SML
repeat drop_main_goal;
open_theory "hol";
new_theory "usr004";
=TEX
}
%\underscoreoff

\def\mela{ML}
\def\obla{HOL}

\chapter*{CONTENTS}

\tableofcontents

\pagebreak

\setcounter{chapter}{-1}

\chapter{ABOUT THIS PUBLICATION} \label{intro}
\section{Purpose}

This document, one of several making up the user documentation for the \Product\ system,  contains a tutorial introduction to the  system.
\section{Readership}

This document is intended to be the first to be read by new users of {\Product}. It is a tutorial for learning the basic  use of the system.  The reader is assumed to be familiar with predicate logic.


\section{Related Publications}

A bibliography is given at the end of this document.
Publications relating specifically to \Product\ are:

\begin{enumerate}
\item {\em \ {\HTUTORIAL}}, tutorial notes for the {\ProductHOL} course.
\item {\em \ {\ZTUTORIAL}}, a tutorial covering {\ProductZ}.
\item {\em \ {\DESCRIPTION}};
\item {\em \ {\REFERENCE}};
\item {\em \ {\INSTALLATION}};
\item {\em \ {\TYPESETTING}}.
\end{enumerate}

\section{Area Covered}

This tutorial  is an introductory \Product\ course which gives an idea of the way \Product\ is used, but which does not systematically explain the underlying principles.
After working through  this tutorial, the reader should be capable of using \Product\ for simple tasks, and should also be in a position to approach the {\REFERENCE}.

Once the \Product\ system is installed on the user's workstation, by following the procedure described in the Installation Guide, this tutorial should enable the potential \Product\ user to become familiar with the following subjects:

\begin{enumerate}
\item
The metalanguage {\ProductML}, and how to interact with the metalanguage compiler.
The description of {\ProductML} given here is very brief, only intended to be sufficient to support the exposition of {\Product}.
\ProductML\ is an extension of the programming language Standard ML.
For a more complete introduction to Standard ML the reader is referred to \cite{PAULSON91}, \cite{WIKSTROM87}, or \cite{HARPER88}.
\item
The formal logic supported by the \Product\ system (higher order logic) and its manipulation via the metalanguage.
\item Forward proof and derived rules of inference.
\item Goal directed proof, and tactics and tacticals.
\end{enumerate}

The sections that follow cover these topics in the sequence shown above.
\section{Assumptions}

Though this tutorial can be read independently, it is most beneficially read while running {\Product} so that the features described can be observed at first hand.
The instructions for running {\Product} assume that the reader has available an installed \Product\ system, and that the reader is following the tutorial at a workstation and trying out the examples interactively.
Basic familiarity with using the X Windows System is assumed.

Other tutorial manuals are available with {\Product}, which are best attempted after reading this tutorial, which is the tutorial most suitable for absolute beginners.
After reading this tutorial, a more thorough knowledge of {\Product} may be obtained by working through {\HTUTORIAL}, which contains exercises and solutions, and covers a wider range of facilities than those described here.
Those interested in the Z support facilities of {\Product} may then work through {\ZTUTORIAL} which describes how to use {\Product} for specification and proof in {\ProductZ}.

\section{Acknowledgements}

ICL gratefully acknowledges its debt to the many researchers (both academic and industrial) who have provided the intellectual capital on which ICL has drawn in the development of \Product.

We are particularly indebted to Mike Gordon of Cambridge, both for his leading role in the research on which {\Product} is based, and for the text, \cite{SRI89B}, which formed the starting point for the development of this tutorial.

The \Product\ system is a proof tool for Higher Order Logic which builds upon ideas arising from research carried out at the Universities of Cambridge and Edinburgh, and elsewhere.

In particular the logic supported by the system is (at an abstract level) identical to that implemented in the Cambridge HOL system \cite{gordon93}, and the paradigm adopted for implementation of proof support for the language follows that adopted by Cambridge HOL, originating with the LCF system developed at Edinburgh \cite{gordon79}.
The functional language ``standard ML'' used both for the implementation and as a interactive metalanguage for proof development, originates in work at Edinburgh, and has been developed to its present state by an international group of academics and industrial researchers.
The implementation of Standard ML on which \Product\ is based was itself implemented by David Matthews at the University of Cambridge, and is now commercially marketed by Abstract Hardware Limited.

\label{getting-started}

\pagebreak

\chapter{GETTING STARTED} \label{install}

This manual is intended to serve as a tutorial introduction to the use of {\Product} for simple specification and proof using the {\ProductHOL} language.
It contains numerous examples of interaction with {\Product}.
Many readers will wish to try out the examples interactively as they read.
The remainder of this chapter explains how to do this.

The instructions which follow assume that you are working in a user name which has been set up to run {\Product} as described in the installation instructions supplied with the software.
If you have problems with the instructions, this may well be because your user name has not been set up to run {\Product} or because there has been some problem with the installation of {\Product}.
If you have difficulty, you are advised first to consult the installation
instructions or the person responsible for installing the {\Product} software on your system.


\section{Interaction with {\Product}}
The most convenient way to use {\Product} for developing both specifications and proofs involves two parallel activities:

\begin{itemize}
\item
Using an editor to develop a {\LaTeX} source document called a `literate script' (see \TYPESETTING) in which {\Product} commands are recorded.
\item
Executing {\ProductML} commands, typically extracted from the script.
The various object languages, {\ProductHOL}, {\ProductZ}, etc., supported by the tool are all embedded in {\ProductML}, and execution of {\ProductML} commands is  how fragments of specification are checked and how proof steps are conducted.
\end{itemize}

Under the X Windows System, the recommended way of carrying out these two activities is to use the program {\tt xpp} which integrates a general purpose editor
with the {\ProductML} compiler and gives easy ways of carrying out many of
the common tasks (e.g., entering mathematical symbols).
Sections \ref{SettingUp} to \ref{EndingTheSession} below describe how to use {\tt xpp} to work through the examples in this tutorial.
The instructions in these sections assume that you have started up X in the way appropriate for your system and that you have an `xterm', `command tool' or other UNIX terminal emulator on the work station screen.


An advantage of {\tt xpp} is that it supports the use of mathematical symbols on the screen.
It is possible to run {\Product} without using {\tt xpp}, but this advantage is then lost: mathematical symbols have to be handled as ASCII keywords.
Users who are obliged to work the tutorial examples in ASCII are referred to section \ref{WorkingInASCII} below.

\section{Setting Up}\label{SettingUp}
The results of work with the \Product\ system  are stored in what is called a {\em database}.  A database stores  objects of different kinds: definitions, axioms, theorems and theories.    Work with \Product\ will commonly result in updating a database.

The \Product\ system is issued with a relatively large database of predefined objects, and it is desirable both  to avoid casual modification to this  issued database and to avoid making unnecessary copies of it.
  Consequently the user is recommended to create a new empty database,  having the issued database as its `parent', and to use this `child' database thereafter while working through the examples.  The objects stored in the parent are available through use of the child.

The file-name for a database is derived from
the name you use to name the database on the command line.
The conventions for the file-names depend on the operating system
and hardware you are using and on the Standard ML compiler used to build {\Product}.
For example, with the Standard ML of New Jersey compiler running with the Linux
operating system on Intel x86 hardware, a database named `demo' would be
held in a file named `demo-x86-linux'.

The following UNIX commands create a new database named `demo' (which is a child of the issued database and is held in a file in the current directory):

\begin{verbatim}
      pp_make_database -p hol demo
\end{verbatim}

The instructions in the rest of this chapter assume you have changed to a directory in which you wish to store your work on this tutorial and that you have successfully executed the above command.


\section{Entering \Product}\label{EnteringProofPower}


The \Product\ system is entered by a command at the UNIX prompt, invoking the {\tt xpp} program and giving it arguments identifying, amongst other things, the name of a file you wish to edit and the name of a {\em database}.

Following the instructions in the previous section, you will have a new database called `demo'.
The source text of the tutorial is in the file
`$\$$PPHOME/doc/usr004.doc'.
The following UNIX command will start up {\tt xpp} to edit that file and to run {\Product} on the new database.

\begin{verbatim}
     xpp -f $PPHOME/doc/usr004.doc -d demo
\end{verbatim}

(See the entry on {\tt xpp} in {\REFERENCE} for more information.)

When {\tt xpp} starts up, you will see that its display has four main
features as follows (working from top to bottom).

\begin{description}
\item[Menu Bar]
This contains menus which you use to select the main functions of {\tt xpp}.
The  menu at the right-hand end is used to give on-line help with {\tt xpp}.
\item[File Name Bar]
This contains the name of the file you are editing.
\item[Script Window]
This is the text area in which you carry out your editing work.
It will come up containing the tutorial script.
\item[Journal Window]
This displays a journal of your transactions with ProofPower.
It will come up displaying start-up messages from the {\ProductML} compiler
followed by a prompt: `$:)$'.
\end{description}

\section{Using the Editor}

The Script Window in {\tt xpp} together with the Menu Bar comprise a general purpose text editor providing
several features which are convenient for editing {\Product} literate scripts;
The File and Edit Menu provide standard editing features, and the Tools Menu is used to pop up tools to perform various functions, e.g., the Palette Tool which gives an easy way to enter mathematical symbols (both into the Script Window and into other parts of {\tt xpp} --- see the Help Menu entry about the Tools Menu for more information).

\section{Executing {\Product} Commands}
The basic way of executing {\Product} commands using {\tt xpp} is with the `Execute Selection' item in the Command Menu in response to the {\ProductML} prompt: `$:)$'.

In this manual, lines of input for {\Product} will be shown in the following style:

=SML
"This is a line of Standard ML Input";
=TEX

To execute a line of {\ProductML}, select it in the {\tt xpp} Script Window (e.g., by double clicking with the left mouse button) and then chose `Execute Selection' from the Command Menu.
The line will be copied to the Journal Window for processing by the {\ProductML} compiler.

The output which subsequently appears in the Journal Window is shown in this manual thus:

=GFT
val it = "This is a line of Standard ML Input" : string
=TEX

There are several shortcuts to make interaction easier; for example, you can type `Control-Space' instead of selecting `Execute Selection'.
A more powerful shortcut is the Command Line Tool, which you can invoke from the  Tools menu; this helps you type in and execute commands which you do not want to keep in the script, and can be used to remember and recall commands which you use frequently.
Consult the Help Menu for further information.

\section{{\ProductML} Prompts and Interrupts}

The {\ProductML} compiler uses the prompt `$:)$' to invite you to input a command.
If you have typed in a syntactically incomplete line of input, the compiler will
expect you to complete the command on subsequent `continuation lines'.
For example, the following command is spread over three input lines.

=SML
1
+
2;
=TEX

If you suspect that the compiler is waiting for you to complete a command, but
you wish to abort the command instead, you can use the `Interrupt' item in the
Command Menu to do so. If you see an `Abandon' item in the Command Menu,
it is only for backwards compatibility with earlier versions of {\Product}.

\section{Ending The Session}\label{EndingTheSession}
To leave {\tt xpp}, use the `Quit' item in its File Menu.
You will be prompted if you have not saved all your changes to the file you are editing or if the {\ProductML} compiler is still running.

It is recommended that you always quit the {\ProductML} compiler before
quitting {\tt xpp}.
(Quitting {\tt xpp} without quitting the {\ProductML} compiler generally works,
but may bypass some tidying up such as removal of temporary files.)

If you wish the work you have carried out to be saved in the database before your quit, you should execute the following {\ProductML} command before quitting {\tt xpp}:
=GFT SML
      save_and_quit();
=TEX

This command will cause the database to be updated by storing in it the results of the work done during the session.

To quit from the \Product\ system without updating the database, execute the {\ProductML} command before quitting {\tt xpp}:

=GFT SML
      quit();
=TEX
This will ask you for confirmation (which you can conveniently send using the Command Line Tool).

\section{Input from a File}
Within a \Product\ session, the \Product\ system may be directed to take input from a file, rather than interactively, by executing, for example,  the command
=GFT SML
      use_file  "myfile";
=TEX

 After reading and executing the last line in the file, the \Product\ system returns to taking interactive input.

There is an option on the UNIX command-line to read and execute such a `script' file immediately on entry to the \Product\ system:

\begin{verbatim}
     xpp -command pp -d demo -i myfile
\end{verbatim}

\section{Working In ASCII} \label{WorkingInASCII}

To work through this tutorial in ASCII, first copy the source document into a local directory and then convert it to ASCII as follows:

\begin{verbatim}
      cp installdir/docs/usr004.doc .
      conv_ascii usr004
      textedit usr004.doc
\end{verbatim}

Create a database as described in section \ref{SettingUp}
and then begin an interactive {\Product} session directly rather than
via {\tt xpp} by executing the UNIX command:

\begin{verbatim}
      pp -d demo
\end{verbatim}

{\Product} will then come up and prompt for input from your terminal.
You should immediately set {\Product} into ASCII mode by entering the following command:

=GFT SML
	set_flag ("use_extended_chars", false);
=TEX
When a flag is set the previous value of the flag is returned, so the above command will  respond:
=GFT
	val it = true : bool
=TEX
Now type directly in response to the {\Product} prompt, or use cut-and-paste from the text editor of your choice.

The ASCII keywords used to represent mathematical symbols in ASCII mode are documented in \TYPESETTING.

\chapter{CONVENTIONS}
This chapter describes some conventions followed in this manual.

\section{Sessions}

Throughout this tutorial, the sequences of user's interactions with the system and the system's responses are called `sessions'.
All sessions in this documentation are displayed in numbered boxes.
This number indicates whether the session  is a new
one (when the number will be {\small\sl  1}) or  the continuation  of a session
started in an earlier box.  Consecutively numbered boxes are assumed to be part
of a single continuous session. In particular, variable bindings made in earlier boxes are assumed
to persist to later ones in the same sequence.

\section{Input and Output}

As already mentioned, input to {\ProductML} will be marked by a vertical line on the left, with `SML` in small letters, thus:

=SML
"This is a line of ProofPower Input";
=TEX

This is, in fact, the usual appearance of {\Product} commands in a printed literate script.

The output resulting from the above input is shown in this manual marked by a vertical line alone, thus:

=GFT
val it = "This is a line of Standard ML Input" : string
=TEX


=TEX
\cleardoublepage
\chapter{A FIRST EXAMPLE}
In this section  a very small example  is presented and briefly explained in order to give the reader some idea of what to expect in the following sections.
The purpose of the \Product\ system is to support proof.  A style of proof which is favoured by \Product\ (but not the only one possible) is called {\bf goal-oriented proof}.   In this style of proof:

\begin{itemize}
\item firstly, a conjecture is stated. The conjecture is called the {\bf goal} of the proof process.
\item then a proof is conducted in one or more steps, each step being specified by the user.
 The steps are progressive transformations of the goal, aimed at transforming the goal to the logical value `true'.
 When this has been achieved the conjecture is proved, yielding a {\bf theorem}.
\end{itemize}

To illustrate the actual mechanics of the process, here is an example which shows three lines of user input to  state a conjecture
=INLINEFT
p ∨ ¬ p
=TEX
,  perform a one-step proof, and then record the proved conjecture as a theorem. Each line of user input is followed by a system response, (which is not reproduced in full here).   Inputs and responses are annotated with comments between the symbols (* and *).

\begin{session}
=SML
    set_goal([ ], ⌜p ∨ ¬p⌝ );			(* 1: state the conjecture *)
=GFT
    ...  ⌜p ∨ ¬ p⌝   ...				(* response echoes goal *)

=SML
     apply_tactic (REPEAT strip_tac);		(* 2: perform one-step proof *)
=GFT
     ... goal achieved ...				(* response  *)
=SML
      val example_theorem = top_thm();		(* 3:  save resulting theorem *)
=GFT
      val example_theorem = ⊢ p ∨ ¬ p : THM	(* response *)
=TEX
\end{session}

The following points may be noted:
\begin{itemize}
\item Each line of user input is in the {\bf metalanguage}, which is called {\ProductML}.  The conjecture
=INLINEFT
p ∨ ¬ p
=TEX
{} is a term in the  {\bf object language}, which is called {\ProductHOL}.   The object language term occurs, surrounded by the special quotation symbols
=INLINEFT
⌜
=TEX
{} and
=INLINEFT
⌝
=TEX
, embedded in the metalanguage command.

\item Stating the conjecture is accomplished by initialising a {\bf stack} of goals.  The proved theorem is extracted from the top of the stack at the end of the process.

\item A proof step is accomplished by applying what is called a {\bf tactic} to the goal at the top of the stack. At each step the user must {\bf choose} an appropriate tactic.

\item  A tactic is a procedure which attempts to find a sequence of inferences in the \ProductHOL\ logic such that the goal can be inferred to be true.
A tactic may be
\begin{itemize}
\item wholly successful, as in this example, or
\item partly successful, in which case the goal is reduced to a simpler goal, so that a further tactic must be chosen and applied, or
\item wholly unsuccesful, leaving the goal unchanged, in which case a different tactic must be chosen.
\end{itemize}

\item The proof system makes available a set of predefined tactics.  Different tactics are available to exploit different features of the goal.  Users can construct new tactics as programmed application of existing  tactics.

\item In this example the predefined tactic denoted by
=INLINEFT
REPEAT strip_tac
=TEX
{} was chosen, on the ground that this tactic is a standard opening gambit, capable of achieving many useful simplifications of the goal, and indeed achieving simple goals by itself.


\item The system, {\bf not the user}, is responsible for the soundness of the  process of logical inference performed by any tactic, whether the tactic is predefined or user-defined.
Thus to choose an inappropriate tactic at any step does not risk an unsound inference, but merely failure to make progress.

\item Finally, note that what achieves the proof of the conjecture
=INLINEFT
⌜p ∨ ¬ p⌝
=TEX
{} is a metalanguage expression
=INLINEFT
apply_tactic (REPEAT strip_tac)
=TEX
, and the latter does not have the conventional appearance of a proof.  It should be regarded not as a proof itself, but rather as a program which, when executed, will perform a formal proof of
=INLINEFT
⌜p ∨ ¬ p⌝
=TEX
{} and many other such propositions.
\end{itemize}









=TEX
\cleardoublepage
\chapter{INTRODUCTION TO THE METALANGUAGE}
\label{ML}

This chapter is a brief introduction to the metalanguage {\ProductML}.  {\ProductML} is an extension of the programming language Standard ML.  The extensions are:
\begin{itemize}
\item An extended character set to include symbols of logic and mathematics.
\item An additional form of quotation, analogous to the quotation of ASCII strings,  for the quotation of object language expressions.
\item A collection of predefined functions.
\end{itemize}


The aim  of this chapter is to explain only enough of \ProductML\ to make the following chapters comprehensible.   The rest of this chapter applies equally to Standard ML and to {\ProductML}.
 For a more complete introduction to Standard ML the reader is referred to \cite{PAULSON91},  \cite{WIKSTROM87},  or \cite{HARPER88}.

Throughout the rest of this document, \ProductML\ will be referred to simply as {\mela}.
{\mela} is an interactive programming language.
When interacting directly with the system, (which is called `at the top level') one can
evaluate expressions and perform declarations.

\section{Expressions}

\setcounter{sessioncount}{1}

\begin{session}
=SML
    1+1;
=TEX
=GFT
    val it = 2 : int
=TEX
\end{session}

This box shows an example of entering an \mela\ expression through the keyboard (that is, `at the top level'), which is then evaluated and the result displayed.
 The  semicolon `\ml{;}'  is used to terminate a top-level phrase. The display of the result can be seen to consist of:
\begin{itemize}
\item The letters
=INLINEFT
val
=TEX
, indicating that a value is to follow.
\item A name for the value.  In this case the user has not supplied any name, having merely typed in the anonymous expression
=INLINEFT
1+1
=TEX
, and so the system supplies the name $it$.   The value of the most-recently-entered anonymous expression at the top level can always be referred to as $it$.
\item  The symbol $=$.
\item The value, in this case $2$.
\item A colon followed by an indication of the type of the value.  In this case, the value 2 is of type integer, abbreviated to $int$.  The \mela\ type checker infers the type of expressions using methods invented by Robin Milner, \cite{MILNER78}.
\end{itemize}

\section{Lists and Strings}
The  \mela\ expression
=INLINEFT
[2,3,4,5]
=TEX
{}  is a list of four integers.
\begin{session}
=SML
    [2,3,4,5];
=GFT
    val it = [2, 3, 4, 5] : int list
=TEX
\end{session}

The type
=INLINEFT
int list
=TEX
{} is the type of `lists of
integers';
=INLINEFT
list
=TEX
{} is a unary type operator.  The type system of \mela\
is very similar to the type system of the \Product\ logic which is explained in
Chapter~\ref{HOLlogic}.


Expressions such as
=INLINEFT
"a", "b", "foo"
=TEX
{}   are {\it strings\/} and have type
=INLINEFT
string
=TEX
.  Any sequence of {\small ASCII} characters can be
written between the quotes. The  infix function
=INLINEFT
^
=TEX
{} concatenates two strings to form a single string.

\begin{session}
=SML
    "tog" ^ "ether";
=GFT
    val it = "together" : string
=TEX
\end{session}

\section{Declarations}
A declaration may have the form
=INLINEFT
val n = e
=TEX
,  which results in the value of the expression
=INLINEFT
e
=TEX
{} being bound to the name
=INLINEFT
n
=TEX
.

\begin{session}
=SML
      val x = 42;
=GFT
      val x = 42 : int

=SML
      x + 1;
=GFT
      val it = 43 : int
=TEX

\end{session}


\section{Function Applications}
The application of a function
$f$ to an argument $x$ can be written as $f\ x$. The more conventional  $f$ \ml{(}$x$\ml{)}
is also allowed.  The expression $f\ x_1\ x_2\ \cdots\ x_n$ abbreviates the less
intelligible expression {\small\verb"("}$\cdots${\small\verb"(("}$f\
x_1${\small\verb")"}$x_2${\small\verb")"}$\cdots${\small\verb")"}$x_n$. That is, function application is left associative.

Functions may be infix, as in the case of
=INLINEFT
+
=TEX
. Another infix function is
=INLINEFT
::
=TEX
{} which constructs a list which is the left argument followed by the right argument.
Other list processing functions include
=INLINEFT
hd
=TEX
,  which yields the head -- the first element  -- of a list),
=INLINEFT
tl
=TEX
, which yields the tail -- all but the first element -- of a list)  and
=INLINEFT
null
=TEX
, which tests for an empty list.



\begin{session}
=SML
    val L = 1:: [2, 3];
=GFT
    val L = [1, 2, 3] : int list
=SML
    hd L;
=GFT
    val it = 1 : int
=SML
    tl L;
=GFT
    val it = [2, 3] : int list
=SML
    tl (tl it);
=GFT
    val it = [ ] : int list
=TEX
\end{session}



\section{Pairs and Tuples}

An expression of the form
=INLINEFT
(e⋎1, e⋎2)
=TEX
{} evaluates to a
pair, with first component and second component having respectively the values of
=INLINEFT
e⋎1
=TEX
{} and
=INLINEFT
e⋎2
=TEX
. If
=INLINEFT
e⋎1
=TEX
{} has type
=INLINEFT
σ⋎1
=TEX
{} and
=INLINEFT
e⋎2
=TEX
{} has type
=INLINEFT
σ⋎2
=TEX
{}  then
=INLINEFT
(e⋎1, e⋎2)
=TEX
{} has type
=INLINEFT
σ⋎1 * σ⋎2
=TEX
.  A tuple
=INLINEFT
(e⋎1, ..., e⋎n)
=TEX
{} is  NOT  equivalent to
=INLINEFT
(e⋎1, (e⋎2, ..., e⋎n))
=TEX
, unless n = 2.  The first and
second components of a pair (but not a tuple of length greater than two)  can be extracted with the \mela\ functions
=INLINEFT
fst
=TEX
{} and
=INLINEFT
snd
=TEX
{} respectively. The i-th component of a tuple can be extracted with the function
=INLINEFT
#i
=TEX
.

\begin{session}
=SML
    (1, 2, (true, "abc"));
=GFT
    val it = (1, 2, (true, "abc")) : int * int * (bool * string)
=TEX

=SML
    #3 it;
=GFT
    val it = (true, "abc") : bool * string
=TEX

=SML
    snd it;
=GFT
    val it = "abc" : string
=TEX
\end{session}

\noindent The \mela\ expressions
=INLINEFT
true
=TEX
{} and
=INLINEFT
false
=TEX
{}
denote the two truth values, being of type
=INLINEFT
bool
=TEX
.
\section{Polymorphic Types}


\mela\ types can contain the {\it type variables\/}
=INLINEFT
'a
=TEX
,
=INLINEFT
'b
=TEX
,  \etc\ Such types are called {\it
polymorphic\/}. A function with a polymorphic type should be thought of as
possessing all the types obtainable by replacing type variables by types.
An example of a function with polymorphic  type is
=INLINEFT
hd
=TEX
{} (head of a list), which is applicable to lists of any type:

\begin{session}
=SML
      hd;
=GFT
      val it = fn : 'a list -> 'a
=TEX
\end{session}

This example also shows that, in the system's response, the value of a function is not displayed in full, but only symbolized by the letters
=INLINEFT
fn
=TEX
.  This is true of all function-values.


\section{Declarations of Functions}


The function which, for example, computes $x+1$ from $x$ can be defined and given a name, say,
=INLINEFT
step
=TEX
, as follows:

\begin{session}
=SML
      fun step x = x + 1;
=GFT
      val step = fn : int -> int
=SML
      step 6;
=GFT
      val it = 7 : int
=TEX
\end{session}

The declaration
=INLINEFT
fun step x = x + 1
=TEX
{} is a convenient abbreviation for
=INLINEFT
val step = fn x => x + 1
=TEX
.

\begin{session}
=SML
      val step = fn x => x + 1;
=GFT
      val step = fn : int -> int
=SML
      step 6;
=GFT
      val it = 7 : int
=TEX
\end{session}


Here
=INLINEFT
fn x => x + 1
=TEX
{} is an expression  the value of which is a function.  In what follows, it will be common  for the arguments or results of functions themselves to be functions.   In the following example
=INLINEFT
twice
=TEX
{} is a function which takes a function as argument and returns another as a result, such that applying the result-function is equivalent  to applying the argument-function twice.

\begin{session}
=SML
      fun twice f = fn x => f (f x);
=GFT
      val twice = fn : ('a -> 'a) -> 'a -> 'a
=SML
      val hop = twice step;
=GFT
      val hop = fn : int -> int
=SML
      hop 6;
=GFT
      val it = 8 : int
=SML
      (twice tl) [1, 3, 5, 7];
=GFT
      val it = [5, 7] : int list
=TEX
\end{session}

Again the syntactic abbreviation may be employed to give a neater definition of twice:

\begin{session}
=SML
      fun twice f x = f (f x);
=GFT
      val twice = fn : ('a -> 'a) -> 'a -> 'a
=SML
      twice step 6;
=GFT
      val it = 8 : int
=TEX
\end{session}

Note particularly that the expression
=INLINEFT
twice step 6
=TEX
{} is equivalent to
=INLINEFT
(twice step) 6
=TEX
.  The  declaration above,
=INLINEFT
fun twice f x = f (f x)
=TEX
,  is an example of a more general form of declaration of a function,
=INLINEFT
fun f v⋎1 ... v⋎n = e
=TEX
{} where each
=INLINEFT
v⋎i
=TEX
{} is an argument and
=INLINEFT
e
=TEX
{} is an expression.

As a final example, a useful built-in function is
=INLINEFT
map
=TEX
{} which applies its function-argument to each member of a list to produce a list:

\begin{session}
=SML
      map step [1, 3, 5];
=GFT
      val it = [2, 4, 6] : int list

=TEX
\end{session}



The sessions  above  are enough  to give  an idea of \mela.
In the  next sections,  the logic  supported by  the \Product\  system (higher order
logic) will be introduced, together with the tools in \mela\ for manipulating it.

=TEX
\cleardoublepage
\chapter{INTRODUCTION TO THE ProofPower LOGIC}
\label{HOLlogic}

The \Product\ system  supports {\it  higher order  logic}.   This is  a version of
predicate calculus with three main extensions:
\begin{itemize}
\item Variables can range over functions and predicates
(hence `higher order').
\item The logic is {\it typed}.
\item There is no separate syntactic category of {\it formulae\/}.  Instead, there are terms of a boolean type.
\end{itemize}

\section{Overview of higher order logic}
It is assumed that the reader is familiar with predicate logic.
The table  below summarizes the notation used.
In what follows the logic supported by \Product\ will be called the HOL logic, or simply HOL.

\begin{center}
\begin{tabular}{|l|l|l|} \hline
\multicolumn{3}{|c|}{ } \\
\multicolumn{3}{|c|}{\bf Terms of the \obla\ Logic} \\
\multicolumn{3}{|c|}{ } \\
{\it Kind of term} & {\it  \obla\ notation} & {\it Description} \\ \hline
                   &                      &                    \\
Truth              & $T$                  & {\it true}        \\ \hline
Falsity            &  $F$                 & {\it false}       \\ \hline
Negation           & ¬$t$                 & {\it not}$\ t$       \\ \hline
Disjunction        & $t_1$∨$t_2$          & $t_1\ ${\it or}$\ t_2$    \\ \hline
Conjunction        & $t_1$∧$t_2$         & $t_1\ ${\it and}$\ t_2$     \\ \hline
Implication        & $t_1$⇒$t_2$         & $t_1\ ${\it implies}$\ t_2$ \\ \hline
Equality           & $t_1 \ = \ t_2$      & $t_1\ ${\it equals}$\ t_2$   \\ \hline
$\forall$-quantification & ∀$x$⦁$t$            & {\it for\ all\ }$x, t$       \\ \hline
$\exists$-quantification & ∃$x$⦁$t$            & {\it for\ some\ }$x, t$       \\ \hline
$\hilbert$-term   & $ \hilbert \ x$⦁$t$        &  {\it an}$\ x\ ${\it such\ that}$\ t$ \\ \hline
Conditional       & {\it if\ }$t${\it \ then\ }$t_1${\it\ else\ }$t_2$  & {\it if\ }$t${\it \ then\ }$t_1${\it\ else\ }$t_2$  \\ \hline
\end{tabular}
\end{center}\label{logic-table}

\bigskip


Terms of the \obla\ logic are represented in \mela\ by an {\it abstract
type\/}\footnote{Abstract types appear to  the user  as primitive  types with a
collection of operations}   called
=INLINEFT
TERM
=TEX
.   They are represented as character strings which are input not between the  usual quotation symbols but  rather  between
the symbols
=INLINEFT
⌜
=TEX
{} and
=INLINEFT
⌝
=TEX
.   For example,  the expression
=INLINEFT
⌜ x ∧ y ⇒ z⌝
=TEX
{} evaluates in \mela\ to a term representing
=INLINEFT
x ∧ y ⇒ z
=TEX
. Terms can be manipulated by various built-in \mela\ functions.   For  example, the \mela\ function
=INLINEFT
dest_⇒
=TEX
{}  with  \mela\  type
=INLINEFT
TERM -> TERM * TERM
=TEX
{} splits an implication into  a pair  of terms  consisting of  its antecedent and
consequent, and the \mela\ function
=INLINEFT
dest_∧
=TEX
{} of  type
=INLINEFT
TERM -> TERM * TERM
=TEX
{} splits a conjunction into its two conjuncts.

\setcounter{sessioncount}{1}
\begin{session}

=SML
      ⌜x∧y⇒z⌝;
=TEX
=GFT
      val it = ⌜x ∧ y ⇒ z⌝ : TERM
=SML
      dest_⇒ it;
=GFT
      val it = (⌜x ∧ y⌝, ⌜z⌝) : TERM * TERM
=SML
      dest_∧ (fst it);
=GFT
      val it = (⌜x⌝, ⌜y⌝) : TERM * TERM
=TEX
\end{session}

Terms of the \obla\ logic are quite similar in appearance to \mela\ expressions, but the distinction must be carefully observed.  Indeed, terms of the logic have types  in a way which is similar  to the way in which
\mela\ expressions have types.   For example,
=INLINEFT
⌜1⌝
=TEX
{} is  an \mela\ expression with \mela\ type
=INLINEFT
TERM
=TEX
.  The \obla\ type of this term is
=INLINEFT
:ℕ
=TEX
, the type of the natural numbers.

The types of \obla\ terms form an \mela\ type called
=INLINEFT
TYPE
=TEX
. Expressions having the form
=INLINEFT
⌜: ....⌝
=TEX
{} evaluate to logical  (that is, \obla\ ) types.  The built-in function
=INLINEFT
type_of
=TEX
{} has \mela\ type
=INLINEFT
TERM -> TYPE
=TEX
{} and returns the logical type of a term.

\begin{session}
=SML
      ⌜(1,2)⌝;
=GFT
      val it = ⌜(1, 2)⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:ℕ × ℕ⌝ : TYPE
=SML
      (⌜1⌝, ⌜2⌝);
=GFT
      val it = (⌜1⌝, ⌜2⌝) : TERM * TERM
=SML
      type_of (fst it);
=GFT
      val it = ⌜:ℕ⌝ : TYPE
=TEX
\end{session}


To emphasise the distinction between   the \mela\ types of \mela\ expressions and the logical types of \obla\ terms
, the former will be referred to as {\it metalanguage types\/} and the latter as {\it object language types\/}.



\obla\ terms can be input using explicit {\it quotation\/}, as above, using
=INLINEFT
⌜
=TEX
{} and
=INLINEFT
⌝
=TEX
{} for quotation marks,  or they can be constructed using \mela\ constructor functions. The function
=INLINEFT
mk_var
=TEX
{}  constructs a variable from a string and a type.  In the example below, three  terms are constructed, each representing a single object-language variable  of type
=INLINEFT
BOOL
=TEX
, and  metalanguage names  are chosen for the terms  to  coincide with the names of the object-language variables.  These are used later.

\begin{session}
=SML
      val x = mk_var("x",⌜:BOOL⌝);
      val y = mk_var("y",⌜:BOOL⌝);
      val z = mk_var("z",⌜:BOOL⌝);
=GFT
      val x = ⌜x⌝ : TERM
      val y = ⌜y⌝ : TERM
      val z = ⌜z⌝ : TERM
=TEX
\end{session}

The constructors
=INLINEFT
mk_∧
=TEX
{} and
=INLINEFT
mk_⇒
=TEX
{} construct conjunctions and implications respectively.

\begin{session}
=SML
      val t = mk_⇒(mk_∧(x,y),z);
=GFT
      val t = ⌜x ∧ y ⇒ z⌝ : TERM
=TEX
\end{session}

\section{Terms}

There are only four different kinds of terms:
\begin{enumerate}
\item Variables.
\item Constants.
\item Function applications:
=INLINEFT
⌜t⋎1 t⋎2⌝
=TEX
. \item $\lambda$-abstractions:
=INLINEFT
⌜λ x ⦁ t ⌝
=TEX
.
\end{enumerate}

Both variables and constants have a name and a type; the difference is that
constants cannot be bound by quantifiers, and their type is fixed when they are
declared (see below). The type checking algorithm uses the types of constants to
infer the types of variables in the same quotation. If there is not enough type
information to constrain the assignment of a type, then an assignment of the most general type, that is,   involving  {\em type-variables}, will result:


\begin{session}
=SML
      ⌜¬x⌝;
=GFT
      val it = ⌜¬ x⌝ : TERM
=SML
      dest_¬ it;
=GFT
      val it = ⌜x⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:BOOL⌝ : TYPE
=SML
      ⌜x⌝;
=GFT
      val it = ⌜x⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:'a⌝ : TYPE
=TEX
\end{session}

In the first case, the HOL type checker  used the  known type
=INLINEFT
BOOL → BOOL
=TEX
{} of
=INLINEFT
¬
=TEX
{} to  deduce  that  the  variable
=INLINEFT
x
=TEX
{} must  have  type
=INLINEFT
BOOL
=TEX
.  In the second case, it assigns the most general  type to
=INLINEFT
x
=TEX
.      The  `scope'  of type  information for type
checking is a single quotation, so a  type in  one quotation  cannot affect the
type checking of another.     If there  is not enough
contextually-determined type information to resolve the types  of all variables
in a quotation, then it may be necessary to explicitly indicate  the required types
by using
=INLINEFT
⌜term:type⌝
=TEX
{} as illustrated below.


\begin{session}
=SML
      ⌜x:ℕ⌝;
=GFT
      val it = ⌜x⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:ℕ⌝ : TYPE
=TEX
\end{session}

Functions have types of the form
=INLINEFT
σ⋎1→σ⋎2
=TEX
, where
=INLINEFT
σ⋎1
=TEX
{} and
=INLINEFT
σ⋎2
=TEX
{} are the types of elements of the domain and range of the function, respectively.


Before considering an example of the types of functions, an aside is appropriate on  a purely syntactic matter.
 Functions may be defined with a special lexical status, such as being  an infix operator, in the case of
=INLINEFT
+
=TEX
{} or
=INLINEFT
∧
=TEX
. In such cases, putting
=INLINEFT
$
=TEX
{} in front of the name of the function causes the parser to ignore any special syntactic status it may have.
 This means that the naked symbol
=INLINEFT
∧
=TEX
{} is not  in itself a syntactically well-formed expression,  because it denotes the application of the function to arguments which are missing.
However the expression
=INLINEFT
$∧
=TEX
{} is well-formed in itself, denoting a function, and it can be applied to arguments.

\begin{session}
=GFT SML
      ⌜∧⌝;
=GFT
      Syntax error in: ⌜  <?> ∧
      ∧ is not expected after ⌜
      Exception- Fail * Syntax error [HOL-Parser.19000] * raised
=SML
      ⌜$∧⌝;
=GFT
      val it = ⌜$∧⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:BOOL → BOOL → BOOL⌝ : TYPE
=SML
      ⌜$∧ t1 t2⌝;
=GFT
      val it = ⌜t1 ∧ t2⌝ : TERM
=TEX
\end{session}

After that aside, we return now to the subject of the types of  functions.  Functions can be denoted by  Lambda-terms (or $\lambda$-terms).  For example,
=INLINEFT
⌜λx⦁ x+1⌝
=TEX
{} is a term that denotes the function which maps a number $x$ to a number $x+1$, and is thus of type
=INLINEFT
ℕ → ℕ
=TEX
.

\begin{session}
=SML
      ⌜λx ⦁ x+1⌝;
=GFT
      val it = ⌜λ x⦁ x + 1⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:ℕ → ℕ⌝ : TYPE
=TEX
\end{session}


The next box provides further examples of metalanguage and object-language types.


\begin{session}
=SML
      ⌜(x+1), (t1⇒t2)⌝;
=GFT
      val it = ⌜(x + 1, t1 ⇒ t2)⌝ : TERM
=SML
      type_of it;
=GFT
      val it = ⌜:ℕ × BOOL⌝ : TYPE
=SML
      (⌜x=1⌝, ⌜t1⇒t2⌝);
=GFT
      val it = (⌜x = 1⌝, ⌜t1 ⇒ t2⌝) : TERM * TERM
=SML
      (type_of(fst it), type_of(snd it));
=GFT
      val it = (⌜:BOOL⌝, ⌜:BOOL⌝) : TYPE * TYPE
=TEX
\end{session}


The types of constants are declared in {\it theories}; this is described
in Section~\ref{theories}.

An application
=INLINEFT
t⋎1 t⋎2
=TEX
{} is badly typed if
=INLINEFT
t⋎1
=TEX
{} is not a function:


\begin{session}
=GFT SML
      ⌜1 2⌝;
=GFT
      Type error in ⌜1 2⌝
      The operator must have type σ → τ
      Cannot apply ⌜1:ℕ⌝
                to ⌜2:ℕ⌝
      Exception- Fail * Type error [HOL-Parser.16000] * raised
=TEX

\end{session}

or if it is a function, but
=INLINEFT
t⋎2
=TEX
{} is not in its domain:

\begin{session}

=GFT SML
       ⌜¬1⌝;
=GFT
      Type error in ⌜¬ 1⌝
      The operator and the operand have incompatible types
      Cannot apply ⌜¬:(BOOL→BOOL)⌝
                to ⌜1:ℕ⌝
      Exception- Fail * Type error [HOL-Parser.16000] * raised
=TEX
\end{session}



\section{Boolean Terms, Theorems and  Sequents}

So far, in the language of HOL terms, we have seen terms of different object-language types, including  those of object-language type
=INLINEFT
⌜:BOOL⌝
=TEX
.
The \Product\ system supports a process of  inference which results in the production of {\em theorems}.  Theorems are objects of metalanguage type
=INLINEFT
THM
=TEX
. Terms are not theorems, that is, the metalanguage types
=INLINEFT
TERM
=TEX
{} and
=INLINEFT
THM
=TEX
{} are distinct. The form taken by  a theorem in this system of inference is not simply  a boolean-valued term but rather  a composite of:
\begin{itemize}
\item  a list of assumptions, each of which is a boolean-valued term
\item  a conclusion, which is a single boolean-valued term.
\end{itemize}

The following session produces an example  of a theorem  to illustrate this structure of assumptions and conclusion.   The example is produced by means which are yet to be described, but will be covered in following sections.


\begin{session}
=SML
      tac_proof (([⌜x=y⌝, ⌜y=z⌝], ⌜x=z⌝), (asm_rewrite_tac[ ]));
=GFT
      val it = x = y, y = z ⊢ x = z : THM
=TEX
\end{session}

It can be seen that the turnstile symbol,
=INLINEFT
⊢
=TEX
, separates assumptions from conclusion.  This theorem can be understood as meaning: on the assumption that x=y and the further assumption  that y=z, it may be concluded that x=z.
 The theorem is about the relationship between assumptions and conclusion (that the latter follows from the former).  The ``truth'' of the theorem is the truth of an assertion about what follows from what.


Strictly speaking, all theorems in this system are about the relationship between assumptions and conclusions, but in practice  many theorems have no assumptions.  Here is another example of a theorem produced by means yet to be described:

\begin{session}
=SML
      refl_conv ⌜x⌝;
=GFT
      val it = ⊢ x = x : THM
=TEX
\end{session}

This  theorem can be understood as meaning ``without making any assumptions, it may be concluded  that x=x''.   Here the list of assumptions mentioned above is  present, but is empty and so nothing is displayed for it.

Terms can be constructed at will, (subject only to the constraint of being well-typed.)
 On the other hand, theorems can be constructed only by a proof which appeals to the rules of inference supported by the system.
 The soundness of the system of inference and the correctness of the implementation guarantee the  ``truth''  of any theorems produced, and ensure that theorems can only be produced by the prescribed system of inference.

Objects structured according to the pattern described above as a list of assumptions followed by a conclusion are called ``sequents''.
In this sense, theorems may be called sequents, so that the \Product\ system of inference is described as a sequent calculus; see e.g. \cite{gordon93}.

The system  supports ``sequents''  by providing, as an abbreviation for
=INLINEFT
TERM list * TERM
=TEX
,  the name
=INLINEFT
SEQ
=TEX
.  Sequents  in this other sense are NOT theorems, just data-structures.
Their usefulness is (as shown in the example of producing the first theorem above) in convenience in stating goals for a proof process, so much so
that the system also supports the abbreviation \ml{GOAL} for the same type.
  This is illustrated in the next session, where the same object is ascribed a type which is reported in three different ways.


\begin{session}
=SML
      val s =([⌜x=y⌝, ⌜y=z⌝], ⌜x=z⌝);
=GFT
      val s = ([⌜x = y⌝, ⌜y = z⌝], ⌜x = z⌝) : TERM list * TERM
=SML
      s:SEQ;
=GFT
      val it = ([⌜x = y⌝, ⌜y = z⌝], ⌜x = z⌝) : SEQ
=SML
      s:GOAL;
=GFT
      val it = ([⌜x = y⌝, ⌜y = z⌝], ⌜x = z⌝) : GOAL
=TEX
\end{session}


\section{The Development of Theories}
\label{theories}
\subsection{Theories}

The objects generated by work with \Product\  -- definitions, types, constants, axioms and theorems  -- are organised into larger units called {\em theories}.  A theory in \Product\ is  similar to what a logician would call a
theory, but there are some differences arising from the needs of mechanical
proof.
 A \obla\ theory, like a logician's theory, contains sets of types,
constants, definitions and axioms.  In addition, however, a \obla\  theory
may contain an explicit list of theorems that have been proved from the axioms
and definitions.
 Logicians normally do not need to distinguish theorems that
have actually been proved from those that could be proved, hence they do not
normally consider sets of proven theorems as part of a theory; rather, they
take the theorems of a theory to be the (often infinite) set of all
consequences of the axioms and definitions.
 Another difference between
logicians' theories and \obla\ theories is that, for logicians, theories are
relatively static objects, but in \Product\ they can be developed over a period of time.   For example, further theorems can be proved to produce a new version of a theory which replaces the previous version.

The purpose of the \Product\ system may be described as to provide tools to enable well-formed
theories to be constructed.  All the theorems of such theories are logical
consequences of the definitions and axioms of the theory.  The \Product\ system
ensures that only well-formed theories can be constructed by allowing
theorems to be created by {\it formal proof\/} only.


In general, a  new theory is not constructed in a vacuum, but rather in a context of prior theories, which makes available the contents of the prior theories for use in the new theory.
Thus theories are related one to another as parent to child, so that the parent is logically (but not physically) incorporated into the child.

Any new theory must be a child of an existing theory, and in fact may be a child of several different parent theories simultaneously.
A collection of theories organised in a parent-child relationship is called a theory-hierarchy. The \Product\ system as issued contains  a theory-hierarchy of approximately 20 theories.
 Of these,  the theory called `min' (for `minimal') is the ultimate ancestor of all other theories, whether issued or user-defined.  Each theory is devoted to a particular subject, so that there is, for example a theory of numbers in the issued database.






\subsection{Theory Databases}
A given theory is stored in what is called a theory database, which is a file in the file system of the computer.
 Thus a theory database is what is stored between sessions of interaction with the \Product\ system.

In principle a whole hierarchy of theories can be stored in a single theory database.
 In practice however it may be more convenient to distribute a theory-hierarchy over several databases.   For this purpose, databases may be organised in a parent-child relationship.  Here each child database has exactly one parent.


Such an arrangement would allow a collection of theories in a common database to be read-only,  and other theories under development to be in updatable child databases.
 Similar arrangements are possible  within a single database: an individual theory may have a status of ``locked'' to prevent casual changes.
 Thus facilities for the management of theories are available both at the level of the individual theory and at the level of the database.


\subsection{The Current Theory and Current Database}

Any single \Product\ session works with a single database, the ``current'' database, which is that nominated in the UNIX command line which caused entry to the \Product\ system.

There is always a {\it current theory\/}: definitions and theorems are stored in the theory which is current at the time the definitions or theorems are generated.
Each database has a theory which by default becomes the current theory immediately on entry to a session with that database.

Facilities for working with theories include the following:

\def\aa{\parbox{2.5in}{
=INLINEFT
⦏print_status⦎();
=TEX
}}

\def\ab{\parbox{3.5in}{displays the name of the current theory and other information.}}

\def\ba{\parbox{2.5in}{
=INLINEFT
⦏print_theory⦎ "X";
=TEX
}}
\def\bb{\parbox{3.5in}{displays the contents of the theory named X. As a convenience, the current theory may be referred to by the name ``-''.  }}

\def\ca{\parbox{2.5in}{
=INLINEFT
⦏new_theory⦎ "X";
=TEX
}}
\def\cb{\parbox{3.5in}{will create a new, empty theory, named X, which becomes current, being a child of the hitherto-current  theory}}


\def\da{\parbox{2.5in}{
=INLINEFT
⦏open_theory⦎ "X";
=TEX
}}
\def\db{\parbox{3.5in}{will cause the existing theory X to become current.}}

\def\ea{\parbox{2.5in}{
=INLINEFT
⦏new_parent⦎ "X";
=TEX
}}
\def\eb{\parbox{3.5in}{will cause the current theory to acquire an additional parent, namely theory X.}}

\begin{tabular}{|l|l|} \hline

\aa & \ab \\ \hline
\ba & \bb \\ \hline
\ca & \cb \\ \hline
\da & \db \\ \hline
\ea & \eb \\ \hline
\end{tabular}



\subsection{Naming of Object}

It has been explained that the state of a \Product\ session can be saved, and then retrieved on a later occasion.  Within the state of the \Product\ session,
there will be theorems and other objects: axioms, definitions, constants and so on.   Now a  theorem, for example,  can be associated with a name, in the state of the \Product\ session, in either or both of two ways, which are distinct.

Firstly, a theorem is an \mela\ value like any other, in that it can be associated with an \mela\ name by the familiar process, seen many times above, of making a declaration:

\begin{session}
=SML
      val thm99 = refl_conv ⌜x⌝;
=GFT
      val thm99 = ⊢ x = x : THM
=TEX
\end{session}

The value, and the association with the name, will survive the saving and retrieving of the state of the \Product\ session.

Secondly,  the current theory is represented by a data structure within the state of the current session.
 This data structure has no \mela\ name, but is instead provided with a number of access functions by which its contents may be inspected, extracted, and updated.

 For example, the function
=INLINEFT
⦏print_theory⦎
=TEX
{} enables the content of the theory to be inspected.  There is a function
=INLINEFT
⦏save_thm⦎
=TEX
{} which takes two arguments, a string and a theorem, and causes the theorem to be saved in the data structure which is the current theory  under the name given by the string.   A name given by such a string is called a key.
The theorem can be recovered by another access function,
=INLINEFT
⦏get_thm⦎
=TEX
, which takes as arguments a theory name (the current theory can be referred to by the name
=INLINEFT
"-"
=TEX
) and the key under which the theorem was stored.
 Note that there is no necessary connection between this string and the name of any \mela\ variable used to hold a theorem.  To emphasize the point, note that the key need not be a well-formed name.

\begin{session}
=SML
      save_thm ("theorem of 5 September 91", thm99);
=GFT
      val it = ⊢ x = x : THM
=SML
      get_thm "-" "theorem of 5 September 91";
=GFT
      val it = ⊢ x = x : THM
=TEX
\end{session}

\subsection{Example of Developing a New Theory}

In this section an example is given of developing a new theory, which is chosen to be a treatment of Peano's postulates as axioms for the natural numbers.    It is to be noted that there is already a theory built into \Product, called
=INLINEFT
ℕ
=TEX
, which covers natural numbers and arithmetic, (in which Peano's postulates  are  in  fact  derived  theorems rather  than postulated as axioms).  To emphasize that this example theory is just an example, and has no relation to
=INLINEFT
ℕ
=TEX
{} except superficial resemblance, the example theory will be called
=INLINEFT
Peanissimo
=TEX
.

Executing
=INLINEFT
new_theory "thy"
=TEX
{} creates a new  theory called
=INLINEFT
thy
=TEX
; it fails if there already exists a theory so named in the current theory hierarchy.


\begin{session}
=SML
      new_theory "Peanissimo";
=GFT
      val it = () : unit
=TEX
\end{session}


This starts a theory called
=INLINEFT
Peanissimo
=TEX
,  which is to be  made into a
theory containing Peano's postulates as axioms for the natural
numbers. These postulates, stated informally, are:

%\begin{list}{{\small\bf P\arabic{Peano}}}{\usecounter{Peano}
%\setlength{\leftmargin}{12mm}
%\setlength{\rightmargin}{7mm}
%\setlength{\labelwidth}{6mm}
%\setlength{\labelsep}{2mm}
%\setlength{\listparindent}{0mm}
%\setlength{\itemsep}{14pt plus1pt minus1pt}
%\setlength{\topsep}{3mm}
%\setlength{\parsep}{0mm}}

\begin{description}
\item [P1]
There is a number which we will call $zero$.
\item [P2]
There is a function  which we will call $successor$  such that
if $n$ is a number then  the successor of $n$ is a number.
\item [P3]
$zero$ is not the $successor$ of any number.
\item [P4]
If two numbers have the same $successor$ then the numbers are equal.
\item [P5]
If a property holds of $zero$, and if whenever it holds of a number then it
also holds of the $successor$ of that number, then the property holds of all
numbers. This postulate is called {\it Mathematical Induction}.
\end{description}

To formalize this in HOL a new type is introduced called
=INLINEFT
nat
=TEX
{} (for natural number)


\begin{session}
=SML
      new_type ("nat", 0);
=GFT
      val it = ⌜:nat⌝ : TYPE
=TEX
\end{session}

In general
=INLINEFT
new_type ("op", n)
=TEX
{} makes
=INLINEFT
op
=TEX
{} a new $n$-ary type operator in the current theory.
Constant types  (such as
=INLINEFT
BOOL
=TEX
{} or
=INLINEFT
ℕ
=TEX
) are regarded as degenerate type operators with no arguments, thus
the new type
=INLINEFT
nat
=TEX
{} is declared to be a $0$-ary type operator. An example of a $1$-ary type operator is
=INLINEFT
LIST
=TEX
, occurring in for example
=INLINEFT
⌜[a;b;c] : ℕ LIST⌝;
=TEX
{} and an example of a 2-ary type operator is
=INLINEFT
×
=TEX
{} occurring in for example
=INLINEFT
⌜(x,y) : BOOL × ℕ⌝;
=TEX
.


The axioms {\small\bf P1} and {\small\bf P2} can now be formalized by declaring
two new constants to represent $zero$ and $successor$.

Evaluating
=INLINEFT
new_const("c", σ)
=TEX
{} makes
=INLINEFT
c
=TEX
{} a new constant of type
=INLINEFT
σ
=TEX
{} in the current theory.
This fails if there already exists a constant named
=INLINEFT
c
=TEX
{} in the current theory (or a parent  of the current theory).

\begin{session}
=SML
      new_const ("zero", ⌜:nat⌝);
=GFT
      val it = ⌜zero⌝ : TERM
=SML
      new_const ("successor", ⌜:nat→nat⌝);
=GFT
      val it = ⌜successor⌝ : TERM
=TEX
\end{session}



The HOL type checker ensures that {\small\bf P1} and {\small\bf P2} hold.
{\small\bf P3} is now asserted as an axiom:

\begin{session}
=SML
       new_axiom(["P3"], ⌜∀n⦁ ¬(zero = successor n)⌝ );
=GFT
       val it = ⊢ ∀ n⦁ ¬ zero = successor n : THM
=TEX
\end{session}

\noindent This creates an axiom in the current theory (that is,  in
=INLINEFT
Peanissimo
=TEX
) called
=INLINEFT
P3
=TEX
. Axiom
=INLINEFT
P4
=TEX
{} can be declared similarly:


\begin{session}

=SML
       new_axiom(["P4"], ⌜∀m n ⦁(successor m = successor n) ⇒ (m = n)⌝);
=GFT
       val it = ⊢ ∀ m n⦁ successor m = successor n ⇒ m = n : THM
=TEX

\end{session}

The final Peano axiom is Mathematical Induction:

\begin{session}
=SML
      new_axiom(["P5"],⌜∀ P⦁ P zero ∧ (∀ n ⦁ P n ⇒ P(successor n)) ⇒ (∀n⦁ P n)⌝);
=GFT
      val it = ⊢ ∀ P⦁ P zero ∧ (∀ n⦁ P n ⇒ P (successor n)) ⇒ (∀ n⦁ P n) : THM
=TEX
\end{session}

\clearpage
To inspect the theory, the function
=INLINEFT
print_theory
=TEX
{} can be used:

\begin{session}
=SML
print_theory "-";
=GFT
	=== The theory Peanissimo ===

	--- Parents ---

			demo

	--- Constants ---

	zero		nat
	successor	nat → nat

	--- Types ---

	nat

	--- Axioms ---

	P3		⊢ ∀ n⦁ ¬ zero = successor n
	P4		⊢ ∀ m n
		  ⦁ successor m = successor n ⇒ m = n
	P5		⊢ ∀ P
			  ⦁ P zero
			        ∧ (∀ n⦁ P n ⇒ P (successor n))
			      ⇒ (∀ n⦁ P n)

	=== End of listing of theory Peanissimo ===
=TEX
\end{session}


To end the session and make an  update to the database in use, recording all the work of the session including the new theory,  the current state of the session is saved to the database,  by executing
=INLINEFT
save_and_quit();
=TEX
.

\begin{session}

=GFT SML
      save_and_quit();
=GFT
/par20/users/rda/tmp/sun4demo.db:131072 bytes
Closing /par20/users/rda/tmp/sun4demo.db now
Opening /par20/users/rda/tmp/sun4demo.db
=TEX
\end{session}


The preceding session set up a first version of a theory,
=INLINEFT
Peanissimo
=TEX
. It is usual to include in `Peano arithmetic' axioms defining addition and multiplication.
To do this a new session can be started and the theory further developed.

If you are using {\tt xpp} and it is still running, you can start the new session by selecting the `Restart' item from the Command Menu in {\tt xpp}.
Otherwise start a new session from UNIX as explained in section \ref{EnteringProofPower} (or \ref{WorkingInASCII}, if you are not using {\tt xpp}).
You should now be in a position to continue developing the theory by issuing the {\ProductML} command.

\begin{session}
=SML
      open_theory "Peanissimo";
=GFT
      val it = () : unit
=TEX

\end{session}

The two new axioms can now be added, but first constants
 must  be  declared  to  represent  addition  and  multiplication.   Let us choose the names
=INLINEFT
pplus
=TEX
{} and
=INLINEFT
ptimes
=TEX
{} respectively for these.  Since we wish to use these  syntactically in the same way as
=INLINEFT
+
=TEX
{} and
=INLINEFT
*
=TEX
, that is,  as infix operators with appropriate values for syntactic precedence, they are declared as such with  {\em fixity} declarations
=INLINEFT
⦏declare_infix⦎
=TEX
{}  followed by
=INLINEFT
⦏new_const⦎
=TEX
. Constants declared with
=INLINEFT
declare_infix
=TEX
{} must have a type of the form
\ml{$\sigma_1$→$\sigma_2$→$\sigma_3$}.


\begin{session}
=SML
      declare_infix (300, "pplus");
      declare_infix (310, "ptimes");
=GFT
      val it = () : unit
      val it = () : unit
=SML
      new_const ("pplus", ⌜:nat→nat→nat⌝);
      new_const ("ptimes", ⌜:nat→nat→nat⌝);
=GFT
      val it = ⌜$pplus⌝ : TERM
      val it = ⌜$ptimes⌝ : TERM
=TEX
\end{session}



Axioms defining
=INLINEFT
pplus
=TEX
{} and \
=INLINEFT
ptimes
=TEX
{} can now be given.

\begin{session}
=SML
      new_axiom(["pplus_def"],
         ⌜(∀n⦁ (zero pplus n) = n) ∧
          (∀m n⦁((successor m) pplus n) = successor (m pplus n) )⌝ );
=GFT
      val it = ⊢ (∀ n⦁ (zero pplus n) = n) ∧
                 (∀ m n⦁ (successor m pplus n) = successor (m pplus n)) : THM
=TEX

=SML
      new_axiom(["ptimes_def"],
          ⌜(∀n⦁ (zero ptimes n) = zero) ∧
           (∀m n⦁((successor m) ptimes n) = ((m ptimes n) pplus n)  )⌝ );
=GFT
      val it = ⊢ (∀ n⦁ (zero ptimes n) = zero) ∧
                 (∀ m n⦁ (successor m ptimes n) = (m ptimes n pplus n)) : THM
=TEX

\end{session}

The theory
=INLINEFT
Peanissimo
=TEX
{} has now been extended to contain the new definitions.

This example shows how a theory is set up. How to prove consequences of axioms and
definitions is described later. The \Product\ system contains a built-in
theory of numbers called
=INLINEFT
ℕ
=TEX
{} which contains Peano's postulates and  the definitions of addition
=INLINEFT
(+)
=TEX
{} and multiplication
=INLINEFT
(*)
=TEX
{} amongst others.
In fact, Peano's
postulates are theorems not axioms in the theory
=INLINEFT
ℕ
=TEX
. The  constants
=INLINEFT
0
=TEX
{} and
=INLINEFT
Suc
=TEX
{} (corresponding to
=INLINEFT
zero
=TEX
{} and
=INLINEFT
successor
=TEX
{} in
=INLINEFT
Peanissimo
=TEX
)  are {\it defined\/} in terms of purely logical notions.

\section{Constant Specification}  \label{conspe}

Constant specification is a mechanism that lets us introduce axioms that are known consistent.
In HOL, such axioms are referred to as {\it definitions\/} rather than axioms.
In general, a specification will incur a proof obligation: a proof must be provided that there exists something which satisfies the predicate.    A complete discussion of this topic is given in section \ref{withoutax},  deferred until after the discussion of proof techniques.

However,  in many cases,  the system is able to perform the existence-proof automatically.   These cases include the definitional  $name=value$  form, and also simple predicates such as $T$.  This means that the  mechanism for the specification of constants can be used uniformly for  both specification and definition.


Associated with the constant-specification mechanism is a facility for a graphic display.    In the source-file of a document typeset with {\LaTeX},  the characters which cause a display such as the following:

ⓈHOLCONST
Square : nat → nat
├
Square = λx⦁ (x ptimes x)
■

can be pasted directly into the \Product\ window.   The source-file characters are typed as:

=GFTSHOW
	ⓈHOLCONST
	Square : nat → nat
	├
	Square = λx⦁ (x ptimes x)
	■
=TEX

Entering these characters is equivalent making use of the function
=INLINEFT
⦏const_spec⦎
=TEX
{} by entering:
=GFT
	const_spec (
	  ["Square"],
	  [⌜Square : nat → nat⌝],
	  ⌜Square = λx⦁ (x ptimes x)⌝ );
=TEX

In this tutorial, an occurrence of a display of this kind  puts a strain on the convention we have followed, of  showing system input and output in session-boxes, character by character.  Such a display is meant to be understood as being in a small session-box of its own, which represents some input.

We now give the listing of the theory that we have constructed:

\clearpage

\begin{session}

=SML
print_theory "-";
=GFT
	=== The theory Peanissimo ===

	--- Parents ---
			demo

	--- Constants ---
	zero		nat
	successor	nat → nat
	$pplus		nat → nat → nat
	$ptimes		nat → nat → nat
	Double		nat → nat
	Square		nat → nat

	--- Types ---
	nat

	--- Fixity ---
	Infix 300:	pplus
	Infix 310:	ptimes

	--- Axioms ---
	P3		⊢ ∀ n⦁ ¬ zero = successor n
	P4		⊢ ∀ m n
			  ⦁ successor m = successor n ⇒ m = n
	P5		⊢ ∀ P
			  ⦁ P zero
			        ∧ (∀ n⦁ P n ⇒ P (successor n))
			      ⇒ (∀ n⦁ P n)
	pplus_def	⊢ (∀ n⦁ zero pplus n = n)
			    ∧ (∀ m n
			    ⦁ successor m pplus n
			        = successor (m pplus n))
	ptimes_def	⊢ (∀ n⦁ zero ptimes n = zero)
			    ∧ (∀ m n
			    ⦁ successor m ptimes n
			        = m ptimes n pplus n)

	--- Definitions ---
	Square		⊢ Square = (λ x⦁ x ptimes x)

	=== End of listing of theory Peanissimo ===
=TEX
\end{session}

To repeat the point made earlier, the theory
=INLINEFT
Peanissimo
=TEX
{} is presented here solely as a small example of the development of a theory.  In one important respect it is atypical, and that is in the introduction of axioms. The use of axioms, as illustrated here, carries considerable  danger in general
because it is very easy to assert inconsistent axioms.  It is thus safer to use
only definitions.

A theory  containing  only definitions is called a {\it definitional theory\/}.
A number of useful definitional theories are built-in to the \Product\ system, and are shown in the {\REFERENCE}.
Examples include theories of numbers, sets, pairs and lists.
Indeed it is particularly important to note that, with a single exception,  {\em all} the built-in theories are purely definitional.  The exception is the built-in theory
=INLINEFT
init
=TEX
{} which contains the five primitive axioms of HOL.  By inspecting the theories listed in the {\REFERENCE}, it may be seen that
=INLINEFT
init
=TEX
{} is the only theory containing axioms, and all else is built up by  a process of definition.

This topic is covered  in section \ref{withoutax} below.  It is noteworthy that if consistency is
 to be achieved by avoiding the use of axioms then a price must be paid which amounts to doing proofs.
 Further coverage of specification is thus deferred until after  the coverage of proof.




\cleardoublepage

\chapter{INTRODUCTION TO PROOF WITH \Product\ }
\label{proof}


For a logician, a formal proof is a sequence, each of whose  elements is
either an {\it axiom\/} or follows from earlier members of the sequence by a
{\it rule of inference\/}.  A theorem is the last element of a proof.


Theorems are represented in HOL by values of an abstract
type called
=INLINEFT
THM
=TEX
.  The  only way  to create theorems is by proof.  In \Product\ (following \LCF, \cite{gordon79} ), this consists in applying \mela\ functions
representing {\it rules of inference\/} to  axioms or previously generated
theorems.  The sequence of such applications  directly corresponds to a
logician's proof.

There are five axioms of the HOL logic and eight primitive
inference rules. The axioms can be retrieved  from the theory
=INLINEFT
init
=TEX
{} with  the function
=INLINEFT
⦏get_axiom⦎
=TEX
. For example, the Law of
Excluded Middle can be retrieved with the key
=INLINEFT
"bool_cases_axiom"
=TEX
:

\begin{session}
=SML
      get_axiom "init" "bool_cases_axiom";
=GFT
      val it = ⊢ ∀ b⦁ (b ⇔ T) ∨ (b ⇔ F) : THM
=TEX
\end{session}

Theorems are printed with a turnstile
=INLINEFT
⊢
=TEX
{} as illustrated above.   Rules of inference are \mela\ functions that
return values of type
=INLINEFT
THM
=TEX
.  An example of a rule of inference is {\it
specialization\/} (or $\forall - elimination$).
In standard notation this might be:

\[ \Gamma\turn \uquant{x}t \over \Gamma\turn t[t'/x]\]

This means that a theorem of the form below the line may be inferred from a theorem of the form above the line. Here $\Gamma$ represents the assumptions, which must be the same in the inferred theorem as in the premise, and  $t[t'/x]$ represents  the result of substituting $t'$ for free
occurrences of $x$ in $t$, with the restriction that no free variables in $t'$
become bound after substitution.


A rule very similar to this is represented in \mela\
by a function
=INLINEFT
∀_elim
=TEX
\footnote{This function is not a
primitive rule of inference in the HOL logic, but is a derived rule. Derived rules
are described in Section~\ref{forward}.  }
which, when given as arguments a term
=INLINEFT
⌜a⌝
=TEX
{} and a theorem
=INLINEFT
⊢∀x⦁t[x]
=TEX
, returns the theorem
=INLINEFT
⊢t[a]
=TEX
, the result of substituting
=INLINEFT
a
=TEX
{} for
=INLINEFT
x
=TEX
{} in
=INLINEFT
t[x]
=TEX
.

\setcounter{sessioncount}{1}

\begin{session}
=SML
      val Th1 =  get_axiom "init" "bool_cases_axiom";
=GFT
      val Th1 = ⊢ ∀ b⦁ (b ⇔ T) ∨ (b ⇔ F) : THM
=SML
      val Th2 = ∀_elim ⌜1 = 2⌝ Th1;
=GFT
      val Th2 = ⊢ (1 = 2 ⇔ T) ∨ (1 = 2 ⇔ F) : THM
=TEX
\end{session}


This session consists of a proof of two steps: using an axiom and
applying the rule
=INLINEFT
∀_elim
=TEX
; it interactively performs the following proof:


\begin{enumerate}
\item $\turn \uquant{t} t= T \ \disj\  t= F $ \hfill
[Axiom
=INLINEFT
bool_cases_axiom
=TEX
]
\item $\turn (1{=}2)=T\ \disj\ (1{=}2)=F$\hfill [Specializing line 1 to `$1{=}2$']
\end{enumerate}

If the argument to an \mela\ function representing a rule of inference is of the
wrong kind, or violates a condition of the rule, then the application fails.



A proof in the \Product\ system is constructed by repeatedly applying inference
rules to axioms or to previously proved theorems.
Since proofs may consist of millions of steps, it is necessary to provide
tools to make proof construction easier for the user.  The proof generating
tools in the \Product\ system are described later.


The general form of a theorem is  $t_1,\ldots,t_n\ $\ml{⊢}$\  t$, where $t_1$,
$\ldots$ , $t_n$ are boolean terms called  the {\it  assumptions} and  $t$ is a
boolean term called the {\it conclusion\/}.  Such a theorem asserts that if its
assumptions are true then so is its conclusion.  Its truth  conditions are thus
the same as those for the single term \ml{$(t_1$ ∧ $\ldots $ ∧ $t_n$) ⇒ $t$. } Theorems  with  no  assumptions are displayed in the form \ml{⊢$\ t$}.


Every value of  type
=INLINEFT
THM
=TEX
{} in  the  \Product\ system  can be  obtained by repeatedly
applying  {\bf inference rules} to axioms.

Every {\bf inference rule} is either a {\bf derived rule} or else a {\bf constructor of the abstract data type THM}.

Every {\bf derived rule} is a procedure which invokes other rules each time the derived rule is invoked. Some derived rules are supplied as part of \Product\ and others may be user-defined.

Every rule which is a {\bf constructor} is either a {\bf primitive rule} or else a {\bf built-in rule} or else a {\bf definition schema}.  The collection of constructor rules is fixed.

Every {\bf built-in rule} can in principle be defined as a derived rule in terms of the primitive rules, but for efficiency reasons is not implemented in this way.

Every {\bf definition schema} is justified, not in terms of the primitive rules, but rather in terms of a principle of definitional extension.

In the rest of this section, the  process of  {\it forward  proof\/}, which has
 been sketched above, is decribed in more detail.   In section~\ref{tactics} below, {\it
goal directed proof\/} is described.  Goal directed proof provides additional facilities for  interactive proof development which makes it suitable as the most common mode of working with {\Product}.

\section{Forward proof}
\label{forward}

Three of the primitive inference rules of the HOL logic are
\begin{itemize}
\item
=INLINEFT
asm_rule
=TEX
{} (assumption introduction),
\item
=INLINEFT
⇒_intro
=TEX
{} (discharging, that is, eliminating,  an assumption by introducing an implication) and
\item
=INLINEFT
⇒_elim
=TEX
{} (eliminating an implication, that is, Modus Ponens).
\end{itemize}

These rules will be used to illustrate forward proof and the writing of derived
rules.
The inference rule
=INLINEFT
asm_rule
=TEX
{} generates theorems of the form \ml{$t$ ⊢ $t$}.  The function
=INLINEFT
dest_thm
=TEX
{} decomposes a theorem into a pair consisting of list of
assumptions and the conclusion. The \mela\ type
=INLINEFT
SEQ
=TEX
, or
=INLINEFT
GOAL
=TEX
,  abbreviates
=INLINEFT
TERM list * TERM
=TEX
; this is motivated in Section~\ref{tactics}.

\begin{session}
=SML
      val Th3 = asm_rule ⌜t1⇒t2⌝;
=GFT
      val Th3 = t1 ⇒ t2 ⊢ t1 ⇒ t2 : THM
=SML
      dest_thm Th3;
=GFT
      val it = ([⌜t1 ⇒ t2⌝], ⌜t1 ⇒ t2⌝) : SEQ
=TEX
\end{session}

The primitive inference rule
=INLINEFT
⇒_intro
=TEX
{} (discharging, assumption elimination) infers from
a theorem of the form $\cdots t_1\cdots \ml{⊢}t_2$ the new theorem
$\cdots\ \cdots\ \ml{⊢}\ t_1\ml{⇒}t_2$.
=INLINEFT
⇒_intro
=TEX
{} takes as arguments
the term to be discharged (\ie\ $t_1$) and the theorem from whose
assumptions it is to be discharged and returns the result of the discharging.
The following session illustrates this:
\begin{session}
=SML
      val Th4 = ⇒_intro ⌜t1⇒t2⌝ Th3;
=GFT
      val Th4 = ⊢ (t1 ⇒ t2) ⇒ t1 ⇒ t2 : THM
=TEX

\end{session}


In HOL,  the  rule   of  Modus  Ponens  is  specified in conventional
notation by:

\[ \Gamma_1 \turn t_1 \imp t_2 \qquad\qquad \Gamma_2\turn t_1\over
\Gamma_1 \cup \Gamma_2 \turn t_2\]

Corresponding to Modus Ponens, the \mela\ function
=INLINEFT
⇒_elim
=TEX
{} takes argument theorems of the
form \ml{$\cdots\ $ ⊢ $\ t_1$\ ⇒\ $t_2$} and \ml{$\cdots\ $ ⊢ $\ t_1$}
and returns \ml{$\cdots\ $ ⊢ $\ t_2$}. The next session illustrates the use of
=INLINEFT
⇒_elim
=TEX
{}  and  illustrates also a common error, namely not supplying the HOL logic type
checker with enough information.

\begin{session}
=GFT SML
      val Th5 = asm_rule  ⌜t1⌝;
=GFT
      Exception- Fail * ⌜t1⌝ is not of type ⌜:BOOL⌝ [asm_rule.3031] * raised
=SML
      val Th5 = asm_rule  ⌜t1:BOOL⌝;
=GFT
      val Th5 = t1 ⊢ t1 : THM
=SML
      val Th6 = ⇒_elim Th3 Th5;
=GFT
      val Th6 = t1 ⇒ t2, t1 ⊢ t2 : THM
=TEX

\end{session}

The assumptions of
=INLINEFT
Th6
=TEX
{} can be extracted with the \mela\ function
=INLINEFT
asms
=TEX
,
which returns the list of assumptions of a theorem. The conclusion  of a theorem is returned by the function
=INLINEFT
concl
=TEX
.

\begin{session}
=SML
      asms Th6;
=GFT
      val it = [⌜t1 ⇒ t2⌝, ⌜t1⌝] : TERM list
=SML
      concl Th6;
=GFT
      val it = ⌜t2⌝ : TERM

=TEX
\end{session}

Discharging
=INLINEFT
Th6
=TEX
{} twice establishes the theorem $ ⊢ \ t1  \ ⇒ \  (t1 ⇒ t2) ⇒ t2 $.

\begin{session}
=SML
      val  Th7 = ⇒_intro  ⌜t1⇒t2⌝ Th6;
=GFT
      val Th7 = t1 ⊢ (t1 ⇒ t2) ⇒ t2 : THM
=TEX

=SML
      val  Th8 = ⇒_intro ⌜t1:BOOL⌝ Th7;
=GFT
      val Th8 = ⊢ t1 ⇒ (t1 ⇒ t2) ⇒ t2 : THM
=TEX

\end{session}



The sequence:  $Th3, \ Th5, \ Th6,  \ Th7, \ Th8 $
 constitutes a proof in HOL of
the theorem \[⊢ \ t1 ⇒ (t1 ⇒ t2) ⇒ t2 \]   This
proof could be written:

\begin{enumerate}
\item $ t_1\imp t_2\turn t_1\imp t_2$ \hfill
[Assumption introduction]
\item $ t_1\turn t_1$ \hfill
[Assumption introduction]
\item $t_1\imp t_2,\ t_1 \turn t_2 $ \hfill
[Modus Ponens applied to lines 1 and 2]
\item $t_1 \turn (t_1\imp t_2)\imp t_2$ \hfill
[Discharging the first assumption of line 3]
\item $\turn t_1 \imp (t_1 \imp t_2) \imp t_2$ \hfill
[Discharging the only assumption of line 4]
\end{enumerate}

\section{Derived rules}


A {\it proof from hypothesis $th_1, \ldots, th_n$} is a sequence each of whose
elements is either an axiom, or one of the hypotheses $th_i$, or follows from
earlier elements by a rule of inference.

For example, a proof of $\Gamma,\ t'\turn t$ from the hypothesis
$\Gamma\turn t$ is:


\begin{enumerate}
\item $t'\turn t'$ \hfill [Assumption introduction]
\item $\Gamma\turn t$ \hfill [Hypothesis]
\item $\Gamma\turn t'\imp t$ \hfill [`Discharge' $t'$ from line 2]
\item $\Gamma,\ t'\turn t$ \hfill [Modus Ponens applied to lines 3 and 1]
\end{enumerate}

Note that line 3 above mentions `discharging' the assumption $t'$, but $t'$ is not actually amongst the assumptions.  The rule
=INLINEFT
⇒_intro
=TEX
{} does not in fact require its term argument ($t'$) to be present in the assumptions of its theorem argument (line 2).

This proof works for any hypothesis of the form $\Gamma\turn t$
and any boolean term $t'$ and
shows that the result of adding an arbitrary hypothesis to a theorem is another
theorem (because the four lines above can be added to any proof of
$\Gamma\turn t$ to get a proof of $\Gamma,\ t'\turn t$).\footnote{This property
of the logic is called {\it monotonicity}.} For example,
the next session uses this proof to add the hypothesis
=INLINEFT
t3
=TEX
{} to
=INLINEFT
Th6
=TEX
.


\begin{session}

=SML
      val  Th9 = asm_rule ⌜t3:BOOL⌝;
=GFT
      val Th9 = t3 ⊢ t3 : THM
=SML
      val  Th10 = ⇒_intro ⌜t3:BOOL⌝ Th6;
=GFT
      val Th10 = t1 ⇒ t2, t1 ⊢ t3 ⇒ t2 : THM
=SML
      val Th11 = ⇒_elim Th10 Th9;
=GFT
      val Th11 = t1 ⇒ t2, t1, t3 ⊢ t2 : THM
=TEX
\end{session}


A {\it derived rule\/} is an \mela\ procedure that generates a proof from given hypotheses
each time it is invoked. The hypotheses are the arguments of the rule.
An example of  definition of a derived rule will now be given.   A rule, called, say,
=INLINEFT
ADD_ASSUM
=TEX
, will be defined as an \mela\ procedure that carries
out the proof above. In standard notation this would be described by:

\[ \Gamma\turn t\over \Gamma,\ t'\turn t \]

The \mela\ definition is:

\begin{session}
=SML
      fun  ADD_ASSUM t th =
       let val th9  = asm_rule t
           val th10 = ⇒_intro t th
       in
       ⇒_elim th10 th9
       end;
=GFT
      val ADD_ASSUM = fn : TERM -> THM -> THM
=SML
      ADD_ASSUM ⌜t3:BOOL⌝ Th6;
=GFT
      val it = t1 ⇒ t2, t1, t3 ⊢ t2 : THM
=TEX
\end{session}

The body of
=INLINEFT
ADD_ASSUM
=TEX
{} has been coded  to mirror  the proof done
in session~9 above, so as to show how an interactive proof  can be generalized
into a  procedure.   But
=INLINEFT
ADD_ASSUM
=TEX
{} can be  written much more concisely as:

\begin{session}
=SML
      fun  ADD_ASSUM t th = ⇒_elim (⇒_intro t th) (asm_rule t);
=GFT
      val ADD_ASSUM = fn : TERM -> THM -> THM
=SML
      ADD_ASSUM  ⌜t3:BOOL⌝ Th6;
=GFT
      val it = t1 ⇒ t2, t1, t3 ⊢ t2 : THM
=TEX
\end{session}


As another example of a derived inference rule,  one which  moves the antecedent of an implication to the assumptions, is shown below as
=INLINEFT
UNDISCH
=TEX
.

\[ \Gamma\turn t_1\imp t_2 \over\Gamma,\ t_1\turn t_2 \]

An \mela\ derived rule that implements this is:

\begin{session}
=SML
      fun  UNDISCH th =  ⇒_elim th (asm_rule(fst(dest_⇒(concl th))));
=GFT
      val UNDISCH = fn : THM -> THM
=SML
      Th10;
=GFT
      val it = t1 ⇒ t2, t1 ⊢ t3 ⇒ t2 : THM
=SML
      UNDISCH Th10;
=GFT
      val it = t1 ⇒ t2, t1, t3 ⊢ t2 : THM
=TEX
\end{session}

Each time
=INLINEFT
UNDISCH
=TEX
{} $\Gamma\turn t_1\imp t_2$ is executed,
the following proof is performed:

\begin{enumerate}
\item $t_1\turn t_1$ \hfill [Assumption introduction]
\item $\Gamma\turn t_1\imp t_2$ \hfill [Hypothesis]
\item $\Gamma,\ t_1\turn t_2$ \hfill [Modus Ponens applied to lines 2 and 1]
\end{enumerate}

Rules  equivalent to
=INLINEFT
ADD_ASSUM
=TEX
{} and
=INLINEFT
UNDISCH
=TEX
{} (named respectively
=INLINEFT
asm_intro
=TEX
{} and
=INLINEFT
undisch_rule
=TEX
) are  derived rules defined when the \Product\ system is built.

\section{Rewriting}

An important derived rule  is
=INLINEFT
rewrite_rule
=TEX
.    This takes  as arguments
\begin{itemize}
\item a collection of equations represented by  a list of theorems, such that each theorem is an equation or a conjunction of equations, and
\item   a theorem $\Delta\turn t$
\end{itemize}
 and  repeatedly  replaces in  $t$  instances  of  the lefthand side of an equation  by the
corresponding instance of the righthand side until no further change occurs.   The result is
a theorem $\Gamma\cup\Delta\turn t'$ where $t'$ is the result  of rewriting $t$
in this way, and $\Gamma$ is the union of the assumptions in the equations.


 The session below illustrates the use of
=INLINEFT
rewrite_rule
=TEX
.  In it the list of equations is a list
=INLINEFT
rewrite_list
=TEX
{} containing the  theorems   of the theory
=INLINEFT
ℕ
=TEX
{} defining addition and multiplication.


\begin{session}
=SML
      val  rewrite_list =  map (get_defn "ℕ") ["+", "*"];
=GFT
      val rewrite_list = [
          ⊢ ∀ m n⦁ 0 + n = n ∧
                   (m + 1) + n = (m + n) + 1 ∧
                   Suc m =  m + 1,
          ⊢ ∀ m n⦁ 0 * n = 0 ∧
                  (m + 1) * n = m * n + n] : THM list
=TEX
\end{session}

In the following example,  the conclusion of a theorem (an arbitrary theorem just for this example) is rewritten using these definitions to produce a simpler theorem.

\begin{session}
=SML
      val th = asm_rule ⌜(0 + m) = ((0* n) +1)⌝;
=GFT
      val th = 0 + m = 0 * n + 1 ⊢ 0 + m = 0 * n + 1 : THM
=SML
      rewrite_rule rewrite_list th;
=GFT
      val it = 0 + m = 0 * n + 1 ⊢ m = 1 : THM
=TEX
\end{session}

=INLINEFT
rewrite_rule
=TEX
{} is not a primitive in HOL, but is a derived rule.   In addition to the equations given explicitly as an argument,
=INLINEFT
rewrite_rule
=TEX
{} makes use of equations in the supplied theories, as shown in the following example of rewriting with an empty list as argument:

\begin{session}
=SML
      (asm_rule ⌜(T ∧ x) ∨ F ⇒ F⌝);
=GFT
      val it = T ∧ x ∨ F ⇒ F ⊢ T ∧ x ∨ F ⇒ F : THM
=SML
      rewrite_rule [ ] it;
=GFT
      val it = T ∧ x ∨ F ⇒ F ⊢ ¬ x : THM
=TEX
\end{session}


There are powerful facilities in \Product\ for producing customized rewriting tools which scan through terms in user programmed orders;
=INLINEFT
rewrite_rule
=TEX
{} is the tip of an iceberg.

\pagebreak

\chapter{GOAL ORIENTED PROOF}
\label{backward}\label{tactics}

The style of forward proof described in the previous chapter is unnatural and
too laborious for many applications.   This chapter covers the topic of an alternative style, called `goal-oriented proof', also known as `backward proof' or `tactical proof'.  In this style, interactive facilities are available to support the proof development process.   These facilities are called `the subgoal package'.  Before describing the subgoal package, the underlying concepts of goals and tactics are described.

\section{Goals and Tactics}

An important advance in proof generating
methodology was made by Robin Milner in the early 1970s when he invented the
notion of {\it tactics\/}. A conjecture, stated as a sequent, is called a `goal' when it becomes a candidate for proving it to be a theorem.  A tactic is a function which does two things:
\begin{itemize}
\item It decomposes a goal into one or more simpler goals, called subgoals.
\item It keeps track of the reason why achieving the subgoal(s) will achieve the goal.
\end{itemize}

\noindent Consider, for example, the  rule of $\wedge$-introduction\footnote{In
higher order logic this is a derived rule; in first  order logic  it is usually
primitive.  In HOL the rule is called
=INLINEFT
∧_intro
=TEX
{}}  shown below:

\[ \Gamma_1\turn
t_1\qquad\qquad\qquad\Gamma_2\turn t_2\over \Gamma_1\cup\Gamma_2 \turn t_1\conj
t_2 \]


\noindent In HOL,  $\wedge$-introduction is  represented by  the \mela\ function
=INLINEFT
∧_intro
=TEX
, such that
  \[ ∧\_intro \ (\Gamma_1\turn t_1)\ (\Gamma_2\turn t_2) \ \ is \ (\Gamma_1\cup\Gamma_2\turn  t_1\conj  t_2)\]

This is illustrated in the
following new  session  (note  that  the  session  number  has  been  reset  to
{\small\sl 1}):

\setcounter{sessioncount}{1}
\begin{session}
=SML
      val  Th1 = asm_rule ⌜A:BOOL⌝ and Th2 = asm_rule ⌜B:BOOL⌝;
=GFT
      val Th1 = A ⊢ A : THM   val Th2 = B ⊢ B : THM
=SML
      val  Th3 = ∧_intro Th1 Th2;
=GFT
      val Th3 = A, B ⊢ A ∧ B : THM
=TEX
\end{session}

Suppose the goal is to prove $A\conj B$, then this rule says
that it is sufficient
to prove the two subgoals $A$ and $B$, because from $\turn A$ and $\turn B$
the theorem $\turn A\conj B$ can be deduced. Thus:

\begin{description}
\item[(i)] To prove $\turn A \conj B$ it is sufficient to
      prove $\turn A$ and $\turn B$.
\item [(ii)]The justification for the reduction of the
goal  $\turn A \conj B$  to the two  subgoals  $\turn A$
and $\turn B$ is the rule of $\wedge$-introduction.
\end{description}

A {\it goal\/} in HOL is a pair
([$t_1$,\ldots,$t_n$],$t$) of \mela\ type
=INLINEFT
TERM list * TERM
=TEX
. An {\it achievement\/} of such a goal
is a theorem
$t_1$,$\ldots$,$t_n$\ $⊢$ \ $t$.
A tactic is an \mela\ function that when applied to a goal generates subgoals
together with a {\it justification function\/} or {\it validation\/},
which will be an \mela\ derived inference
rule, that can be used to infer an achievement of the original goal from
achievements
of the subgoals.



\mela\ has a type abbreviating mechanism which is used to give mnemonic
names to the various types associated with goal oriented proof.  Some type abbreviations are as follows:

\def\aa{
=INLINEFT
CONV
=TEX
}
\def\ab{
=INLINEFT
TERM -> THM
=TEX
}
\def\ba{
=INLINEFT
GOAL
=TEX
}
\def\bb{
=INLINEFT
(TERM list) * TERM
=TEX
}
\def\ca{
=INLINEFT
GOAL_STATE
=TEX
}
\def\cb{
=INLINEFT
an abstract type
=TEX
}
\def\da{
=INLINEFT
PROOF
=TEX
}
\def\db{
=INLINEFT
THM list -> THM
=TEX
}

\def\ea{
=INLINEFT
SEQ
=TEX
}
\def\eb{
=INLINEFT
(TERM list) * TERM
=TEX
}
\def\fa{
=INLINEFT
TACTIC
=TEX
}
\def\fb{
=INLINEFT
GOAL -> (GOAL list * PROOF)
=TEX
}
\def\ga{
=INLINEFT
THM_TACTIC
=TEX
}
\def\gb{
=INLINEFT
THM -> TACTIC
=TEX
}
\def\ha{
=INLINEFT
THM_TACTICAL
=TEX
}
\def\hb{
=INLINEFT
THM_TACTIC -> THM_TACTIC
=TEX
}

\begin{tabular}{|l|l|}  \hline
{\bf Abbreviation} & {\bf Type} \\ \hline \hline
% \ml{CONV}          & \verb+TERM -> THM+    \\        \hline
% \ml{GOAL}          & \verb+(TERM list ) * TERM + \\  \hline
% \ml{GOAL\_STATE}   & an abstract type \\  \hline
% \ml{PROOF}         & \verb+THM list -> THM+    \\    \hline
% \ml{SEQ}           & \verb+(TERM list ) * TERM+   \\ \hline
% \ml{TACTIC}        & \verb+GOAL -> (GOAL list * PROOF)+  \\ \hline
% \ml{THM\_TACTIC}   & \verb+THM -> TACTIC+  \\ \hline
% \ml{THM\_TACTICAL} & \verb+THM_TACTIC -> THM_TACTIC+  \\ \hline
\aa &
=INLINEFT
TERM -> THM
=TEX
 \\ \hline
\ba &
=INLINEFT
(TERM list) * TERM
=TEX
\\ \hline
\da &
=INLINEFT
THM list -> THM
=TEX
 \\ \hline
\ea &
=INLINEFT
(TERM list) * TERM
=TEX
 \\ \hline
\fa &
=INLINEFT
GOAL -> (GOAL list * PROOF)
=TEX
\\ \hline
\ga &
=INLINEFT
THM -> TACTIC
=TEX
 \\ \hline
\ha &
=INLINEFT
THM_TACTIC -> THM_TACTIC
=TEX
\\ \hline
\end{tabular}


The left hand side of these abbreviations can be used anywhere that the
right hand side can.



If $T$ is a tactic (\ie\ an \mela\ function of type
=INLINEFT
TACTIC
=TEX
) and $g$ is a goal (\ie\ an \mela\ value of type
=INLINEFT
GOAL
=TEX
), then
applying $T$ to $g$ (\ie\ evaluating the \mela\
expression
=INLINEFT
T g
=TEX
) will result in an object of \mela\ type
=INLINEFT
GOAL list * PROOF
=TEX
, that is,  a pair whose
first component is a list of
goals and whose second component is a justification function, \ie\ has \mela\ type
=INLINEFT
PROOF
=TEX
.

An example tactic is
=INLINEFT
∧_tac
=TEX
.  For example, consider the trivial goal of showing
=INLINEFT
T ∧ T
=TEX
, where
=INLINEFT
T
=TEX
{} is a constant that stands for $true$:

\begin{session}

=SML
      val  goal : GOAL =([ ], ⌜T ∧ T⌝);
=GFT
      val goal = ([ ], ⌜T ∧ T⌝) : GOAL

=SML
      ∧_tac goal;
=GFT
      val it = ([([ ], ⌜T⌝), ([ ], ⌜T⌝)], fn) : GOAL list * PROOF

=SML
      val  (goal_list,just_fn) = it;
=GFT
      val goal_list = [([ ], ⌜T⌝), ([ ], ⌜T⌝)] : GOAL list
      val just_fn = fn : PROOF
=TEX
\end{session}


Applying
=INLINEFT
∧_tac
=TEX
{} has produced a goal  list consisting  of two identical
subgoals, each of which is to show
=INLINEFT
([ ],⌜T⌝)
=TEX
.  Now, there  is a  preproved theorem in
HOL, which is recorded in theory
=INLINEFT
misc
=TEX
{} under the name of
=INLINEFT
t_thm
=TEX
.  It can be produced and bound to an \mela\ name, say
=INLINEFT
TRUTH
=TEX
, as follows:


\begin{session}

=SML
	val TRUTH = get_thm "misc" "t_thm";
=GFT
	val TRUTH = ⊢ T : THM
=TEX

\end{session}

Applying the justification function
=INLINEFT
just_fn
=TEX
{} to a list of theorems achieving the goals in
=INLINEFT
goal_list
=TEX
{} results in a theorem achieving the original goal:

\begin{session}
=SML
      just_fn [TRUTH, TRUTH];
=GFT
      val it = ⊢ T ∧ T : THM
=TEX
\end{session}

Although this  example  is trivial,  it does  illustrate the  essential idea of
tactics.

\subsection{Example of Defining a Tactic}
Tactics are  not special  theorem-proving primitives. They
are just  \mela\  functions.  New tactics may be defined in terms of inference rules or (by means to be described below) by combining existing tactics.   An example of the definition of a tactic equivalent to the built-in
=INLINEFT
∧_tac
=TEX
{} would be:

=GFT
    fun ∧_tac_equivalent (asmlist, conjunct) =
	let val (left, right) = dest_∧ conjunct
	in
	([(asmlist,left), (asmlist,right)],
	 fn [th1, th2] => ∧_intro th1 th2)
	end;

=TEX

In this definition, the \mela\ function
=INLINEFT
dest_∧
=TEX
{} splits a conjunctive term
=INLINEFT
conjunct
=TEX
{} into its
two conjuncts,
=INLINEFT
left
=TEX
{} and
=INLINEFT
right
=TEX
. If
=INLINEFT
(asmlist, ⌜left ∧ right⌝)
=TEX
{} is a goal, then
=INLINEFT
∧_tac_equivalent
=TEX
{} splits it into the list of two subgoals
=INLINEFT
(asmlist,⌜left⌝)
=TEX
{} and
=INLINEFT
(asmlist,⌜right⌝)
=TEX
.

The justification function,
=INLINEFT
fn [th1, th2] => ∧_intro th1 th2
=TEX
, takes a list
=INLINEFT
[th1, th2]
=TEX
{} of theorems and applies the rule
=INLINEFT
∧_intro
=TEX
{} to
=INLINEFT
th1
=TEX
{} and
=INLINEFT
th2
=TEX
.

It should be noted that there are facilities, described below, for defining new tactics by combining existing tactics

\subsection{Effects of Tactics}
To summarize:
if $T$ is a tactic and $g$
is a goal, then
applying $T$ to $g$ will result in
an object of \mela\ type
=INLINEFT
GOAL list * PROOF
=TEX
, \ie\ a pair whose first component is a list of
goals and whose second component is a justification function.

Suppose $T \ g = ([g_1 ,  \ldots , g_n], \ p ) $.
The idea is that $g_1 , \ldots , g_n$ are subgoals and $p$
is a `justification' of the reduction of goal $g$ to subgoals
$g_1 , \ldots , g_n$.
Suppose further that the subgoals $g_1 , \ldots , g_n$ have been solved.
This would mean that
theorems $th_1$ , $\ldots$ , $th_n$ had been proved
such that each $th_i$ ($1\leq i\leq n$) `achieves' the goal $g_i$.
The justification $p$ (produced
by applying $T$ to $g$) is an \mela\
function which when applied to the list
$[th_1$, $\ldots$, $th_n]$ returns a theorem, $th$,
which `achieves' the original goal $g$.
Thus $p$ is a function for converting a solution of the subgoals to a
solution of the original goal. If $p$
does this successfully, then the tactic $T$ is
called {\it valid\/}.

Invalid tactics cannot result in the proof of invalid theorems;
the worst they can do is result in insolvable goals or unintended theorems
being proved.
If tactic $T$ were invalid and were used
to reduce goal $g$ to subgoals $g_1$ , $\ldots$ , $g_n$,
then  effort might be spent proving
theorems $th_1$ , $\ldots$ , $th_n$ to
achieve the subgoals $g_1$ , $\ldots$ , $g_n$,
only to find out after the work is done that this is a blind alley
because $p \ [th_1$, \ldots$ ,th_n]$
doesn't achieve $g$ (\ie\ it fails,
or else it achieves some other goal).

A theorem {\it achieves\/} a goal if the assumptions of the theorem are
included in the assumptions of the goal {\it and\/} if the conclusion of the
theorem is equal (up to the renaming of bound variables) to the conclusion of
the goal. More precisely, a theorem
$t_1, \dots, t_m  \ ⊢ \ t $ achieves a goal
$([u_1, \ldots , u_n], \ u)$


if and only if {\small\verb%{%}$t_1,\ldots,t_m${\small\verb%}%} is a subset of
{\small\verb%{%}$u_1,\ldots,u_n${\small\verb%}%} and $t$ is equal to $u$ (up
to renaming of bound variables).  For example, the goal
\begin{quotation}
\ml{([⌜x=y⌝, ⌜y=z⌝, ⌜z=w⌝],   ⌜x=z⌝)}
\end{quotation}
 is achieved by the theorem
\begin{quotation}
\ml{x=y, y=z ⊢ x=z}
\end{quotation}the assumption \ml{z=w} being not
needed.

A tactic {\it solves\/} a goal if it reduces the goal
to the empty list
of subgoals. Thus $T$ solves $g$ if  $T\ g${\small\verb% = ([ ],%}$p${\small\verb%)%}.
If this is the case and if $T$ is valid, then $p${\small\verb%[ ]%}
will evaluate to a theorem achieving $g$.
Thus if $T$ solves $g$ then the \mela\ expression
=INLINEFT
snd(T g)[ ]
=TEX
{} evaluates to
a theorem achieving $g$.

Tactics generally fail (in the \mela\ sense) if they are applied to
inappropriate
goals. For example,
=INLINEFT
∧_tac
=TEX
{} will fail if it is applied to a goal whose
conclusion is not a conjunction.


\subsection{Notation for Specifying Tactics}

Tactics are specified using the following notation:

\begin{center}
\begin{tabular}{c} \\
$goal$ \\ \hline \hline
$goal_1\ \ \ goal_2 \ \ \ \cdots\ \ \ goal_n$ \\
\end{tabular}
\end{center}

For example, a tactic called
=INLINEFT
∧_tac
=TEX
{} is described by

\begin{center}
\begin{tabular}{c} \\
$ t_1$ \ml{∧} $t_2$ \\ \hline \hline
$t_1\ \ \ \ \ \ \ t_2$ \\
\end{tabular}
\end{center}

Thus
=INLINEFT
∧_tac
=TEX
{} reduces a goal of the form
\ml{$\Gamma$, ⌜$t_1$∧$t_2$⌝}
to subgoals \ml{$\Gamma$, ⌜$t_1$⌝} and \ml{$\Gamma$, ⌜$t_2$⌝}
.
The fact that the assumptions of the top-level goal
are propagated unchanged to the two subgoals is indicated by the absence
of assumptions in the notation.

\pagebreak

Another example is
=INLINEFT
induction_tac
=TEX
, the tactic for doing mathematical induction on the natural numbers.

\begin{center}
\begin{tabular}{c} \\
$t[n]$ \\ \hline \hline
$t[${\small\verb%0%}$]$ {\small\verb%     %} $\{t[n]\}\ t[${\small\verb%Suc %}$n]$
\end{tabular}
\end{center}

Given the name of a variable, n say,  which is to be the induction variable,
=INLINEFT
induction_tac ⌜n:ℕ⌝
=TEX
{} reduces a goal $( \Gamma, \ t[n]) $ to
\begin{itemize}
\item  a basis subgoal , $( \Gamma, \ t[0]) $ and
\item  an induction step subgoal $(\Gamma \ \cup  \ \{ t[n] \}, t[n+1]) $.  Here the set of assumptions are the original set $\Gamma$ together  with the extra assumption, written in the tactic-notation as  a singleton set, $\{ t[n] \}$
\end{itemize}

\begin{session}

=SML
	(induction_tac ⌜m:ℕ⌝)  ([ ], ⌜(m + n) = (n + m)⌝);
=GFT
	val it = ([	([], ⌜0 + n = n + 0⌝),
			([], ⌜(m + 1) + n = n + m + 1⌝)],
		 fn) : GOAL list * PROOF
=TEX
\end{session}

The first subgoal is the basis case and the second subgoal is
the step case.


\section{Using Tactics to Prove Theorems}
\label{using-tactics}

Suppose goal $g$  is to be solved. If $g$
is simple it might be possible
to immediately think up a tactic, $T$
say, which reduces it to the empty list of
subgoals. If this is the case then executing
=INLINEFT
val (gl,p) = T g;
=TEX
{}  will
\begin{itemize}
\item bind $gl$ to the empty list of goals, and
\item bind $p$ to a function which when applied to the empty list
of theorems yields a theorem $th$ achieving $g$.
\end{itemize}

Thus a theorem achieving
$g$ can be computed by executing
=INLINEFT
val th = p [ ];
=TEX
.  This will be illustrated using
=INLINEFT
rewrite_tac
=TEX
{} which takes a list
of equations (empty in the example that follows) and tries to prove a goal
by rewriting with these equations together with built-in rewrites:

\begin{session}
=SML
      val g = ([ ], ⌜T ∧ x ⇒ x ∨ (y ∧ F)⌝) : GOAL;
=GFT
      val g = ([ ], ⌜T ∧ x ⇒ x ∨ y ∧ F⌝) : GOAL

=SML
      val T = rewrite_tac [ ];
=GFT
      val T = fn : TACTIC

=SML
      val (gl, p) = T g;
=GFT
      val gl = [ ] : GOAL list val p = fn : PROOF

=SML
      val th = p[ ];
=GFT
      val th = ⊢ T ∧ x ⇒ x ∨ y ∧ F : THM
=TEX
\end{session}


There is a useful built-in  function
=INLINEFT
⦏tac_proof⦎
=TEX
{} of \mela\ type
=INLINEFT
GOAL * TACTIC -> THM
=TEX
{} such that
=INLINEFT
tac_proof (G, T)
=TEX
{}  proves the goal  $G$  using  tactic  $T$  and  returns the resulting theorem.

\subsection{The Subgoal Package}

When conducting a proof that involves many subgoals and tactics, it is necessary
to keep track of all the justification functions
and compose them in the correct order.  While
this is feasible even in large proofs, it is tedious.  \Product\ provides a package
for building and traversing the tree of subgoals, stacking the justification functions and
applying them properly; such a package was originally implemented for \LCF\ by
Larry Paulson.

The subgoal package implements a simple framework for interactive proof. A proof
tree is created and traversed top-down.  The current goal can be expanded
into subgoals using a tactic; the subgoals are pushed onto the goal
stack.
Subgoals can be considered in any order.  If the tactic solves a
subgoal (\ie\ returns an empty subgoal list), then the package proceeds to the
next subgoal in the tree.

The function
=INLINEFT
⦏set_goal⦎
=TEX
{} of type
=INLINEFT
GOAL -> unit
=TEX
{} initializes the subgoal package with a new {\bf main goal} goal.  It takes two arguments: a list of terms which are to be the assumptions and a term which is to be the conclusion. Usually
main goals have no assumptions;  the function
=INLINEFT
g
=TEX
{} is useful
in this case where g is defined by:

=SML
      fun g t = set_goal([ ],t);
=TEX

To illustrate the facilities provided by the subgoal package the trivial theorem
$m+0=m$ will be proved.


\setcounter{sessioncount}{1}
\begin{session}
=SML
      g ⌜(m + 0) = m⌝;
=GFT
      Now 1 goal on the main goal stack

      (* *** Goal "" *** *)

      (* ?⊢ *)  ⌜m + 0 = m⌝

      val it = (): unit

=TEX
\end{session}


This sets up the goal.   The system response consists of
\begin{itemize}
\item a display of the number of main goals now on the stack.

\item A label for the goal.  In this case the label is  the  empty string appearing between the ``'' marks.
\item A display of the goal itself.  The display consists of a list of  assumptions, (there being none in this case), followed by the conclusion.   The conclusion is marked by the symbols
=INLINEFT
(* ?⊢ *)
=TEX
\item A display of the value returned by the {}
=INLINEFT
set_goal
=TEX
{} (or g) function, which is always
=INLINEFT
() : unit
=TEX
.  Thus the  preceding lines of the display produced are a side-effect of the function, not a returned value.
\end{itemize}


The next step is to choose a tactic and apply it to the goal.  One  of several possible approaches is to use induction to split the goal into a basis and step case.  A suitable tactic is provided by
=INLINEFT
⦏induction_tac⦎
=TEX
. Here we will induct on
=INLINEFT
m
=TEX
{} so the tactic to be applied is
=INLINEFT
induction_tac ⌜m:ℕ⌝
=TEX
.




To  apply any tactic, use is made of the function
=INLINEFT
⦏apply_tactic⦎
=TEX
. This frequently-used function is available under the alias
=INLINEFT
⦏a⦎
=TEX
. It applies a tactic to the top goal on the stack, then
pushes the resulting subgoals onto the goal stack, then prints the resulting
subgoals. If there are no subgoals, the justification function is applied to the
theorems solving the subgoals that have been proved and the resulting theorems are
printed.

\begin{session}
=SML
      a  (induction_tac ⌜m:ℕ⌝) ;
=GFT
      Tactic produced 2 subgoals:

      (* *** Goal "2" *** *)

      (* ?⊢ *)  ⌜(m + 1) + 0 = m + 1⌝


      (* *** Goal "1" *** *)

      (* ?⊢ *)  ⌜0 + 0 = 0⌝

      val it = () : unit
=TEX

\end{session}


The top of the goal stack is printed last. The basis case
is an instance of the definition of addition, so is solved by rewriting with the equations for addition in the theory
=INLINEFT
ℕ
=TEX
.    These equations are amongst those used in rewriting by default, and so no explicit list of equations need be supplied:

\begin{session}
=SML
      a (rewrite_tac [ ]);
=GFT
      Tactic produced 0 subgoals:
      Current goal achieved, next goal is:

      (* *** Goal "2" *** *)

      (* ?⊢ *)  ⌜(m + 1) + 0 = m + 1⌝
=TEX
\end{session}


The basis is solved and the goal
stack popped so that its top is now the step case.  This goal can be solved in the same way as the previous:

\begin{session}
=SML
	a (rewrite_tac [ ]);

=GFT
	Tactic produced 0 subgoals:
	Current and main goal achieved

=TEX
\end{session}


The top goal  (the step case)
is solved , and since the basis is already solved, the main goal is solved.
The theorem achieving the goal can be extracted from the subgoal package with
=INLINEFT
⦏top_thm⦎
=TEX
, or with
=INLINEFT
⦏pop_thm⦎
=TEX
:  the former leaves the goal stack unchanged while the latter removes the goal from the stack.

\begin{session}
=SML
      top_thm();
=GFT
      val it = ⊢ m + 0 = m : THM
=TEX
\end{session}




The order in which goals are worked on can be adjusted. Firstly the goal stack is backed up. The function
=INLINEFT
undo
=TEX
takes an argument which is the number of steps by which to back up the goal-stack to a previous state: to go  back to the point at which there were two subgoals will require undoing two steps:

\begin{session}
=SML
	undo 2;
=GFT
Current goal is:

(* *** Goal "1" *** *)

(* ?⊢ *)  ⌜0 + 0 = 0⌝


=TEX
\end{session}

The system offers the basis case as the current subgoal.  In order to survey all the possible subgoals, the command
=INLINEFT
⦏print_goal_state⦎  (top_goal_state())
=TEX
{} is used:

\begin{session}
=SML
	print_goal_state (top_goal_state());
=GFT
	Main goal is:
	(* ?⊢ *)  ⌜m + 0 = m⌝

	Goals to be proven are:

	(* *** Goal "1" *** *)

	(* ?⊢ *)  ⌜0 + 0 = 0⌝


	(* *** Goal "2" *** *)

	(* ?⊢ *)  ⌜(m + 1) + 0 = m + 1⌝


	Current goal is:

	(* *** Goal "1" *** *)

	(* ?⊢ *)  ⌜0 + 0 = 0⌝

=TEX
\end{session}

It can be seen that the current goal is labelled ``1'' and the other goal is labelled ``2''.  To choose goal ``2'' to work on, it is made current with the command
=INLINEFT
⦏set_labelled_goal⦎
=TEX
, providing an argument value of, in this case, "2".
\begin{session}
=SML
      set_labelled_goal "2";
=GFT
	Current goal is:

	(* *** Goal "2" *** *)

	(* ?⊢ *)  ⌜(m + 1) + 0 = m + 1⌝

=TEX
\end{session}


The top goal is now the step case not the basis case, so the tactic can be applied:

\begin{session}
=SML
	a (rewrite_tac [ ]);
=GFT
	Tactic produced 0 subgoals:
	Current goal achieved, next goal is:

	(* *** Goal "1" *** *)

	(* ?⊢ *)  ⌜0 + 0 = 0⌝

=TEX
\end{session}

These example have illustrated the working of the subgoal package, with multiple subgoals, using just two tactics, induction and rewriting.   It may be noted that in fact rewriting alone is sufficient for this simple goal, to give a one-step proof:

\begin{session}

=SML
	g ⌜(m + 0) = m⌝;
=GFT
	Now 1 goal on the main goal stack

	(* *** Goal "" *** *)

	(* ?⊢ *)  ⌜m + 0 = m⌝
=SML
	a (rewrite_tac []);
=GFT
	Tactic produced 0 subgoals:
	Current and main goal achieved

=TEX
\end{session}


\subsection{Multiple Main Goals}  \label{push}

The subgoal package allows work on one main goal to be suspended(i.e. stacked) to work on another. The second goal can be quite independent of the first, although most use of this facility would be to prove a subsidiary theorem in the course of proving another.


To begin work on a second goal while suspending work on the first, the function
=INLINEFT
⦏push_goal⦎
=TEX
{} is used rather than
=INLINEFT
set_goal
=TEX
{} for stating the second goal.

It has already been mentioned that
=INLINEFT
pop_thm
=TEX
{} can be used to retrieve a proved theorem from the topmost goal, and then discard that goal from the stack.  Whatever the state of the proof , the topmost goal on the stack can be discarded by executing
=INLINEFT
⦏drop_main_goal⦎ ();
=TEX

It may be noted that
=INLINEFT
set_goal
=TEX
{} is equivalent to
=INLINEFT
drop_main_goal
=TEX
{} followed by
=INLINEFT
push_goal
=TEX
.


\subsection{Working With Assumptions}

The following example introduces two new tactics.
The first of these is a general simplifying tactic called
=INLINEFT
⦏strip_tac⦎
=TEX
.   One of the effects of this tactic is to simplify the conclusion of the goal by replacing implications with assumptions.   Other effects of
=INLINEFT
⦏strip_tac⦎
=TEX
{} are described below, in section \ref{striptac}.

The second of the two new tactics is  called
=INLINEFT
⦏asm_rewrite_tac⦎
=TEX
{} which does everything that
=INLINEFT
rewrite_tac
=TEX
{} does, but in addition uses the assumptions  of the current goal  as a source of rewriting  equations, as well as any explicitly given as an argument, and the default equations of the built-in theories.   Although
=INLINEFT
asm_rewrite_tac
=TEX
{}  does everything that
=INLINEFT
rewrite_tac
=TEX
{} does, there is a purpose in retaining the two as separately available tactics, in that a greater degree of control is provided over which equations are used for rewriting on any occasion.

To illustrate:

\begin{session}
=SML
	g ⌜P = Q ⇒ P x = Q x⌝;
=GFT
	Now 1 goal on the main goal stack

	(* *** Goal "" *** *)

	(* ?⊢ *)  ⌜P = Q ⇒ P x = Q x⌝
=SML
	a strip_tac;
=GFT
	Tactic produced 1 subgoal:

	(* *** Goal "" *** *)

	(*  1 *)  ⌜P = Q⌝

	(* ?⊢ *)  ⌜P x = Q x⌝
=TEX
\end{session}

Note that the goal is now displayed as a  list of numbered assumptions followed by the conclusion.  Here there is only one assumption, number 1.  To continue:

\begin{session}
=SML
	a (asm_rewrite_tac []);
=GFT
	Tactic produced 0 subgoals:
	Current and main goal achieved
=TEX
\end{session}


\section{Tacticals}
\label{tacticals}

It is possible to do in one step the above proof by induction, by using a compound
tactic built with the {\it tactical\/}\footnote{This usage was introduced by Robin
Milner: `tactical' is to `tactic` as `functional' is to `function'.} called
=INLINEFT
⦏THEN⦎
=TEX
.

Tacticals are higher order operations for combining tactics. Thus a tactical is an \mela\ function that returns a tactic (or tactics) as result.
Tacticals may take various parameters; this is reflected in the various
\mela\ types that the built-in tacticals have. Some important tacticals in  the \Product\ system are listed below.




\subsection{The Tactical $THEN$}

In the example above the tactic $induction\_tac$ was applied first.
Then the tactic,
=INLINEFT
rewrite_tac []
=TEX
{} was applied to all (that is, both) the resulting subgoals.

If $T_1$ and $T_2$ are tactics,
then the \mela\ expression
=INLINEFT
T⋎1 THEN T⋎2
=TEX
{} evaluates to a tactic
which first applies $T_1$ and then applies $T_2$ to all the subgoals produced by
$T_1$.   The type of
=INLINEFT
THEN
=TEX
{} is
=INLINEFT
TACTIC * TACTIC -> TACTIC
=TEX
.


To illustrate, the previous example will be done again with a one-step proof. (From now on the proof-sessions will be shown just in essentials, that is,  omitting some of the annotations provided by the system.)

\setcounter{sessioncount}{1}


\begin{session}
=SML
	g ⌜(m + 0) = m⌝;
=GFT
	(* ?⊢ *)  ⌜m + 0 = m⌝
=SML
	a ((induction_tac ⌜m:ℕ⌝) THEN  (rewrite_tac [ ]));
=GFT
	Current and main goal achieved
=TEX
\end{session}


This is typical: it is common to use a single tactic for several goals. A tactical similar to
=INLINEFT
THEN
=TEX
{} is
=INLINEFT
⦏THEN_LIST⦎
=TEX
. Whereas
=INLINEFT
THEN
=TEX
{} applies the same tactic to all resulting subgoals,
=INLINEFT
⦏THEN_LIST⦎
=TEX
{} applies the members of a list of tactics, taken in order, to corresponding subgoals.


=IGN
perhaps examples here
=TEX

\subsection{The Tactical $REPEAT$}

If
=INLINEFT
T
=TEX
{} is a
tactic then
=INLINEFT
⦏REPEAT⦎ T
=TEX
{} is a tactic which repeatedly applies
=INLINEFT
T
=TEX
{} until it fails.
The type of
=INLINEFT
REPEAT
=TEX
is
=INLINEFT
TACTIC -> TACTIC
=TEX
.  This can be illustrated in conjunction with
=INLINEFT
∀_tac
=TEX
, which is specified by:


\begin{center}
\begin{tabular}{c} \\
$∀x⦁t[x]$
\\ \hline \hline
$t[x']$
\\
\end{tabular}
\end{center}


where $x'$ is a variant of $x$
not free in the goal or the assumptions.

=INLINEFT
∀_tac
=TEX
{} strips off one universal quantifier;
=INLINEFT
REPEAT ∀_tac
=TEX
{} strips off all  universal quantifiers:

\begin{session}

=SML
      g ⌜ ∀x y z⦁ (x + (y + z)) = ((x + y) + z ) ⌝;

=GFT
      (* ?⊢ *)  ⌜∀ x y z⦁ x + y + z = (x + y) + z⌝

=SML
      a ∀_tac;
=GFT

      (* ?⊢ *)  ⌜∀ y z⦁ x + y + z = (x + y) + z⌝

=SML
      a (REPEAT ∀_tac );
=GFT
      (* ?⊢ *)  ⌜x + y + z = (x + y) + z⌝
=TEX
\end{session}




\cleardoublepage
\chapter{FURTHER TACTICS}

This section describes some of the tactics built-in to the \Product\ system in addition to those described above.  This section is not meant to provide complete coverage of the available tactics,
but rather to acquaint the reader with more of the effects to be achieved in transforming goals,and some tactics to achieve those  effects.   There are many more available tactics, and variations of tactics,  than are covered here.
.

\section{Simplifying the Goal} \label{striptac}

An important tactic is that which `strips' or simplifies a goal.  The tactic
=INLINEFT
strip_tac
=TEX
{} which has already been mentioned,  performs a variety of simplifications, and is often usefully applied at the outset of  embarking on a proof.  The simplifications achieved by
=INLINEFT
strip_tac
=TEX
{} include the following:
\begin{itemize}
\item moving the antecedent of an implication from the conclusion to the assumptions of the goal:
\item proving tautologies
\item removing leading universal quantifiers
\item using, where possible relevant, assumptions in the assumption-list
\end{itemize}

\begin{session}
=SML
      g ⌜(P 3) ⇒ ∀x⦁  x = 3 ⇒ P x⌝;
=GFT
      (* ?⊢ *)  ⌜P 3 ⇒ (∀ x⦁ x = 3 ⇒ P x)⌝

=SML
      a strip_tac;
=GFT
      (*  1 *)  ⌜P 3⌝

      (* ?⊢ *)  ⌜∀ x⦁ x = 3 ⇒ P x⌝
=SML
      a strip_tac;
=GFT
      (*  1 *)  ⌜P 3⌝

      (* ?⊢ *)  ⌜x = 3 ⇒ P x⌝
=SML
      a strip_tac;
=GFT
      (*  2 *)  ⌜P 3⌝
      (*  1 *)  ⌜x = 3⌝

      (* ?⊢ *)  ⌜P x⌝
=GFT SML
      a strip_tac;
=GFT
      Exception-
         Fail
            * There is no stripping technique for ⌜P x⌝ in the current proof
             context [strip_tac.28003] * raised

=SML
       a (asm_rewrite_tac [ ]);
=GFT
      Current and main goal achieved
=TEX
\end{session}

The foregoing session showed 4 successive applications of
=INLINEFT
strip_tac
=TEX
{} of which the first three each had an effect and the fourth failed, leaving a goal amenable to
=INLINEFT
asm_rewrite_tac
=TEX
.  With the knowledge provided by hindsight, we can see that a single compound tactic to achieve this goal would be to repeat
=INLINEFT
strip_tac
=TEX
{} until failure, and then apply
=INLINEFT
asm_rewrite_tac
=TEX
, thus:

\begin{session}
=SML
      g ⌜(P 3) ⇒ ∀x⦁  x = 3 ⇒ P x⌝;
=GFT
      (* ?⊢ *)  ⌜P 3 ⇒ (∀ x⦁ x = 3 ⇒ P x)⌝

=SML
      a ((REPEAT strip_tac)  THEN (asm_rewrite_tac [ ]));
=GFT
      Current and main goal achieved
=TEX
\end{session}

Although this particular example is specific to the goal, nevertheless
=INLINEFT
(REPEAT strip_tac)
=TEX
{} is often useful as an opening gambit.


The tactic
=INLINEFT
strip_tac
=TEX
{} reduces the complexity in the conclusion of the goal, but does nothing to simplify the assumptions.  In order to give
=INLINEFT
strip_tac
=TEX
{}  as much as possible to work on, it may be useful  in the early stage of a proof to move complexity from the assumptions into the conclusion.  A tactic,
=INLINEFT
all_asm_ante_tac
=TEX
, is available to achieve this effect.  In the following example,
=INLINEFT
strip_tac
=TEX
{} is ineffective on a goal with such a simple conclusion(
=INLINEFT
U = V
=TEX
), but moving the assumptions into the conclusion with
=INLINEFT
all_asm_ante_tac
=TEX
{} will make the conclusion amenable to
=INLINEFT
(REPEAT strip_tac)
=TEX
.
\begin{session}

=SML
      set_goal([⌜P=Q⌝, ⌜¬ P = Q⌝],  ⌜U = V⌝);
=GFT
      (*  2 *)  ⌜¬ P = Q⌝
      (*  1 *)  ⌜P = Q⌝

      (* ?⊢ *)  ⌜U = V⌝

=SML
      a all_asm_ante_tac;
=GFT
      (* ?⊢ *)  ⌜¬ P = Q ⇒ P = Q ⇒ U = V⌝

=SML
      a (REPEAT strip_tac);
=GFT
      Current and main goal achieved
=TEX
\end{session}

In this example, the conclusion of the final goal is in fact a tautology, so it would be amenable to other tactics, notably
=INLINEFT
⦏taut_tac⦎
=TEX
.
\begin{session}
=SML
      set_goal([⌜P=Q⌝, ⌜¬ P = Q⌝],  ⌜U = V⌝);
=GFT
      (*  2 *)  ⌜¬ P = Q⌝
      (*  1 *)  ⌜P = Q⌝

      (* ?⊢ *)  ⌜U = V⌝

=SML
      a (all_asm_ante_tac THEN taut_tac);
=GFT
      Current and main goal achieved
=TEX
\end{session}

\section{Specializing the Assumptions}

Consider the following:
\begin{session}
=SML
      g ⌜(∀x⦁P x) ⇒ P y⌝;
=GFT
      (* ?⊢ *)  ⌜(∀ x⦁ P x) ⇒ P y⌝

=SML
      a (REPEAT strip_tac);
=GFT
      (*  1 *)  ⌜∀ x⦁ P x⌝

      (* ?⊢ *)  ⌜P y⌝
=TEX
\end{session}

Here there is a universally-quantified assumption of which the conclusion is an instance.  There is an applicable tactic, called
=INLINEFT
⦏spec_nth_asm_tac⦎
=TEX
{} which takes two arguments:
\begin{itemize}
\item the assumption-number of the  relevant universal assumption (in this case, 1)
\item  a term in which to instantiate  the universal, so as to yield the conclusion. In this case the appropriate term would be
=INLINEFT
⌜y⌝
=TEX
.
\end{itemize}

\begin{session}
=SML
      a (spec_nth_asm_tac 1 ⌜y⌝);
=GFT
      Current and main goal achieved.
=TEX
\end{session}

If specializing the universal is not sufficient to achieve the goal, the result is  simply to strip the new specialized assumption into the list of assumptions.
This in itself may be a useful step towards achieving the goal, as the following example is contrived to show.
\begin{session}
=SML
      g ⌜ (R = Q ∧  (P y) ∧ ∀x⦁ P x  ⇒ Q x) ⇒ R y⌝;
=GFT
      (* ?⊢ *)  ⌜R = Q ∧ P y ∧ (∀ x⦁ P x ⇒ Q x) ⇒ R y⌝

=SML
      a (REPEAT strip_tac);
=GFT
      (*  3 *)  ⌜R = Q⌝
      (*  2 *)  ⌜P y⌝
      (*  1 *)  ⌜∀ x⦁ P x ⇒ Q x⌝

      (* ?⊢ *)  ⌜R y⌝

=SML
      a (spec_nth_asm_tac 1 ⌜y⌝);
=GFT
      (*  4 *)  ⌜R = Q⌝
      (*  3 *)  ⌜P y⌝
      (*  2 *)  ⌜∀ x⦁ P x ⇒ Q x⌝
      (*  1 *)  ⌜Q y⌝

      (* ?⊢ *)  ⌜R y⌝

=SML
      a (asm_rewrite_tac [ ]);
=GFT
      Current and main goal achieved
=TEX
\end{session}

\section{Existentially Quantified Goals}

Consider the case when the conclusion of the goal is of the form
=INLINEFT
∃x⦁ P x
=TEX
.  It will commonly be the case that propositions of this form are achievable by producing a witness $w$ which has property $P$, so the goal becomes one of showing that
=INLINEFT
P w
=TEX
{} is true.  The tactic
=INLINEFT
⦏∃_tac⦎
=TEX
{} has the purpose of transforming the goal in this way, from
=INLINEFT
∃x⦁ P x
=TEX
{} to
=INLINEFT
P w
=TEX
.  The following  example takes the goal of proving that there is a number less than 1, and the required witness will be the number 0.

\begin{session}
=SML
      g ⌜∃x⦁x < 1⌝;
=GFT
      (* ?⊢ *)  ⌜∃ x⦁ x < 1⌝

=SML
      a (∃_tac ⌜0⌝);
=GFT
      (* ?⊢ *)  ⌜0 < 1⌝
=TEX
\end{session}

This tactic has had the expected effect.   By inspecting the listing of the theory
=INLINEFT
⦏ℕ⦎
=TEX
{} we see that a relevant fact,  that is,
=INLINEFT
0 < 1
=TEX
, is obtainable from the theorem
=INLINEFT
⦏less_clauses⦎
=TEX
.  For the purpose of rewriting, the `fact'
=INLINEFT
0 < 1
=TEX
{} can be understood as the equation
=INLINEFT
0 < 1 = T
=TEX
. Thus it will be sufficient to rewrite with :
=INLINEFT
less_clauses
=TEX
. (Rewriting with an empty list of equations would also work, picking up
 =INLINEFT
0 < 1
=TEX
{}  by default.)

\begin{session}

=SML
      a (rewrite_tac [less_clauses]);
=GFT
      Current and main goal achieved.

=TEX
\end{session}

\section{Contradiction and Resolution}
In this section some further tactics are introduced by  showing some different approaches to the proof of
=INLINEFT
∃x⦁x < 1
=TEX

Firstly, we could try a proof by contradiction: if the conclusion is true then its negation should lead to a falsehood.  A tactic to apply is
=INLINEFT
⦏contr_tac⦎
=TEX
.

\begin{session}
=SML
      g ⌜∃x⦁x < 1⌝;
=GFT
      (* ?⊢ *)  ⌜∃ x⦁ x < 1⌝

=SML
      a contr_tac;
=GFT
      (*  1 *)  ⌜∀ x⦁ ¬ x < 1⌝

      (* ?⊢ *)  ⌜F⌝
=TEX
\end{session}

Assumption 1 contradicts the fact that
=INLINEFT
0 < 1
=TEX
, which we have seen already can be established from
=INLINEFT
less_clauses
=TEX
,  and this contradiction can be {\bf resolved} to prove the goal with conclusion
=INLINEFT
F
=TEX
{} by using a tactic called
=INLINEFT
⦏Resolution.basic_res_tac1⦎
=TEX
.
Since the resolution process may, in some circumstances continue indefinitely, the tactic takes an argument which is a number limiting the amount of processing.
 For this purpose a value of, say, 5, ought to be ample.   The second argument of the tactic is a list of theorems to be resolved  with the assumptions of the goal.



We use
=INLINEFT
less_clauses
=TEX
{} as a suitable list.


\begin{session}
=SML
      a (Resolution.basic_res_tac1 5 [less_clauses]);
=GFT
      Current and main goal achieved
=TEX
\end{session}

We saw above that
=INLINEFT
Resolution.basic_res_tac1
=TEX
{} was appropriate with a goal of
=INLINEFT
F
=TEX
{} and a contradiction exploitable.  A variation of this tactic will in effect first apply
=INLINEFT
contr_tac
=TEX
{}, so that the proof above can be performed in one step:

\begin{session}
=SML
      g ⌜∃x⦁x < 1⌝;
=GFT
      (* ?⊢ *)  ⌜∃ x⦁ x < 1⌝

=SML
      a (Resolution.basic_res_tac 5 [less_clauses]);
=GFT
      Current and main goal achieved
=TEX
\end{session}

Here is another example which illustrates the principle of resolution.  It uses another resolution tactic called
=INLINEFT
⦏asm_prove_tac⦎
=TEX

\begin{session}
=SML
	set_goal  ([⌜P ∨ Q⌝ , ⌜R ∨ ¬ Q⌝] , ⌜P ∨ R⌝);
=GFT
	(*  2 *)  ⌜R ∨ ¬ Q⌝
	(*  1 *)  ⌜P ∨ Q⌝

	(* ?⊢ *)  ⌜P ∨ R⌝
=SML
	a (asm_prove_tac [ ]);
=GFT
	Current and main goal achieved
=TEX
\end{session}



\section{Proof Contexts}

It has been mentioned that rewriting automatically uses   equations in the supplied theories as well as those  equations supplied explicitly by the user.
The choice of which equations are automatically used is in fact not fixed, but is an aspect of what is called the current
=INLINEFT
⦏proof context⦎
=TEX
.
 Other features of the system are also influenced by the proof context, notably the stripping tactics,
 automatic existence proving in constant-specification and the behaviour of  tactics such as
=INLINEFT
asm_prove_tac
=TEX
.

All the examples of this tutorial have been presented in the proof-context which is provided by default.

In this default proof-context, context-sensitive  features  of the system have to some degree been optimized around the issued theories.   There are facilities for users developing  new theories to define proof-contexts specially tailored to those new theories.  These facilities are covered in \REFERENCE\ but a further description is beyond the scope of this tutorial.

\cleardoublepage

\chapter{SPECIFICATION WITHOUT AXIOMS} \label{withoutax}

The section covers the topic of developing  theories without the introduction of axioms.
Firstly, note that the function
=INLINEFT
simple_new_defn
=TEX
{} has already been mentioned (\ref{simplenewdefn} above) as providing one means of defining constants without axioms.
However, the effects achievable by this function are limited to assigning names to terms, that is, to definitions of the form
=INLINEFT
name = value
=TEX
.
Means are now considered of specifying constants with predicates which are arbitrary, so long as consistency is maintained.

\section{Specifying Constants}
This section covers specifying new constants of existing types.   The next section will cover specifying new types and constants of new types.


The following example shows specification of a function with a predicate consisting of two equations. (Recall that the means of entering specifications in this way was described in section \ref{conspe} above.)

ⓈHOLCONST
Factorial:ℕ→ℕ
├
Factorial 0 = 1 ∧
∀ x:ℕ ⦁ Factorial (x+1) = (x+1) * Factorial x
■


Executing
=INLINEFT
print_theory "-";
=TEX
{} at this point will show a new  definition theorem for Factorial. This theorem can be retrieved by executing
\begin{itemize}
\item
=INLINEFT
⦏get_spec⦎ ⌜Factorial⌝
=TEX

\item
=INLINEFT
⦏get_defn⦎ "-" "Factorial"
=TEX

\end{itemize}

Clearly, since there are two equations, it is conceivable that there is no function which satisfies them both. In the course of entering the definition of $Factorial$, the system was able to automatically prove a theorem to the effect that the definition of $Factorial$ is consistent, that is, there exists a function with the same definition as $Factorial$.
The automatic proving facilities are oriented towards defining functions with multiple equations, such as this, and may not necessarily be able to prove existence automatically for an arbitrary predicate.
Here is an example session: a constant N is specified, very loosely, as any non-zero number:

\begin{session}
ⓈHOLCONST
N:ℕ
├
N > 0
■
\end{session}

and the system response is:

=GFT

       val it = ⊢ ConstSpec (λ N'⦁ N' > 0) N : THM
=TEX

Observe that the form of the resulting theorem is different from that of the previous example: the presence of
=INLINEFT
ConstSpec
=TEX
{} is a signal that more remains to be done.  Examining the specification of N we see that it is qualified with an assumption about the consistency of the predicate:
\begin{session}
=SML
      get_spec ⌜N⌝;

=GFT
      val it = Consistent (λ N'⦁ N' > 0) ⊢ N > 0 : THM
=TEX
\end{session}

Sooner or later this consistency-assumption should be discharged.   This is achieved  with  the functions
=INLINEFT
⦏push_consistency_goal⦎
=TEX
{} and
=INLINEFT
⦏save_consistency_thm⦎
=TEX
{} as follows:

\begin{session}
=SML
	push_consistency_goal ⌜N⌝;

=GFT
	...

	(* ?⊢ *)  ⌜∃ N'⦁ N' > 0⌝
=SML
	a (∃_tac ⌜1⌝);
	a (rewrite_tac[ ]);
=GFT
	Current and main goal achieved
=SML
	save_consistency_thm ⌜N⌝ (pop_thm ());
=TEX
\end{session}

Now the specification of N can be re-examined to see the change achieved by performing the proof: the consistency assumption has been discharged:

\begin{session}
=SML
      get_spec ⌜N⌝;

=GFT
      val it = ⊢ N > 0 : THM
=TEX
\end{session}


\section{Specifying Types}


This section covers the specification of new types.  A new type, as considered here, is defined in terms of a subset of an existing type with membership characterised by a predicate.
A simple example is the ordinal numbers: the subset of the natural numbers  which are non-zero.


The first step is to prove a theorem that such a subset is non-empty.  The theorem must have the form
=INLINEFT
∃x⦁ P x
=TEX
{} so the goal is taken as
=INLINEFT
∃x:ℕ ⦁ (λx⦁ ¬ x = 0) x
=TEX
{} rather than
=INLINEFT
∃x:ℕ ⦁ ¬ x = 0
=TEX
.


\begin{session}
=SML
      new_theory "ordinals";
      set_goal ([ ], ⌜∃x:ℕ⦁ (λx⦁ ¬ x = 0) x⌝);
      a  ((∃_tac ⌜1⌝) THEN (rewrite_tac [ ])) ;
=GFT
      Current and main goal achieved
=TEX
\end{session}

The new type is now introduced. The function
=INLINEFT
⦏new_type_defn⦎
=TEX
{} takes three arguments:
\begin{itemize}
\item one or more names (keys) under which a defining-theorem will be stored.
\item a name for the type itself.  In this example the name is `Ordinal'.
\item The existence theorem just proved, which is currently available on the top of goal-stack and so can be retrieved by
=INLINEFT
top_thm
=TEX
{} or
=INLINEFT
pop_thm
=TEX
.
\end{itemize}


\begin{session}
=SML
      new_type_defn (["ordinal_def"], "Ordinal", [ ], pop_thm());
=GFT
      val it = ⊢ ∃ f⦁ TypeDefn (λ x⦁ ¬ x = 0) f : THM
=TEX
\end{session}

We have a new type, `Ordinal', and can construct terms with variables of that type, but so far we have only very limited means of specifying constants.


ⓈHOLCONST
VII:Ordinal
├
T
■

Even though Ordinals were specified by a predicate which characterised a subset of the numbers, we cannot simply equate an Ordinal variable with a number
because  the equality will be ill-typed -- left and right hand sides will be of different types.



=GFT HOL Const
VIII:Ordinal
├
VIII = 8
=TEX


The system response is:

=GFT
	Type error in ⌜VIII = 8⌝
	The operands of ⌜$=⌝ must have the same type
	The types inferred were:
	⌜VIII:Ordinal⌝
	⌜8:ℕ⌝
	Exception- Fail * Type error [HOL-Parser.16000] * raised
=TEX


Thus it is not the case that the new type is a subset of the parent type, but rather that there is an isomorphism between the new type and the subset of the  parent type.
If we wish to specify the values of constants of the new type with predicates which include terms of existing types, we will need functions for, in this case, :
\begin{itemize}
\item mapping numbers to ordinals.  This mapping is called `abstraction' and a suitable function A will be developed in the example. With this function terms can be written such as
=INLINEFT
VII = A 7
=TEX
.
\item mapping ordinals to numbers.  This mapping is called `representation' and a suitable function R will be developed in the example. With this function terms can be written such as
=INLINEFT
7 = R VII
=TEX
.
\end{itemize}

Defining the mappings A and R is the next task.
A theorem must be proved which asserts that the intended isomorphism can exist, that is, that there are two mappings with suitable properties.
 Here we take a `cookbook' approach, so that the following `recipe' will serve, with slight adaptations, in most cases. The  goal is in a `standard ' form;
 note the occurrence  in the goal of the characteristic predicate as
=INLINEFT
¬ n = 0
=TEX
.

The reader is asked to accept without explanation that the four tactics shown below are generally effective for proving a goal such as this.

\begin{session}
=SML
	set_goal([ ],⌜∃ A R ⦁
	      (∀ a : Ordinal ⦁ A ( R a) = a)
	      ∧
	      (∀ n : ℕ ⦁ (¬ n = 0) ⇔ (R (A n) = n))⌝);

	a (strip_asm_tac (rewrite_rule[ ]
		(simple_⇒_match_mp_rule type_lemmas_thm
		(get_defn "-" "ordinal_def"))));
	a (∃_tac ⌜abs⌝);
	a (∃_tac ⌜rep⌝);
	a (asm_rewrite_tac[ ]);
=GFT
	...
	Current and main goal achieved
=TEX
\end{session}

We now specify the constructor functions A and R as constants,  by use of the function
=INLINEFT
⦏new_spec⦎
=TEX
.  This takes three arguments:
\begin{itemize}
\item A list of keys for the defining theorem which will be produced.

\item a count of the number of constants -- 2 in this case, ( A  and  R)
\item An existence theorem for A and R, which is the one  just proved and available on the top of the goal-stack.
\end{itemize}

\begin{session}
=SML
      val ordinal_consts_def =
          new_spec(["R","A","ordinal_consts_def"],2,pop_thm());

=GFT
      val ordinal_consts_def =
        ⊢ (∀ a⦁ A (R a) = a) ∧ ∀ n⦁ ¬ n = 0 ⇔ R (A n) = n) : THM

=TEX
\end{session}
We are finally in a position to specify constants of the new type.   Note that more than one constant can be specifiedat a time.

ⓈHOLCONST
IX X :Ordinal
├
IX = A 9 ∧ X = A 10
■


The system response is:

=GFT
	val it = ⊢ IX = A 9 ∧ X = A 10 : THM
=TEX


What has been achieved is summarised in the current theory:
\begin{session}
=SML
print_theory "-";
=GFT
	=== The theory ordinals ===

	--- Parents ---

		demo

	--- Constants ---

	VII		Ordinal
	R		Ordinal → ℕ
	A		ℕ → Ordinal
	X		Ordinal
	IX		Ordinal

	--- Types ---

	Ordinal

	--- Definitions ---

	ordinal_def	⊢ ∃ f⦁ TypeDefn (λ x⦁ ¬ x = 0) f
	VII		⊢ T
	R
	A
	ordinal_consts_def
			⊢ (∀ a⦁ A (R a) = a)
			    ∧ (∀ n
			    ⦁ ¬ n = 0 ⇔ R (A n) = n)
	IX
	X		⊢ IX = A 9 ∧ X = A 10

	=== End of listing of theory ordinals ===


=TEX
\end{session}

\chapter{MOVING ON}

We hope that this tutorial provides a helpful introduction to \Product.
Depending on your interests, we would recommend {\HTUTORIAL} or {\ZTUTORIAL} as a next step.

A comprehensive reference manual to the facilities provided by {\Product}
is supplied as the \REFERENCE.
Many of these facilities are intended for use by a programmer extending the system rather than by a user developing specifications or proofs.
However, despite its length, many users find it useful to have the {\REFERENCE} on the screen for
interactive reference via its keyword-in-context index.

In response to popular demand, we conclude this document with a list of the names of some of the more commonly used tactics, rules, conversions, tacticals and conversionals.
These have been extracted from some of the proof scripts provided with the system.

\twocolumn[]

\section{Tactics}

$∨\_left\_tac\\
∨\_right\_tac\\
⇒\_tac\\
∀\_tac\\
∃\_tac\\
accept\_tac\\
all\_asm\_ante\_tac\\
ante\_tac\\
asm\_ante\_tac\\
asm\_fc\_tac\\
asm\_prove\_tac\\
asm\_rewrite\_tac\\
asm\_rewrite\_thm\_tac\\
asm\_tac\\
bc\_tac\\
bc\_thm\_tac\\
cases\_tac\\
contr\_tac\\
conv\_tac\\
fc\_tac\\
gen\_induction\_tac\\
id\_tac\\
induction\_tac\\
intro\_∀\_tac\\
lemma\_tac\\
list\_induction\_tac\\
list\_spec\_asm\_tac\\
list\_spec\_nth\_asm\_tac\\
once\_rewrite\_tac\\
once\_rewrite\_thm\_tac\\
prove\_∃\_tac\\
prove\_tac\\
pure\_asm\_rewrite\_tac\\
pure\_rewrite\_tac\\
rename\_tac\\
rewrite\_tac\\
rewrite\_thm\_tac\\
spec\_nth\_asm\_tac\\
step\_strip\_tac\\
strip\_asm\_tac\\
strip\_tac\\
swap\_asm\_concl\_tac\\
swap\_nth\_asm\_concl\_tac$

\section{Rules}

$⇒\_elim\\
∀\_elim\\
all\_∀\_elim\\
all\_∀\_intro\\
asm\_rule\\
conv\_rule\\
eq\_sym\_rule\\
list\_∧\_intro\\
list\_∀\_elim\\
list\_∀\_intro\\
pc\_rule\\
prove\_rule\\
rewrite\_rule\\
strip\_∧\_rule\\
taut\_rule$

\section{Conversions}

$eq\_sym\_conv\\
prove\_∃\_conv\\
rewrite\_conv$

\section{Conversionals}

$ONCE\_MAP\_C\\
ORELSE\_C\\
THEN\_C\\
TOP\_MAP\_C$

\section{Tacticals}

$⇒\_T\\
CASES\_T\\
DROP\_ASM\_T\\
DROP\_NTH\_ASM\_T\\
FC\_T\\
GET\_ASM\_T\\
GET\_NTH\_ASM\_T\\
INDUCTION\_T\\
LEMMA\_T\\
LIST\_DROP\_NTH\_ASM\_T\\
LIST\_GET\_NTH\_ASM\_T\\
LIST\_SPEC\_NTH\_ASM\_T\\
ORELSE\\
PC\_T\\
POP\_ASM\_T\\
THEN\\
TOP\_ASM\_T\\
TRY\_T$

\onecolumn
\chapter*{REFERENCES}
\addcontentsline{toc}{chapter}{REFERENCES}

\bibliographystyle{fmu}
\bibliography{fmu}

\twocolumn
\chapter*{INDEX}
\addcontentsline{toc}{chapter}{INDEX}
\small
\printindex

\end{document}



A simple theorem about the ordinals:

set_goal([ ], ⌜¬ VII = IX ⌝);

a (asm_tac (get_defn "-" "some_ordinals_def"));
a (asm_rewrite_tac [ ]);
a (asm_tac (get_defn "-" "ordinal_consts_def"));
a contr_tac;
a all_asm_ante_tac;
a (REPEAT strip_tac);


a (lemma_tac  ⌜¬ 7 = 0⌝);

val c =ℕ_eq_conv;
a (rewrite_tac [c  ⌜7 = 0⌝]);
a (lemma_tac  ⌜¬ 9 = 0⌝);
a (rewrite_tac [c  ⌜9 = 0⌝]);
a (spec_nth_asm_tac  4 ⌜7⌝);
a (spec_nth_asm_tac  5 ⌜9⌝);
a (lemma_tac  ⌜∀x y ⦁ x = y ⇒ R x = R y⌝);
a strip_tac;
a strip_tac;
a strip_tac;
a (asm_rewrite_tac [ ] );
a (spec_nth_asm_tac  1 ⌜ A 7⌝);
a (spec_nth_asm_tac  1 ⌜ A 9⌝);




s c r a p s

a (spec_nth_asm_tac  4 ⌜7⌝);
val u = map (get_defn "-" ) [ "A", "some_ordinals_def"];
a (rewrite_tac u);
a contr_tac;
a (lemma_tac  ⌜∀x y ⦁ x = y ⇒ R x = R y⌝);
a (lemma_tac  ⌜¬ 7 = 0⌝);


a(strip_asm_tac (rewrite_rule[ ]
	(simple_⇒_match_mp_rule type_lemmas_thm
	(get_defn "-" "k1"))));
a (∃_tac ⌜abs⌝);
a (∃_tac ⌜rep⌝);
a(asm_rewrite_tac[ ]);
val nonzero_consts_def =
new_spec(["nonzero_as_ℕ","ℕ_as_nonzero","nonzero_consts_def"],2,pop_thm());

ⓈHOLCONST
P Q : BOOL
├
T
■



set_goal ([⌜P ∨ Q⌝ , ⌜P ∨ ¬ Q⌝] , ⌜P⌝);

val br1 =  Resolution.basic_res_tac1 10 [];

a br1;

set_goal ([⌜G 3 ∨ H y⌝ , ⌜G x ∨ ¬ H 1⌝] , ⌜G 3⌝);
set_goal ([⌜G 3 ∨ Q⌝ , ⌜G x ∨ ¬ Q⌝] , ⌜G 3⌝);
set_goal ([⌜G 3 ∨ Q⌝ , ⌜G x ∨ ¬ Q⌝] , ⌜G x ⌝);
set_goal ([⌜G 3 ∨ Q⌝ , ⌜G x ∨ ¬ Q⌝] , ⌜G x  ∨ G 3⌝);





const_spec (["VII",  "IX", "some_ordinals_def"],
            [⌜VII:Ordinal, IX: Ordinal⌝],
	    ⌜VII = A 7 ∧ IX = A 9⌝);




const_spec (["Factorial", "factorial_def"],
            [⌜Factorial:ℕ→ℕ⌝],
	    ⌜Factorial 0 = 1 ∧ ∀ x:ℕ ⦁ Factorial (x+1) = (x+1) * Factorial x⌝);

set_goal ([⌜P = Q⌝ ] , ⌜P x = Q x⌝);
set_goal ([] , ⌜A ⇔ B⌝);
set_goal ([] , ⌜P = Q ⇒ P x = Q x⌝);

\section{The Tactical $THEN\_LIST$}

The tactical
=INLINEFT
THEN_LIST
=TEX
{} is useful if one wants to do different
things to different subgoals.


If $T$ is a tactic which produces $n$ subgoals and $T_1$, $\ldots$ ,
$T_n$ are tactics
then
=INLINEFT
T THEN_LIST [T⋎1,  ...  ,T⋎n]
=TEX
{} is a tactic which first applies $T$ and then
applies $T_i$ to the $i$th subgoal produced by $T$.

The type of
=INLINEFT
THEN_LIST
=TEX
{} is
=INLINEFT
TACTIC * TACTIC list -> TACTIC
=TEX

The tactical
=INLINEFT
THEN_LIST
=TEX
{} can be illustrated by doing the proof of $m+0=m$ in
one step.


\setcounter{sessioncount}{1}
\begin{session}
=GFT SML
      g ⌜(m +0) = m⌝;
=GFT
      (* ?⊢ *)  ⌜m + 0 = m⌝

=GFT SML
      a ((induction_tac ⌜m:ℕ⌝) THEN_LIST [(rewrite_tac ADD), (asm_rewrite_tac  ADD)]);
=GFT
      Tactic produced 0 subgoals:
      Current and main goal achieved
=TEX

\end{session}


The compound tactic:

=INLINEFT
      (induction_tac ⌜m:ℕ⌝) THEN_LIST [(rewrite_tac ADD), (asm_rewrite_tac ADD)]
=TEX


first applies
=INLINEFT
induction_tac ⌜m:ℕ⌝
=TEX
{} and then applies
=INLINEFT
rewrite_tac ADD
=TEX
{} to the first resulting subgoal (the basis) and
=INLINEFT
asm_rewrite_tac ADD
=TEX
{} to the second subgoal (the step).

