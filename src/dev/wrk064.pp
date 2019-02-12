=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,10pt]{article}

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

\def\Title{ {\Slrp} Grammars for Ada 95, Java 1.1 and Pascal }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives grammars for Ada 95, Java 1.1 and Pascal in the {\Slrp} format.}
\end{center}}

\def\Reference{LEMMA1/PPTEX/WRK064}

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

\def\Version{$Revision: 1.1 $%
}
\def\Date{\FormatDate{$Date: 2003/03/04 16:14:13 $%
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
\item[Issues 1.1 (2003/03/04)] First draft.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/11/26]
Tidied up the copyright statements.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

As determined by experience with the template.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}
\begin{center}
\begin{tabular}{ll}
Lemma 1 Development Library
\end{tabular}
\end{center}

\subsection{Acknowledgments}

The layout and narrative in this document is copyright {\copyright} Lemma 1 Ltd.
The technical content has been derived from sources made available on the Internet by
Intermetrics Inc., Dmitri Bronnikov and Philippe Marquet.
See the comments on pages~\ref{Ada95}, \ref{Java11} and~\ref{Pascal}.

\newpage

%%%%% NOW THE CREATIVE BIT:

\section{Introduction}
\subsection{Scope}
This document provides example grammars in the {\Slrp} format.

\subsection{Purpose and Background}

The document is primarily intended for testing the {\Slrp} parser generator.
It is a companion to~\cite{LEMMA1/DEV/WRK063}.

\subsection{Overview}

This document gives a grammars for Ada 95, Java 1.1 and Pascal in the {\Slrp} format.
These have been derived from {\tt yacc} and {\tt bison} grammars for these languages
publicly available for download on the Internet.

The conversion from the {\tt yacc}/{\tt bison} format was semi-automatic:

