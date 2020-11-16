=IGN
********************************************************************************
mdt118.doc: this file is part of the PPDev system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex
\def\Slrp{{\bf SLRP}}
\def\Hide#1{\relax}
\ftlinepenalty=9999

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Tests for the ProofPower UNIX Interface}

\def\Abstract{\begin{center}
{\bf Abstract}\par
{Tests for the UNIX commands that run ProofPower.}
\end{center}}

\def\Reference{DS/FMU/IED/MDT111}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}

\item[Issues 1.1 (2007/07/26) -- 1.2 (2007/07/26) ] First drafts.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2014/08/08]
Made it follow the convention that temporary ML files have a ``.sml'' extension.
\item[2015/04/15]
Now uses new date and version macros from doctex
%%%% END OF CHANGES HISTORY %%%%
\item[2017/03/05]
Tidy up.
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}
\begin{center}
\begin{tabular}{ll}
{\Product} Development Library & Lemma 1\\
\end{tabular}
\end{center}
\newpage
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for the shell scripts that run ProofPower.

\subsection{Introduction}
This document provides tests for the scripts defined in \cite{LEMMA1/HOL/DTD111}.



\subsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD118}.

The tests were first introduced when the scripts were updated to handle file names with spaces.
The current tests mainly concentrate on that and on error cases.

\section{Auxiliary File}

=DUMP mdt111a.sml
fun hello_world () = (
	diag_line "Hello world!";
	"a"
);
=TEX
The next two should only be compiled after mdt111A.sml:
=DUMP mdt111b.sml
hello_world();
fun hello_world () = (
	diag_line "Hello world!";
	"b"
);
=SH
sed -e "/\"b\"/s/b/c/" <mdt111b.sml >"mdt111  c.sml"
=DUMP mdt111check.sml
use_file "dtd013.sml";
use_file "imp013.sml";
init_mt_results ();
val stage = get_shell_var "MDT111STAGE";
if stage = hello_world ()
then diag_line "Test case passed"
else (diag_line "Test case failed"; exit 1);
=TEX
=DUMP mdt111.sh
FAILURES=
SUCCESSES=
# Case 1 - check load of init script with spaces:
echo "**** **** **** **** TEST CASE 1 **** **** **** ****"
if	MDT111STAGE=c \
	pp \
	-i mdt111a.sml \
	-i "mdt111  c.sml" \
	-i mdt111check.sml \
	-d mdt111child \
	</dev/null
then	SUCCESSES="$SUCCESSES mdt111.1"
else	FAILURES="$FAILURES mdt111.1"
fi
# Case 2 - check that pp is returning the exit code from poly:
echo "**** **** **** **** TEST CASE 2 **** **** **** ****"
if	! \
	MDT111STAGE=x \
	pp \
	-i mdt111a.sml \
	-i mdt111b.sml \
	-i "mdt111  c.sml" \
	-i mdt111check.sml \
	-d mdt111child \
	</dev/null
then	SUCCESSES="$SUCCESSES mdt111.2"
else	FAILURES="$FAILURES mdt111.2"
fi
# Case 3 - check for -f effective in same session:
echo "**** **** **** **** TEST CASE 3 **** **** **** ****"
if	MDT111STAGE=a \
	pp \
	-f "mdt111a.sml" \
	-f "mdt111b.sml" \
	-f "mdt111a.sml" \
	-f "mdt111check.sml" \
	-d mdt111child
then	SUCCESSES="$SUCCESSES mdt111.3"
else	FAILURES="$FAILURES mdt111.3"
fi
RESVARS="$RESVARS RES$COUNT=\$RES$COUNT"
# Case 4 - check that -f is effective in subsequent sessions:
echo "**** **** **** **** TEST CASE 4 **** **** **** ****"
if	MDT111STAGE=a \
	pp \
	-d mdt111child \
	<mdt111check.sml
then	SUCCESSES="$SUCCESSES mdt111.4"
else	FAILURES="$FAILURES mdt111.4"
fi
echo SUCCESSES=$SUCCESSES
echo FAILURES=$FAILURES
if test	"$FAILURES" = ""
then	echo All module tests passed.
else	echo The following module tests failed: $FAILURES
fi
=TEX
\section{END OF TESTS}
=SML
=TEX
\end{document}
=IGN

