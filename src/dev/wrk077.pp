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

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ A {\Slrp} Parser for ANSI-C }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives a grammar for ANSI-C together with the supporting code to form a
fairly complete parser for the full ANSI-C language.}
\end{center}}

\def\Reference{LEMMA1/DEV/WRK077}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{$Revision: 1.16 $%
}
\def\Date{\FormatDate{$Date: 2006/10/25 13:31:40 $%
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
\item[Issues 1.1 (2006/10/05)] First draft.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/11/26]
Now works with MLton as well as Poly/ML and SML/NJ.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

Parser code to be added.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}
\begin{center}
\begin{tabular}{ll}
Lemma 1 Development Library
\end{tabular}
\end{center}


\newpage

%%%%% NOW THE CREATIVE BIT:

\section{Introduction}
\subsection{Scope}
This document is part of the {\Slrp} test suite.

\subsection{Purpose and Background}
This document is part of the {\Slrp} test suite and also provides an example of
various techniques of interest to users of {\Slrp}.

\subsection{Overview}
This document provides a grammar in the {\Slrp} format that can support the full C language.
I.e., unlike the grammar of \cite{LEMMA1/DEV/WRK063}, this grammar caters for all the consequences of the definitions of C, for example, the rule that says structure member names are in a separate namespace.

=TEX
\section{THE GRAMMAR} \label{GRAMMAR}
Our starting point is the reference grammar given in \cite{LEMMA1/DEV/WRK063}
which is a {\Slrp} verion of the grammars given in the 1990 standard \cite{ansi90} and in
\cite{Kernighan88}.
Note that all of these grammars leave some essentially syntactic issues unspecified,
i.e., they expect some syntax errors to be detected after parsing.
For example, the declarator at the beginning of a function definition must contain a parameter list, but none of the grammars captures this constraint.

There are two main problems with the reference grammar of \cite{LEMMA1/DEV/WRK063}:

\begin{enumerate}
\item
The grammar as presented effectively assumes that {\tt typedef} names
comprise a distinguished subset of the set of identifers.
This means that their declarations must be analysed as they are encountered to maintain a timely record of what names are {\tt typedef} names.
For example, to parse  `{\tt typedef int I; I i;}' properly according to the reference grammar,
one must take the first `{\tt I}' as an {\em identifier} and the second `{\tt I}' as a {\em typedef\_name}.
\item
The C language allows {\tt typedef} names to be redeclared in inner scopes either as {\tt typdef} names or as ordinary identifiers.
This leads to the kind of oddity pointed out in example 3 of section 6.5.6 of \cite{ansi90}, and also in the following example:
{\small
\begin{verbatim}
    typedef int I, J;
    void f(void)
    {
        I I;               /* legal - declares a variable I */
        J;                 /* legal but useless, declares nothing */
        struct {
            int J:4;       /* bitfield: type `int'; width 4; name J */
            const J:5;     /* bitfield: type `const J'; width 5; nameless */
            J j:6;         /* bitfield: type `J'; width 6; name j */
        } x;
     }
\end{verbatim}}
\end{enumerate}

The solution to the first problem is fairly straightforward: one must simply ensure that the parsing action functions are called at the appropriate time to process declarations maintaining a record of which names are currently {\tt typedef} names.
This needs to take into account the C scope rules: in particular, it must
take into account section 6.2.1 of \cite{ansi90}: {\em each enumeration constant has scope that begins
just after its defining enumerator \ldots Any other identifier has scope that begins just after
the completion of its declarator.}
Some of the consequences of the scope rules may be seen in the following (correct) example:

\begin{verbatim}
typedef int A, AFA(A A);
int f(void)
{
    A A = &A - &A;
    return A; /* 0 */
}
A g(A g)
{
    return g;
}
int h(void)
{
    struct {
        enum {A = (A)1001, B = A + 110} x;
    } z;
    z.x = A;
    return z.x; /* 1111 */
}
\end{verbatim}

The solution to the second problem is more involved: we adopt a trick that goes back to early versions of the {\tt gcc} compiler\footnote{Recent versions of {\tt gcc} use a hand-coded recursive descent parser for C and C++.}.
The {\tt gcc} trick exploits the following points from \cite{ansi90}:
\begin{description}
\item[6.7.1] {\it If the declarator includes an identifier list, \ldots. An identifier declared as
a {\tt typedef} name shall not be redeclared as a parameter.}

