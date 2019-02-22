=IGN
********************************************************************************
mdt512.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% mdt512.doc    ℤ $Date: 2006/03/28 11:22:56 $ $Revision: 1.13 $ $RCSfile: mdt512.doc,v $
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,11pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{latexsym}
\usepackage{epsf}
\makeindex

%%%%% YOU WILL WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{Module Tests: Compliance Notation Reader/Writer}

\def\AbstractText{This document comprises test cases for testing the DAZ Compliance Notation Reader/Writer as described in the document ISS/HAT/DAZ/MDT512.}

\def\Reference{ISS/HAT/DAZ/MDT512}

\def\Author{A.C. Hayward}


\def\EMail{C/O {\tt rda@lemma-one.com}}

\def\Phone{C/O +44 7497 030682}

\def\Abstract{\begin{center}{\bf Abstract}\par\parbox{0.7\hsize}
{\small \AbstractText}
\end{center}}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%% LaTeX2e port: =TEX
%% LaTeX2e port: % TQtemplate.tex
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}    %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Module Tests: Compliance Notation Reader/Writer}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/MDT512}    %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.13 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}    %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/03/28 11:22:56 $
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}            %% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.C.~Hayward & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{D.J.~King & WIN01\\A.C.~Hayward & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{This document comprises test cases for testing the DAZ Compliance Notation Reader/Writer as described in the document ISS/HAT/DAZ/MDT512.}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library \\ A.C. Hayward\\ D.J. King}}
%% LaTeX2e port: 
%% LaTeX2e port: %\TPPclass{CLASSIFICATION}
%% LaTeX2e port: %\def\TPPheadlhs{}
%% LaTeX2e port: %\def\TPPheadcentre{}
%% LaTeX2e port: %def\TPPheadrhs{}
%% LaTeX2e port: %\def\TPPfootlhs{}
%% LaTeX2e port: %\def\TPPfootcentre{}
%% LaTeX2e port: %\def\TPPfootrhs{}
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \TPPsetsizes
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{centering}
%% LaTeX2e port: 
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: 
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

