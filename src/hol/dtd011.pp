=IGN
********************************************************************************
dtd011.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
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

\def\Title{Detailed Design of Antiunification}

\def\AbstractText{This document gives the detailed design of the module containing a function to compute the antiunifier of a pair of types.}

\def\Reference{DS/FMU/IED/DTD011}

\def\Author{R.D. Arthan}


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
%% LaTeX2e port: \def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design of Antiunification}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD011}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 2.3 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $%
%% LaTeX2e port: }}  %% Mandatory field (with sensible default)
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & HAT Manager}
%% LaTeX2e port: \TPPabstract{
%% LaTeX2e port: This document gives the detailed design of the module containing
%% LaTeX2e port: a function to compute the antiunifier of a pair of types.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library \\ R.D. Arthan\\ D.J. King}}
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
\subsection{Contents list}
\tableofcontents
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item[Issue 1.1 (1991/04/15)-1.5 (1991/08/20) (15 April - 20 August 1991)]
Initial drafts.
\item[Issue 2.1 (1991/08/20) (\FormatDate{91/08/20%
})] First approved issue after deskcheck ID0034.

\item[Issue 2.2 (\FormatDate{92/01/20})] Updated to use new fonts.

\item[Issue 2.3 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.4 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design of the
antiunification module of the ICL HOL system as called
for in \cite{DS/FMU/IED/HLD008}.
\subsection{Introduction}
\subsubsection{Background and Purpose}
Type Inference for ICL HOL, see \cite{DS/FMU/IED/HLD008,DS/FMU/IED/DTD016},
requires a function to compute the antiunifier of a pair of
HOL types (where the antiunifier of a set of types is the least general
type which has every type in the set as an instance).
The antiunification algorithm is used to support type inference
in the presence of overloaded names.

This document gives the detailed design of such a function and gives
an overview of the algorithm it uses.
Note that the type inferrer itself does not use this function directly,
however, its correct operation depends on its use in the symbol table
function for declaring aliases (see \cite{DS/FMU/IED/DTD020}).



\subsubsection{Interface}
The document defines a signature $Antiunify$.
\subsubsection{Dependencies}
This document depends on \cite{DS/FMU/IED/DTD003}.
\subsubsection{Possible Enhancements}
It is not currently expected that the algorithm described here will
be used in performance critical applications. Performance improvements
at the algorithm level may well be possible.
\subsubsection{Deficiencies}\label{Deficiencies}
None known.

\section{ALGORITHM}
\subsection{The Problem}
If $\tau_1$ and $\tau_2$ are HOL types, let us write
$\tau_1\preceq\tau_2$, if $\tau_2$ is an instance of $\tau_1$.
Slightly more formally, $\tau_1\preceq\tau_2$, if for some
function $\phi$ assigning a type $\phi(\alpha)$ to each
type variable $\alpha$, we have $\hat\phi(\tau_1) = \tau_2$,
where $\hat\phi(\tau_1)$ is the resulting of replacing each
occurrence in $\tau_1$ of a type variable $\alpha$ by
$\phi(\alpha)$. We call such a function, $\phi$, a {\em substitution}.
For example, $'a\preceq\tau$ for any type $\tau$ and
$'a\rightarrow'b\preceq\tau_1\rightarrow\tau_2$ for any
types $\tau_1$ and $\tau_2$.
Informally, we often say that $\tau_1$ is {\em no less general} than $\tau_2$
if $\tau_1\preceq\tau_2$, and use terms such as {\em more general}
in an analogous way.

We write $\tau_1\simeq\tau_2$, if $\tau_1\preceq\tau_2$ and
$\tau_2\preceq\tau_1$.  Clearly $\simeq$ is an equivalence relation
on the set of all HOL types. The equivalence classes with respect
to $\simeq$ containing a given type $\tau$ is the set of all types
obtainable from $\tau$ by substitutions which are injections and
whose range contains only type variables.

We say that $\tau_1$ and $\tau_2$ can
be {\em unified} if there is a type $\tau$ such that
$\tau_1\preceq\tau$ and $\tau_2\preceq\tau$. There is a famous
algorithm which given two types, $\tau_1$ and $\tau_2$ say,
determines whether they can be unified
and, if so, returns a most general unifier for the two types,
$\tau$ say, which means that $\tau_1\preceq\tau$ and $\tau_2\preceq\tau$
and that $\tau\preceq\tau'$ for any type $\tau'$ for which
$\tau_1\preceq\tau'$ and $\tau_2\preceq\tau'$.
(This algorithm is used in type inference for HOL. A textbook
reference is \cite{PeytonJones86}).

In this document we are concerned with the dual problem to unification.
We say that $\tau$ is an antiunifier of $\tau_1$ and $\tau_2$ if
$\tau\preceq\tau_1$ and $\tau\preceq\tau_2$.
Given the fact, implicit in the previous paragraph, that any finite
set of types which has a unifier has a most general unifier it is
easy to see that any pair of types has an antiunifier,
since, given a pair of types, $\tau_1$ and $\tau_2$ say, we can consider
the set, $T$ say, of equivalence classes under $\simeq$ of
types which are antiunifiers of  $\tau_1$ and $\tau_2$;
$T$ is non-empty since
for any type variable, $'a$ say, $'a\preceq\tau$
for any type $\tau$, so that the equivalence class containing
$'a$ is in $T$; moreover, $T$ is finite, since for any type $\tau$
there are most finitely many equivalence classes of types which
are no more general than $\tau$ (since if $\tau_1$ is less general
than $\tau_2$, $\tau_1$ is shorter than $\tau_2$); it follows
that if we pick a representative from each equivalence class
in $T$ to form a set of types, $T'$ say, then $T'$ is a finite
non-empty set of types with a unifier (e.g. $\tau_1$), so
$T'$ has a most general unifier which may easily be checked to be the
desired least general antiunifier of $\tau_1$ and $\tau_2$

We want an algorithm which will find the least general antiunifiers
whose existence was demonstrated in the previous paragraph.
The algorithm has an auxiliary input
which is used in recursive applications of the algorithm to record
the context in which the recursive application is made.
The algorithm assumes we have a potentially infinite supply of what we
will call {\em fresh} type variable names which are distinct from any
such names which appear in the problem data.

For the purpose of describing the algorithm, let us say that a pair
of types, $(\tau, \tau')$, is {\em easy} if
$\tau$ and $\tau'$ are not formed by applying the same constructor
to (possibly different) non-empty argument lists of the same length.
Thus, for example, $('a \rightarrow 'b, 'x \rightarrow 'y)$
is not easy whereas $('a \rightarrow 'b, 'a)$ is.
Using this terminology the algorithm is as follows:

\begin{description}
\item[ Inputs:] A pair of types, $(\tau_1, \tau_2)$ and a finite function
$f$ from type variables to pairs of types.

\item[ Outputs:] A type $\sigma$ and a finite function $g$
from type variables to pairs of types such that (i)
$f\subseteq g$ and (ii) the substitutions $\phi_1$ and $\phi_2$ which
send a type variable $\alpha$ to $\sigma$ and $\sigma'$
(respectively) if $\alpha\in dom (f)$ and $f(\alpha)=(\sigma, \sigma')$
and send $\alpha$ to $\alpha$ otherwise, have the property that
$\hat\phi_1(\sigma)=\tau_1$ and $\hat\phi_2(\sigma)=\tau_2$.

\item[ Method:]

\begin{enumerate}
\item
If $(\tau_1, \tau_2)$ are easy
then we proceed as follows:
    \begin{enumerate}
    \item If $\tau_1 = \tau_2$ or if for some type variable $\beta$, $f(\beta) = (\tau_1, \tau_2)$,
    then we return with $g = f$ and $\sigma = \beta$.
    \item Otherwise, we pick a fresh type variable $\beta$ and
     return with $g = f\cup\{(\beta, (\tau_1, \tau_2))\}$
     and $\sigma = \beta$.
    \end{enumerate}
\item Otherwise $\tau_1$ and $\tau_2$ have the form
$c(\sigma_1^1, \sigma_1^2, \ldots, \sigma_1^k)$ and
$c(\sigma_2^1, \sigma_2^2, \ldots, \sigma_2^k)$ for some
constructor $c$.
We apply the algorithm to the pair $(\sigma_1^1, \sigma_2^1)$
and the function $f$ to give $\sigma^1$ and $g^1$ say.
We now apply the algorithm to the pair $(\sigma_1^2, \sigma_2^2)$
and the function $g^1$ to give $\sigma^2$ and $g^2$ say.
Continuing in this way, we
get a sequence of types $\sigma^1, \sigma^2, \ldots, \sigma^k$
and a sequence of functions $g^1, g^2, \ldots,g^k$.
We return with $g = g^k$ and
$\sigma=c(\sigma^1, \sigma^2, \ldots, \sigma^k)$.
\end{enumerate}
\end{description}

If we write $au(\tau_1, \tau_2, f)$ for the result returned by
the above algorithm when applied to
the inputs $(\tau_1, \tau_2)$ and
$f$, then $au(\tau_1, \tau_2, \emptyset)$ is
the desired least general antiunifier of $\tau_1$ and
$\tau_2$.
This may be demonstrated by proving by induction over the structure
of $\tau_1$ that $au(\tau_1, \tau_2, \emptyset)$ is an antiunifier
of $\tau_1$ and $\tau_2$ and then showing by induction over
the structure of $\sigma$ that if
$\sigma\preceq\tau_1$ and $\sigma\preceq\tau_2$
then $\sigma\preceq au(\tau_1, \tau_2, \emptyset)$.

\section{THE STRUCTURE $Antiunify$}
=DOC
signature ⦏Antiunify⦎ = sig
=DESCRIBE
This is the signature of the structure $Antiunify$ which
contains a function to compute the antiunifier of a pair of
types.
=USES
This is used in the implementation of the aliasing facility.
=ENDDOC
=DOC
	val ⦏antiunify⦎ : (TYPE * TYPE) -> TYPE
=DESCRIBE
The antiunifier of a set of one or more types is the least general
type which has each type in the set as an instance. Given a pair
of types, $(\tau_1, \tau_2)$, $antiunify\,(\tau_1, \tau_2)$ is the
antifunifier of $\{\tau_1, \tau_2\}$.
=USES
This is used in the implementation of the aliasing facility.
=ENDDOC

=SML
end; (* of signature Antiunify *)
=TEX
\section{TEST POLICY}
The tests should follow the standards and guidelines laid down in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex
\end{document}



