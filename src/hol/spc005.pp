=TEX
% TQtemplate.tex
% \documentstyle[hol1,11pt,TQa4]{article}
\documentclass[a4paper,11pt]{article}
\usepackage{A4}
\usepackage{ProofPower}
\usepackage{fleqn}

\ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
\makeindex
\title{{\bf HOL Formalised: \\ Formal Design of the Logical Kernel}}  %% Mandatory field

\author{R.D. Arthan \\ ICL, \\ Eskdale Road, \\ Winnersh, \\ Berks. \\ RG11 5TT \\ rda@win.icl.co.uk}
\date{25 October 1993 \\ Revised \FormatDate{\VCDate}}

\begin{document}
\begin{titlepage}
\maketitle
\begin{abstract}

This document contains a formal specification,
in HOL, of the design of the
logical kernel of the {\Product} system.

This design document is essentially a sequel to a suite of documents entitle ``HOL Formalised'' which define the syntax, semantics and deductive system of HOL and provide formal criteria for assessing a tool that purports to be a theorem-proving system for HOL.
This document defines a design for such a theorem-proving system which is believed likely to meet these criteria (although that has not been formally proved).

Although fairly abstract, the design does address realistic architectural issues such as how a large body of HOL theories may be physically distributed for use by several users and how the system can support deletion of definitions and axioms without compromising its logical integrity.

An index to the formal material is provided at the end of the document.
\end{abstract}
\vfill
\begin{centering}

\bf Copyright \copyright\ : International Computers Ltd \number\year \\
Reference: DS/FMU/IED/SPC001; Git revision: {\VCVersion}


\end{centering}
\thispagestyle{empty}
\end{titlepage}
\newpage