\pagebreak
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{daz,fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issues 1.1 (1994/07/18), 1.2 (1994/07/19) \FormatDate{94/07/18}] First versions.
\item[Issue 1.3 (1994/07/19), \FormatDate{94/07/19}] Working properly.
\item[Issues 1.4 (1994/07/20), 1.5 (1994/07/21) \FormatDate{94/07/20}] Tidied up format of tests.
\item[Issues 1.5 (1994/07/21), 1.6 (1995/01/03)] Corrected for enhancements.
\item[Issue 1.7 (1995/11/07)] `Q' in strings.
\item[Issue 1.8 (2002/03/27)] Allowed for possibility of adjacent Text items in input lists.
\item[Issue 1.10 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.11 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.12 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.13 (2006/03/28)] Allowed for automated state management.
\item[Issue 1.14 (2009/02/15)] Allowed for changes to handling of white space
at beginning of named quotations.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\pagebreak
\section{GENERAL}
\subsection{Scope}

This document comprises test cases and test code/data for testing the DAZ Compliance Notation Reader/Writer specified in \cite{ISS/HAT/DAZ/DTD512}.

\subsection{Introduction}

\subsubsection{Background and Purpose}

This document is intended to supply module tests for the DAZ Compliance Notation Reader/Writer as defined in \cite{ISS/HAT/DAZ/DTD512} and implemented in \cite{ISS/HAT/DAZ/IMP512}. The tests are intended to meet the requirements for tests identified in the quality plan \cite{ISS/HAT/DAZ/PLN003}.

\subsubsection{Dependencies}

These tests depend on the test harness as implemented in DS/FMU/IED/IMP013, and its corresponding detailed design document, DS/FMU/IED/DTD013.

\subsubsection{Possible Enhancements}

None known.

\subsubsection{Deficiencies}

There are no known deficiencies.

\section{INITIALISATION}
First we need to load the test harness and initialise it.

=SML
use_file "dtd013";
use_file "imp013";
init_mt_results();
=TEX

\section{PREAMBLE}
Set up the theory database as necessary.

=SML
open_theory "z_library";
force_delete_theory "mdt512" handle (_) => ();
new_theory "mdt512";
open Lex;
=TEX

A function to compare two objects of Lex.INPUT list.  This is the type returned by the basic Compliance Notation Reader Writer.

=SML
local
    fun comp_input (Char x, Char y) = if x=y then true else false
    |   comp_input (Error x, Error y) = if x=y then true else false
    |   comp_input (Separator x, Separator y) = if x=y then true else false
    |   comp_input (String x, String y) = if x=y then true else false
    |   comp_input (Term x, Term y) = if x=$y then true else false
    |   comp_input (Text x, Text y) = if x=y then true else false
    |   comp_input (Type x, Type y) = if x=:y then true else false
    |   comp_input (_ : INPUT, _ : INPUT) = false;
in
    fun comp_input_list ([] : INPUT list, [] : INPUT list) = true
    |   comp_input_list (xs : INPUT list, [] : INPUT list) = false
    |   comp_input_list ([] : INPUT list, ys : INPUT list) = false
    |   comp_input_list (Text a::Text b :: xs : INPUT list, ys : INPUT list) = comp_input_list (Text(a^b)::xs, ys)
    |   comp_input_list (xs : INPUT list, Text a :: Text b::ys : INPUT list) = comp_input_list (xs, Text(a^b)::ys)
    |   comp_input_list (x::xs : INPUT list, y::ys : INPUT list) =
        if (comp_input (x,y)) = false
        then false
        else comp_input_list (xs,ys);
end (* local ... in *);
=TEX

Set up the Compilance Notation Reader Writer.  This is just a basic reader,
giving us a list of strings.

=SML
fun cn_recogniser
    (start:string, lang:string, value:Lex.INPUT list, finish:string) = (
    if ReaderWriterSupport.PrettyNames.is_same_symbol(start, "Ⓢ")
        andalso ReaderWriterSupport.PrettyNames.is_same_symbol(finish, "■")
        andalso (lang = "CN")
    then
        value
    else
        fail "cn_recogniser" 504010
            [fn () => start, fn () => lang, fn () => finish]
);
=TEX

\section{Testing the Compilance Notation Reader/Writer}

\subsection{Keywords and Percent symbols}

Keywords inside a string should be ignored and not converted to an extended character.  i.e. Strings should be kept verbatim.  However keywords not in a string should be converted to extended characters as usual.

=SMLPLAIN
local
    val t1 = ⓈCN "∀ ⦁" ■
    val t2 = ⓈCN ∀ ⦁ ■
    val a1 = [Text "", String "%%forall%% %%spot%%", Text " "] : INPUT list;
    val a2 = [Text "∀ ⦁ "] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("Keyword.1", (fn x => x), t1, a1),
        ("Keyword.2", (fn x => x), t2, a2)];
end;
=TEX

\subsection{Quotation symbols}

To represent quotation symbol in a string we use two adjacent quotation symbols.

=SML
local
    val t1 = ⓈCN """" ■
    val t2 = ⓈCN """Hello, World""" ■
    val a1 = [Text "", String "\"", Text " "] : INPUT list;
    val a2 = [Text "", String "\"Hello, World\"", Text " "] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("Quotation.1", (fn x => x), t1, a1),
        ("Quotation.2", (fn x => x), t2, a2)];
end;
=TEX

\subsection{Backslash symbols}

Both inside and outside strings a backslash character is converted to a double backslash character because of its use as a string escape symbol.

=SML
local
    val t1 = ⓈCN \ \\ \\\ ■
    val t2 = ⓈCN "\ \\ \\\" ■
    val a1 = [Text "\\ \\\\ \\\\\\ "] : INPUT list;
    val a2 = [Text "", String "\\ \\\\ \\\\\\", Text " "] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("Backslash.1", (fn x => x), t1, a1),
        ("Backslash.2", (fn x => x), t2, a2)];
end;
=TEX

\subsection{Strings}

In SPARK a string is defined as a sequence of graphic characters (possibly none) enclosed between two quotation characters.

=SMLPLAIN
local
    val t1 = ⓈCN "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" ■
    val t2 = ⓈCN "0 1 2 3 4 5 6 7 8 9" ■
    val t3 = ⓈCN """ # & ' ( ) * + , - . / : ; < = > _ |" ■
    val t4 = ⓈCN " " ■
    val t5 = ⓈCN "a b c d e f g h i j k l m n o p q r s t u v w x y z" ■
    val t6 = ⓈCN "! $ % ? @ [ \ ] ^ ` { } ~" ■
    val t7 = ⓈCN "" ■
    val a1 = [Text "",
              String "A B C D E F G H I J K L M N O P \081 R S T U V W X Y Z",
              Text " "] : INPUT list;
    val a2 = [Text "", String "0 1 2 3 4 5 6 7 8 9", Text " "] : INPUT list;
    val a3 = [Text "", String "\" # & ' ( ) * + , - . / : ; < = > _ |",
              Text " "] : INPUT list;
    val a4 = [Text "", String " ", Text " "] : INPUT list;
    val a5 = [Text "",
              String "a b c d e f g h i j k l m n o p q r s t u v w x y z",
              Text " "] : INPUT list;
    val a6 = [Text "", String "! $ %% ? @ [ \\ ] ^ ` { } ~",
              Text " "] : INPUT list;
    val a7 = [Text "", String "", Text " "] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("Strings.1", (fn x => x), t1, a1),
        ("Strings.2", (fn x => x), t2, a2),
        ("Strings.3", (fn x => x), t3, a3),
        ("Strings.4", (fn x => x), t4, a4),
        ("Strings.5", (fn x => x), t5, a5),
        ("Strings.6", (fn x => x), t6, a6),
        ("Strings.7", (fn x => x), t7, a7)];