\begin{enumerate}
\item Replace C style comment symbols with {\Slrp} ones remembering that C comments do not nest;
\item Remove the token declarations;
\item Remove the double-percent delimiters around the grammar and delete
any C code after the grammar;
\item Change the string quotation symbols to backquotes;
\item Replace `:' by `=' after the non-terminal name in each rule;
\item Add a `,' between the grammar symbols on the left-hand side of each rule.
\end{enumerate}

\newpage
\section{Ada 95} \label{Ada95}
=DUMP ada95.grm.txt
(* **** **** **** **** **** **** **** **** **** **** **** **** **** ****
/******* A YACC grammar for Ada 9X *********************************/
/* Copyright (C) Intermetrics, Inc. 1994 Cambridge, MA  USA        */
/* Copying permitted if accompanied by this statement.             */
/* Derivative works are permitted if accompanied by this statement.*/
/* This grammar is thought to be correct as of May 1, 1994         */
/* but as usual there is *no warranty* to that effect.             */
/*******************************************************************/
 * This derivative is a conversion to BS BNF as understood by the SLRP parser generator.
 * SLRP conversion Copyright(C) Lemma 1 Ltd.2003 - present date.
 * Copying and derivatives are permitted if accompanied by this statement
 * and the copyright statement of Intermetrics Inc. quoted above.
 * Rob Arthan. Lemma 1. Ltd 4th March 2003. rda@lemma-one.com
 **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

goal_symbol = compilation
        ;


pragma  = PRAGMA, identifier, `;`
        | PRAGMA, simple_name, `(`, pragma_arg_s, `)`, `;`
        ;

pragma_arg_s = pragma_arg
        | pragma_arg_s, `,`, pragma_arg
        ;

pragma_arg = expression
        | simple_name, RIGHT_SHAFT, expression
        ;

pragma_s =
        | pragma_s, pragma
        ;

decl    = object_decl
        | number_decl
        | type_decl
        | subtype_decl
        | subprog_decl
        | pkg_decl
        | task_decl
        | prot_decl
        | exception_decl
        | rename_decl
        | generic_decl
        | body_stub
        | error, `;`
        ;

object_decl = def_id_s, `:`, object_qualifier_opt, object_subtype_def, init_opt, `;`
        ;

def_id_s = def_id
        | def_id_s, `,`, def_id
        ;

def_id  = identifier
        ;

object_qualifier_opt =
        | ALIASED
        | CONSTANT
        | ALIASED, CONSTANT
        ;

object_subtype_def = subtype_ind
        | array_type
        ;

init_opt =
        | IS_ASSIGNED, expression
        ;

number_decl = def_id_s, `:`, CONSTANT, IS_ASSIGNED, expression, `;`
        ;

type_decl = TYPE, identifier, discrim_part_opt, type_completion, `;`
        ;

discrim_part_opt =
        | discrim_part
        | `(`, BOX, `)`
        ;

type_completion =
        | IS, type_def
        ;

type_def = enumeration_type
        | integer_type
        | real_type
        | array_type
        | record_type
        | access_type
        | derived_type
        | private_type
        ;

subtype_decl = SUBTYPE, identifier, IS, subtype_ind, `;`
        ;

subtype_ind = name, constraint
        | name
        ;

constraint = range_constraint
        | decimal_digits_constraint
        ;

decimal_digits_constraint = DIGITS, expression, range_constr_opt
        ;

derived_type = NEW, subtype_ind
        | NEW, subtype_ind, WITH, PRIVATE
        | NEW, subtype_ind, WITH, record_def
        | ABSTRACT, NEW, subtype_ind, WITH, PRIVATE
        | ABSTRACT, NEW, subtype_ind, WITH, record_def
        ;

range_constraint = RANGE, range
        ;

range = simple_expression, DOT_DOT, simple_expression
        | name, TIC, RANGE
        | name, TIC, RANGE, `(`, expression, `)`
        ;

enumeration_type = `(`, enum_id_s, `)`
        ;

enum_id_s = enum_id
        | enum_id_s, `,`, enum_id
        ;

enum_id = identifier
        | char_lit
        ;

integer_type = range_spec
        | MOD, expression
        ;


range_spec = range_constraint
        ;

range_spec_opt =
        | range_spec
        ;

real_type = float_type
        | fixed_type
        ;

float_type = DIGITS, expression, range_spec_opt
        ;

fixed_type = DELTA, expression, range_spec
        | DELTA, expression, DIGITS, expression, range_spec_opt
        ;

array_type = unconstr_array_type
        | constr_array_type
        ;

unconstr_array_type = ARRAY, `(`, index_s, `)`, OF, component_subtype_def
        ;

constr_array_type = ARRAY, iter_index_constraint, OF, component_subtype_def
        ;

component_subtype_def = aliased_opt, subtype_ind
        ;

aliased_opt =
        | ALIASED
        ;

index_s = index
        | index_s, `,`, index
        ;

index = name, RANGE, BOX
        ;

iter_index_constraint = `(`, iter_discrete_range_s, `)`
        ;

iter_discrete_range_s = discrete_range
        | iter_discrete_range_s, `,`, discrete_range
        ;

discrete_range = name, range_constr_opt
        | range
        ;

range_constr_opt =
        | range_constraint
        ;

record_type = tagged_opt, limited_opt, record_def
        ;

record_def = RECORD, pragma_s, comp_list, END, RECORD
        | NuLL, RECORD
        ;

tagged_opt =
        | TAGGED
        | ABSTRACT, TAGGED
        ;

comp_list = comp_decl_s, variant_part_opt
        | variant_part, pragma_s
        | NuLL, `;`, pragma_s
        ;

comp_decl_s = comp_decl
        | comp_decl_s, pragma_s, comp_decl
        ;

variant_part_opt = pragma_s
        | pragma_s, variant_part, pragma_s
        ;

comp_decl = def_id_s, `:`, component_subtype_def, init_opt, `;`
        | error, `;`
        ;

discrim_part = `(`, discrim_spec_s, `)`
        ;

discrim_spec_s = discrim_spec
        | discrim_spec_s, `;`, discrim_spec
        ;

discrim_spec = def_id_s, `:`, access_opt, mark, init_opt
        | error
        ;

access_opt =
        | ACCESS
        ;

variant_part = CASE, simple_name, IS, pragma_s, variant_s, END, CASE, `;`
        ;

variant_s = variant
        | variant_s, variant
        ;

variant = WHEN, choice_s, RIGHT_SHAFT, pragma_s, comp_list
        ;

choice_s = choice
        | choice_s, `|`, choice
        ;

choice = expression
        | discrete_with_range
        | OTHERS
        ;

discrete_with_range = name, range_constraint
        | range
        ;

access_type = ACCESS, subtype_ind
        | ACCESS, CONSTANT, subtype_ind
        | ACCESS, ALL, subtype_ind
        | ACCESS, prot_opt, PROCEDURE, formal_part_opt
        | ACCESS, prot_opt, FUNCTION, formal_part_opt, RETURN, mark
        ;

prot_opt =
        | PROTECTED
        ;

decl_part =
        | decl_item_or_body_s1
        ;

decl_item_s =
        | decl_item_s1
        ;

decl_item_s1 = decl_item
        | decl_item_s1, decl_item
        ;

decl_item = decl
        | use_clause
        | rep_spec
        | pragma
        ;

decl_item_or_body_s1 = decl_item_or_body
        | decl_item_or_body_s1, decl_item_or_body
        ;

decl_item_or_body = body
        | decl_item
        ;

body = subprog_body
        | pkg_body
        | task_body
        | prot_body
        ;

name = simple_name
        | indexed_comp
        | selected_comp
        | attribute
        | operator_symbol
        ;

mark = simple_name
        | mark, TIC, attribute_id
        | mark, `.`, simple_name
        ;

simple_name = identifier
        ;

compound_name = simple_name
        | compound_name, `.`, simple_name
        ;

c_name_list = compound_name
         | c_name_list, `,`, compound_name
        ;

used_char = char_lit
        ;

operator_symbol = char_string
        ;

indexed_comp = name, `(`, value_s, `)`
        ;

value_s = value
        | value_s, `,`, value
        ;

value = expression
        | comp_assoc
        | discrete_with_range
        | error
        ;

selected_comp = name, `.`, simple_name
        | name, `.`, used_char
        | name, `.`, operator_symbol
        | name, `.`, ALL
        ;

attribute = name, TIC, attribute_id
        ;

attribute_id = identifier
        | DIGITS
        | DELTA
        | ACCESS
        ;

literal = numeric_lit
        | used_char
        | NuLL
        ;

aggregate = `(`, comp_assoc, `)`
        | `(`, value_s_2, `)`
        | `(`, expression, WITH, value_s, `)`
        | `(`, expression, WITH, NuLL, RECORD, `)`
        | `(`, NuLL, RECORD, `)`
        ;

value_s_2 = value, `,`, value
        | value_s_2, `,`, value
        ;

comp_assoc = choice_s, RIGHT_SHAFT, expression
        ;

expression = relation
        | expression, logical, relation
        | expression, short_circuit, relation
        ;

logical = AND
        | OR
        | XOR
        ;

short_circuit = AND, THEN
        | OR, ELSE
        ;

relation = simple_expression
        | simple_expression, relational, simple_expression
        | simple_expression, membership, range
        | simple_expression, membership, name
        ;

relational = `=`
        | NE
        | `<`
        | LT_EQ
        | `>`
        | GE
        ;

membership = IN
        | NOT, IN
        ;

simple_expression = unary, term
        | term
        | simple_expression, adding, term
        ;

unary   = `+`
        | `-`
        ;

adding  = `+`
        | `-`
        | `&`
        ;

term    = factor
        | term, multiplying, factor
        ;

multiplying = `*`
        | `/`
        | MOD
        | REM
        ;

factor = primary
        | NOT, primary
        | ABS, primary
        | primary, EXPON, primary
        ;

primary = literal
        | name
        | allocator
        | qualified
        | parenthesized_primary
        ;

parenthesized_primary = aggregate
        | `(`, expression, `)`
        ;

qualified = name, TIC, parenthesized_primary
        ;

allocator = NEW, name
        | NEW, qualified
        ;

statement_s = statement
        | statement_s, statement
        ;

statement = unlabeled
        | label, statement
        ;

unlabeled = simple_stmt
        | compound_stmt
        | pragma
        ;

simple_stmt = null_stmt
        | assign_stmt
        | exit_stmt
        | return_stmt
        | goto_stmt
        | procedure_call
        | delay_stmt
        | abort_stmt
        | raise_stmt
        | code_stmt
        | requeue_stmt
        | error, `;`
        ;

compound_stmt = if_stmt
        | case_stmt
        | loop_stmt
        | block
        | accept_stmt
        | select_stmt
        ;

label = LT_LT, identifier, GT_GT
        ;

null_stmt = NuLL, `;`
        ;

assign_stmt = name, IS_ASSIGNED, expression, `;`
        ;

if_stmt = IF, cond_clause_s, else_opt, END, IF, `;`
        ;

cond_clause_s = cond_clause
        | cond_clause_s, ELSIF, cond_clause
        ;

cond_clause = cond_part, statement_s
        ;

cond_part = condition, THEN
        ;

condition = expression
        ;

else_opt =
        | ELSE, statement_s
        ;

case_stmt = case_hdr, pragma_s, alternative_s, END, CASE, `;`
        ;

case_hdr = CASE, expression, IS
        ;

alternative_s =
        | alternative_s, alternative
        ;

alternative = WHEN, choice_s, RIGHT_SHAFT, statement_s
        ;

loop_stmt = label_opt, iteration, basic_loop, id_opt, `;`
        ;

label_opt =
        | identifier, `:`
        ;

iteration =
        | WHILE, condition
        | iter_part, reverse_opt, discrete_range
        ;

iter_part = FOR, identifier, IN
        ;

reverse_opt =
        | REVERSE
        ;

basic_loop = LOOP, statement_s, END, LOOP
        ;

id_opt =
        | designator
        ;

block = label_opt, block_decl, block_body, END, id_opt, `;`
        ;

block_decl =
        | DECLARE, decl_part
        ;

block_body = BEGiN, handled_stmt_s
        ;

handled_stmt_s = statement_s, except_handler_part_opt
        ;

except_handler_part_opt =
        | except_handler_part
        ;

exit_stmt = EXIT, name_opt, when_opt, `;`
        ;

name_opt =
        | name
        ;

when_opt =
        | WHEN, condition
        ;

return_stmt = RETURN, `;`
        | RETURN, expression, `;`
        ;

goto_stmt = GOTO, name, `;`
        ;

subprog_decl = subprog_spec, `;`
        | generic_subp_inst, `;`
        | subprog_spec_is_push, ABSTRACT, `;`
        ;

subprog_spec = PROCEDURE, compound_name, formal_part_opt
        | FUNCTION, designator, formal_part_opt, RETURN, name
        | FUNCTION, designator  (* for generic inst, and generic rename *)
        ;

designator = compound_name
        | char_string
        ;

formal_part_opt =
        | formal_part
        ;

formal_part = `(`, param_s, `)`
        ;

param_s = param
        | param_s, `;`, param
        ;

param = def_id_s, `:`, mode, mark, init_opt
        | error
        ;

mode =
        | IN
        | OUT
        | IN, OUT
        | ACCESS
        ;

subprog_spec_is_push = subprog_spec, IS
        ;

subprog_body = subprog_spec_is_push,
               decl_part, block_body, END, id_opt, `;`
        ;

procedure_call = name, `;`
        ;

pkg_decl = pkg_spec, `;`
        | generic_pkg_inst, `;`
        ;

pkg_spec = PACKAGE, compound_name, IS,
             decl_item_s, private_part, END, c_id_opt
        ;

private_part =
        | PRIVATE, decl_item_s
        ;

c_id_opt =
        | compound_name
        ;

pkg_body = PACKAGE, BODY, compound_name, IS,
               decl_part, body_opt, END, c_id_opt, `;`
        ;

body_opt =
        | block_body
        ;

private_type = tagged_opt, limited_opt, PRIVATE
        ;

limited_opt =
        | LIMITED
        ;

use_clause = USE, name_s, `;`
        | USE, TYPE, name_s, `;`
        ;

name_s = name
        | name_s, `,`, name
        ;

rename_decl = def_id_s, `:`, object_qualifier_opt, subtype_ind, renames, `;`
        | def_id_s, `:`, EXCEPTION, renames, `;`
        | rename_unit
        ;

rename_unit = PACKAGE, compound_name, renames, `;`
        | subprog_spec, renames, `;`
        | generic_formal_part, PACKAGE, compound_name, renames, `;`
        | generic_formal_part, subprog_spec, renames, `;`
        ;

renames = RENAMES, name
        ;

task_decl = task_spec, `;`
        ;

task_spec = TASK, simple_name, task_def
        | TASK, TYPE, simple_name, discrim_part_opt, task_def
        ;

task_def =
        | IS, entry_decl_s, rep_spec_s, task_private_opt, END, id_opt
        ;

task_private_opt =
        | PRIVATE, entry_decl_s, rep_spec_s
        ;

task_body = TASK, BODY, simple_name, IS,
               decl_part, block_body, END, id_opt, `;`
        ;

prot_decl = prot_spec, `;`
        ;

prot_spec = PROTECTED, identifier, prot_def
        | PROTECTED, TYPE, simple_name, discrim_part_opt, prot_def
        ;

prot_def = IS, prot_op_decl_s, prot_private_opt, END, id_opt
        ;

prot_private_opt =
        | PRIVATE, prot_elem_decl_s
        ;


prot_op_decl_s =
        | prot_op_decl_s, prot_op_decl
        ;

prot_op_decl = entry_decl
        | subprog_spec, `;`
        | rep_spec
        | pragma
        ;

prot_elem_decl_s =
        | prot_elem_decl_s, prot_elem_decl
        ;

prot_elem_decl = prot_op_decl | comp_decl ;

prot_body = PROTECTED, BODY, simple_name, IS,
               prot_op_body_s, END, id_opt, `;`
        ;

prot_op_body_s = pragma_s
        | prot_op_body_s, prot_op_body, pragma_s
        ;

prot_op_body = entry_body
        | subprog_body
        | subprog_spec, `;`
        ;

entry_decl_s = pragma_s
        | entry_decl_s, entry_decl, pragma_s
        ;

entry_decl = ENTRY, identifier, formal_part_opt, `;`
        | ENTRY, identifier, `(`, discrete_range, `)`, formal_part_opt, `;`
        ;

entry_body = ENTRY, identifier, formal_part_opt, WHEN, condition, entry_body_part
        | ENTRY, identifier, `(`, iter_part, discrete_range, `)`,
                formal_part_opt, WHEN, condition, entry_body_part
        ;

entry_body_part = `;`
        | IS, decl_part, block_body, END, id_opt, `;`
        ;

rep_spec_s =
        | rep_spec_s, rep_spec, pragma_s
        ;

entry_call = procedure_call
        ;

accept_stmt = accept_hdr, `;`
        | accept_hdr, DO, handled_stmt_s, END, id_opt, `;`
        ;

accept_hdr = ACCEPT, entry_name, formal_part_opt
        ;

entry_name = simple_name
        | entry_name, `(`, expression, `)`
        ;

delay_stmt = DELAY, expression, `;`
        | DELAY, UNTIL, expression, `;`
        ;

select_stmt = select_wait
        | async_select
        | timed_entry_call
        | cond_entry_call
        ;

select_wait = SELECT, guarded_select_alt, or_select, else_opt,
              END, SELECT, `;`
        ;

guarded_select_alt = select_alt
        | WHEN, condition, RIGHT_SHAFT, select_alt
        ;

or_select =
        | or_select, OR, guarded_select_alt
        ;

select_alt = accept_stmt, stmts_opt
        | delay_stmt, stmts_opt
        | TERMINATE, `;`
        ;

delay_or_entry_alt = delay_stmt, stmts_opt
        | entry_call, stmts_opt
        ;

async_select = SELECT, delay_or_entry_alt,
               THEN, ABORT, statement_s,
               END, SELECT, `;`
        ;

timed_entry_call = SELECT, entry_call, stmts_opt,
                   OR, delay_stmt, stmts_opt,
                   END, SELECT, `;`
        ;

cond_entry_call = SELECT, entry_call, stmts_opt,
                  ELSE, statement_s,
                  END, SELECT, `;`
        ;

stmts_opt =
        | statement_s
        ;

abort_stmt = ABORT, name_s, `;`
        ;

compilation =
        | compilation, comp_unit
        | pragma, pragma_s
        ;

comp_unit = context_spec, private_opt, unit, pragma_s
        | private_opt, unit, pragma_s
        ;

private_opt =
        | PRIVATE
        ;

context_spec = with_clause, use_clause_opt
        | context_spec, with_clause, use_clause_opt
        | context_spec, pragma
        ;

with_clause = WITH, c_name_list, `;`
        ;

use_clause_opt =
        | use_clause_opt, use_clause
        ;

unit = pkg_decl
        | pkg_body
        | subprog_decl
        | subprog_body
        | subunit
        | generic_decl
        | rename_unit
        ;

subunit = SEPARATE, `(`, compound_name, `)`,
              subunit_body
        ;

subunit_body = subprog_body
        | pkg_body
        | task_body
        | prot_body
        ;

body_stub = TASK, BODY, simple_name, IS, SEPARATE, `;`
        | PACKAGE, BODY, compound_name, IS, SEPARATE, `;`
        | subprog_spec, IS, SEPARATE, `;`
        | PROTECTED, BODY, simple_name, IS, SEPARATE, `;`
        ;

exception_decl = def_id_s, `:`, EXCEPTION, `;`
        ;

except_handler_part = EXCEPTION, exception_handler
        | except_handler_part, exception_handler
        ;

exception_handler = WHEN, except_choice_s, RIGHT_SHAFT, statement_s
        | WHEN, identifier, `:`, except_choice_s, RIGHT_SHAFT, statement_s
        ;

except_choice_s = except_choice
        | except_choice_s, `|`, except_choice
        ;

except_choice = name
        | OTHERS
        ;

raise_stmt = RAISE, name_opt, `;`
        ;

requeue_stmt = REQUEUE, name, `;`
        | REQUEUE, name, WITH, ABORT, `;`
        ;

generic_decl = generic_formal_part, subprog_spec, `;`
        | generic_formal_part, pkg_spec, `;`
        ;

generic_formal_part = GENERIC
        | generic_formal_part, generic_formal
        ;

generic_formal = param, `;`
        | TYPE, simple_name, generic_discrim_part_opt, IS, generic_type_def, `;`
        | WITH, PROCEDURE, simple_name,
            formal_part_opt, subp_default, `;`
        | WITH, FUNCTION, designator,
            formal_part_opt, RETURN, name, subp_default, `;`
        | WITH, PACKAGE, simple_name, IS, NEW, name, `(`, BOX, `)`, `;`
        | WITH, PACKAGE, simple_name, IS, NEW, name, `;`
        | use_clause
        ;

generic_discrim_part_opt =
        | discrim_part
        | `(`, BOX, `)`
        ;

subp_default =
        | IS, name
        | IS, BOX
        ;

generic_type_def = `(`, BOX, `)`
        | RANGE, BOX
        | MOD, BOX
        | DELTA, BOX
        | DELTA, BOX, DIGITS, BOX
        | DIGITS, BOX
        | array_type
        | access_type
        | private_type
        | generic_derived_type
        ;

generic_derived_type = NEW, subtype_ind
        | NEW, subtype_ind, WITH, PRIVATE
        | ABSTRACT, NEW, subtype_ind, WITH, PRIVATE
        ;

generic_subp_inst = subprog_spec, IS, generic_inst
        ;

generic_pkg_inst = PACKAGE, compound_name, IS, generic_inst
        ;

generic_inst = NEW, name
        ;

rep_spec = attrib_def
        | record_type_spec
        | address_spec
        ;

attrib_def = FOR, mark, USE, expression, `;`
        ;

record_type_spec = FOR, mark, USE, RECORD, align_opt, comp_loc_s, END, RECORD, `;`
        ;

align_opt =
        | AT, MOD, expression, `;`
        ;

comp_loc_s =
        | comp_loc_s, mark, AT, expression, RANGE, range, `;`
        ;

address_spec = FOR, mark, USE, AT, expression, `;`
        ;

code_stmt = qualified, `;`
        ;
=TEX
=SH
slrp -g -l 2  -f ada95.grm.txt >ada95.grm.run
=TEX
\newpage
\section{Java 1.1} \label{Java11}
=TEX


=DUMP java11.grm.txt
(* **** **** **** **** **** **** **** **** **** **** **** **** **** ****
 * Copyright (C)
 *   1996, 1997, 1998 Dmitri Bronnikov, All rights reserved.
 *
 * THIS GRAMMAR IS PROVIDED "AS IS" WITHOUT  ANY  EXPRESS  OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES  OF  MERCHANTABILITY  AND  FITNESS  FOR  A  PARTICULAR
 * PURPOSE, OR NON-INFRINGMENT.
 *
 * Bronikov@inreach.com
 *
 * This derivative is a conversion to BS BNF as understood by the SLRP parser generator.
 * SLRP conversion Copyright(C) Lemma 1 Ltd. 2003 - present date.
 * Copying and derivatives are permitted if accompanied by this statement
 * and the copyright statement of Dmitri Bronnikov quoted above.
 * Rob Arthan. Lemma 1. Ltd 4th March 2003. rda@lemma-one.com
 * **** **** **** **** **** **** **** **** **** **** **** **** **** ****
 *
 * VERSION 1.06 DATE 20 AUG 1998
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** ****
 *
 * UPDATES
 *
 * 1.06 Correction of Java 1.1 syntax
 * 1.05 Yet more Java 1.1
 *      <qualified name>.<allocation expression>
 * 1.04 More Java 1.1 features:
 *      <class name>.this
 *      <type name>.class
 * 1.03 Added Java 1.1 features:
 *      inner classes,
 *      anonymous classes,
 *      non-static initializer blocks,
 *      array initialization by new operator
 * 1.02 Corrected cast expression syntax
 * 1.01 All shift/reduce conflicts, except dangling else, resolved
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** ****
 *
 * PARSING CONFLICTS RESOLVED
 *
 * Some Shift/Reduce conflicts have been resolved at the expense of
 * the grammar defines a superset of the language. The following
 * actions have to be performed to complete program syntax checking:
 *
 * 1) Check that modifiers applied to a class, interface, field,
 *    or constructor are allowed in respectively a class, inteface,
 *    field or constructor declaration. For example, a class
 *    declaration should not allow other modifiers than abstract,
 *    final and public.
 *
 * 2) For an expression statement, check it is either increment, or
 *    decrement, or assignment expression.
 *
 * 3) Check that type expression in a cast operator indicates a type.
 *    Some of the compilers that I have tested will allow simultaneous
 *    use of identically named type and variable in the same scope
 *    depending on context.
 *
 * 4) Change lexical definition to change '[' optionally followed by
 *    any number of white-space characters immediately followed by ']'
 *    to OP_DIM token. I defined this token as [\[]{white_space}*[\]]
 *    in the lexer.
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** ****
 *
 * UNRESOLVED SHIFT/REDUCE CONFLICTS
 *
 * Dangling else in if-then-else
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** ****
  **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)
Start = CompilationUnit;

TypeSpecifier
        = TypeName
        | TypeName, Dims
        ;

TypeName
        = PrimitiveType
        | QualifiedName
        ;

ClassNameList
        = QualifiedName
        | ClassNameList, `,`, QualifiedName
        ;

PrimitiveType
        = BOOLEAN
        | CHAR
        | BYTE
        | SHORT
        | INT
        | LONG
        | FLOAT
        | DOUBLE
        | VOID
        ;

SemiColons
        = `;`
        | SemiColons, `;`
        ;

CompilationUnit
        = ProgramFile
        ;

ProgramFile
        = PackageStatement, ImportStatements, TypeDeclarations
        | PackageStatement, ImportStatements
        | PackageStatement,                  TypeDeclarations
        |                  ImportStatements, TypeDeclarations
        | PackageStatement
        |                  ImportStatements
        |                                   TypeDeclarations
        ;

PackageStatement
        = PACKAGE, QualifiedName, SemiColons
        ;

TypeDeclarations
        = TypeDeclarationOptSemi
        | TypeDeclarations, TypeDeclarationOptSemi
        ;

TypeDeclarationOptSemi
        = TypeDeclaration
        | TypeDeclaration, SemiColons
        ;

ImportStatements
        = ImportStatement
        | ImportStatements, ImportStatement
        ;

ImportStatement
        = IMPORT, QualifiedName, SemiColons
        | IMPORT, QualifiedName, `.`, `*`, SemiColons
        ;

QualifiedName
        = IDENTIFIER
        | QualifiedName, `.`, IDENTIFIER
        ;

TypeDeclaration
        = ClassHeader, `{`, FieldDeclarations, `}`
        | ClassHeader, `{`, `}`
        ;

ClassHeader
        = Modifiers, ClassWord, IDENTIFIER, Extends, Interfaces
        | Modifiers, ClassWord, IDENTIFIER, Extends
        | Modifiers, ClassWord, IDENTIFIER,       Interfaces
        |           ClassWord, IDENTIFIER, Extends, Interfaces
        | Modifiers, ClassWord, IDENTIFIER
        |           ClassWord, IDENTIFIER, Extends
        |           ClassWord, IDENTIFIER,       Interfaces
        |           ClassWord, IDENTIFIER
        ;

Modifiers
        = Modifier
        | Modifiers, Modifier
        ;

Modifier
        = ABSTRACT
        | FINAL
        | PUBLIC
        | PROTECTED
        | PRIVATE
        | STATIC
        | TRANSIENT
        | VOLATILE
        | NATIVE
        | SYNCHRONIZED
        ;

ClassWord
        = CLASS
        | INTERFACE
        ;

Interfaces
        = IMPLEMENTS, ClassNameList
        ;

FieldDeclarations
        = FieldDeclarationOptSemi
        | FieldDeclarations, FieldDeclarationOptSemi
        ;

FieldDeclarationOptSemi
        = FieldDeclaration
        | FieldDeclaration, SemiColons
        ;

FieldDeclaration
        = FieldVariableDeclaration, `;`
        | MethodDeclaration
        | ConstructorDeclaration
        | StaticInitializer
        | NonStaticInitializer
        | TypeDeclaration
        ;

FieldVariableDeclaration
        = Modifiers, TypeSpecifier, VariableDeclarators
        |           TypeSpecifier, VariableDeclarators
        ;

VariableDeclarators
        = VariableDeclarator
        | VariableDeclarators, `,`, VariableDeclarator
        ;

VariableDeclarator
        = DeclaratorName
        | DeclaratorName, `=`, VariableInitializer
        ;

VariableInitializer
        = Expression
        | `{`, `}`
        | `{`, ArrayInitializers, `}`
        ;

ArrayInitializers
        = VariableInitializer
        | ArrayInitializers, `,`, VariableInitializer
        | ArrayInitializers, `,`
        ;

MethodDeclaration
        = Modifiers, TypeSpecifier, MethodDeclarator, Throws, MethodBody
        | Modifiers, TypeSpecifier, MethodDeclarator,        MethodBody
        |           TypeSpecifier, MethodDeclarator, Throws, MethodBody
        |           TypeSpecifier, MethodDeclarator,        MethodBody
        ;

MethodDeclarator
        = DeclaratorName, `(`, ParameterList, `)`
        | DeclaratorName, `(`, `)`
        | MethodDeclarator, OP_DIM
        ;

ParameterList
        = Parameter
        | ParameterList, `,`, Parameter
        ;

Parameter
        = TypeSpecifier, DeclaratorName
        | FINAL, TypeSpecifier, DeclaratorName
        ;

DeclaratorName
        = IDENTIFIER
        | DeclaratorName, OP_DIM
        ;

Throws
        = THROWS, ClassNameList
        ;

MethodBody
        = Block
        | `;`
        ;

ConstructorDeclaration
        = Modifiers, ConstructorDeclarator, Throws, Block
        | Modifiers, ConstructorDeclarator,        Block
        |           ConstructorDeclarator, Throws, Block
        |           ConstructorDeclarator,        Block
        ;

ConstructorDeclarator
        = IDENTIFIER, `(`, ParameterList, `)`
        | IDENTIFIER, `(`, `)`
        ;

StaticInitializer
        = STATIC, Block
        ;

NonStaticInitializer
        = Block
        ;

Extends
        = EXTENDS, TypeName
        | Extends, `,`, TypeName
        ;

Block
        = `{`, LocalVariableDeclarationsAndStatements, `}`
        | `{`, `}`
        ;

LocalVariableDeclarationsAndStatements
        = LocalVariableDeclarationOrStatement
        | LocalVariableDeclarationsAndStatements, LocalVariableDeclarationOrStatement
        ;

LocalVariableDeclarationOrStatement
        = LocalVariableDeclarationStatement
        | Statement
        ;

LocalVariableDeclarationStatement
        = TypeSpecifier, VariableDeclarators, `;`
        | FINAL, TypeSpecifier, VariableDeclarators, `;`
        ;

Statement
        = EmptyStatement
        | LabelStatement
        | ExpressionStatement, `;`
        | SelectionStatement
        | IterationStatement
        | JumpStatement
        | GuardingStatement
        | Block
        ;

EmptyStatement
        = `;`
        ;

LabelStatement
        = IDENTIFIER, `:`
        | CASE, ConstantExpression, `:`
        | DEFAULT, `:`
        ;

ExpressionStatement
        = Expression
        ;

SelectionStatement
        = IF, `(`, Expression, `)`, Statement
        | IF, `(`, Expression, `)`, Statement, ELSE, Statement
        | SWITCH, `(`, Expression, `)`, Block
        ;

IterationStatement
        = WHILE, `(`, Expression, `)`, Statement
        | DO, Statement, WHILE, `(`, Expression, `)`, `;`
        | FOR, `(`, ForInit, ForExpr, ForIncr, `)`, Statement
        | FOR, `(`, ForInit, ForExpr,         `)`, Statement
        ;

ForInit
        = ExpressionStatements, `;`
        | LocalVariableDeclarationStatement
        | `;`
        ;

ForExpr
        = Expression, `;`
        | `;`
        ;

ForIncr
        = ExpressionStatements
        ;

ExpressionStatements
        = ExpressionStatement
        | ExpressionStatements, `,`, ExpressionStatement
        ;

JumpStatement
        = BREAK, IDENTIFIER, `;`
        | BREAK,            `;`
        | CONTINUE, IDENTIFIER, `;`
        | CONTINUE,            `;`
        | RETURN, Expression, `;`
        | RETURN,            `;`
        | THROW, Expression, `;`
        ;

GuardingStatement
        = SYNCHRONIZED, `(`, Expression, `)`, Statement
        | TRY, Block, Finally
        | TRY, Block, Catches
        | TRY, Block, Catches, Finally
        ;

Catches
        = Catch
        | Catches, Catch
        ;

Catch
        = CatchHeader, Block
        ;

CatchHeader
        = CATCH, `(`, TypeSpecifier, IDENTIFIER, `)`
        | CATCH, `(`, TypeSpecifier, `)`
        ;

Finally
        = FINALLY, Block
        ;

PrimaryExpression
        = QualifiedName
        | NotJustName
        ;

NotJustName
        = SpecialName
        | NewAllocationExpression
        | ComplexPrimary
        ;

ComplexPrimary
        = `(`, Expression, `)`
        | ComplexPrimaryNoParenthesis
        ;

ComplexPrimaryNoParenthesis
        = LITERAL
        | BOOLLIT
        | ArrayAccess
        | FieldAccess
        | MethodCall
        ;

ArrayAccess
        = QualifiedName, `[`, Expression, `]`
        | ComplexPrimary, `[`, Expression, `]`
        ;

FieldAccess
        = NotJustName, `.`, IDENTIFIER
        | RealPostfixExpression, `.`, IDENTIFIER
        | QualifiedName, `.`, THIS
        | QualifiedName, `.`, CLASS
        | PrimitiveType, `.`, CLASS
        ;

MethodCall
        = MethodAccess, `(`, ArgumentList, `)`
        | MethodAccess, `(`, `)`
        ;

MethodAccess
        = ComplexPrimaryNoParenthesis
        | SpecialName
        | QualifiedName
        ;

SpecialName
        = THIS
        | SUPER
        | JNULL
        ;

ArgumentList
        = Expression
        | ArgumentList, `,`, Expression
        ;

NewAllocationExpression
        = PlainNewAllocationExpression
        | QualifiedName, `.`, PlainNewAllocationExpression
        ;

PlainNewAllocationExpression
        = ArrayAllocationExpression
        | ClassAllocationExpression
        | ArrayAllocationExpression, `{`, `}`
        | ClassAllocationExpression, `{`, `}`
        | ArrayAllocationExpression, `{`, ArrayInitializers, `}`
        | ClassAllocationExpression, `{`, FieldDeclarations, `}`
        ;

ClassAllocationExpression
        = NEW, TypeName, `(`, ArgumentList, `)`
        | NEW, TypeName, `(`,              `)`
        ;

ArrayAllocationExpression
        = NEW, TypeName, DimExprs, Dims
        | NEW, TypeName, DimExprs
        | NEW, TypeName, Dims
        ;

DimExprs
        = DimExpr
        | DimExprs, DimExpr
        ;

DimExpr
        = `[`, Expression, `]`
        ;

Dims
        = OP_DIM
        | Dims, OP_DIM
        ;

PostfixExpression
        = PrimaryExpression
        | RealPostfixExpression
        ;

RealPostfixExpression
        = PostfixExpression, OP_INC
        | PostfixExpression, OP_DEC
        ;

UnaryExpression
        = OP_INC, UnaryExpression
        | OP_DEC, UnaryExpression
        | ArithmeticUnaryOperator, CastExpression
        | LogicalUnaryExpression
        ;

LogicalUnaryExpression
        = PostfixExpression
        | LogicalUnaryOperator, UnaryExpression
        ;

LogicalUnaryOperator
        = `~`
        | `!`
        ;

ArithmeticUnaryOperator
        = `+`
        | `-`
        ;

CastExpression
        = UnaryExpression
        | `(`, PrimitiveTypeExpression, `)`, CastExpression
        | `(`, ClassTypeExpression, `)`, CastExpression
        | `(`, Expression, `)`, LogicalUnaryExpression
        ;

PrimitiveTypeExpression
        = PrimitiveType
        | PrimitiveType, Dims
        ;

ClassTypeExpression
        = QualifiedName, Dims
        ;

MultiplicativeExpression
        = CastExpression
        | MultiplicativeExpression, `*`, CastExpression
        | MultiplicativeExpression, `/`, CastExpression
        | MultiplicativeExpression, `%`, CastExpression
        ;

AdditiveExpression
        = MultiplicativeExpression
        | AdditiveExpression, `+`, MultiplicativeExpression
        | AdditiveExpression, `-`, MultiplicativeExpression
        ;

ShiftExpression
        = AdditiveExpression
        | ShiftExpression, OP_SHL, AdditiveExpression
        | ShiftExpression, OP_SHR, AdditiveExpression
        | ShiftExpression, OP_SHRR, AdditiveExpression
        ;

RelationalExpression
        = ShiftExpression
        | RelationalExpression, `<`, ShiftExpression
        | RelationalExpression, `>`, ShiftExpression
        | RelationalExpression, OP_LE, ShiftExpression
        | RelationalExpression, OP_GE, ShiftExpression
        | RelationalExpression, INSTANCEOF, TypeSpecifier
        ;

EqualityExpression
        = RelationalExpression
        | EqualityExpression, OP_EQ, RelationalExpression
        | EqualityExpression, OP_NE, RelationalExpression
        ;

AndExpression
        = EqualityExpression
        | AndExpression, `&`, EqualityExpression
        ;

ExclusiveOrExpression
        = AndExpression
        | ExclusiveOrExpression, `^`, AndExpression
        ;

InclusiveOrExpression
        = ExclusiveOrExpression
        | InclusiveOrExpression, `|`, ExclusiveOrExpression
        ;

ConditionalAndExpression
        = InclusiveOrExpression
        | ConditionalAndExpression, OP_LAND, InclusiveOrExpression
        ;

ConditionalOrExpression
        = ConditionalAndExpression
        | ConditionalOrExpression, OP_LOR, ConditionalAndExpression
        ;

ConditionalExpression
        = ConditionalOrExpression
        | ConditionalOrExpression, `?`, Expression, `:`, ConditionalExpression
        ;

AssignmentExpression
        = ConditionalExpression
        | UnaryExpression, AssignmentOperator, AssignmentExpression
        ;

AssignmentOperator
        = `=`
        | ASS_MUL
        | ASS_DIV
        | ASS_MOD
        | ASS_ADD
        | ASS_SUB
        | ASS_SHL
        | ASS_SHR
        | ASS_SHRR
        | ASS_AND
        | ASS_XOR
        | ASS_OR
        ;

Expression
        = AssignmentExpression
        ;

ConstantExpression
        = ConditionalExpression
        ;
=SH
slrp -g -l 2  -f java11.grm.txt > java11.grm.run
=TEX
\newpage
\section{Pascal} \label{Pascal}
=TEX
=DUMP pascal.grm.txt
(* **** **** **** **** **** **** **** **** **** **** **** **** **** ****
Acknowledgments to Philippe Marquet, who provides this grammar on the World Wide Web
at URL http://www.lifl.fr/~marquet/ens/pcp/pcp017.html as Annexe A of his book
Travaux Diriges et Travaux Pratiques pour la Construction d'un Petit Compilateur de Pascal.

* Pascal grammar in Yacc format,based originally on BNF given
* in "Standard Pascal -- User Reference Manual", by Doug Cooper.
* This in turn is the BNF given by the ANSI and ISO Pascal standards,
* and so, is PUBLIC DOMAIN. The grammar is for ISO Level 0 Pascal.
* The grammar has been massaged somewhat to make it LALR, and added
* the following extensions.
*
* constant expressions
* otherwise statement in a case
* productions to correctly match else's with if's
* beginnings of a separate compilation facility
*
* What follows is a conversion by Rob Arthan of Philippe Marquet's yacc grammar
* into BS BNF as understood by the SLRP parser generator. Like the original
* this conversion is in the public domain.
***** **** **** **** **** **** **** **** **** **** **** **** **** **** *)
file    = program
        | module
        ;

program = program_heading, semicolon, block, DOT
        ;

program_heading = PROGRAM, identifier
        | PROGRAM, identifier, LPAREN, identifier_list, RPAREN
        ;

identifier_list = identifier_list, comma, identifier
        | identifier
        ;

block = label_declaration_part,
        constant_definition_part,
        type_definition_part,
        variable_declaration_part,
        procedure_and_function_declaration_part,
        statement_part
        ;

module = constant_definition_part,
        type_definition_part,
        variable_declaration_part,
        procedure_and_function_declaration_part
        ;

label_declaration_part = LABEL, label_list, semicolon
        |
        ;

label_list = label_list, comma, label
        | label
        ;

label = DIGSEQ
        ;

constant_definition_part = CONST, constant_list
        |
        ;

constant_list = constant_list, constant_definition
        | constant_definition
        ;

constant_definition = identifier, EQUAL, cexpression, semicolon
        ;

(*constant = cexpression ;               good stuff! *)

cexpression = csimple_expression
        | csimple_expression, relop, csimple_expression
        ;

csimple_expression = cterm
        | csimple_expression, addop, cterm
        ;

cterm = cfactor
        | cterm, mulop, cfactor
        ;

cfactor = sign, cfactor
        | cexponentiation
        ;

cexponentiation = cprimary
        | cprimary, STARSTAR, cexponentiation
        ;

cprimary = identifier
        | LPAREN, cexpression, RPAREN
        | unsigned_constant
        | NOT, cprimary
        ;

constant = non_string
        | sign, non_string
        | CHARACTER_STRING
        ;

sign = PLUS
        | MINUS
        ;

non_string = DIGSEQ
        | identifier
        | REALNUMBER
        ;

type_definition_part = TYPE, type_definition_list
        |
        ;

type_definition_list = type_definition_list, type_definition
        | type_definition
        ;

type_definition = identifier, EQUAL, type_denoter, semicolon
        ;

type_denoter = identifier
        | new_type
        ;

new_type = new_ordinal_type
        | new_structured_type
        | new_pointer_type
        ;

new_ordinal_type = enumerated_type
        | subrange_type
        ;

enumerated_type = LPAREN, identifier_list, RPAREN
        ;

subrange_type = constant, DOTDOT, constant
        ;

new_structured_type = structured_type
        | PACKED, structured_type
        ;

structured_type = array_type
        | record_type
        | set_type
        | file_type
        ;

array_type = ARRAY, LBRAC, index_list, RBRAC, OF, component_type
        ;

index_list = index_list, comma, index_type
        | index_type
        ;

index_type = ordinal_type ;

ordinal_type = new_ordinal_type
        | identifier
        ;

component_type = type_denoter ;

record_type = RECORD, record_section_list, END
        | RECORD, record_section_list, semicolon, variant_part, END
        | RECORD, variant_part, END
        ;

record_section_list = record_section_list, semicolon, record_section
        | record_section
        ;

record_section = identifier_list, COLON, type_denoter
        ;

variant_part = CASE, variant_selector, OF, variant_list, semicolon
        | CASE, variant_selector, OF, variant_list
        |
        ;

variant_selector = tag_field, COLON, tag_type
        | tag_type
        ;

variant_list = variant_list, semicolon, variant
        | variant
        ;

variant = case_constant_list, COLON, LPAREN, record_section_list, RPAREN
        | case_constant_list, COLON, LPAREN, record_section_list, semicolon,
                variant_part, RPAREN
        | case_constant_list, COLON, LPAREN, variant_part, RPAREN
        ;

case_constant_list = case_constant_list, comma, case_constant
        | case_constant
        ;

case_constant = constant
        | constant, DOTDOT, constant
        ;

tag_field = identifier ;

tag_type = identifier ;

set_type = SET, OF, base_type
        ;

base_type = ordinal_type ;

file_type = PFILE, OF, component_type
        ;

new_pointer_type = UPARROW, domain_type
        ;

domain_type = identifier ;

variable_declaration_part = VAR, variable_declaration_list, semicolon
        |
        ;

variable_declaration_list =
          variable_declaration_list, semicolon, variable_declaration
        | variable_declaration
        ;

variable_declaration = identifier_list, COLON, type_denoter
        ;

procedure_and_function_declaration_part =
          proc_or_func_declaration_list, semicolon
        |
        ;

proc_or_func_declaration_list =
          proc_or_func_declaration_list, semicolon, proc_or_func_declaration
        | proc_or_func_declaration
        ;

proc_or_func_declaration = procedure_declaration
        | function_declaration
        ;

procedure_declaration = procedure_heading, semicolon, directive
        | procedure_heading, semicolon, procedure_block
        ;

procedure_heading = procedure_identification
        | procedure_identification, formal_parameter_list
        ;

directive = FORWARD
        | EXTERNAL
        ;

formal_parameter_list = LPAREN, formal_parameter_section_list, RPAREN ;

formal_parameter_section_list =
          formal_parameter_section_list, semicolon, formal_parameter_section
        | formal_parameter_section
        ;

formal_parameter_section = value_parameter_specification
        | variable_parameter_specification
        | procedural_parameter_specification
        | functional_parameter_specification
        ;

value_parameter_specification = identifier_list, COLON, identifier
        ;

variable_parameter_specification = VAR, identifier_list, COLON, identifier
        ;

procedural_parameter_specification = procedure_heading ;

functional_parameter_specification = function_heading ;

procedure_identification = PROCEDURE, identifier ;

procedure_block = block ;

function_declaration = function_heading, semicolon, directive
        | function_identification, semicolon, function_block
        | function_heading, semicolon, function_block
        ;

function_heading = FUNCTION, identifier, COLON, result_type
        | FUNCTION, identifier, formal_parameter_list, COLON, result_type
        ;

result_type = identifier ;

function_identification = FUNCTION, identifier ;

function_block = block ;

statement_part = compound_statement ;

compound_statement = PBEGIN, statement_sequence, END ;

statement_sequence = statement_sequence, semicolon, statement
        | statement
        ;

statement = open_statement
        | closed_statement
        ;

open_statement = label, COLON, non_labeled_open_statement
        | non_labeled_open_statement
        ;

closed_statement = label, COLON, non_labeled_closed_statement
        | non_labeled_closed_statement
        ;

non_labeled_closed_statement = assignment_statement
        | procedure_statement
        | goto_statement
        | compound_statement
        | case_statement
        | repeat_statement
        | closed_with_statement
        | closed_if_statement
        | closed_while_statement
        | closed_for_statement
        |
        ;

non_labeled_open_statement = open_with_statement
        | open_if_statement
        | open_while_statement
        | open_for_statement
        ;

repeat_statement = REPEAT, statement_sequence, UNTIL, boolean_expression
        ;

open_while_statement = WHILE, boolean_expression, DO, open_statement
        ;

closed_while_statement = WHILE, boolean_expression, DO, closed_statement
        ;

open_for_statement = FOR, control_variable, ASSIGNMENT, initial_value, direction,
                        final_value, DO, open_statement
        ;

closed_for_statement = FOR, control_variable, ASSIGNMENT, initial_value, direction,
                        final_value, DO, closed_statement
        ;

open_with_statement = WITH, record_variable_list, DO, open_statement
        ;

closed_with_statement = WITH, record_variable_list, DO, closed_statement
        ;

open_if_statement = IF, boolean_expression, THEN, statement
        | IF, boolean_expression, THEN, closed_statement, ELSE, open_statement
        ;

closed_if_statement = IF, boolean_expression, THEN, closed_statement,
                        ELSE, closed_statement
        ;

assignment_statement = variable_access, ASSIGNMENT, expression
        ;

variable_access = identifier
        | indexed_variable
        | field_designator
        | variable_access, UPARROW
        ;

indexed_variable = variable_access, LBRAC, index_expression_list, RBRAC
        ;

index_expression_list = index_expression_list, comma, index_expression
        | index_expression
        ;

index_expression = expression ;

field_designator = variable_access, DOT, identifier
        ;

procedure_statement = identifier, params
        | identifier
        ;

params = LPAREN, actual_parameter_list, RPAREN ;

actual_parameter_list = actual_parameter_list, comma, actual_parameter
        | actual_parameter
        ;

(*
 * this forces you to check all this to be sure that only write and
 * writeln use the 2nd and 3rd forms, you really can't do it easily in
 * the grammar, especially since write and writeln aren't reserved
 *)
actual_parameter = expression
        | expression, COLON, expression
        | expression, COLON, expression, COLON, expression
        ;

goto_statement = GOTO, label
        ;

case_statement = CASE, case_index, OF, case_list_element_list, END
        | CASE, case_index, OF, case_list_element_list, SEMICOLON, END
        | CASE, case_index, OF, case_list_element_list, semicolon,
                        otherwisepart, statement, END
        | CASE, case_index, OF, case_list_element_list, semicolon,
                        otherwisepart, statement, SEMICOLON, END
        ;

case_index = expression ;

case_list_element_list = case_list_element_list, semicolon, case_list_element
        | case_list_element
        ;

case_list_element = case_constant_list, COLON, statement
        ;

otherwisepart = OTHERWISE
        | OTHERWISE, COLON
        ;

control_variable = identifier ;

initial_value = expression ;

direction = TO
        | DOWNTO
        ;

final_value = expression ;

record_variable_list = record_variable_list, comma, variable_access
        | variable_access
        ;

boolean_expression = expression ;

expression = simple_expression
        | simple_expression, relop, simple_expression
        ;

simple_expression = term
        | simple_expression, addop, term
        ;

term = factor
        | term, mulop, factor
        ;

factor = sign, factor
        | exponentiation
        ;

exponentiation = primary
        | primary, STARSTAR, exponentiation
        ;

primary = variable_access
        | unsigned_constant
        | function_designator
        | set_constructor
        | LPAREN, expression, RPAREN
        | NOT, primary
        ;

unsigned_constant = unsigned_number
        | CHARACTER_STRING
        | NIL
        ;

unsigned_number = unsigned_integer | unsigned_real ;

unsigned_integer = DIGSEQ
        ;

unsigned_real = REALNUMBER
        ;

(* functions with no params will be handled by plain identifier *)
function_designator = identifier, params
        ;

set_constructor = LBRAC, member_designator_list, RBRAC
        | LBRAC, RBRAC
        ;

member_designator_list = member_designator_list, comma, member_designator
        | member_designator
        ;

member_designator = member_designator, DOTDOT, expression
        | expression
        ;

addop= PLUS
        | MINUS
        | OR
        ;

mulop = STAR
        | SLASH
        | DIV
        | MOD
        | AND
        ;

relop = EQUAL
        | NOTEQUAL
        | LT
        | GT
        | LE
        | GE
        | IN
        ;

identifier = IDENTIFIER
        ;

semicolon = SEMICOLON
        ;

comma = COMMA
        ;
=TEX
=SH
slrp -g -l 2  -f pascal.grm.txt >pascal.grm.run
=TEX
\end{document}