\section{DOCUMENT CONTROL}
\subsection{Contents list}
\tableofcontents
\pagebreak
\subsection{Document cross references}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes history}  % to get section number `0.3'
\begin{description}
\item[Issue 1.2 (1991/02/20) (26 February 1991)]
First draft for initial comment on approach.
\item[Issue 1.6 (1991/07/16) (16 July 1991)]
Revision and corrections in light of comments.
\item[Issue 1.7 (1991/08/05) (\FormatDate{$Date: 1996/03/04 16:53:23 $%
})]
Revision after inspection ID0014.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes forecast}
The state well-formedness
predicate is yet to be formalised. A choice of which formulation
of the critical requirements to use is yet to be made.


\pagebreak
\section{GENERAL}
\subsection{Scope}
This document gives a formal specification, at an abstract
level of parts of the HOL proof development system.
The document is called for in \cite{DS/FMU/IED/HLD007} and is intended to
help meet the requirements concerning
integrity and the route to high assurance stated in \cite{DS/FMU/IED/DEF004}.



\subsection{Introduction}
\subsubsection{Background and Requirements}
The high level design document, \cite{DS/FMU/IED/HLD007},
discusses informally the abstract data type used to represent theorems,
which it refers to as the {\em Logical Kernel} of the {\Product}
proof development system.

This document gives a formal model of the main data structures
used in the logical kernel and of the operations on them.
We stress that the definitions are intended to describe a simplified model of
the actual system, and, for reasons of efficiency or practicality,
the actual details of the internal datatypes will be implementation dependent.


\subsubsection{Dependencies}
This document depends on the suite of documents formalising
HOL, overviewed in \cite{DS/FMU/IED/SPC001}.

\subsubsection{Notation}
In addition to the specification facilities mentioned in
\cite{DS/FMU/IED/SPC001}, we use the Z-like schema boxes to
introduce labelled record types.

\subsubsection{Deficiencies}
The formalisation of the well-formedness condition on states has yet
to be included.
\subsubsection{Possible Enhancements}
It has been suggested that there may be some merit in giving system
extenders more control over collections of theories. For example, it
might be useful in some circumstances to arrange that no one theory in a
given collection of related theories could be opened without the others also
being opened. A neat scheme for doing this within the framework
of the present document could be adopted, if such a scheme is discovered.
As things stand, such a feature must be implemented in non-critical
code.

\section{DISCUSSION}
\subsection{Basic Concepts for Ensuring Integrity}

The design of the logical kernel is a development of the LCF paradigm
which has been used in earlier implementations of the HOL logic, most
notably the Cambridge implementation described in \cite{SRI89a}.
The original reference for LCF is \cite{Gordon79}.
The ideas depend upon the use of a strongly typed metalanguage supporting
the  abstract data type facility, whereby a data type may be declared
together with one or more so-called constructosr, in such a way
that the type discipline ensures that all values of the data type are
created using the constructors. For the
{\Product} implementation of the HOL logic the metalanguage is Standard ML, see \cite{Milner90},
in which the {\tt abstype} construct provides the necessary feature.

In crude outline, integrity is ensured in an LCF-style proof development
system by representing theorems as elements of an abstract data type,
which we will call $THM$. The representation type for $THM$ is
the set of sentences of the logic --- sequents in the case of HOL as
formulated in \cite{DS/FMU/IED/SPC001}.
The constructors of the abstract data type are the axioms and inference
rules of the logic, so that values of type $THM$ arise from computations
which directly represent formal proofs. The great merit of this approach
is that it concentrates all the code which is critical to the integrity
of the system in the abstract data type and the small amount of code
which supports it. Facilities such as user-interfaces and proof procedures
may be implemented using the primitive operations of the abstract data type
and are not themselves critical since they cannot compromise the integrity of the system.

This elegant paradigm has, however, to be adapted to meet practical
requirements. The following paragraphs
summarise the key issues and solutions for {\Product}:

\begin{enumerate}
\item
We must allow the user to make definitions and other extensions,
both conservative and axiomatic. Thus proofs (i.e. computations of
theorems) are carried out with respect to a context determined by
a callection of such extensions, i.e. a {\em theory} in the sense
of \cite{DS/FMU/IED/SPC001}. Since we wish to let the user navigate
at will around the various theories which have been constructed, we
must mark each theorem with an indicator (actually a store address)
which uniquely identifies the theory to which the theorem belongs.
The inference rules use these indicators to ensure that a theorem is
valid in the context in which it is being used.

\item
We wish to store the collection of theories belonging to one or more users
in a reasonably efficient fashion. Two measures facilitate this.
Firstly, we make the concrete representation of a theory hold
only those extensions which are specific to it. The theories are organised
as a directed acyclic graph given by a parenthood relation defined by the user.
The context (or abstract theory) determined by such a concrete theory
comprises the union of the extensions contained in it and its ancestors with
respect to this relation and is represented
by a set of theory addresses. Secondly, we organise the theories themselves
into a tree of theory hierarchies. A theory hierarchy is intended to
represent the set of theories constructed by a particular user.
A theory hierarchy may conveniently be implemented
as a physical store or {\em database} in which we hold a set of theories
together with a pointer to a parent theory hierarchy. This parenthood
relation on theory hierarchies allows a collection of theories to be
shared amongst many users without undue replication in the physical store.
A theory hierarchy determines a set of theory addresses from which the
user may construct contexts in which to carry out proof.

\item
We wish to allow the user to edit the contents of a theory by deleting
extensions, and then, perhaps, making new extensions which are logically
incompatible with the ones which have been deleted.
This implies that a theorem must be marked with an indicator identifying
the set of extensions on which it may depend. For reasons of efficiency,
this indicator comprises a so-called {\em level number}. Each extension
to a theory or deletion of an extension from a theory causes the level
number to be incremented. When an extension is deleted, the corresponding
level number is added to a set of invalid levels maintained in the data
structure representing the theory. The inference rules both check
that any theorem presented to them has a valid level number and also
generate theorems which have a level number corresponding to the
most recent extension to the context.
\end{enumerate}

\subsection{Implementation Strategies}
The design given here can be implemented using several different strategies.
The one currently used in {\Product} uses an implementation of Standard ML, namely, Abstract Hardware Ltd.'s Poly/ML, which provides a persistent object store structured as a tree of physical files called {\em databases}.
The root of this tree as realised for {\Product} contains the ML code of the compiler itself together with the code and data which implements the {\Product} system.

When an interactive or batch session with the Poly/ML compiler is started, the user indicates a database which, if it is to be updated, must be a leaf in the tree. As and when desired the user can save the results of his work in the database.
New databases are created using a command script supplied as part of {\Product} which protects the user from most of the intricacies of working with hierarchies as described in section \ref{OoH}.
The $freeze\_hierarchy$ operation, for example, is carried out automatically on the parent database when a child is created, and the $load\_hierarchy$ operation is invoked automatically at the beginning of each session.

An alternative implementation strategy would be to store representations of theory hierarchies in files using metalanguage I/O operations. This has the disadvantage of disassociating the theory hierarchies from any associated metalanguage variable bindings. This disadvantage could doubtless be ameliorated in various ways, largely determined by the capabilities of the metalanguage compiler and associated tools.


\subsection{Overview of Model}
In the sequel we define a model of a proof development system for HOL.
This is a more concrete model than the abstract one used
in \cite{DS/FMU/IED/SPC004}. Where confusion might otherwise arise we
use the terms {\em concrete} and {\em abstract} to distinguish notions
in the present model from related notions in the more abstract treatment.
However, the model is still quite abstract in a number of ways.
For example, there is no commitment here as to whether the theory
hierarchy is held entirely in main store or whether it is a main store
data structure used to access the contents of a theory in backing store.
Nor do we define a number of mechanisms which will be necessary in the
interests of efficiency, e.g. the use of a symbol table to give fast access to
the context.

The main features of the implementation which we are modelling are
as follows:

\begin{enumerate}
\item
the representation of the theory hierarchy within
the store of a machine;
\item
the mechanisms whereby use of a theorem is restricted to contexts
which include the context in which it was proved;
\item
the commands which manipulate the theory hierarchy or modify the
context in which proof is carried out;
\item
a reversible facility for the user to prevent a theory from further
modification\footnote{%
This locking and unlocking facility is offered as a more
general substitute for the ability, in earlier implementations
of HOL, to load a theory for read-only access (or the ability to use
operating system facilities to prevent a filestore representation
of a theory from being modified).%
}.
\end{enumerate}

\subsection{System Construction}
In order to focus attention on the features identified in the previous
section we specify the model
as a function $pds$ which constructs the system from three subsystems:

\begin{enumerate}
\item
A $DEFINER$, which stands for the operations which perform
theory extensions;
\item
An $INFERRER$, standing for the inference rules;
\item
An $INTERPRETER$, which corresponds, approximately, to the metalanguage compiler,
and is actually a function from $DEFINER$s and $INTERPRETER$s to state transition
functions.
\end{enumerate}

This construction is purely for conceptual purposes, it is not intended
to imply the use of any particular implementation technique only that the
implementation be capable of being viewed in this way under an appropriate
interpretation function.

Note that the above view on what it means to be an
implementation of the design implies that the names used in the implementation
may differ from the names used in the design.

It is intended that implementations will include definition schemata,
and, perhaps, other built-in theorem schemata, for
numeric and other literals. This technique demands either {\em(a)} that the proof
development system as seen by the user always has suitable definitions
of appropriate types and constants in scope
or {\em(b)} that the implementation of each schema checks that it is operating
in a context containing appropriate definitions.
Approach {\em(b)} is unlikely to be attractive for performance reasons, and
approach {\em(a)} may lead to boot-strapping problems (since it appears to
imply that the
proof development system code cannot be used to assist in making the necessary
definitions).
One approach might be to work on the assumption that the implementation
of such schemata actually checked that the right definitions were available
and then demonstrate that the checks are actually unnecessary
in a particular implementation, in which steps are
taken to ensure that the theories containing the definitions
are always in scope.

\section{PRELIMINARIES}\label{PRELIMINARIES}
\section{Preamble}
The theory ``$spc005$'' which is defined in this document is introduced
as follows. Its parent is the theory ``$spc004$'' which defines the critical
properties of an abstract model of a HOL proof development system.

=SML
open_theory"spc004";
new_theory⦏"spc005"⦎;
new_parent"cache'play" handle Fail _ => ();
=TEX
=TEX
\subsection{Dictionaries}
Axioms, definitions and the like are held in the
implementation in tables indexed by names.
We refer to such tables as dictionaries.

We model dictionaries as sets of pairs representing
partial functions in the usual set-theoretic manner.
In the implementation these will typically be finite
partial functions represented by a concrete data structure
such as a list of pairs. However, the implementation
will also contain some definitions or theorem schemata
(e.g. the rules which define numbers or strings), these
may be thought of as (parts of) infinite dictionaries in the
appropriate theories.

=SML
declare_type_abbrev(⦏"DICT"⦎, ["'X"], ⌜:STRING ↔ 'X⌝);
=TEX
Dictionaries are formed starting with an initial, empty, dictionary:

ⓈHOLCONST
	⦏initial_dict⦎ : ('X)DICT
├
	initial_dict = {}
■
=TEX

Entries may be added to a dictionary using the function
$enter$:
ⓈHOLCONST
	⦏enter⦎ : STRING → 'X → ('X)DICT → ('X)DICT
├
	∀key item dict⦁enter key item dict = dict ⊕ {(key, item)}
■
=TEX
We look things up in a dictionary using $lookup$ defined below. Note that
the use we will make of $lookup$ is such that it may actually
be implemented as a partial function, i.e. we will never associate
more than one value with a given key.

ⓈHOLCONST
	⦏lookup⦎ : STRING → ('X)DICT → 'X → BOOL
├
	∀key dict item⦁
		lookup key dict item ⇔ (key, item) ∈ dict
■
=TEX

We may delete things by key from a dictionary using $delete$:
ⓈHOLCONST
	⦏delete⦎ : STRING → ('X)DICT → ('X)DICT
├
	∀key dict⦁ delete key dict = {key} ⩤ dict
■
=TEX
We may delete entries whose values lie in some set from a dictionary using
$block\_delete$:
ⓈHOLCONST
	⦏block_delete⦎ : ('X SET) → ('X)DICT → ('X)DICT
├
	∀a dict⦁ block_delete a dict = dict ⩥ a
■
=TEX

$keys$ gives the set of key values in use in a dictionary:
ⓈHOLCONST
	⦏keys⦎ : ('X)DICT → STRING SET
├
	keys = Dom
■
=TEX

\subsection{Stores}
The state of the proof development system will be
held in assignable metalanguage variables of various types.
To model these we use a polymorphic notion of a store.

The addresses for our stores come from the following
countably infinite type, $ADDR$. It gives a useful
cross-check on the present specification
for this type to have a parameter which identifies the
type of object addressed. To achieve this we
represent a $('X)ADDR$ as a pair $((εx:'X⦁T), n)$
where $n$ is a natural number. The result is a polymorphic
type all of whose instances are isomorphic to the
natural numbers.

=SML
val ⦏ADDR_DEF⦎ = new_type_defn(["ADDR_DEF"], ⦏"ADDR"⦎, ["'X"],
	(tac_proof(([], ⌜∃a:'X × ℕ⦁(λx⦁Fst x = εx:'X⦁T) a⌝),
		∃_tac⌜((εx:'X⦁T), (n:ℕ))⌝ THEN
		rewrite_tac[])));
=TEX
A store is a partial function from addresses to values,
represented as a set of pairs:
=SML
declare_type_abbrev(⦏"STORE"⦎, ["'X"], ⌜:('X)ADDR ↔ 'X⌝);
=TEX
The operations on stores are assignment, dereferencing
and allocation.

$<-$ is the assignment operation, note that it is not defind to
create new storage locations, but only to modify existing ones.
=SML
declare_infix(300, "<-");
ⓈHOLCONST
	$⦏<-⦎ : ('X)ADDR → 'X → ('X)STORE → ('X)STORE
├
	∀ addr value st⦁
		addr ∈ Dom st ⇒
		(addr <- value) st = st ⊕ {(addr, value)}
■

$fetch$ is the dereferencing operation:
ⓈHOLCONST
	⦏fetch⦎ : ('X)ADDR → ('X)STORE → 'X → BOOL
├
	∀ addr st value⦁ fetch addr st value ⇔ (addr, value) ∈ st
■
=TEX

$new$ is the allocation operation:
ⓈHOLCONST
	⦏new⦎ : 'X → ('X)STORE → (('X)STORE × ('X)ADDR) → BOOL
├
	∀ value st1 st2 addr⦁
		new value st1 (st2, addr) ⇔
			¬addr ∈ Dom st1
		∧	st2 = st1 ⊕ {(addr, value)}
■
=TEX

Stores are constructed using $new$ from an initial empty
store:
ⓈHOLCONST
	⦏initial_store⦎ : ('X)STORE
├
	initial_store = {}
■
=TEX

\section{THE SYSTEM STATE}\label{SYSTEMSTATE}
\subsection{User-Defined Data}
Theories will be record types containing a field in which essentially
arbitrary user-defined data can be stored.
This will be used to
support the concrete syntax of HOL, e.g. by allowing the syntactic
properties of identifiers to be stored in a theory,
and may be used for similar purposes for other languages.
The presence of this field is not critical to the
integrity of the system. Our model will be polymorphic
over the type of this information, for which we will
systematically use the type variable $'UD$.

\subsection{System Inputs}
We will systematically use the type variable $'IP$ for the
components of the input to the system which we do not wish to specify
in detail here. The actual inputs to the abstract data type would
be represented in the model by instantiating $'IP$ to some disjoint
union type allowing for the various possibilities (e.g. the template
term which is a parameter to the rule of substitution defined
in \cite{DS/FMU/IED/SPC003}).

\subsection{Concrete Theories}
It is useful to have
a representation for the contents of a theory.
This serves for the internal representation in our
simplified model (and an analogous type might be available in an
implementation for general use, e.g by the theory lister).

ⓈHOLLABPROD ⦏THEORY_CONTENTS⦎
	tc_name			: STRING;
	tc_ty_env		: (ℕ × ℕ) DICT;
	tc_con_env 		: (TYPE × ℕ) DICT;
	tc_parents		: STRING LIST;
	tc_axiom_dict		: (SEQ × ℕ) DICT;
	tc_definition_dict	: (SEQ × ℕ) DICT;
	tc_theorem_dict		: (SEQ × ℕ) DICT;
	tc_current_level	: ℕ;
	tc_deleted_levels	: ℕ SET;
	tc_user_data		: 'UD
■

Here the fields have the following significance:

\begin{tabular}{|l|p{4in}|}\hline
Field & Description \\ \hline
$name$ & This gives the name of the theory.
\\ \hline
$ty\_env$ & This represents a type environment assigning arities and level numbers
to type operator names. It corresponds to the $TY\_ENV$ component of a theory
as specified in \cite{DS/FMU/IED/SPC001}.
The level number gives the level number which was current when the type was
introduced.
\\ \hline
$con\_env$ & This represents a constant environment assigning types and level numbers
to constant names. It corresponds to the $CON\_ENV$ component of a theory
as specified in \cite{DS/FMU/IED/SPC001}.
The level number gives the level number which was current when the constant was
introduced.
\\ \hline
$parents$ & This is the set of names of parents of this theory.
\\ \hline
$axiom\_dict$ & This contains the non-definitional axioms of the theory.
Each axiom is marked with the level number which was current
when the axiom was introduced.
\\ \hline
$definition\_dict$ & This contains the definitional axioms of the theory.
Like the axioms, these are marked with the level number current when
the definitional axiom was introduced.
\\ \hline
$theorem\_dict$ & This contains the theorems which have been saved on the theory.
These are marked with the level number which was current when the theorem
was proved (or $0$ if the theorem belongs to an ancestor of the current theory).
\\ \hline
$user\_data$ & This contains the user-defined data stored in the theory
\\ \hline
$current\_level$ & This is the current level number. It is
0 when a theory is first created. It is incremented whenever
an extension to the theory is introduced or deleted.
\\ \hline
$deleted\_levels$ & This is the set of level numbers
corresponding to  extensions which have been deleted.
\\ \hline
\end{tabular}

Note that a theory can be used without
modifying any of the above information.
Moreover this information does not depend on the hierarchy containing
the theory.


\subsection{Concrete Theory Hierarchies} \label{TheoryHierarchies}
A theory hierarchy is essentially a finite set of records each comprising
a theory contents together
with information about the theory which is local to the hierarchy.

The local information comprises a status attribute (which indicates
a fairly permanent property of the theory) and a scope attribute which is
set true when the theory in question is the current theory or one
of its ancestors.
The scope attribute is discussed in more detail
in section \ref{opentheory} below.

We recognise the following four values
for the status attribute.
=SML
declare_type_abbrev(⦏"STATUS"⦎, [], ⓣONE + ONE + ONE + ONE⌝);
ⓈHOLCONST
	⦏TSNormal⦎		: STATUS;
	⦏TSLocked⦎		: STATUS;
	⦏TSAncestor⦎		: STATUS;
	⦏TSDeleted⦎		: STATUS
├
	[TSNormal; TSLocked; TSAncestor; TSDeleted] ∈ Distinct
■
=TEX

The significance of the theory status values is as follows:

\begin{tabular}{|l|p{4in}|} \hline
Value & Description \\ \hline
$TSNormal$ &
A theory which can be modified while this theory hierarchy is current;
\\ \hline
$TSLocked$ &
A theory which cannot be modified while this theory hierarchy
is current because the user has asked for it to be locked
(see section \ref{locktheory} for more information);
\\ \hline
$TSAncestor$ &
A theory which cannot be modified while this theory hierarchy is
current since it belongs to an ancestor of some hierarchy
(see section \ref{Well-Formedness} below for more information);
\\ \hline
$TSDeleted$ &
A theory which has been deleted.
\\ \hline
\end{tabular}


The information about a theory held in a theory hierarchy
then has the following type:

ⓈHOLLABPROD ⦏THEORY_INFO⦎
	ti_status		: STATUS;
	ti_inscope		: BOOL;
	ti_contents		: (('UD)THEORY_CONTENTS)ADDR
■

Here the address will reference a store of theory contents held in the state.

A theory hierarchy will comprise a list of
$THEORY\_INFO$s:
=SML
declare_type_abbrev(⦏"HIERARCHY"⦎, ["'UD"], ⌜:(('UD)THEORY_INFO)LIST⌝);
=TEX

\subsection{Concrete Theorems} \label{Theorems}
A theorem is represented by the following data type:

ⓈHOLLABPROD ⦏PDS_THM⦎
	pt_theory	: (('UD)THEORY_CONTENTS)ADDR;
	pt_level	: ℕ;
	pt_sequent	: SEQ
■
The $pt\_theory$ component here gives the address of
the (contents of the) theory to which the theorem belongs (with respect to
a store of theory contents held in the state of the system).
The level number is that which was current when the
theorem was proved.

\subsection{The System State} \label{SystemState}
\subsubsection{Definition and Initialisation}
The state of our model of the proof development
system has the following type:

ⓈHOLLABPROD ⦏PDS_STATE⦎
	ps_current_theory	 	: (('UD)THEORY_CONTENTS)ADDR;
	ps_current_hierarchy	: (('UD)HIERARCHY)ADDR;
	ps_theory_store		: (('UD)THEORY_CONTENTS)STORE;
	ps_hierarchy_store	: (('UD)HIERARCHY) STORE;
	ps_theorem_store		: (('UD)PDS_THM) STORE
■

Here the current theory (resp. hierarchy) is the theory (resp. hierarchy)
in which modifications to the state of the system are currently
being made, these modifications often constituting updates to the
three stores.

The theorem store component is different in intention from the other
two stores in that it will not, in practice, correspond to
a metalanguage variable inside the abstract data type. It represents
the locations in which theorems computed by the abstract data type
have been stored.

The initial state of the system is parameterised by
the initial user-defined data. To define it we first
define the initial theory (we apologise for the fact
that the initial theory is $MIN$ not $INIT$)
The initial theory information comes supplied with a store
containing the contents of a suitable initial theory:
ⓈHOLCONST
	⦏initial_theory⦎	: 'UD →
				(	(('UD)THEORY_CONTENTS)STORE)
				×	('UD)THEORY_INFO
├
	∀ud⦁initial_theory ud =
		let contents = MkTHEORY_CONTENTS
			"MIN"
			initial_dict	initial_dict
			[]
			initial_dict	initial_dict	initial_dict
			0		{}
			ud
		in let (st, addr) = ε(st, addr)⦁new contents initial_store (st, addr)
		in (st, MkTHEORY_INFO TSNormal T addr)
■
=TEX
The initial state is then as follows:

ⓈHOLCONST
	⦏initial_state⦎	: 'UD → ('UD)PDS_STATE
├
	∀ud⦁initial_state ud =
	let (thy_st, thy_info) = initial_theory ud
	in let (hier_st, hier_addr) = ε(st, addr)⦁new [thy_info] initial_store (st, addr)
	in MkPDS_STATE (ti_contents thy_info) hier_addr thy_st hier_st initial_store
■
=TEX
\subsubsection{Interpretation Mapping}\label{StateInterpretation}
In this section we define an interpretation function
from $PDS\_STATE$s to the more abstract notion of a
theory hierarchy defined in \cite{DS/FMU/IED/SPC004}.
To do this requires a number of auxiliary definitions:

$theory\_contents$ returns the theory contents associated
with a theory name in a state. It is a partial function
which we represent as a relation.

ⓈHOLCONST
	⦏theory_contents⦎	: ('UD)PDS_STATE → STRING →
					('UD)THEORY_CONTENTS → BOOL
├
	∀state name thy_c⦁theory_contents state name thy_c ⇔
		let thy_st = ps_theory_store state
		in let hier_st = ps_hierarchy_store state
		in let cur_hier = ps_current_hierarchy state
		in let infos = εx⦁fetch cur_hier hier_st x
		in let thys = Map((λaddr⦁εx⦁fetch addr thy_st x) o ti_contents) infos
		in ∃thy⦁ thy ∈ Elems thys ∧ tc_name thy = name
■
=TEX

The following function returns the names of the theories
in a state:

ⓈHOLCONST
	⦏theory_names⦎ : ('UD)PDS_STATE → STRING SET
├
	∀state name⦁name ∈ theory_names state ⇔
		∃thy_c⦁theory_contents state name thy_c
■
=TEX

$theory\_ancestors$ returns the names of the ancestors
of a given theory (which we take to include the theory
itself, if it is in the state):
ⓈHOLCONST
	⦏theory_ancestors⦎ : ('UD)PDS_STATE → STRING → STRING  SET
├
	∀state name⦁theory_ancestors state name = ⋂{P:STRING SET |
		(name ∈ theory_names state ⇒ name ∈ P)
	∧	(∀anc1 thy_c anc2⦁
			anc1 ∈ P
		∧	theory_contents state anc1 thy_c
		∧	anc2 ∈ Elems (tc_parents thy_c)
		⇒	anc2 ∈ P)}
■
=TEX

Given a set of theory contents, $interpret\_theory\_contents$ constructs
a $THEORY$ in the sense of \cite{DS/FMU/IED/SPC001}, together with the sets of definitional axioms and saved theorems
which are used in the definition of the abstract notion of  theory hierarchy in
\cite{DS/FMU/IED/SPC004}.

ⓈHOLCONST
	⦏interpret_theory_contents⦎ : (('UD)THEORY_CONTENTS  SET) →
					(THEORY × (SEQ SET) × (SEQ SET))
├
	∀thy_cs⦁interpret_theory_contents thy_cs = (
		abs_theory(
		{(tyn, arity) | ∃thy_c lev⦁thy_c ∈ thy_cs
				∧ lookup tyn (tc_ty_env thy_c) (arity, lev)},
		{(cn, ty) | ∃thy_c lev⦁thy_c ∈ thy_cs
				∧ lookup cn (tc_con_env thy_c) (ty, lev)},
		{seq | ∃thy_c thmn lev⦁thy_c ∈ thy_cs ∧
				(lookup thmn (tc_axiom_dict thy_c) (seq, lev)
			∨	 lookup thmn (tc_definition_dict thy_c) (seq, lev))}
		),
		{seq | ∃thy_c thmn lev⦁thy_c ∈ thy_cs ∧
			lookup thmn (tc_definition_dict thy_c) (seq, lev)},
		{seq | ∃thy_c thmn lev⦁thy_c ∈ thy_cs ∧
			lookup thmn (tc_theorem_dict thy_c) (seq, lev)}
	)
■
=TEX

Our interpretation mapping for a state is now easy to define (note that the definition
results in abstract theory hierarchies which map undefined theory names to
the theory all of whose components are empty).

ⓈHOLCONST
	⦏interpret_state⦎ : ('UD)PDS_STATE → THEORY_HIERARCHY
├
	∀state⦁interpret_state state = mk_theory_hierarchy(λthyn⦁
		interpret_theory_contents {tc | ∃anc ⦁
				anc ∈ theory_ancestors state thyn
			∧	theory_contents state anc tc})
■
=TEX

(Note that the interpretation of a state does not depend on the theorem
store. This is because the theorem store will in general contain theorems
which were proved in theories which have been deleted or which depend
on definitions or axioms which have been deleted.)

\subsubsection{Well-Formedness}\label{Well-Formedness}
As is apparent from the construction of the interpretation
mapping, we require the state to satisfy an invariant
which ensures that:

\begin{enumerate}
\item
no hierarchy in the hierarchy store
contains two distinct $THEORY\_INFO$s whose contents fields address theory
contents with the same name. Thus a theory name uniquely identifies the address
of the corresponding theory within a hierarchy;
\item
there are no dangling addresses; more accurately
the current theory (resp. hierarchy) should be
a valid address for the theory (resp. hierarchy) store
and the list of addresses addressed by the current
hierarchy should all be valid addresses for the theory
store;
\item
the ancestral of the parenthood relation is
a rooted DAG (with root the initial theory);
\item
the set of type names defined in a theory is
disjoint from the type names in its ancestors (and
similarly for constant names);
\item
no entry in any dictionary in any theory contains a level number which
is in the set of deleted levels for that theory.
\end{enumerate}

Note that condition 4 above implies that the type
(or constant) names in a theory must be disjoint from
those in its descendants. This implies that we must
not introduce new type or constant names into a hierarchy
which is the ancestor of some hierarchy. This is the significance of
the $TSAncestor$ status value.

The formalisation of these conditions has been deferred.

\section{OPERATIONS}\label{OPERATIONS}
\subsection{Discussion}
We can now define the operations on states which are of concern to us.
We consider the operations under four headings:

\begin{description}
\item[Operations on Hierarchies]
These are the operations concerned with creating and loading
theory hierarchies;
\item[Operations on Theory Attributes]
These are the operations which affect the status
and scope attributes for one or more theories;
\item[Operations on Theory Contents]
These are the operations which affect the
contents of a theory;
\item[Inference Rules]
These are the inference rules (viewed as functions
on states returning theorems).
\end{description}

The operations are described in the following sections
under the above headings. Except for the Inference Rules,
the operations are (functions returning)
functions from states to states, and, we are essentially
doing imperative programming in HOL.
It will be an implicit precondition of all of these
operations that the stores in the state are not full.
Since each operation only allocates a finite number
of new addresses in the stores, this precondition will
always be met by states constructed by finite iteration
of these operations starting from the initial state.
We specify the operations so that they always succeed
if there is room enough in the stores (by making them
do the identity state change, if what might otherwise
be a precondition does not hold).

The operation $new\_parent$ affects both the contents of the current theory
and the scope attributes of the new ancestors. We will classify it, arbitrarily,
as an operation on theory attributes.

\subsection{Utility Functions}
It is convenient to have a single function
giving the components of a state (the only inconvenience
is having to write out its signature!):
ⓈHOLCONST
	⦏dest_state⦎ : ('UD)PDS_STATE →
		(	('UD)THEORY_CONTENTS ADDR
		× 	('UD)HIERARCHY ADDR
		×	('UD) THEORY_CONTENTS STORE
		×	('UD)HIERARCHY STORE
		×	('UD)PDS_THM STORE	)
├
	∀state⦁dest_state state = (
		ps_current_theory state,
		ps_current_hierarchy state,
		ps_theory_store state,
		ps_hierarchy_store state,
		ps_theorem_store state)
■
=TEX
Similarly, the following destructor function for theory contents
is useful
ⓈHOLCONST
	⦏dest_theory_contents⦎ : ('UD)THEORY_CONTENTS →
		(	STRING
		× 	(ℕ × ℕ) DICT
		×	(TYPE × ℕ) DICT
		×	STRING LIST
		×	(SEQ × ℕ) DICT
		×	(SEQ × ℕ) DICT
		×	(SEQ × ℕ) DICT
		×	ℕ
		×	ℕ SET
		×	'UD	)
├
	∀tc⦁dest_theory_contents tc = (
		tc_name tc,
		tc_ty_env tc,
		tc_con_env tc,
		tc_parents tc,
		tc_axiom_dict tc,
		tc_definition_dict tc,
		tc_theorem_dict tc,
		tc_current_level tc,
		tc_deleted_levels tc,
		tc_user_data tc)
■
=TEX

$current\_theory\_contents$ returns the contents of
the current theory, (here and elsewhere we use variable
names of the form $\_1$, $\_2$ etc. for variables which
are required by the syntax but whose value we are not
concerned with).

ⓈHOLCONST
	⦏current_theory_contents⦎ :	('UD)PDS_STATE →
					('UD)THEORY_CONTENTS
├
	∀state⦁current_theory_contents state =
	let (cur_thy, _1, thy_st, _2, _3) = dest_state state
	in	(εtc⦁fetch cur_thy thy_st tc)
■
=TEX

$current\_theory\_name$ returns the name of
the current theory.

ⓈHOLCONST
	⦏current_theory_name⦎ : ('UD)PDS_STATE → STRING
├
	∀state⦁current_theory_name state =
		tc_name(current_theory_contents state)
■
=TEX
$current\_abstract\_theory$ returns the abstract theory corresponding
to the current theory. This function is used later to abbreviate the
specification of various conditions.
ⓈHOLCONST
	⦏current_abstract_theory⦎ : ('UD)PDS_STATE → THEORY
├
	∀state⦁current_abstract_theory state = Fst(interpret_theory_contents{tc|∃anc⦁
				anc ∈ theory_ancestors state (current_theory_name state)
			∧	theory_contents state anc tc})
■
=TEX

$theory\_info$ returns the $THEORY\_INFO$ associated with
a given theory name in the current state (and returns rubbish if the name
does not identify a theory in the state).
ⓈHOLCONST
	⦏theory_info⦎ : ('UD)PDS_STATE → STRING → ('UD) THEORY_INFO
├
	∀state name⦁theory_info state name =
	let (cur_thy, cur_hier, thy_st, hier_st, _1) = dest_state state
	in let hier = εh⦁fetch cur_hier hier_st h
	in	εti⦁	tc_name(εtc⦁fetch (ti_contents ti) thy_st tc) = name
		∧	¬ti_status ti = TSDeleted
■
=TEX

$current\_theory\_status$ returns the status value associated with
the current theory. Note that this status cannot be $TSDeleted$ in
the states arising from the operations we will define.
ⓈHOLCONST
	⦏current_theory_status⦎ : ('UD)PDS_STATE → STATUS
├
	∀state⦁current_theory_status state =
	ti_status (theory_info state (current_theory_name state))
■
=TEX


Several of the operations we wish
to define involve the important notion of checking whether a theorem is
in scope. The check is carried out as follows.

\begin{enumerate}
\item
we fetch the theory contents addressed by the theory component
of the theorem;
\item
we fetch the $THEORY\_INFO$ associated with the name in the theory
contents computed in step 1;
\item
We return true iff. the following
three conditions hold:
(a) the address in the $THEORY\_INFO$ is the same as that in the theorem;
(b) the scope flag in the $THEORY\_INFO$ is true;
(c) the level number in the theorem is not one of the deleted levels in the theory contents.
\end{enumerate}

ⓈHOLCONST
	⦏check_thm⦎ : ('UD)PDS_STATE → ('UD)PDS_THM → BOOL
├
	∀state thm⦁check_thm state thm ⇔
	let (cur_thy, cur_hier, thy_st, hier_st, _1) = dest_state state
	in let tc = εtc⦁fetch (pt_theory thm) thy_st tc
	in let ti = theory_info state (tc_name tc)
	in (	pt_theory thm = ti_contents ti
	∧	ti_inscope ti
	∧	¬pt_level thm ∈ tc_deleted_levels tc )
■
=TEX
$check\_thm\_address$ determines whether an address identifies a theorem
in the theorem store which is in scope:

ⓈHOLCONST
	⦏check_thm_address⦎ : ('UD)PDS_STATE → ('UD)PDS_THM ADDR → BOOL
├
	∀state thm_ad⦁check_thm_address state thm_ad ⇔
	let (_1, _2, _3, _4, thm_st) = dest_state state
	in ∃thm⦁fetch thm_ad thm_st thm ∧ check_thm state thm
■
=TEX

$fetch\_thms$ fetches a list of theorems from the theorem store given
a list of addresses. It is the responsibility of a function using
$fetch\_thms$ to check the validity of the addresses:
ⓈHOLCONST
	⦏fetch_thms⦎ :
	('UD)PDS_STATE → ('UD)PDS_THM ADDR LIST → ('UD)PDS_THM LIST
├
	∀state thm_ads⦁fetch_thms state thm_ads =
	let (_1, _2, _3, _4, thm_st) = dest_state state
	in Map (λa⦁εthm⦁fetch a thm_st thm) thm_ads
■
=TEX

We may sometimes need to know whether one theory hierarchy is an ancestor
of another. This is essentially inclusion of lists of theory addresses
viewed as
sets. If the hierarchies in question are given by their addresses relative
to a state, the following function gives the relation.
Note that it returns false if either of the addresses is not
valid for the hierarchy store in the state.

ⓈHOLCONST
	⦏hierarchy_ancestor⦎ :	('UD)PDS_STATE →
				(('UD)HIERARCHY)ADDR →
				(('UD)HIERARCHY)ADDR → BOOL
├
	∀state hier_ad1 hier_ad2 ⦁hierarchy_ancestor state hier_ad1 hier_ad2 ⇔
	let (_1, cur_hier, _2, hier_st, _3) = dest_state state
	in ∀h1 h2⦁
		fetch hier_ad1 hier_st h1 ∧ fetch hier_ad2 hier_st h2
	⇒	Elems (Map ti_contents h1) ⊆ Elems (Map ti_contents h2)
■
=TEX

$pds\_mk\_thm$ makes a theorem from a given sequent with $theory$ and $level$
values taken from the current theory of a state. It makes no checks whatsoever.
It is the responsibility of a function using $mk\_thm$ to store the
resulting theorem in the theorem store.

ⓈHOLCONST
	⦏pds_mk_thm⦎ : ('UD)PDS_STATE → SEQ → ('UD)PDS_THM
├
	∀state seq⦁pds_mk_thm state seq =
	let cur_thy = ps_current_theory state
	in let lev = tc_current_level (current_theory_contents state)
	in MkPDS_THM cur_thy lev seq
■
$make\_current$ does most of the work of opening a theory.
It is defined here because it is needed both in $open\_theory$ and in $load\_hierarchy$, q.v.
It is given a name which must identify a theory which has not been deleted.
On this assumption, it carries out the following steps.

\begin{enumerate}
\item
compute a modified theory hierarchy
in which the $inscope$ flags are true for the new current
theory and its ancestors only;
\item
assign the result of step 1 to the current hierarchy;
\item
set the current theory to the address of the theory contents identified
by the name (as found in the corresponding $THEORY\_INFO$).
\end{enumerate}

ⓈHOLCONST
	⦏make_current⦎ : STRING → ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀thyn state⦁make_current thyn state =
	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
	in let f1 = λti⦁tc_name(εtc⦁fetch (ti_contents ti) thy_st tc)
	in let f2 = λti⦁(f1 ti) ∈ theory_ancestors state thyn
	in let f3 = λti⦁MkTHEORY_INFO(ti_status ti)(f2 ti)(ti_contents ti)
	in let hier' =  Map f3 (εh⦁fetch cur_hier hier_st h)
	in let hier_st' = (cur_hier <- hier') hier_st
	in let cur_thy' = ti_contents (theory_info state thyn)
	in MkPDS_STATE cur_thy' cur_hier thy_st hier_st' thm_st
■
=TEX
\subsection{Operations on Hierarchies}\label{OoH}

\subsubsection{$freeze\_hierarchy$}
$freeze\_hierarchy$ changes the status of all undeleted theories in the
current hierarchy to $TSAncestor$ (in readiness for subsequent
$new\_hierarchy$ operations).
It performs the following steps:

\begin{enumerate}
\item
compute a modified theory hierarchy from the one held in the
current hierarchy by setting the status of all undeleted theories to be $TSAncestor$;
\item
assign the result of step 1 to the current hierarchy;
\end{enumerate}

ⓈHOLCONST
	⦏freeze_hierarchy⦎ : ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀state⦁freeze_hierarchy state =
	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
	in let f1 = λn⦁if n = TSDeleted then n else TSAncestor
	in let f2 = λti⦁MkTHEORY_INFO(f1(ti_status ti))(ti_inscope ti)(ti_contents ti)
	in let hier' =  Map f2 (εh⦁fetch cur_hier hier_st h)
	in let hier_st' = (cur_hier <- hier') hier_st
	in MkPDS_STATE cur_thy cur_hier thy_st hier_st' thm_st
■
=TEX

\subsubsection{$new\_hierarchy$}
$new\_hierarchy$ creates a new hierarchy.
It performs the following steps:

\begin{enumerate}
\item
if there is an theory in the current hierarchy with status other
than $TSAncestor$ or $TSDeleted$ then leave the state alone.
\item
allocate a new theory hierarchy initially equal
to the current hierarchy.
\item
return a state with the current hierarchy equal to the one allocated in
step 2.
\end{enumerate}

ⓈHOLCONST
	⦏new_hierarchy⦎ : ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀state⦁new_hierarchy state =
	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
	in let hier = εh⦁fetch cur_hier hier_st h
	in
	if	(∃ti⦁ti ∈ Elems hier
		∧	¬ti_status ti ∈ {TSAncestor; TSDeleted})		
	then	state
	else	let (hier_st', cur_hier') = ε(st, a)⦁new hier hier_st (st, a)
		in MkPDS_STATE cur_thy cur_hier' thy_st hier_st' thm_st
■
=TEX

\subsubsection{$load\_hierarchy$}
This operation typically corresponds to loading a theory into
the system from filestore.
Not all implementations will require it, since in
a persistent object store approach it may be possible
to arrange for the state of the system to persist from
session to session\footnote{%
It will be required with a persistent object store
mechanism such as the PolyML one, since the state variables
inside the abstract datatype will be held in the HOL
system database not the user's database and so their
values will not be permanently updated by the
theory management operations.%
}.

The parameter to $load\_hierarchy$ is the address
of the hierarchy to load. This might in practice be
a metalanguage variable or a file name.

The algorithm is as follows:

\begin{enumerate}
\item
if the address of the hierarchy to be loaded is not
valid for the hierararchy store then leave the state alone;
\item
otherwise, if the hierarchy we wish to
load is not a descendant of the current hierarchy
then leave the state alone;
\item
otherwise, compute the state in which the current hierarchy is the
address of the new hierarchy and all other fields are as in the old state.
\item
return the result of making the original current theory current again in the state computed in step 3.
\end{enumerate}

Note that the current theory is unchanged by this operation. The resulting
state is nonetheless well-formed, since the
new current hierarchy is a descendant of the old one.

ⓈHOLCONST
	⦏load_hierarchy⦎ :	(('UD)HIERARCHY)ADDR →
				('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀hier state⦁load_hierarchy hier state =
	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
	in
	if	¬(hierarchy_ancestor state cur_hier hier)
	then	state
	else	let cur_thyn = current_theory_name state
		in let st' = MkPDS_STATE cur_thy hier thy_st hier_st thm_st
		in make_current cur_thyn st'
■
=TEX

\subsection{Operations on Theory Attributes}

\subsubsection{$open\_theory$}\label{opentheory}
$open\_theory$ takes one argument which is the name of
the theory to be opened (i.e. made the current theory).


\begin{enumerate}
\item
if the name is not the name of any theory or it is the
name of a theory which has been deleted, then we leave the state alone;
\item
otherwise, return the state obtained by using $make_current$ to make the named theory the current theory.
\end{enumerate}

ⓈHOLCONST
	⦏open_theory⦎ : STRING → ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀thyn state⦁open_theory thyn state =
	if ¬thyn ∈ theory_names state ∨ ti_status(theory_info state thyn) = TSDeleted
	then	state
	else	make_current thyn state
■
=TEX

\subsubsection{$delete\_theory$}
$delete\_theory$ takes one argument which is the name of the theory to be
deleted. The algorithm is as follows:

\begin{enumerate}
\item
if the name is not the name of any theory, or if the theory it names does
not have status $TSNormal$ or has children or if it is in scope
we leave the state alone;
\item
otherwise, we compute a modified theory hierarchy
in which the theory to be deleted has its status attribute set to
$TSDeleted$;
\item
We assign to the theory contents for this theory
an empty theory of the same name;
\item
we assign the result of step 2 to the current hierarchy
\end{enumerate}


Before we define $delete\_theory$, we specify a function to compute
the empty theory required in step 3. This is also used
to support $new\_theory$. The function is parameterised by
the theory name and the desired parents.

ⓈHOLCONST
	⦏empty_theory⦎ :
	STRING → (STRING LIST) → 'UD → ('UD) THEORY_CONTENTS
├
	∀thyn pars ud⦁empty_theory thyn pars ud =
		 MkTHEORY_CONTENTS
			thyn
			initial_dict	initial_dict
			pars
			initial_dict	initial_dict	initial_dict
			0		{}
			ud
■
=TEX
For $delete\_theory$ we also need an arbitrary user datum value:
ⓈHOLCONST
	⦏arbitrary_ud⦎ : 'UD
├
	T
■
=TEX

ⓈHOLCONST
	⦏delete_theory⦎ : STRING → ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀thyn state⦁delete_theory thyn state =
	if	¬thyn ∈ theory_names state
	∨	¬ti_status(theory_info state thyn) = TSNormal
	∨	ti_inscope(theory_info state thyn)
	∨	∃childname tc⦁theory_contents state childname tc
		∧	thyn ∈ Elems (tc_parents tc)
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let ti = theory_info state thyn
		in let f = λti'⦁
			if ti' = ti
			then MkTHEORY_INFO TSDeleted F (ti_contents ti)
			else ti
		in let hier' =  Map f (εh⦁fetch cur_hier hier_st h)
		in let hier_st' = (cur_hier <- hier') hier_st
		in let thy = empty_theory thyn [] arbitrary_ud
		in let thy_st' = (ti_contents ti <- thy) thy_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st' thm_st
■
=TEX
\subsubsection{$new\_theory$}\label{newtheory}
$new\_theory$ takes two arguments, the first of which is the name of
the theory to be created. The new theory has the current theory as parent.
The current theory is not changed\footnote{%
The user interface to this function may open the new theory
after performing the primitive operation described here.%
}.
The second argument to $new\_theory$ gives an inital user-defined data value
for the new theory.


\begin{enumerate}
\item
if the name is the name of an existing, undeleted, theory, then
we leave the state alone;
\item
otherwise, we allocate space in the theory store for the new theory
initialised to an empty theory with the given name and user-defined data,
and with the current theory as its parent;
\item
we compute a new theory hierarchy by pushing a $THEORY\_INFO$ for the new theory
onto the current theory hierarchy;
\item
we assign the result of step 3 to the current hierarchy
\end{enumerate}


ⓈHOLCONST
	⦏new_theory⦎ :	STRING → 'UD → ('UD)PDS_STATE →
			('UD)PDS_STATE
├
	∀thyn ud state⦁new_theory thyn ud state=
	if	thyn ∈ theory_names state
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let thy = empty_theory thyn [current_theory_name state] ud
		in let (thy_st', addr) = ε(st, a)⦁ new thy thy_st (st, a)
		in let ti = MkTHEORY_INFO TSNormal F addr
		in let hier' =  Cons ti (εh⦁fetch cur_hier hier_st h)
		in let hier_st' = (cur_hier <- hier') hier_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st' thm_st
■
=TEX


\subsubsection{$new\_parent$}\label{newparent}
$new\_parent$ takes one argument, which is the name of
the theory to be added as new parent of the current theory.
The algorithm is as follows (in which we should recall that
the ancestors of a theory are taken to include the theory itself):

\begin{enumerate}
\item
we check to see whether any of the following conditions is satisfied:
\begin{enumerate}
\item the name is not the name of an existing theory;
\item the name is already the name of a parent of the current theory;
\item an ancestor, $anc$, of the theory identified by the name contains
a type name or a constant name which is in the current abstract theory, but $anc$
is not already an ancestor of the current theory.
\end{enumerate}
if any of the above conditions hold, then we leave the state alone;
\item
otherwise, we compute a new theory contents from the current theory contents
by adding the name to the set of its parents;
\item
we compute a new theory hierarchy in which the $inscope$ flags are true
for those theories which are either ancestors of the original current theory
or ancestors of the new parent;
\item
we assign to the current theory the results of step 2 and to the
current hierarchy the results of step 3.
\end{enumerate}


ⓈHOLCONST
	⦏new_parent⦎ :	STRING → ('UD)PDS_STATE →
			('UD)PDS_STATE
├
	∀thyn state⦁new_parent thyn state=
	if	¬thyn ∈ theory_names state
	∨	thyn ∈ Elems(tc_parents (current_theory_contents state))
	∨	∃ancn⦁	ancn ∈ (theory_ancestors state thyn
				\ theory_ancestors state (current_theory_name state))
		∧	let anc = εanc⦁theory_contents state ancn anc
			in let cur_thy = current_abstract_theory state
			in	(∃ty nlev⦁ ty ∈ Dom(types cur_thy)
				∧	lookup ty (tc_ty_env anc) nlev)
			∨	(∃con tylev⦁con ∈ Dom (constants cur_thy)
				∧	lookup con (tc_con_env anc) tylev)
			
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let cur_thyn = current_theory_name state
		in let f1 = λti⦁tc_name(εtc⦁fetch (ti_contents ti) thy_st tc)
		in let f2 = λti⦁(f1 ti) ∈ theory_ancestors state thyn ∨ ti_inscope ti
		in let f3 = λti⦁MkTHEORY_INFO(ti_status ti)(f2 ti)(ti_contents ti)
		in let hier' =  Map f3 (εh⦁fetch cur_hier hier_st h)
		in let tc = current_theory_contents state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
			dest_theory_contents tc
		in let tc' = MkTHEORY_CONTENTS
			nm t_e c_e (Cons thyn pars) ax_d def_d thm_d lev x_levs ud
		in let hier_st' = (cur_hier <- hier') hier_st
		in let thy_st' = (cur_thy <- tc') thy_st
		in MkPDS_STATE cur_thy  cur_hier  thy_st'  hier_st'  thm_st
■
=TEX

\subsubsection{$duplicate\_theory$}\label{duplicatetheory}
$duplicate\_theory$ makes a copy of a theory, with the same contents
(except for the name) but with no descendants.
It takes two arguments, the name of
the theory to be duplicated and the name of the copy.
In order that the ancestor relations is always rooted, the initial
theory may not be duplicated.

The algorithm is as follows:

\begin{enumerate}
\item
if the name of the theory to be duplicated does not identify an existing
theory, or if the name of the copy does, or if the theory to be duplicated
is the initial theory, then we leave the state alone.
\item
otherwise, we compute a new theory contents from the contents of the
theory to be duplicated by changing the name to that of the copy;
\item
we allocate space in the theory store for the theory contents computed
in step 2;
\item
we compute a new theory hierarchy by pushing a $THEORY\_INFO$ for
the new theory onto the current one;
\item
we assign the result of step 3 to the current hierarchy
\end{enumerate}


ⓈHOLCONST
	⦏duplicate_theory⦎ :	STRING → STRING → ('UD)PDS_STATE →
				('UD)PDS_STATE
├
	∀thyn copyn state⦁duplicate_theory thyn copyn state =
	if		¬thyn ∈ theory_names state
		∨	 copyn ∈ theory_names state
		∨	thyn = "MIN"
			
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let tc = εtc⦁theory_contents state thyn tc
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
			dest_theory_contents tc
		in let tc' = MkTHEORY_CONTENTS
			copyn t_e c_e (Cons thyn pars) ax_d def_d thm_d lev x_levs ud
		in let (thy_st', addr) = ε(st, a)⦁
			new tc' thy_st (st, a)
		in let ti = MkTHEORY_INFO TSNormal F addr
		in let hier' =  Cons ti (εh⦁fetch cur_hier hier_st h)
		in let hier_st' = (cur_hier <- hier') hier_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st' thm_st
■
=TEX


\subsubsection{$lock\_theory$}\label{locktheory}
$lock\_theory$ takes a single parameter which is the name of the theory
to lock. A locked theory may not be deleted or have its contents changed.
\begin{enumerate}
\item
if the name is not the name of any theory, or if the
theory it names does not have status $TSNormal$, then we leave the state alone;
\item
otherwise, we compute a modified theory hierarchy in which the theory
to be locked has status attribute set to $TSLocked$.
\item
we assign the result of step 2 to the current hierarchy
\end{enumerate}
=SML
ⓈHOLCONST
	⦏lock_theory⦎ : STRING → ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀thyn state⦁lock_theory thyn state =
	if	¬thyn ∈ theory_names state
	∨	¬ti_status(theory_info state thyn) = TSNormal
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let ti = theory_info state thyn
		in let f = λti'⦁	
			if ti' = ti
			then MkTHEORY_INFO TSLocked(ti_inscope ti)(ti_contents ti)
			else ti
		in let hier' =  Map f (εh⦁fetch cur_hier hier_st h)
		in let hier_st' = (cur_hier <- hier') hier_st
		in MkPDS_STATE cur_thy cur_hier thy_st hier_st' thm_st
■
=TEX

\subsubsection{$unlock\_theory$}
$unlock\_theory$ takes a single parameter which is the name of the theory
to unlock.
\begin{enumerate}
\item
if the name is not the name of any theory, or if the
theory it names does not have status $TSLocked$, then we leave the state alone;
\item
otherwise, we compute a modified theory hierarchy in which the theory
to be locked has status attribute set to $TSNormal$.
\item
we assign the result of step 2 to the current hierarchy
\end{enumerate}

ⓈHOLCONST
	⦏unlock_theory⦎ : STRING → ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀thyn state⦁unlock_theory thyn state =
	if	¬thyn ∈ theory_names state
	∨	¬ti_status(theory_info state thyn) = TSLocked
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let ti = theory_info state thyn
		in let f = λti'⦁
			if ti' = ti
			then MkTHEORY_INFO TSNormal (ti_inscope ti) (ti_contents ti)
			else ti
		in let hier' =  Map f (εh⦁fetch cur_hier hier_st h)
		in let hier_st' = (cur_hier <- hier') hier_st
		in MkPDS_STATE cur_thy cur_hier thy_st hier_st' thm_st
■
=TEX


\subsection{Operations on Theory Contents}

\subsubsection{$save\_thm$}
$save\_thm$ takes two parameters.
The first parameter is the key under which the theorem is to be saved.
The second parameter is the theorem. The theorem is saved in the current
theory.

\begin{enumerate}
\item
we fetch the contents of the current theory;
\item
if the key is already in use as a key into the theorem dictionary of
the theory fetched in step 1, or if the current theory does not have
status $TSNormal$ (e.g. because it is locked),
or if the theorem is
not in scope (see below), then we leave the state alone.
\item
we compute a new theory contents by entering the theorem into the
theorem dictionary (which was computed along the way in step 2) under
the given key.
\item
we assign the new theory contents to the current theory.
\end{enumerate}

Note that we take the level number associated with the stored theorem from the
theorem if the theorem
belongs to the current theory. We take it as 0 if the theorem does not belong
to the current theory (since if it belongs to an ancestor it depends
on no definitions in the current theory). Thus, we allow further definitions
to be made after a theorem has been inferred but before it is saved, without
requiring it to be deleted if some of the subsequent definitions are deleted.
There is no particular requirement for this feature, but it is as easy to
provide as any other formulation.

Note also that we do not update the theorems proved field, since if the
model is correct the theorem must already be in it.

ⓈHOLCONST
	⦏save_thm⦎ : STRING → ('UD)PDS_THM →
		('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀key thm state⦁save_thm key thm state =
	let tc = current_theory_contents state
	in
	if	key ∈ keys (tc_theorem_dict tc)
	∨	¬current_theory_status state = TSNormal
	∨	¬check_thm state thm
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let level = if pt_theory thm = cur_thy then pt_level thm else 0
		in let thm_d' = enter key (pt_sequent thm, level) (tc_theorem_dict tc)
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
			dest_theory_contents tc
		in let tc' = MkTHEORY_CONTENTS
			nm t_e c_e pars ax_d def_d thm_d' lev x_levs ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st
■
=TEX

\subsubsection{$delete\_extension$}
$delete\_extension$ allows the latest (undeleted) definition or
axiom to be deleted from the current theory\footnote{%
In practice, the user interface to this facility will be capable of recursively
deleting definitions and axioms until a desired definition or axiom has been
deleted.%
}.
Here ``definition'' is taken to include constants or types introduced
with $new\_type$ or $new\_constant$ (i.e. which do not have a defining axiom).

\begin{enumerate}
\item
if there is nothing in the current theory to be deleted
or if the current theory has children or does not
have status $TSNormal$, we leave the state alone;
\item
we calculate the most recent level number, $dlev$ say, of any
object stored in the theory;
\item
we remove all definitions and axioms with level number equal to $dlev$ from
the definition and axiom dictionaries and similarly
for the type and constant environments; we increment the current level
and add $dlev$ to the set of deleted levels;
\item
we assign the theory contents computed in the previous step to the current
theory.
\end{enumerate}

The following utility is used to assist in step 2:
ⓈHOLCONST
	⦏is_latest_level⦎ : ('UD)PDS_STATE → ℕ → BOOL
├
	∀state lev⦁is_latest_level state lev ⇔
	let tc = current_theory_contents state
	in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
					dest_theory_contents tc
	in let present = {lv|	(∃ _1 key⦁ lookup key t_e (_1, lv))
			∨	(∃ _1 key⦁ lookup key c_e (_1, lv))
			∨	(∃ _1 key⦁ lookup key ax_d (_1, lv))}
	in	lev ∈ present ∧ (∀lv⦁lv ∈ present ⇒ lv ≤ lev)
■
=TEX
ⓈHOLCONST
	⦏delete_extension⦎ : ('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀state⦁delete_extension state =
	let tc = current_theory_contents state
	in
	if	(¬(∃lev⦁is_latest_level state lev)
	∨	(∃childname tc⦁theory_contents state childname tc
		∧	current_theory_name state ∈ Elems (tc_parents tc))
	∨	¬current_theory_status state = TSNormal)
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
					dest_theory_contents tc
		in let dlev = εlv⦁is_latest_level state lv
		in let def_d' = block_delete {(_1, lv)|lv = dlev} def_d
		in let ax_d' = block_delete {(_1, lv)|lv = dlev} ax_d	
		in let t_e' = block_delete {(_1, lv)|lv = dlev} t_e
		in let c_e' = block_delete {(_1, lv)|lv = dlev} c_e
		in let lev' = lev+1
		in let tc' = MkTHEORY_CONTENTS
			nm t_e' c_e' pars ax_d' def_d' thm_d lev' (x_levs ∪ {dlev}) ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st
■
=TEX


\subsubsection{$delete\_thm$}
$delete\_thm$ deletes a theorem from the current theory.
The algorithm is very simple:
\begin{enumerate}
\item
if the key is not valid for the theorem dictionary for the current
theory, or if the current theory does not have status $TSNormal$,
we leave the state alone;
\item
otherwise,
we assign to the current theory a new theory contents in which the indicated
theorem has been removed from the theorem dictionary.
\end{enumerate}
=SML
ⓈHOLCONST
	⦏delete_thm⦎ : STRING →
		('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀key state⦁delete_thm key state =
	let tc = current_theory_contents state
	in
	if	¬key ∈ keys (tc_theorem_dict tc)
	∨	¬current_theory_status state = TSNormal
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
					dest_theory_contents tc
		in let thm_d' = delete key thm_d
		in let tc' = MkTHEORY_CONTENTS
			nm t_e c_e pars ax_d def_d thm_d' lev x_levs ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st
■
=TEX

\subsubsection{$pds\_new\_axiom$}
$pds\_new\_axiom$ adds a new axiom to a theory. It has two parameters,
the first of which is the term giving the new axiom and the second of
which gives the key under which the axiom is to be stored.
The new axiom is a sequent with no assumptions and with conclusion the
given term.
The algorithm is:

\begin{enumerate}
\item
if the key is already in use for an axiom in the current theory,
or if the new axiom is not a well-formed sequent with respect to the
current theory, then we leave the state alone
\item
otherwise, let $lev$ be the current level number for the current
theory;
\item
we assign to the current theory a new theory contents in which the new
axiom has been entered in the axiom dictionary at level $lev+1$
and the new current level is $lev+1$;
\item
we return a result state with the theory store modified by the assignment
of step 3 and with the new axiom added to the set of theorems proved.
\end{enumerate}
ⓈHOLCONST
	⦏pds_new_axiom⦎ : TERM → STRING →
		('UD)PDS_STATE → ('UD)PDS_STATE
├
	∀tm key state⦁pds_new_axiom tm key state =
	let tc = current_theory_contents state
	in let seq = ({}, tm)
	in
	if	key ∈ keys (tc_axiom_dict tc)
	∨	¬seq ∈ sequents (current_abstract_theory state)
	∨	¬current_theory_status state = TSNormal
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
					dest_theory_contents tc
		in let lev' = lev+1
		in let ax_d' = enter key (seq, lev') ax_d
		in let tc' = MkTHEORY_CONTENTS
			nm t_e c_e pars ax_d' def_d thm_d lev' x_levs ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in let (thm_st', _1) = εsa⦁new(pds_mk_thm state seq)thm_st sa
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st'
■
=TEX

\subsubsection{General Definitional Mechanisms}
The definitional mechanisms to be supplied will be closely
based on the ones identified in \cite{DS/FMU/IED/SPC002}.
We wish to defer the formal specification of the mechanisms which
introduce new definitional axioms, while still specifying
something about their role in our model of the system.
To do this we supply a ``generic'' definitional mechanism,
the function $make\_definition$ below, which is parameterised by
a function (called a $DEFINER$)
which represents an implementation of the definitional
mechanisms.
To avoid complicating the handling of definitional axioms,
the ``definitional'' mechanisms $new\_type$ and $new\_constant$ which do
not introduce new definitional axioms are defined here.

The input to the $DEFINER$ has the following type, which is also used
in section \ref{Inference} below:

=SML
declare_type_abbrev("SUBSYS_INPUT", ["'IP", "'UD"], ⌜:'IP × ('UD)PDS_THM LIST⌝);
=TEX
The input to the system which is used to derive the input to the $DEFINER$
has the type:
=SML
declare_type_abbrev("PDS_INPUT", ["'IP", "'UD"], ⌜:'IP × ('UD)PDS_THM ADDR LIST⌝);
=TEX
The addresses in a $PDS\_INPUT$ are intended to be addresses for the
theorem store in the state.

The parameter then has the type:

=SML
declare_type_abbrev("DEFINER", ["'IP", "'UD"],
	⌜:(('IP, 'UD)SUBSYS_INPUT × ('UD)PDS_STATE) ↔
	(SEQ × ((STRING × ℕ) LIST) × ((STRING × TYPE) LIST) × (STRING LIST))⌝);
=TEX
Thus, a $DEFINER$ is a partial function, represented as a set of pairs, which
computes a 4-tuple comprising:

\begin{itemize}
\item
a sequent which is to be the definitional axiom resulting from the
definition;
\item
a list of type names and arities for any new types introduced by the
definition;
\item
a list of constant names and types for any new constants introduced by
the definition;
\item
a list of keys under which the definitional axiom is to be saved on the theory.
\end{itemize}

The algorithm for $make\_definition$ is as follows:

\begin{enumerate}
\item
if the input and state are not in the domain of the $DEFINER$, or
if the theorems in the input are not all valid in the current theory
then leave the state alone;
\item
otherwise, apply the $DEFINER$ to the input-state pair;
\item
let $lev$ be the current level number;
\item
using the result of step 2 and the key parameter,
compute a modified theory contents from the current theory contents;
the modified theory contents has level number $lev+1$ and
has the new definition (with level number $lev+1$)
and new type and constant dictionary entries as returned by the $DEFINER$;
\item
assign the result of step 4 to the current theory;
\item
return a state with the theory store modified as in step 5 and with
the new definitional axiom added to the set of theorems proved.
\end{enumerate}

ⓈHOLCONST
	⦏make_definition⦎ :	('IP, 'UD)DEFINER →
				(('IP, 'UD)PDS_INPUT × ('UD)PDS_STATE) →
				('UD)PDS_STATE
├
	∀definer pars thm_ads state⦁
	make_definition definer ((pars, thm_ads), state) =
	if	∃thm_ad⦁thm_ad ∈ Elems thm_ads ∧ ¬check_thm_address state thm_ad
	then	state
	else	let thms = fetch_thms state thm_ads
		in
	if	¬((pars, thms), state) ∈ Dom definer
	then	state
	else	let (seq, tys, cons, ks) = definer@((pars, thms), state)
		in let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let tc = current_theory_contents state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
						dest_theory_contents tc
		in let lev' = lev+1
		in let def_d' = Fold (λk⦁enter k (seq, lev')) ks def_d
		in let t_e' = Fold (Uncurry enter) (Map (λ(s,x)⦁(s, (x, lev'))) tys) t_e
		in let c_e' = Fold (Uncurry enter) (Map (λ(s,x)⦁(s, (x, lev'))) cons) c_e
		in let tc' = MkTHEORY_CONTENTS
			nm t_e' c_e' pars ax_d def_d' thm_d lev' x_levs ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in let (thm_st', _1) = εsa⦁new(pds_mk_thm state seq)thm_st sa
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st'
■
=TEX

\subsubsection{$pds\_new\_type$}
$pds\_new\_type$ introduce a new type with a given arity without any associated
definitional axiom. It takes two parameters, the first being the name of
the type and the second being the arity. A type with the same name as a type
which is already in scope in the current theory is not allowed.

\begin{enumerate}
\item
if some ancestor of the current theory contains a type with the same name
then we leave the state alone;
\item
otherwise, let $lev$ be the current level number;
\item
using the result of step 2 and the parameters,
compute a modified theory contents from the current theory contents;
the modified theory contents has level number $lev+1$ and
and a new type entry for the new type;
\item
assign the result of step 4 to the current theory;
\item
return a state with the theory store modified as in step 5.
\end{enumerate}

ⓈHOLCONST
	⦏pds_new_type⦎ :	STRING → ℕ → ('UD)PDS_STATE →
				('UD)PDS_STATE
├
	∀ty arity state⦁
	pds_new_type ty arity state =
	if	ty ∈ Dom(types (current_abstract_theory state))
	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let tc = current_theory_contents state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
						dest_theory_contents tc
		in let lev' = lev+1
		in let t_e' = enter ty (arity, lev') t_e
		in let tc' = MkTHEORY_CONTENTS
			nm t_e' c_e pars ax_d def_d thm_d lev' x_levs ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st
■
=TEX

\subsubsection{$pds\_new\_constant$}
$pds\_new\_constant$ introduce a new constant with a given type without any associated
definitional axiom. It takes two parameters, the first being the name of
the constant and the second being the type. A constant with the same name as a constant
which is already in scope in the current theory is not allowed.

\begin{enumerate}
\item
if some ancestor of the current theory contains a constant with the same name,
or if the supplied type of the constant is not well-formed with respect
to the current theory,
then we leave the state alone;
\item
otherwise, let $lev$ be the current level number;
\item
using the result of step 2 and the parameters,
compute a modified theory contents from the current theory contents;
the modified theory contents has level number $lev+1$ and
and a new constant entry for the new constant;
\item
assign the result of step 4 to the current theory;
\item
return a state with the theory store modified as in step 5.
\end{enumerate}

ⓈHOLCONST
	⦏pds_new_constant⦎ :	STRING → TYPE → ('UD)PDS_STATE →
				('UD)PDS_STATE
├
	∀con ty state⦁
	pds_new_constant con ty state =
	if	con ∈ Dom(constants (current_abstract_theory state))
	∨	¬ty ∈ wf_type (types (current_abstract_theory state))

	then	state
	else	let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let tc = current_theory_contents state
		in let (nm, t_e, c_e, pars, ax_d, def_d, thm_d, lev, x_levs, ud) =
						dest_theory_contents tc
		in let lev' = lev+1
		in let c_e' = enter con (ty, lev') c_e
		in let tc' = MkTHEORY_CONTENTS
			nm t_e c_e' pars ax_d def_d thm_d lev' x_levs ud
		in let thy_st' = (cur_thy <- tc') thy_st
		in MkPDS_STATE cur_thy cur_hier thy_st' hier_st thm_st
■
=TEX


\subsection{Inference}\label{Inference}
The inference rules to be supplied will typically comprise primitive rules
implementing the rules specified in \cite{DS/FMU/IED/SPC001} together
with rules which define string and other literals and rules which, while
they could be derived from the primitive rules, are built-in for reasons
of efficiency. As a very special case, we consider the
inference rules to include the functions which given
a theory name and a key return the axiom (or definition or theorem) stored
under that key in the indicated theory.

As with the definitional mechanisms, we wish to defer
specification of the rules, and so we complete the present specification
by defining a ``generic'' inference function, $make\_inference$,
parameterised by
a function which represents an implementation of such a set of rules.

=SML
declare_type_abbrev("INFERRER", ["'IP", "'UD"],
		⌜:(('IP, 'UD)SUBSYS_INPUT × ('UD)PDS_STATE) ↔ SEQ⌝);
=TEX

An $INFERRER$ is a partial function, represented as a set of pairs,
which, returns a sequent.

The algorithm for $make\_inference$ is as follows:

\begin{enumerate}
\item
if the input and state are not in the domain of the $INFERRER$, or
if the theorems in the input are not all valid in the current theory
then leave the state alone;
\item
otherwise, apply the $INFERRER$ to the input-state pair;
\item
compute a theorem, with the current theory as its theory field,
the current level number as its level field, and with the result
of step 2 as its sequent field;
\item
return a state with the result of step 3 added to the theorems proved field.
\end{enumerate}

ⓈHOLCONST
	⦏make_inference⦎ :	('IP, 'UD)INFERRER →
				(('IP, 'UD)PDS_INPUT × ('UD)PDS_STATE) →	
				('UD)PDS_STATE
├
	∀inferrer pars thm_ads state⦁
	make_inference inferrer ((pars, thm_ads), state) =
	if	(∃thm_ad⦁thm_ad ∈ Elems thm_ads ∧ ¬check_thm_address state thm_ad)
	then	state
	else	let thms = fetch_thms state thm_ads
		in
	if	¬((pars, thms), state) ∈ Dom inferrer
	∨	¬current_theory_status state = TSNormal
	then	state
	else	let seq = inferrer@((pars, thms), state)
		in let (cur_thy, cur_hier, thy_st, hier_st, thm_st) = dest_state state
		in let (thm_st', _1) = εsa⦁new(pds_mk_thm state seq)thm_st sa
		in MkPDS_STATE cur_thy cur_hier thy_st hier_st thm_st'
■
=TEX
\section{SYSTEM CONSTRUCTION}
We have defined the operations on the state in terms of two subsystems:
the definitional mechanisms and the inference rules.
We now wish to say how the operations and two such subsystems
are to be combined to produce a system.

\subsection{Auxiliary Definitions}
We will say that a state-to-state transition function is $allowed$,
if it is one of the operations on states
defined in section \ref{OPERATIONS} above. Since some of these operations
are parameterised by the definitional mechanism or inference rules, so
is this property:
ⓈHOLCONST
	⦏allowed⦎ :	('IP, 'UD)DEFINER →
			('IP, 'UD)INFERRER →
			( ('UD)PDS_STATE → ('UD)PDS_STATE ) → BOOL
├
	∀definer inferrer trans⦁
	allowed definer inferrer trans ⇔
		trans = freeze_hierarchy
	∨	trans = new_hierarchy
	∨	∃addr⦁trans = load_hierarchy addr
	∨	∃thyn⦁trans = open_theory thyn
	∨	∃thyn⦁trans = delete_theory thyn
	∨	∃thyn ud⦁trans = new_theory thyn ud
	∨	∃thyn⦁trans = new_parent thyn
	∨	∃thyn copyn⦁trans = duplicate_theory thyn copyn
	∨	∃thyn⦁trans = lock_theory thyn
	∨	∃thyn⦁trans = unlock_theory thyn
	∨	∃key thm⦁trans = save_thm key thm
	∨	trans = delete_extension
	∨	∃key⦁trans = delete_thm key
	∨	∃tm key⦁trans = pds_new_axiom tm key
	∨	∃ty arity⦁trans = pds_new_type ty arity
	∨	∃con ty⦁trans = pds_new_constant con ty
	∨	∃pars thm_ads⦁trans = Curry(make_definition definer)(pars, thm_ads)
	∨	∃pars thm_ads⦁trans = Curry(make_inference inferrer)(pars, thm_ads)
■
=TEX
\subsection{The System Construction}
The construction of the system also involves a third
subsystem: a ``command interpreter'', which, given a $DEFINER$ and
an $INFERRER$ maps inputs onto transition
functions.  Thus it has the following type:
=SML
declare_type_abbrev("INTERPRETER", ["'IP", "'UD"],
	⌜:('IP, 'UD)DEFINER → ('IP, 'UD)INFERRER →
		('IP,'UD)PDS_INPUT →
		('UD)PDS_STATE → ('UD)PDS_STATE⌝);
=TEX

The loosely specified function $pds$ constructs a system
from a $DEFINER$, an $INFERRER$ and an $INTERPRETER$. After expanding
the type abbreviations, the systems
it constructs may be seen to have the following type:

=GFT Discussion
	:	(('IP × ('UD)PDS_THM list) × ('UD)PDS_STATE)
	→	(('UD)PDS_STATE × (('UD)PDS_THM STORE))
=TEX

Thus inputs to the system are composed of unspecified
``parameters'', together with lists of theorems. Its output is taken
to be the theorem store (which, in practice, certainly includes any theorem
returned by one of the constructors of the abstract datatype).

$pds$ constructs $HOL\_SYSTEM$s in the
sense of \cite{DS/FMU/IED/SPC004}, allowing us to
assert the critical properties defined in that document for these systems.
ⓈHOLCONST
	⦏pds⦎ : ('IP, 'UD)DEFINER →
		('IP, 'UD)INFERRER →
		('IP, 'UD)INTERPRETER →
		(	('IP, 'UD)PDS_INPUT,
			('UD)PDS_THM STORE,
			('UD)PDS_STATE		)HOL_SYSTEM
├
	∀definer inferrer interpreter⦁
	pds definer inferrer interpreter =
	(	(λ((pars, thm_ads), state)⦁
		let state' = interpreter definer inferrer (pars, thm_ads) state
		in (state', ps_theorem_store state')),
		interpret_state	)
■
=TEX


\subsection{Subsystem Critical Properties}
We will use the term {\em good} of subsystems which satisfy their critical
properties. The critical properties can be expressed either syntactically
or semantically. We choose the semantic formulation, which is felt to
be somewhat simpler.


A $DEFINER$ is good if the extension of abstract theories induced
by its intended effect on concrete theories is definitional:
ⓈHOLCONST
	⦏good_definer⦎ : ('IP, 'UD)DEFINER → BOOL
├
	∀definer⦁good_definer definer ⇔
	∀pars thms state⦁
		((pars, thms), state) ∈ Dom definer
	⇒	let thy = current_abstract_theory state
		in let (tyenv, conenv, axs) = rep_theory thy
		in let (seq, tys, cons, _1) = definer@((pars, thms), state)
		in let tyenv' = Fold (λtn⦁λte⦁te ∪ {tn}) tys tyenv
		in let conenv' = Fold (λst⦁λce⦁ce ∪ {st}) cons conenv
		in let axs' = axs ∪ {seq}
		in let thy' = abs_theory(tyenv', conenv', axs')
		in  thy ∈ definitional_extension thy'
■
=TEX

An $INFERRER$ is good if the sequent it computes is always (a) valid
with respect to the current abstract theory and the
theorems it is given as part of its parameter and (b) is well-formed
with respect to the current abstract theory. As in the definition
of $valid$ in \cite{DS/FMU/IED/SPC002}, an apparently unused
parameter must be used to ensure that the type of the universe
of models appears in the type of $good\_inferrer$.
ⓈHOLCONST
	⦏good_inferrer⦎ : 'U → ('IP, 'UD)INFERRER → BOOL
├
	∀v inferrer⦁good_inferrer v inferrer ⇔
	∀pars thms state⦁
		((pars, thms), state) ∈ Dom inferrer
	⇒	let thy = current_abstract_theory state
		in let seq = inferrer@((pars, thms), state)
		in (	seq ∈ sequents thy
		∧	seq ∈ valid v thy)
■
=TEX

An $INTERPRETER$ is good if it always returns allowable state transitions.

ⓈHOLCONST
	⦏good_interpreter⦎ : ('IP, 'UD)INTERPRETER → BOOL
├
	∀interpreter⦁good_interpreter interpreter ⇔
	∀definer inferrer pars thm_ads⦁
		allowed definer inferrer(interpreter definer inferrer(pars, thm_ads))
■
=TEX

In terms of these notions of goodness we may now formulate a conjecture
that good components, according to the
above syntactic definitions, make a system meeting its critical requirements
either in the semantic formulation:

=GFT Conjecture
	?⊢	∀definer inferrer interpreter⦁
			(	good_definer definer
			∧	good_inferrer inferrer
			∧	∀v:'U⦁good_interpreter v interpreter)
		⇒	(	standard (pds definer inferrer interpreter)
			∧	∀v:'U⦁validity_preserving v (pds definer inferrer interpreter))
		
=TEX
or in the syntactic formulation:

=GFT Conjecture
	?⊢	∀definer inferrer interpreter⦁
			(	good_definer definer
			∧	good_inferrer inferrer
			∧	∀v:'U⦁good_interpreter v interpreter)
		⇒	(	standard (pds definer inferrer interpreter)
			∧	derivability_preserving (pds definer inferrer interpreter))
=IGN
\input{\jobname.thy.tex}
=TEX
\twocolumn[\section{INDEX OF DEFINED TERMS}]
\printindex

=TEX
\end{document}