end;
=TEX

\subsection{Q's}

The character Q is used internally when representing the extended characters.  We check that nothing odd happens when various combinations of the character Q are presented at the input.

=SML
local
    val t1 = ⓈCN Q QQ QQQ QQQQ ■
    val t2 = ⓈCN "Q QQ QQQ QQQQ" ■
    val a1 = [Text "Q QQ QQQ QQQQ "] : INPUT list;
    val a2 = [Text "", String "\081 \081\081 \081\081\081 \081\081\081\081", Text " "] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("Q.1", (fn x => x), t1, a1),
        ("Q.2", (fn x => x), t2, a2)];
end;
=TEX

\subsection{Comments}

A comment starts with two adjacent hyphens and extends to the end of the line.  The presence or absence of comments has no influence on whether the program is legal or illegal, nor on the effect of the program.  Comments are passed on by the Compliance Notation reader writer.

=SML
local
    val t1 = ⓈCN     -- this is a comment
 ■
    val t2 = ⓈCN "-- not a comment"
 ■
    val a1 = [Text "-- this is a comment\n "] : INPUT list;
    val a2 = [Text "", String "-- not a comment", Text "\n "] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("Comments.1", (fn x => x), t1, a1),
        ("Comments.2", (fn x => x), t2, a2)];
end;
=TEX

\subsection{White Space}

The Compliance Notation reader writer preserves white space fairly carefully.

=SML
local
    val t1 = ⓈCN
	a	b
c■
    val t2 = ⓈCN ■
    val a1 = [Text "\ta\tb\nc"] : INPUT list;
    val a2 = [Text ""] : INPUT list;
in
    val _ = store_mt_results (mt_runf comp_input_list) [
        ("WhiteSpace.1", (fn x => x), t1, a1),
        ("WhiteSpace.2", (fn x => x), t2, a2)];
end;
=TEX

\section{SUMMARY OF RESULTS}

=SML
diag_line(summarize_mt_results());
=TEX

\end{document}