(This is taken to apply to all declarators, not just those in function definitions. It means that an old-style parameter list can't redefine a {\tt typedef} name.)
\item[6.5.6] {\it If the identifier is redeclared in an inner scope or is declared as a member of a structure or union in the same or an inner scope, the type specifiers shall not be omitted in the inner declaration.}

(So in `{\tt const J;}' in the above example, `{\tt J}' must not be taken as a declarator that redeclares the outer {\tt typedef} name `{\tt J}'.)

\item[6.5.2] {\em Each list of type specifiers shall be one of the following sets \ldots}

(This implies that the type specifier part of a declaration can contain at most one {\tt typedef} name and that {\tt typedef} name cannot appear with other kinds of type specifier so that the second `{\tt I}' in the declaration `{\tt I I;}' above must be a declarator and cannot be a type specifier.)

\end{description}

There is an additional problem with the interpretation of parameter declarations, that was not completely addressed in \cite{ansi90}.
In the following example:
\begin{verbatim}
typedef int INT;
float g4 (float INT (int));
\end{verbatim}
it is unclear whether {\tt INT} is a formal parameter name
or a typedef name.
This was clarified in \cite{ansi11} as follows:

\begin{description}
\item[6.7.6.3p11] If, in a parameter declaration, an identifier can be treated as a typedef name or a parameter name, it shall be taken as a typedef name.
\end{description}

This is still slightly unclear. We follow {\tt gcc} and the
defect report for this problem\footnote{
See
{\tt http://www.open-std.org/jtc1/sc22/WG14/www/docs/dr\_009.html}}
in
interpreting ``can be treated as a typedef name or a parameter name'' as
meaning ``can be parsed as a typedef name or a parameter name''.
Thus even though parameter names are required in a function definition,
we will take {\tt INT} to be a typedef name
and hence construe {\tt float(INT(int))} as an abstract declarator
in the following function definition (which will therefore be disallowed):
\begin{verbatim}
typedef int INT;
float g4 (float (INT (int))) { return (float) INT(42); }
\end{verbatim}
The above function definition becomes valid if the redundant brackets are
removed.


The following records the various changes that have been made to the grammar of \cite{LEMMA1/DEV/WRK063}.
If the changes are made incrementally, then, at each stage, the only LALR(1) conflict is the shift/reduce conflict caused by the dangling else problem.

\begin{itemize}
\item
Introduce a new non-terminal  {\em identifier\_or\_typedef\_name} for
use in situations such as statement labels where either an identifier or a typedef name is allowed.
Use this as appropriate wherever it does not cause LALR(1) conflicts (which is everywhere except in a {\em direct\_declarator}).
\item
Change {\em declaration\_list} into {\em declaration\_list\_opt} allowing empty lists, and exploit this to abbreviate the productions that use it.
Similarly for {\em init\_declarator\_list} and {\em identifier\_list}.
\item
Do the gcc trick, which applies to the three different types of declarations as follows:
\begin{description}
\item[Variable and constant declarations:]
add a new non-terminal {\em type\_declarator} which is like {\em declarator} but having a typedef name as the name being declared.
Similarly add {\em init\_type\_declarator\_list}, {\em struct\_type\_declarator\_list} etc.
Change {\em declaration\_specifiers} to have at least one type specifier and at most one typedef name.
Add a new production {\em declaration\_modifiers} to represent what was previously a {\em declaration\_specifiers} with no type specifiers.
This gives a new case in the production for {\em declaration} and then it becomes safe to add a further alternative allowing an {\em init\_type\_declarator} after a {\em declaration\_specifiers}.
\item[Structure and union member declarations:]
change {\em specifier\_qualifier\_list} to have at least one type specifier and at most one {\em typedef\_name} and so add an alternative allowing a {\em struct\_type\_declarator\_list} after a {\em specifier\_qualifier} list in a {\em struct\_declaration}.
\item
\item[Parameter declarations:]
Add new non-terminals {\em parameter\_direct\_declarator} and {\em parameter\_declarator}.
{\em parameter\_direct\_declarator} is essentially the union of {\em direct\_declarator}, and {\em direct\_abstract\_declarator} generalised to allow the identifier being declared to be a typedef name provided the
declarator is not enclosed in brackets.
Use {\em parameter\_declarator} in {\em parameter\_declaration} in place of the separate alternatives for {\em declarator} and {\em abstract\_declarator}.

\end{description}
\item
Add in new non-terminals, {\em do\_push\_members} etc. at the points in the syntax where an action function needs to be invoked, see section~\ref{actions} below.
Each of these non-terminals has a name beginning `{\em do\_}' and generates an empty language.
For convenience, add an extra non-terminal {\em enumerator\_name} to carry the action associated with the identifier in an {\em enumerator}.
\end{itemize}

[Remark: The 1999 revision of the C standard, \cite{ansi99}, requires a type specifier in
each of the three sorts of declaration, and so the non-terminals {\em declaration\_specifiers}
and {\em specification\_qualifier\_list} as modified generate what C99 specifies.]

\subsection{Translation Units}
=DUMP wrk077.grm.txt
⦏translation_unit⦎
	= external_declaration
	| translation_unit, external_declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏external_declaration⦎
	= function_definition
	| declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏function_definition⦎
	= declarator, declaration_list_opt, compound_statement
	| declaration_specifiers, declarator, declaration_list_opt, compound_statement
	;
=TEX
\subsection{Declarations}

=TEX
=DUMPMORE wrk077.grm.txt
⦏declaration⦎
	= declaration_modifiers, init_declarator_list_opt, do_end_declaration, `;`
	| declaration_specifiers, init_declarator_list_opt, do_end_declaration, `;`
	| declaration_specifiers, init_type_declarator_list, do_end_declaration, `;`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏declaration_list_opt⦎
	=
	| declaration_list_opt, declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏declaration_modifiers⦎
	= storage_class_specifier
	| storage_class_specifier, declaration_modifiers
	| type_qualifier
	| type_qualifier, declaration_modifiers
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏declaration_specifiers⦎
	= type_specifier, reserved_declaration_specifiers
	| declaration_modifiers, type_specifier, reserved_declaration_specifiers
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏reserved_declaration_specifiers⦎
	=
	| reserved_declaration_specifiers, reserved_type_specifier
	| reserved_declaration_specifiers, type_qualifier
	| reserved_declaration_specifiers, storage_class_specifier
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏storage_class_specifier⦎
	= `auto`
	| `register`
	| `static`
	| `extern`
	| do_typedef, `typedef`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏reserved_type_specifier⦎
	= `void`
	| `char`
	| `short`
	| `int`
	| `long`
	| `float`
	| `double`
	| `signed`
	| `unsigned`
	| struct_or_union_specifier
	| enum_specifier
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏type_specifier⦎
	= reserved_type_specifier
	| typedef_name
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏type_qualifier⦎
	= `const`
	| `volatile`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_or_union_specifier⦎
	= struct_or_union, do_push_members,
		`{`, struct_declaration_list, do_pop_members, `}`
	| struct_or_union, identifier_or_typedef_name, do_push_members,
		`{`, struct_declaration_list, do_pop_members, `}`
	| struct_or_union, identifier_or_typedef_name
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_or_union⦎
	= `struct`
	| `union`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_declaration_list⦎
	= struct_declaration
	| struct_declaration_list, struct_declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏init_declarator_list_opt⦎
	=
	| init_declarator_list
	;
=TEX
Note that it would not introduce an LALR(1) conflict to allow an {\em init\_type\_declarator} in the second and subsequent members of the list below.
However, section 6.5.6 of \cite{ansi90} does not allow this extra generality:
if `{\tt I}' has been declared as a {\tt typedef} name, a redeclaration such as `{\tt const J, I;}' without a type specifier is not allowed.
=DUMPMORE wrk077.grm.txt
⦏init_declarator_list⦎
	= init_declarator
	| init_declarator_list, `,`, init_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏init_type_declarator_list⦎
	= init_type_declarator
	| init_type_declarator_list, `,`, init_declarator
	| init_type_declarator_list, `,`, init_type_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏init_declarator⦎
	= declarator, do_declaration
	| declarator, do_declaration, `=`, initializer
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏init_type_declarator⦎
	= type_declarator, do_declaration
	| type_declarator, do_declaration, `=`, initializer
	;
=TEX
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_declaration⦎
	= type_qualifier_list, struct_declarator_list, `;`
	| specifier_qualifier_list, struct_declarator_list, `;`
	| specifier_qualifier_list, struct_type_declarator_list, `;`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏specifier_qualifier_list⦎
	= type_specifier, reserved_specifier_qualifiers
	| type_qualifier_list, type_specifier, reserved_specifier_qualifiers
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏reserved_specifier_qualifiers⦎
	=
	| reserved_specifier_qualifiers, reserved_type_specifier
	| reserved_specifier_qualifiers, type_qualifier
	;
=TEX
The comment about {\em innit\_declarator\_list} above also applies, {\it mutatis mutandis} to
{\em struct\_declarator\_list}.
=DUMPMORE wrk077.grm.txt
⦏struct_declarator_list⦎
	= struct_declarator, do_declaration
	| struct_declarator_list, `,`, struct_declarator, do_declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_type_declarator_list⦎
	= struct_type_declarator, do_declaration
	| struct_type_declarator_list, `,`, struct_type_declarator, do_declaration
	| struct_type_declarator_list, `,`, struct_declarator, do_declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_declarator⦎
	= declarator
	| `:`, constant_expression, do_abstract_declarator
	| declarator, `:`, constant_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏struct_type_declarator⦎
	= type_declarator
	| type_declarator, `:`, constant_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏enum_specifier⦎
	= `enum`, do_push_enumerators,
		`{`, enumerator_list, `}`, do_pop_enumerators
	| `enum`, identifier_or_typedef_name, do_push_enumerators,
		`{`, enumerator_list, `}`, do_pop_enumerators
	| `enum`, identifier_or_typedef_name
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏enumerator_list⦎
	= enumerator, do_declaration
	| enumerator_list, `,`, enumerator, do_declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏enumerator⦎
	= enumerator_name
	| enumerator_name, `=`, constant_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏enumerator_name⦎
	= identifier_or_typedef_name, do_declaration_name
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏declarator⦎
	= direct_declarator
	| pointer, direct_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏type_declarator⦎
	= type_direct_declarator
	| pointer, type_direct_declarator
	;
=TEX
In the following note that there is just one identifier or {\em typedef\_name} at the
heart of the declarator (i.e., the name the declarator, declares).
The distinction between identifier or {\em typedef\_name} declarators then ripples up through the grammar.
=DUMPMORE wrk077.grm.txt
⦏direct_declarator⦎
	= identifier, do_declaration_name
	| `(`, declarator, `)`
	| direct_declarator, `[`, `]`
	| direct_declarator, `[`, constant_expression, `]`
	| direct_declarator, do_push_parameters,
		`(`, parameter_type_list, do_pop_parameters, `)`
	| direct_declarator, do_push_parameters,
		`(`, identifier_list_opt, do_pop_parameters, `)`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏type_direct_declarator⦎
	= typedef_name, do_declaration_name
	| `(`, type_declarator, `)`
	| type_direct_declarator, `[`, `]`
	| type_direct_declarator, `[`, constant_expression, `]`
	| type_direct_declarator, do_push_parameters,
		`(`, parameter_type_list, do_pop_parameters, `)`
	| type_direct_declarator, do_push_parameters,
		`(`, identifier_list_opt, do_pop_parameters,` )`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏pointer⦎
	= `*`
	| `*`, type_qualifier_list
	| `*`, pointer
	| `*`, type_qualifier_list, pointer
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏type_qualifier_list⦎
	= type_qualifier
	| type_qualifier_list, type_qualifier
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏parameter_type_list⦎
	= parameter_list
	| parameter_list, `,`, `...`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏parameter_list⦎
	= parameter_declaration, do_declaration
	| parameter_list, `,`, parameter_declaration, do_declaration
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏parameter_declaration⦎
	= declaration_specifiers, do_abstract_declarator
	| declaration_specifiers, parameter_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏parameter_declarator⦎
	= parameter_direct_declarator
	| pointer, do_abstract_declarator
	| pointer, parameter_direct_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏parameter_direct_declarator⦎
	= identifier_or_typedef_name, do_declaration_name
	| `(`, declarator, `)`
	| `(`, abstract_declarator, `)`, do_abstract_declarator
	| `(`, `)`, do_abstract_declarator
	| `[`, `]`, do_abstract_declarator
	| `[`, constant_expression, `]`, do_abstract_declarator
	| parameter_direct_declarator, `[`, `]`
	| parameter_direct_declarator, `[`, constant_expression, `]`
	| `(`, do_push_parameters,
		parameter_type_list, do_pop_parameters, `)`,
			do_abstract_declarator
	| parameter_direct_declarator, do_push_parameters,
		`(`, parameter_type_list, do_pop_parameters, `)`
	| parameter_direct_declarator, do_push_parameters,
		`(`, identifier_list_opt, do_pop_parameters, `)`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏identifier_list_opt⦎
	=
	| identifier_list
	;
=TEX
The following production is only used for old style formal parameter lists, in which {\tt typedef} names are not to be treated as identifiers.
=DUMPMORE wrk077.grm.txt
⦏identifier_list⦎
	= identifier, do_parameter_identifier
	| identifier_list, `,`, identifier, do_parameter_identifier
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏initializer⦎
	= assignment_expression
	| `{`, initializer_list, `}`
	| `{`, initializer_list, `,`, `}`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏initializer_list⦎
	= initializer
	| initializer_list, `,`, initializer
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏type_name⦎
	= type_qualifier_list
	| type_qualifier_list, abstract_declarator
	| specifier_qualifier_list
	| specifier_qualifier_list, abstract_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏abstract_declarator⦎
	= pointer
	| direct_abstract_declarator
	| pointer, direct_abstract_declarator
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏direct_abstract_declarator⦎
	= `(`, abstract_declarator, `)`
	| `[`, `]`
	| `[`, constant_expression, `]`
	| direct_abstract_declarator, `[`, `]`
	| direct_abstract_declarator, `[`, constant_expression, `]`
	| `(`, `)`
	| `(`, parameter_type_list, `)`
	| direct_abstract_declarator, `(`, `)`
	| direct_abstract_declarator, `(`, parameter_type_list, `)`
	;
=TEX
We need an action function, {zem red\_typedef\_name} here to record the {\tt typedef} name.
=DUMPMORE wrk077.grm.txt
⦏typedef_name⦎ =
	TypedefName
	(red_typedef_name x1)
	;
=TEX
However, the C name space rules imply that there a {\tt typedef} name may be used as an identifier in several places, e.g., as a structure tag.
Where it does not introduce LALR(1) conflicts, we use the following production to achieve this:
=DUMPMORE wrk077.grm.txt
⦏identifier_or_typedef_name⦎
	= identifier
	| typedef_name
	;
=TEX
\subsection{Statements}
=DUMPMORE wrk077.grm.txt
⦏statement⦎
	= labeled_statement
	| compound_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏labeled_statement⦎
	= identifier_or_typedef_name, `:`, statement
	| `case`, constant_expression, `:`, statement
	| `default`, `:`, statement
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏compound_statement⦎
	= do_push_compound_statement,
	 `{`, declaration_list_opt, do_pop_compound_statement, `}`
	| do_push_compound_statement,
	 `{`, declaration_list_opt, statement_list, do_pop_compound_statement, `}`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏statement_list⦎
	= statement
	| statement_list, statement
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏expression_statement⦎
	= `;`
	| expression, `;`
	;
=TEX
This is where the shift/reduce conflict arises. The statement ``{\tt if(a) if(b) f(); else g();}''
can be parsed so that the else-part belongs to the inner if-statement or the outer one
according to the following grammar. The resolution is that it should belong to the
inner if-statement, i.e., shift.
=DUMPMORE wrk077.grm.txt
⦏selection_statement⦎
	= `if`, `(`, expression, `)`, statement
	| `if`, `(`, expression, `)`, statement, `else`, statement
	| `switch`, `(`, expression, `)`, statement
	;
=TEX
To avoid 7 extra cases in the following, we introduce a new production for an optional expression.
=DUMPMORE wrk077.grm.txt
⦏iteration_statement⦎
	= `while`, `(`, expression, `)`, statement
	| `do`, statement, `while`, `(`, expression, `)`, `;`
	| `for`, `(`, expression_opt, `;`, expression_opt, `;`, expression_opt, `)`,
	  statement
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏expression_opt⦎
	=
	| expression;
=TEX
=DUMPMORE wrk077.grm.txt
⦏jump_statement⦎
	= `goto`, identifier_or_typedef_name, `;`
	| `continue`, `;`
	| `break`, `;`
	| `return`, expression_opt, `;`
	;
=TEX
\subsection{Expressions}

=DUMPMORE wrk077.grm.txt
⦏expression⦎
	= assignment_expression
	| expression, `,`, assignment_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
=TEX
=DUMPMORE wrk077.grm.txt
⦏assignment_expression⦎
	= conditional_expression
	| unary_expression, assignment_operator, assignment_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏assignment_operator⦎
	= `=`
	| `*=`
	| `/=`
	| `%=`
	| `+=`
	| `-=`
	| `<<=`
	| `>>=`
	| `&=`
	| `^=`
	| `|=`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏conditional_expression⦎
	= logical_or_expression
	| logical_or_expression, `?`, expression, `:`, conditional_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏constant_expression⦎
	= conditional_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏logical_or_expression⦎
	= logical_and_expression
	| logical_or_expression, `||`, logical_and_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏logical_and_expression⦎
	= inclusive_or_expression
	| logical_and_expression, `&&`, inclusive_or_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏inclusive_or_expression⦎
	= exclusive_or_expression
	| inclusive_or_expression, `|`, exclusive_or_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏exclusive_or_expression⦎
	= and_expression
	| exclusive_or_expression, `^`, and_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏and_expression⦎
	= equality_expression
	| and_expression, `&`, equality_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏equality_expression⦎
	= relational_expression
	| equality_expression, `==`, relational_expression
	| equality_expression, `!=`, relational_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏relational_expression⦎
	= shift_expression
	| relational_expression, `<`, shift_expression
	| relational_expression, `>`, shift_expression
	| relational_expression, `<=`, shift_expression
	| relational_expression, `>=`, shift_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏shift_expression⦎
	= additive_expression
	| shift_expression, `<<`, additive_expression
	| shift_expression, `>>`, additive_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏additive_expression⦎
	= multiplicative_expression
	| additive_expression, `+`, multiplicative_expression
	| additive_expression, `-`, multiplicative_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏multiplicative_expression⦎
	= cast_expression
	| multiplicative_expression, `*`, cast_expression
	| multiplicative_expression, `/`, cast_expression
	| multiplicative_expression, `%`, cast_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏cast_expression⦎
	= unary_expression
	| `(`, type_name, `)`, cast_expression
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏unary_expression⦎
	= postfix_expression
	| `++`, unary_expression
	| `--`, unary_expression
	| unary_operator, cast_expression
	| `sizeof`, unary_expression
	| `sizeof`, `(`, type_name, `)`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏unary_operator⦎
	= `&`
	| `*`
	| `+`
	| `-`
	| `~`
	| `!`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏postfix_expression⦎
	= primary_expression
	| postfix_expression, `[`, expression, `]`
	| postfix_expression, `(`, `)`
	| postfix_expression, `(`, argument_expression_list, `)`
	| postfix_expression, `.`, identifier_or_typedef_name
	| postfix_expression, `->`, identifier_or_typedef_name
	| postfix_expression, `++`
	| postfix_expression, `--`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏primary_expression⦎
	= identifier
	| constant
	| string
	| `(`, expression, `)`
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏argument_expression_list⦎
	= assignment_expression
	| argument_expression_list, `,`, assignment_expression
	;
=TEX
We leave enumeration constants out of the following list, on the grounds that a practical parser
would more likely treat them as identifiers during lexical analysis. The distinction between
enumeration constants and other identifiers does not affect the parsing.
=DUMPMORE wrk077.grm.txt
⦏constant⦎
	= IntegerConstant
	| CharacterConstant
	| FloatingConstant
	;
=TEX
For the convenience of the lexical analyser, we have the grammar express concatenation of string elemements:

=DUMPMORE wrk077.grm.txt
⦏string⦎
	= String
	| string, String
	;
=TEX
We need an action function, {zem red\_identifier} here to record the identifier.
=DUMPMORE wrk077.grm.txt
⦏identifier⦎
	= Identifier
	(red_identifier x1)
	;
=TEX
\subsection{Action Functions}~\label{actions}
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_end_declaration⦎
	=
	(red_do_end_declaration ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_typedef⦎
	=
	(red_do_typedef ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_push_members⦎
	=
	(red_do_push_members ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_pop_members⦎
	=
	(red_do_pop_members ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_declaration⦎
	=
	(red_do_declaration ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_push_enumerators⦎
	=
	(red_do_push_enumerators ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_pop_enumerators⦎
	=
	(red_do_pop_enumerators ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_declaration_name⦎
	=
	(red_do_declaration_name ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_abstract_declarator⦎
	=
	(red_do_abstract_declarator ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_push_parameters⦎
	=
	(red_do_push_parameters ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_pop_parameters⦎
	=
	(red_do_pop_parameters ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_parameter_identifier⦎
	=
	(red_do_parameter_identifier ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_push_compound_statement⦎
	=
	(red_do_push_compound_statement ())
	;
=TEX
=DUMPMORE wrk077.grm.txt
⦏do_pop_compound_statement⦎
	=
	(red_do_pop_compound_statement ())
	;
=TEX
=SH
slrp -g -l 2  -f wrk077.grm.txt >wrk077.grm.run
=TEX
\newpage
\section{PARSER IMPLEMENTATION}\label{PARSER}
\subsection{Compiling the {\Slrp} library code}
We assume the following source files are loaded (as is the case where this
code is used as a test in \cite{LEMMA1/DEV/MDT118}).
=GFT
	dtd108.sml	(* Portability infrastructure *)
	imp108.sml
	dtd002.sml	(* System control and error reporting *)
	imp002.sml
	dtd001.sml	(* Standard ML utilities *)
	imp001.sml
	dtd018.sml	(* SLRP parser driver *)
	imp018.sml
	dtd118.sml	(* Generic SLRP parser support *)
	imp118.sml
=TEX
=SML
open GenericSlrpParser;
=TEX
=SML
val ⦏debug⦎ : bool ref = ref false;
fun ⦏diag_print⦎ (new_line : bool) (s : string) : unit = (
	if	!debug
	then	(output(std_out, s);
		if	new_line
		then	output(std_out, "\n")
		else	())
	else	()
);
=TEX
\subsection{Parser State}
We distinguish the various types of scope in which identifiers and {\tt typedef} names can be declared.
=SML
datatype ⦏SCOPE⦎ =
		⦏Declaration⦎
	|	⦏Typedef⦎
	|	⦏StructUnion⦎
	|	⦏Enumerators⦎
	|	⦏Parameters⦎;
=TEX
=SML
fun ⦏string_of_scope⦎ (Declaration : SCOPE) : string = "declaration"
| string_of_scope Typedef = "typedef"
| string_of_scope StructUnion = "struct/union"
| string_of_scope Enumerators = "enum"
| string_of_scope Parameters = "parameter list"

=TEX
We need to track the type definitions in the input, which we do by manipulating
a stack of frames defined as follows (and in which when we push a new frame, we
copy the dictionary from the outer frame into it).

When a parameter list, struct, union or enum is being parsed, the frame includes a list of the identifiers declared in the parameter list, struct, union or enum.
This will include the parameter names (in the case of a parameter list) together with any names declared in {\tt enum} specifiers int the parameter list, struct, union or enum.
The list is an optional value enabling the special case of the first parameter list in a declarator to be detected.
This approach deals with monstrosities such as:

\begin{verbatim}
int (*f(enum{X = 1} a))(enum{X = 2} b)
{
    printf("X = %d\n", (int) X); /* prints `X = 1' */
    return 0;
}
\end{verbatim}

At the end of processing a parameter list, if the list of local identifiers is not already present in the immediately enclosing frame, then the list from the top of
the stack is copied into the outer frame.
Then, when a block is encountered the names in the list are removed from the list of {\tt typedef} names.
This is how the parameters cross over into the statement part of a function definition.

Similarly, at the end of processing a struct, union or enum, when the frame for the struct or union is popped off the stack, all elements of the list of local identifiers are removed from the list of {\tt typedef} names in the immediately enclosing frame.


=SML
type ⦏FRAME⦎ = {
	scope : SCOPE,
	typedef_names : unit E_DICT,
	local_identifiers : string list OPT};
=TEX
=SML
val ⦏initial_frame⦎ : FRAME = {
	scope = Declaration,
	typedef_names = initial_e_dict,
	local_identifiers = Nil};
=TEX
=SML
val ⦏stack⦎ : FRAME list ref = ref [initial_frame];
val ⦏current_name⦎ : string ref = ref "* dummy name *";
val ⦏declaration_names⦎ : string OPT list ref = ref [];
=TEX
=SML
fun ⦏reset_state⦎ (():unit) : unit = (
	stack := [initial_frame];
	current_name := "* dummy name *";
	declaration_names := []
);
=TEX
=SML
fun ⦏set_scope⦎ (new_scope : SCOPE) : unit = (
	case !stack of
		{scope, typedef_names, local_identifiers} :: more =>
			stack :=
			{scope = new_scope,
			 typedef_names = typedef_names,
			 local_identifiers = local_identifiers
			} :: more
	|	_ => ()
);
=TEX
=SML
fun ⦏get_scope⦎ (():unit) : SCOPE = (
	#scope(hd(!stack))
);
=TEX
=SML
fun ⦏set_typedef_names⦎ (new_typedef_names : unit E_DICT) : unit = (
	case !stack of
		{scope, typedef_names, local_identifiers} :: more =>
			stack :=
			{scope = scope,
			 typedef_names = new_typedef_names,
			 local_identifiers = local_identifiers
			} :: more
	|	_ => ()
);
=TEX
=SML
fun ⦏get_typedef_names⦎ (():unit) : unit E_DICT = (
	#typedef_names(hd(!stack))
);
=TEX
=SML
fun ⦏declare_typedef_name⦎ (new_typedef_name : string) : unit = (
diag_print true ("Declaring typedef: "  ^ new_typedef_name);
	set_typedef_names
	(e_enter new_typedef_name () (#typedef_names(hd(!stack))))
);
=TEX
=SML
fun ⦏undeclare_typedef_name⦎ (identifier : string) : unit = (
diag_print true ("Undeclaring typedef: "  ^ identifier);
	set_typedef_names
	(e_delete identifier (#typedef_names(hd(!stack))))
);
=TEX
=SML
fun ⦏set_local_identifiers⦎ (new_local_identifiers : string list OPT) : unit = (
	case !stack of
		{scope, typedef_names, local_identifiers} :: more =>
			stack :=
			{scope = scope,
			 typedef_names = typedef_names,
			 local_identifiers = new_local_identifiers
			} :: more
	|	_ => ()
);
=TEX
=SML
fun ⦏get_local_identifiers⦎ (():unit) : string list = (
	case #local_identifiers(hd(!stack)) of
		Value dns => dns
	|	Nil => []
);
=TEX
=SML
fun ⦏declare_identifier⦎ (identifier : string) : unit = (
diag_print true ("Declaring identifier: "  ^ identifier);
	set_local_identifiers
	(case #local_identifiers(hd(!stack)) of
		Value dns => Value(identifier::dns)
	|	Nil => Value [identifier]);
	undeclare_typedef_name identifier
);
=TEX
=SML
fun ⦏push_scope⦎ (scope : SCOPE) : unit = (
	diag_print false "New scope: ";
	diag_print true (string_of_scope scope);
	let	val {typedef_names, ... } = hd(!stack);
		val lis = get_local_identifiers();
	in	stack := initial_frame :: !stack;
		set_scope scope;
		set_typedef_names typedef_names;
		(case scope of
			Declaration => app undeclare_typedef_name lis
		|	_ => ())
	end
);
=TEX
=SML
fun ⦏pop_scope⦎ (():unit) : unit = (
	let	val scope = get_scope();
		val lis = get_local_identifiers();
	in	diag_print false "Leaving scope: ";
		diag_print true (string_of_scope scope);
		stack := tl(!stack);
		(case (scope, #local_identifiers (hd(!stack))) of
			(Parameters, Nil) => set_local_identifiers (Value lis)
		|	(StructUnion, _) => app undeclare_typedef_name lis
		|	(Enumerators, _) => app undeclare_typedef_name lis
		|	_ => ())
	end
);
=TEX
=SML
fun ⦏declare⦎ (name : string) : unit = (
	case get_scope() of
		Declaration => declare_identifier name
	|	Typedef => declare_typedef_name name
	|	StructUnion => ()
	|	Enumerators => declare_identifier name
	|	Parameters => declare_identifier name
);
=TEX
\subsection{Classifier Function}
The classifier function differs from the generic one in that it must first check the list of local identifiers in the current frame and then the list of {\tt typdef} names.
=SML
fun ⦏act_c_classifier⦎ ((LCIdentifier "Identifier", (s, _)) : LEX_CLASS LEX_VALUE)
	: LEX_CLASS = (
	if	s mem get_local_identifiers()
	orelse	(case e_lookup s (get_typedef_names()) of
			Value _ => false
		|	Nil => true)
	then	LCIdentifier "Identifier"
	else	LCIdentifier "TypedefName"
) | act_c_classifier (lc, _) = lc;
=TEX
=SML
fun ⦏c_classifier⦎ (tok as (_, (s, n)) : LEX_CLASS LEX_VALUE)
	: LEX_CLASS = (
	let	val res = act_c_classifier tok;
		fun aux (LCIdentifier x) = x
		|   aux (LCString x) = "`" ^ x ^ "`"
		|   aux (LCEos) = "<end-of-input>";
	in	diag_print true ("Classifying " ^ s ^
			" on line " ^ string_of_int n ^
			" as " ^ aux res);
		res
	end
);
=TEX
\subsection{Reduction Actions}
=TEX
When called with the {\it -g} option on our grammar, {\Slrp} will generate the action
code automatically for each rule that does not contain any action code. The automatically
generated action is a call on the function {\it generic\_reducer}. Our custom reduction
functions simply update the parser state as necessary and then make the same
call on {\it generic\_reducer} as the automatically generated code would make:
=TEX
=SML
fun ⦏red_typedef_name⦎ (x1) = (
	(* typedef_name = TypedefName *)
	(case x1 of
		Token((_, (name, _)), _) => current_name := name
	|	_ => raise PARSER_ERROR "invalid argument to red_typedef_name");
	generic_reducer ("typedef_name", 1) [x1] []
);
=TEX
=SML
fun ⦏red_identifier⦎ (x1) = (
	(* identifier = Identifier *)
	(case x1 of
		Token((_, (name, _)), _) => current_name := name
	|	_ => raise PARSER_ERROR "invalid argument to red_identifier");
	generic_reducer ("identifier", 1) [x1] []
);
=TEX
=SML
fun ⦏red_do_end_declaration⦎ () = (
	(* do_end_declaration =  *)
	set_scope Declaration;
	set_local_identifiers Nil;
	generic_reducer ("do_end_declaration", 1) [] []
);
=TEX
=SML
fun ⦏red_do_typedef⦎ () = (
	(* do_typedef =  *)
	set_scope Typedef;
	generic_reducer ("do_type_def", 1) [] []
);
=TEX
=SML
fun ⦏red_do_push_members⦎ () = (
	(* do_push_members =  *)
	push_scope StructUnion;
	generic_reducer ("do_push_members", 1) [] []
);
=TEX
=SML
fun ⦏red_do_pop_members⦎ () = (
	(* do_pop_members =  *)
	pop_scope ();
	generic_reducer ("do_pop_members", 1) [] []
);
=TEX
=SML
fun ⦏red_do_declaration⦎ () = (
	(* do_declaration =  *)
	(case hd(!declaration_names) of
		Value name => declare name
	|	Nil => ());
	declaration_names := tl(!declaration_names);
	generic_reducer ("do_declaration", 1) [] []
);
=TEX
=SML
fun ⦏red_do_push_enumerators⦎ () = (
	(* do_push_enumerators =  *)
	push_scope Enumerators;
	generic_reducer ("do_push_enumerators", 1) [] []
);
=TEX
=SML
fun ⦏red_do_pop_enumerators⦎ () = (
	(* do_pop_enumerators =  *)
	pop_scope ();
	generic_reducer ("do_pop_enumerators", 1) [] []
);
=TEX
=SML
fun ⦏red_do_declaration_name⦎ () = (
	(* do_declaration_name =  *)
	declaration_names := (Value (!current_name)) :: !declaration_names;
	generic_reducer ("do_declaration_name", 1) [] []
);
=TEX
=SML
fun ⦏red_do_abstract_declarator⦎ () = (
	(* do_abstract_declarator =  *)
	declaration_names := Nil :: !declaration_names;
	generic_reducer ("do_abstract_declarator", 1) [] []
);
=TEX
=SML
fun ⦏red_do_push_parameters⦎ () = (
	(* do_push_parameters =  *)
	push_scope Parameters;
	generic_reducer ("do_push_parameters", 1) [] []
);
=TEX
=SML
fun ⦏red_do_pop_parameters⦎ () = (
	(* do_pop_parameters =  *)
	pop_scope();
	generic_reducer ("do_pop_parameters", 1) [] []
);
=TEX
=SML
fun ⦏red_do_parameter_identifier⦎ () = (
	(* do_parameter_identifier =  *)
	declare (!current_name);
	generic_reducer ("do_parameter_identifier", 1) [] []
);
=TEX
=SML
fun ⦏red_do_push_compound_statement⦎ () = (
	(* do_push_compound_statement =  *)
	push_scope Declaration;
	generic_reducer ("do_push_compound_statement", 1) [] []
);
=TEX
=SML
fun ⦏red_do_pop_compound_statement⦎ () = (
	(* do_pop_compound_statement =  *)
	pop_scope ();
	generic_reducer ("do_pop_compound_statement", 1) [] []
);
=TEX
\subsection{Lexical Analyser}
=TEX
Now we construct the lexical analyser.
\subsubsection{Comments}
=SML
fun ⦏skip_to_end_of_comment⦎ ("*" :: "/"::more) = Value more
|   skip_to_end_of_comment (_::more) = skip_to_end_of_comment more
|   skip_to_end_of_comment [] = Nil;
=TEX
Since they are otherwise lexically illegal, we recognise C++-style single line comments as well
as the standard ANSI ones. Similarly, we treat preprocessor directives as comments (to
skip over the ``\verb!#line!'' directives that {\tt cc -E} typically generates).
=SML
fun ⦏rec_comment⦎ (
	(chs, status as (Continuation (_, InComment)))
		: LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	case skip_to_end_of_comment chs of
		Value rest => (rest, Comment)
	|	Nil => ([], status)
) | rec_comment (chs, status as Continuation _) = (
	(chs, Unknown)
) | rec_comment ("/" :: "*"  :: chs, status) = (
	case skip_to_end_of_comment chs of
		Value rest => (rest, Comment)
	|	Nil => ([], Continuation(get_line_number(), InComment))
) | rec_comment ("/" :: "/"  :: chs, status) = (([], Comment)
) | rec_comment ("#" :: chs, status) = (([], Comment)
) | rec_comment (chs, _) = (chs, Unknown);
=TEX
\subsubsection{Keywords and Identifiers}
=SML
val ⦏keyword_dict⦎ : string E_DICT =
	list_e_merge initial_e_dict (map (fn s => (s, s)) [
	"auto", "break", "case", "char", "const", "continue", "default", "double",
	"do", "else", "enum", "extern", "float", "for", "goto", "if",
	"int", "long", "register", "return", "short", "signed", "sizeof", "static",
	"struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
]);
=TEX
The following could be implemented more efficiently by adapting some of the analogous code
from IMP118.
=SML
fun ⦏c_is_alpha⦎ ch = (
		"a" <= ch andalso ch <= "z"
	orelse	"A" <= ch andalso ch <= "Z"
	orelse	ch = "_"
);
=TEX
=SML
fun ⦏is_digit⦎ ch = "0" <= ch andalso ch <= "9";
=TEX
=SML
val ⦏is_alnum⦎ = c_is_alpha fun_or is_digit;
=TEX
=SML
fun ⦏get_ident⦎ [] = Nil
| get_ident (chs as (ch :: more)) = (
	let	fun aux acc [] = Value(implode(rev acc), [])
		|   aux acc (c::more) = (
			if	is_alnum c
			then	aux (c::acc) more
			else	Value(implode(rev acc), c::more)
		);
	in	if	c_is_alpha ch
		then	aux [ch] more
		else	Nil
	end
);
=TEX
=SML
fun ⦏rec_ident⦎ ((chs, status) : LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	case get_ident chs of
		Value(n, more) => (
			case e_lookup n keyword_dict of
				Value s =>(
					 (more,
					 Known (LCString s, (s, get_line_number())))
			) |	Nil => (
					 (more,
					 Known (LCIdentifier "Identifier",
						(n, get_line_number())))
			)
	) |	Nil => (chs, Unknown)
);
=TEX
\subsubsection{Integer Constants}
=SML
fun ⦏is_int_type_char⦎ "u" = true
|   is_int_type_char "U" = true
|   is_int_type_char "l" = true
|   is_int_type_char "L" = true
|   is_int_type_char _ = false;
=TEX
=SML
fun ⦏is_hexit⦎ ch = (
		is_digit ch
	orelse	("a" <= ch andalso ch <= "f")
	orelse	("A" <=  ch andalso ch <= "F")
);
=TEX
=SML
fun ⦏get_integer⦎ [] = Nil
| get_integer (chs as (ch :: more)) = (
	let	fun aux1 acc [] = Value(implode(rev acc), [])
		|    aux1 acc (c::more) = (
			if	is_int_type_char c
			then	aux1 (c::acc) more
			else	Value(implode(rev acc), c::more)
		);
		fun aux2 test acc [] = Value(implode(rev acc), [])
		|   aux2 test acc (c::more) = (
			if	test c
			then	aux2 test (c::acc) more
			else if	is_int_type_char c
			then	aux1 (c::acc) more
			else	Value(implode(rev acc), c::more)
		);
		fun aux3 acc ("x" :: more) = aux2 is_hexit ("x"::acc) more
		|   aux3 acc ("X" :: more) = aux2 is_digit ("X"::acc) more
		|   aux3 acc chs = aux2 is_digit acc chs;
	in	if	is_digit ch
		then	aux3 [ch] more
		else	Nil
	end
);
=TEX
=SML
fun ⦏rec_integer⦎ ((chs, status) : LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	case get_integer chs of
		Value(n, more) => (
			 (more,
			 Known (LCIdentifier "IntegerConstant", (n, get_line_number())))
	) |	Nil => (chs, Unknown)
);
=TEX
\subsubsection{Character Constants}
We widen the lexis of character constants to allow any sequence of characters
inside single quote marks, using backslash as an escape character. I.e., we are
deferring the check that the character constant actually denotes a single valid
character to a later stage of processing (not implemented here).
=SML
fun ⦏get_char_const⦎ acc ("'"::more) = (implode(rev ("'"::acc)), more)
|   get_char_const acc ("\\"::ch::more) = get_char_const (ch::"\\"::acc) more
|   get_char_const acc (ch::more) = get_char_const (ch::acc) more
|   get_char_const acc [] = (
	raise LexFail (get_line_number(), "unmatched character quotation symbol")
);
=TEX
=SML
fun ⦏rec_char_const⦎ (("'"::chs, status) : LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	let	val (this, rest) = get_char_const ["'"] chs
	in	(rest, Known(LCIdentifier "CharacterConstant", (this, get_line_number())))
	end
) | rec_char_const (chs, _) = (chs, Unknown);
=TEX
\subsubsection{Floating Constants}
=SML
fun ⦏is_floating_type_char⦎ "f" = true
|   is_floating_type_char "F" = true
|   is_floating_type_char "l" = true
|   is_floating_type_char "L" = true
|   is_floating_type_char _ = false;
=TEX
=SML
fun ⦏is_floating_exp_char⦎ "e" = true
|   is_floating_exp_char "E" = true
|   is_floating_exp_char _ = false;
=TEX
\ftlinepenalty=9999
=SML
fun ⦏get_floating⦎ [] = Nil
| get_floating chs = (
	let	fun do_type_char acc [] = Value(rev acc, [])
		|    do_type_char acc (c::more) = (
			if	is_floating_type_char c
			then	Value(rev(c::acc),  more)
			else	Value(rev acc, c::more)
		);
		fun do_exp_rest acc [] = Value (rev acc, [])
		|   do_exp_rest acc (chs as (c::more)) = (
			if	is_digit c
			then	do_exp_rest (c::acc) more
			else	do_type_char acc chs
		);
		fun do_exp e_char acc (chs as ("-"::(more as (ch::_)))) = (
			if	is_digit ch
			then	do_exp_rest ("-"::e_char::acc) more
			else	Value(rev acc, e_char :: chs)
		) | do_exp e_char acc (chs as (ch::more)) = (
			if	is_digit ch
			then	do_exp_rest (ch::e_char::acc) more
			else	Value(rev acc, e_char :: chs)
		) | do_exp e_char acc [] = Value(rev acc, [e_char]);
		fun do_frac_part got_digit acc [] = (
			if	got_digit
			then	Value(rev acc, [])
			else	Nil
		) | do_frac_part got_digit acc (c::more) = (
			if	is_digit c
			then	do_frac_part true (c::acc) more
			else if	got_digit
			then	if	is_floating_exp_char c
				then	do_exp c acc more
				else if	is_floating_type_char c
				then	do_type_char (c::acc) more
				else	Value(rev acc, c::more)
			else	Nil
		);
		fun do_point got_digit acc ("." :: more) = (
			do_frac_part got_digit ("."::acc) more
		) | do_point got_digit acc chs = do_frac_part got_digit acc chs;
		fun do_int_part _ _ [] =Nil
		|   do_int_part got_digit acc (c::more) = (
			if	is_digit c
			then	do_int_part true (c::acc) more
			else	do_point got_digit acc (c::more)
		);
	in	case do_int_part false [] chs of
			Value (chs, more) => (
				if	"." mem chs
				orelse	any chs is_floating_exp_char
				then	Value(implode chs, more)
				else	Nil
		) |	Nil => Nil
	end
);
=TEX
=SML
fun ⦏rec_floating⦎ ((chs, status) : LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	case get_floating chs of
		Value(n, more) => (
			 (more,
			 Known (LCIdentifier "FloatingConstant", (n, get_line_number())))
	) |	Nil => (chs, Unknown)
);
=TEX
\subsubsection{String Constants}
The grammar takes care of the treatment of adjacent string literals.
=SML
fun ⦏get_string_lit⦎ acc ("\""::more) = (implode(rev ("\""::acc)), more)
|   get_string_lit acc ("\\"::ch::more) = get_string_lit (ch::"\\"::acc) more
|   get_string_lit acc (ch::more) = get_string_lit (ch::acc) more
|   get_string_lit acc [] = (
	raise LexFail (get_line_number(), "unmatched string quotation symbol")
);
=TEX
=SML
fun ⦏rec_string_lit⦎ (("\""::chs, status) : LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	let	val (this, rest) = get_string_lit ["\""] chs
	in	(rest, Known(LCIdentifier "String", (this, get_line_number())))
	end
) | rec_string_lit (chs, _) = (chs, Unknown);
=TEX
=TEX
\subsubsection{Operators}
=SML
val ⦏operator_dict⦎ : string E_DICT =
	list_e_merge initial_e_dict (map (fn s => (s, s)) [
	"!=", "!", "\037=", "\037", "&&", "&=", "&", "(",
	")", "*=", "*", "++", "+=", "+", ",", "--",
	"-=", "->", "-", "...", ".", "/=", "/", ":",
	";", "<<=", "<<", "<=", "<", "==", "=", ">=",
	">>=", ">>", ">", "?", "[", "]", "^=", "^",
	"{", "|=", "|", "||", "}", "~"
]);
=TEX
In the following the magic number 2 is 1 less than the maximum length of an operator symbol.
=SML
fun  ⦏get_operator⦎ chs = (
	let	fun aux ~1 = Nil
		|    aux i = (
			case e_lookup (implode (chs to i)) operator_dict of
				Value s => Value(s, chs from(i+1))
			|	Nil => aux (i-1)
		);
	in	aux 2
	end
);
=TEX
=SML
fun ⦏rec_operator⦎ ((chs, status) : LEX_CLASS LEX_STATE)
	: LEX_CLASS LEX_STATE = (
	case get_operator chs of
		Value(n, more) => (
			(more, Known (LCString n, (n, get_line_number())))
	) |	Nil => (chs, Unknown)
);
=TEX
In the following, it is important that we do comments before anything else and floating constants
before operators or integer constants.
=SML
val ⦏rec_any⦎ = rec_first[
	rec_comment,
	rec_ident,
	rec_floating,
	rec_operator,
	rec_integer,
	rec_string_lit,
	rec_char_const];
=TEX
\subsection{Resolver Function}
There is one shift/reduce conflict as shown in the following outline extract from the {\Slrp} listing:
=GFT SLRP Output
+++ State Table +++
...
210:	selection_statement = `if`, `(`, expression, `)`, statement.
	selection_statement = `if`, `(`, expression, `)`, statement., `else`, statement
...
348:	...
	selection_statement = `if`, `(`, expression, `)`, statement, `else`., statement
	...
...
+++ Conflicts +++

LALR(1) lookahead sets resolved 12 conflicts

1 conflict detected (1 shift/reduce, 0 reduce/reduce)

State 210 on symbol `else`
	Reduce by selection_statement = `if`, `(`, expression, `)`, statement | ...
	Shift to 348
=TEX
The conflict arises when the statement forming the then-part of the if-statement is
itself an if-statement with no else-part (yet). The resolution is to shift, which means that
the else-part is given to the inner if-statement. (If we were to reduce, then the parser would
not work: a valid input such as ``{\tt while(a) if(b) f(x); else g(x);}'' would be unparseable).

The upshot of all this is that the resolver function is extremely simple:
=SML
fun ⦏c_resolver⦎ _ = DoShift;
=TEX
\subsection{Error Handler}
We give an error handler that can print out line numbers.
=SML
fun ⦏c_error⦎
	(do_tok : 'lc LEX_VALUE -> string)
	(tok as (_, (_, n)): 'lc LEX_VALUE,
	 stk : ('lc LEX_VALUE, 'lc, 'pp)INPUT_STACK,
	 _ : STATE_STACK, st : 'st)
	: ('lc LEX_VALUE * 'st *int) = (
	raw_diag_line("*** ERROR Syntax error on line " ^ string_of_int n);
	if	any stk (fn Token _ => true | _ => false)
	then	raw_diag_line
		(do_tok tok ^
			" not expected after: "
				^ format_stack do_tok stk)
	else raw_diag_line(do_tok tok ^ " not expected here");
	raise SYNTAX_ERROR
);
=TEX
\subsection{The Parser}
The parser is now completed in two easy stages:
first include the Standard ML code generated by {\Slrp}:
=INCLUDE
wrk077.grm.sml
=TEX
Second, {\it et voila}, instantiate the function {\it slrp'gen\_parser} generated
by {\Slrp} to use our resolver, classifier etc.
=SML
fun c_parse_file name = (
	reset_state();
	slrp'gen_parser c_resolver c_classifier
	(c_error string_of_lex_value)
	(gen_reader LCEos rec_any (in_char_stream_of_file name))
	([], true)
);
=TEX
\subsection{Some Tests}
=DUMP wrk077.1.c
typedef int A, AFA(A A);
int f(void)
{
    A A = &A - &A;
    return A;
}
A g(A g)
{
    return g;
}
int h(void)
{
    struct {
        enum {A = (A)1001, B = A + 110, K} x;
    } z;
    z.x = B;
    return z.x;
}
int i(void)
{
    extern A A(A A);
}
=TEX
=SH
cc -E wrk077.1.c >wrk077.1.i
=SML
print_tree (c_parse_file"wrk077.1.i");
=IGN
print_tree (c_parse_file"t.c");
=TEX
=DUMP wrk077.2.c
long int ________ = 99;
float a_ = 100E45f;
long double _x = 1.2e-9l;
double _ = .1;
float t = .1e3, y = .99999E-7;
static long unsigned int zz____z;
int yyy = 1234567;
char c = 'x';
char d = '\'';
char e = '\\';
char *p1 = "", *p2 = "a", *p3 = "a"/* comment */"b" "c",
	*p4 = "\\\"";
typedef int I;
int f(I I)
{
	I = 0;
	/* {I x;} */ /* not legal: I is not a typedef name here */
	{typedef int I[I]; I x;} /* OK */
}
int (*f(enum{X = 1} a))(enum{X = 2} b)
/* but not: (int *c[X]) */
{
	printf("X = %d\n", (int) X);
	return 0;
}
typedef int I;
int f(I I)
{
	I = 0;
	/* {I x;} */ /* not legal: I is not a typedef name here */
	{typedef int I[I]; I x;} /* OK */
}
int g(void)
{
	int x;
	x = (enum{I}) I;
	x = I + 1;
}
float ff(float(int));
typedef int INT;
float ff(float INT (int))
{
	return (float)INT(42);
}
=SH
cc -E wrk077.2.c >wrk077.2.i
=SML
print_tree (c_parse_file"wrk077.2.i");
=TEX
=DUMP wrk077.3.c
typedef int INT;
float ff(float (INT (int)))
{
	return (float) INT(42); /* syntax errpr: INT is still a typedef name */
}
=SH
cc -E wrk077.3.c >wrk077.3.i
=TEX
We expect this one to give a syntax error:
=SML
(print_tree (c_parse_file"wrk077.3.i");
	print "*** ERROR EXPECTED BUT NOT REPORTED ***\n"; raise Div)
		handle SYNTAX_ERROR => ();
=TEX
\newpage
\section{INDEX}
\small
\printindex
\end{document}


=IGN
=IGN
rm -rf t
mkdir t
cd t
ln -s ~/pp/RCS  .
co `make -f xpp.mkf packinglist`
make -f xpp.mkf help.c
for f in *.c
do
	b=`basename $f .c`
	echo "typedef int __builtin_va_list;" > $b.i
	cc -E -DLINUX $b.c |
		sed -e '/__extension__/s/__extension__/ /g' \
			-e '/__const/s/__const/ /g' \
			-e '/__restrict/s/__restrict/ /g' \
			-e '/__inline__/s/__inline__/ /g' \
			-e '/__attribute__.*;/s/__attribute__.*;/;/g' \
			-e '/({.*})/s/({.*})/(___NON_STANDARD_GCC_EXPRESSION___)/g' \
		 >> $b.i
done
cd ..
=IGN

=IGN
fun f (Leaf _) = 1
|   f (Node(_, children)) = (
	1 + fold (op +) (map f children) 0
);
fun g file = (
	output(std_out, file ^ ": ");
	ExtendedIO.flush_out std_out;
	let	val c = (f o c_parse_file) file
	in	output(std_out, string_of_int c);
		output(std_out, "\n");
		ExtendedIO.flush_out std_out;
		c
	end
);

val results = map g [
	"t/cmdline.i",
	"t/diag.i",
	"t/files.i",
	"t/help.i",
	"t/mainw.i",
	"t/menus.i",
	"t/msg.i",
	"t/options.i",
	"t/palette.i",
	"t/pixmaps.i",
	"t/pterm.i",
	"t/search.i",
	"t/templates.i",
	"t/undo.i",
	"t/xmisc.i",
	"t/xpp.i"];

fold (op+) results 0;

f (c_parse_file "t/temp.i");
f (c_parse_file "foo.c");
