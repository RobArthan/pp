=IGN
********************************************************************************
imp506.doc: this file is part of the PPDaz system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp506.doc   ℤ $Date: 2002/12/14 17:39:23 $ $Revision: 1.29 $ $RCSfile: imp506.doc,v $
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

\def\Title{Implementation: VC Browser}

\def\AbstractText{This document contains the implementation for the navigation tools.}

\def\Reference{ISS/HAT/DAZ/IMP506}

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
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: \ftlinepenalty=9999
\def\Hide#1{}
\def\Bool{``$\it{:}bool\,$''}
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPproject{DAZ PROJECT}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Implementation: VC Browser}  %% Mandatory field
%% LaTeX2e port: \TPPref{ISS/HAT/DAZ/IMP506}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.29 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/12/14 17:39:23 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPauthor{R.D.~Arthan & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{D.J.~King & DAZ Team Leader}
%% LaTeX2e port: \raggedright{\TPPabstract{This document contains the implementation for the navigation tools.}}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library}}
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu,daz}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}

\item[Issues 1.1 (1994/01/30)-1.9 (1994/11/17)] Author's drafts.
\item[Issue 1.10 (1994/11/18)] Under integration.
\item[Issue 1.11 (1995/01/04)] corrected order of web clause list.
\item[Issue 1.12 (1995/01/05)] renamed call to $get\_cn\_state$ to be $get\_z\_generator\_state$.
\item[Issue 1.13 (1995/10/03)] right filter now clears text window if there are no VCs selected.
\item[Issue 1.14 (1995/10/04)] Arbitrary replacements enhancements.
\item[Issue 1.15 (1996/07/17)] K-slots as annotations.
\item[Issue 1.16 (1997/04/10)] Addressing changes to SPARK output programs from IUCT WP 6.
\item[Issue 1.17 (1997/04/16)] Ensured that VC soundness error message is seen.
\item[Issue 1.18 (2001/12/13)] Corrected {\LaTeX} error.
\item[Issue 1.19 (2002/05/22)] Made it check for availability of Motif.
\item[Issue 1.20 (2002/06/05)] Support display of VC derivation.
\item[Issue 1.21 (2002/10/14)] Made it compatible with version 2.5.11 enhancements.
\item[Issue 1.22 (2002/10/15)] Removed unwanted {\it translate\_for\_output}.
\item[Issue 1.23 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.24 (2002/10/17), 1.25 (2002/10/17)] DAZ-specific updates to banner for open source release
\item[Issue 1.26 (2002/11/10)] Uniform treatment of block statements.
\item[Issue 1.27 (2002/12/12)] Window manager deletion now causes browser to be unmapped.
\item[Issue 1.28 (2002/12/12)] Scrolled list widgets now get scroll bar placement from scrolled text settings.
\item[Issue 1.29 (2002/12/14)] Replaced uses of {\it null} to {\it is\_nil} to avoid clahses with {\it null} from DTD505.
Calling VC browser again then causes it to be mapped.
\item[Issue 1.30 (2003/05/27)] Now uses {\it strings\_from\_fmt1}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported daz source documents onto the Lemma 1 document template
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the implementation for the VC Browser.
The detailed desi+gn for this material is in \cite{ISS/HAT/DAZ/DTD506}.
\subsection{Introduction}
See \cite{ISS/HAT/DAZ/DTD506}.
\subsection{Purpose and Background}
See \cite{ISS/HAT/DAZ/DTD506}.
\subsection{Algorithms}
The code is a straightforward application of the PolyML Motif interface.
\subsection{Dependencies}
See \cite{ISS/HAT/DAZ/DTD506}.
\subsection{Known Deficencies}
None known.
\subsection{Possible Enhancements}
Various more or less cosmetic adjustments could doubtless to be made.
=TEX
=TEX
=TEX
\section{FRONT END}
=SML
(use_string"val _ = Motif.XtGetValue;"; ())  handle _  =>  quit();
=SML
structure ⦏CNBrowserFrontEnd⦎ : CNBrowserFrontEnd = struct
local
open  XWindows Motif;
=TEX
=SML
val words : string -> string list = (
	let	fun aux (done, "") [] = done
		|   aux (done, acc) [] = acc :: done
		|   aux (done, "") (" " :: more) = aux (done, "") more
		|   aux (done, acc) (" " :: more) = aux (acc :: done, "") more
		|   aux (done, acc) (ch :: more) = aux (done, acc ^ ch) more;
	in	(rev o aux ([], "") o explode)
	end
);
fun format_string (i : int) : string -> string list = (
	let	fun aux (done, acc, crsr) [] = acc :: done
		|   aux (done, acc, crsr) (w :: more) = (
			let	val l = size w;
				val crsr' = crsr + l + 1;
			in	if	crsr' > i
				then	aux
					(if acc = "" then done else acc :: done,
					w,
					l) more
				else	aux
					(done,
					if acc = "" then w else acc ^ " " ^ w,
					 crsr') more
			end
		);
	in	rev o aux ([], "", 0) o words
	end
);
=TEX
=SML
val destroy_cb : Widget * 'a XEvent * unit -> unit = (fn (w, _, _) =>
	XtDestroyWidget w
);
=TEX
=SML
val icon_rect = XWindows.Area{x = 0, y = 0, w = 32, h = 32};
=TEX
=SML
val pp_bitmap_bits = [
	255, 255, 255, 255, 1, 0, 0, 128, 1, 0, 0, 128, 1, 0, 0, 128,
	1, 0, 0, 128, 1, 0, 254, 129, 129, 1, 254, 131, 129, 1, 54, 134,
	1, 0, 54, 134, 1, 0, 54, 134, 1, 0, 54, 134, 1, 0, 54, 134,
	1, 0, 246, 131, 225, 31, 246, 129, 225, 63, 54, 128, 97, 99, 54, 128,
	97, 99, 54, 128, 97, 99, 54, 128, 97, 99, 62, 128, 97, 99, 62, 128,
	97, 63, 0, 128, 97, 31, 0, 128, 97, 3, 0, 128, 97, 3, 0, 128,
	97, 3, 48, 128, 97, 3, 48, 128, 225, 3, 0, 128, 225, 3, 0, 128,
	1, 0, 0, 128, 1, 0, 0, 128, 1, 0, 0, 128, 255, 255, 255, 255];
=TEX
=SML
=TEX
=SML
fun help_widget (owner_w : Widget) (text : string list) : Widget = (
	let	val fmtd_txt = format_list Combinators.I
				(flat (map (format_string 60) text)) "\n";
		val help_w = XmCreateInformationDialog owner_w "help-dialog" [
			XmNmessageString fmtd_txt,
			XmNokLabelString " Dismiss ",
			XmNdialogTitle "ProofPower-Help"
		];
		val se1 = XtDestroyWidget(XmMessageBoxGetChild help_w
					XmDIALOG_CANCEL_BUTTON);
		val se2 = XtDestroyWidget(XmMessageBoxGetChild help_w
					XmDIALOG_HELP_BUTTON);
		val se3 = XtSetCallbacks help_w [(XmNokCallback, destroy_cb)];
		val se4 = XtManageChild help_w;
	in	help_w
	end
);
=TEX
The result type of the following function is a long record and has ben omitted.
=SML
fun gen_correlator_tool_widgets {
	left_keys : unit -> string list,
	right_keys : unit -> string list}  = (
let
	val shell = XtAppInitialise "" "VCBrowser" "Xpp" [] [];

	val side_effect = XtSetValues shell [
		XmNdeleteResponse XmUNMAP,
		XmNmappedWhenManaged true];

	val outer_paned = XmCreatePanedWindow shell "outer-paned" [
		XmNsashHeight		1,
		XmNsashWidth		1,
		XmNorientation		XmVERTICAL
	];
	val main_paned = XmCreatePanedWindow outer_paned "top-form" [
		XmNorientation		XmHORIZONTAL
	];
	val left_paned = XmCreatePanedWindow main_paned "left-paned" [
		XmNorientation		XmVERTICAL
	];	

	val right_paned = XmCreatePanedWindow main_paned "right-paned" [
		XmNorientation		XmVERTICAL
	];
	val left_context = XmCreateScrolledText left_paned "script" [
		XmNrows		8,
		XmNcolumns	40,
		XmNeditMode	XmMULTI_LINE_EDIT,
		XmNeditable	false
	];
	val left_text = XmCreateScrolledText left_paned "script" [
		XmNrows		12,
		XmNcolumns	40,
		XmNeditMode	XmMULTI_LINE_EDIT,
		XmNeditable	false
	];
	val left_items = left_keys();
	val left_list = XmCreateScrolledList left_paned "left_list" [
		XmNvisibleItemCount	4,
		XmNitems	left_items,
		XmNscrollBarDisplayPolicy XmSTATIC,
		XmNselectionPolicy	XmBROWSE_SELECT,
		XmNselectedItems	([hd left_items] handle Fail _ => [])
	];
	val _ = (
		case XtGetValue left_text "scrollLeftSide" of
			XmNscrollLeftSide b => (
				XtSetValues (XtParent left_list)
					[(XmNscrollBarPlacement
					 (if	b
					 then	XmBOTTOM_LEFT
					 else	XmBOTTOM_RIGHT))]
		) |	_ => ());
	val right_comments = XmCreateScrolledText right_paned "script" [
		XmNrows		4,
		XmNcolumns	40,
		XmNeditMode	XmMULTI_LINE_EDIT,
		XmNeditable	false
	];
	val right_text = XmCreateScrolledText right_paned "script" [
		XmNrows		16,
		XmNcolumns	40,
		XmNeditMode	XmMULTI_LINE_EDIT,
		XmNeditable	false
	];
	val right_items = right_keys();
	val right_list = XmCreateScrolledList right_paned "left_list" [
		XmNvisibleItemCount	4,
		XmNitems		right_items,
	 	XmNscrollBarDisplayPolicy XmSTATIC,
		XmNselectionPolicy	XmBROWSE_SELECT,
		XmNselectedItems	([hd right_items] handle Fail _ => [])
	];
	val _ = (
		case XtGetValue right_text "scrollLeftSide" of
			XmNscrollLeftSide b => (
				XtSetValues (XtParent right_list)
					[(XmNscrollBarPlacement
					 (if	b
					 then	XmBOTTOM_LEFT
					 else	XmBOTTOM_RIGHT))]
		) |	_ => ());
	val button_form = XmCreateForm outer_paned "button-form" [
		XmNfractionBase	12
	];
	val left_filter_btn = XmCreatePushButton button_form "left-filter-btn" [
		XmNlabelString		"Filter",
		XmNtopAttachment	XmATTACH_FORM,
		XmNbottomAttachment	XmATTACH_POSITION,
		XmNbottomPosition	6,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	0,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	2
	];
	val left_skeleton_btn = XmCreatePushButton button_form "left-skeleton-btn" [
		XmNlabelString		"VC Derivation",
		XmNtopAttachment	XmATTACH_FORM,
		XmNbottomAttachment	XmATTACH_POSITION,
		XmNbottomPosition	6,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	2,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	4
	];
	val left_reset_btn = XmCreatePushButton button_form "left-reset-btn" [
		XmNlabelString		"Reset",
		XmNtopAttachment	XmATTACH_FORM,
		XmNbottomAttachment	XmATTACH_POSITION,
		XmNbottomPosition	6,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	4,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	6
	];
	val right_filter_btn = XmCreatePushButton button_form "right-filter-btn" [
		XmNlabelString		"Filter",
		XmNtopAttachment	XmATTACH_FORM,
		XmNbottomAttachment	XmATTACH_POSITION,
		XmNbottomPosition	6,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	6,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	9
	];
	val right_reset_btn = XmCreatePushButton button_form "right-reset-btn" [
		XmNlabelString		"Reset",
		XmNtopAttachment	XmATTACH_FORM,
		XmNbottomAttachment	XmATTACH_POSITION,
		XmNbottomPosition	6,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	9,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	12
	];
	val done_btn = XmCreatePushButton button_form "done-btn" [
		XmNlabelString		"Done",
		XmNtopAttachment	XmATTACH_POSITION,
		XmNtopPosition		6,
		XmNbottomAttachment	XmATTACH_FORM,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	2,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	5
	];
	val help_btn = XmCreatePushButton button_form "help-btn" [
		XmNlabelString		"Help",
		XmNtopAttachment	XmATTACH_POSITION,
		XmNtopPosition		6,
		XmNbottomAttachment	XmATTACH_FORM,
		XmNleftAttachment	XmATTACH_POSITION,
		XmNleftPosition	7,
		XmNrightAttachment	XmATTACH_POSITION,
		XmNrightPosition	10
	];
	val side_effect = map XtManageChild [
		done_btn,
		left_filter_btn,
		left_skeleton_btn,
		left_reset_btn,
		help_btn,
		right_filter_btn,
		right_reset_btn,
		button_form,
		left_list,
		left_text,
		left_context,
		left_paned,
		right_list,
		right_text,
		right_comments,
		right_paned,
		main_paned,
		outer_paned
	];
	val side_effect = XtRealizeWidget shell;
	val side_effect = (
		case XtGetValue button_form "height" of
			XmNheight h => (
				XtSetValues button_form
				[(XmNpaneMaximum h), (XmNpaneMinimum h)]
		) |	_ => ());

	val side_effect = XtSetValue shell (
		XmNiconPixmap		(XCreateBitmapFromData
					(XtWindow shell)
					((implode o map chr) pp_bitmap_bits)
					icon_rect));

in {	left_filter_btn = left_filter_btn,
	left_skeleton_btn = left_skeleton_btn,
	left_reset_btn = left_reset_btn,
	right_filter_btn = right_filter_btn,
	right_reset_btn = right_reset_btn,
	done_btn = done_btn,
	help_btn = help_btn,
	left_list = left_list,
	left_text = left_text,
	left_context = left_context,
	right_list = right_list,
	right_text = right_text,
	right_comments = right_comments,
	shell = shell }
end
)	(* end of function gen_correlator_tool_widgets *);
=TEX
=SML
fun simple_cb (cmd : unit -> unit) :
	Widget * 'a XEvent * unit -> unit = (fn _ => cmd()
);

fun simple_cbs ( [] : (unit -> unit) list) :
	Widget * 'a XEvent * unit -> unit = (fn _ => () )
|   simple_cbs (cmd :: cmds ) = fn x => (cmd(); (simple_cbs(cmds)) x );

=TEX
=SML
in
fun gen_correlator_tool {
	left_keys : unit -> string list,
	right_keys : unit -> string list,
	left_filter	: string -> string list,
	right_filter : string -> string list,
	left_key_to_text : string -> string,
	left_key_to_skeleton : string -> string -> string,
	left_key_to_context : string -> string -> string,
	right_key_to_text : string -> string,
	right_key_to_comments : string -> string,
	help_text : unit -> string list} : Widget = (
let	val {shell, left_list, left_text, left_context, right_list, right_text,right_comments,
		left_filter_btn, left_skeleton_btn,  right_filter_btn, left_reset_btn,
		right_reset_btn, help_btn, done_btn} =
			gen_correlator_tool_widgets
			{left_keys = left_keys, right_keys = right_keys};
	fun set list_w keys = (
		if	not(is_nil keys)
		then	XtSetValues list_w
			[XmNitems	keys,
			XmNselectedItems	[hd keys],
			XmNtopItemPosition	1]
		else	XtSetValues list_w	[XmNitems	keys,
						XmNselectedItems	[]]
	);
	fun clear text_w = (fn () => XmTextSetString text_w "");
	fun select list_w text_w f = (fn () =>
		case XtGetValue list_w "selectedItems" of
			XmNselectedItems (x::_) => (
				XmTextSetString text_w "Please wait.";
				XmTextSetString text_w (f x)
		) |	_ => XmTextSetString text_w ""
	);
	fun reset list_w text_w f g = (fn () => (
		set list_w (f());
		select list_w text_w g ()
	));
	fun filter from_list_w to_list_w to_text_w f g = (fn () =>
		let	val keys = (
				case XtGetValue from_list_w "selectedItems" of
					XmNselectedItems (x::_) => (
						f x
				) |	_ => []
			);
		in	set to_list_w keys;
			select to_list_w to_text_w g ()
		end
	);
	fun filter2 from_list_w to_list_w to_text_w f g = (fn () =>
		let	val (to_keys, from_key) = (
				case XtGetValue from_list_w "selectedItems" of
					XmNselectedItems (x::_) => (
						(f x, x)
				) |	_ => ([],"")
			);
		in	set to_list_w to_keys;
			select to_list_w to_text_w (g from_key) ()
		end
	);
	fun destroy shell_w = (fn () =>
		XtDestroyWidget shell_w
	);
	fun help () = (
		help_widget shell (help_text ());
		()
	);
in	XtSetCallbacks left_list
	[(XmNdefaultActionCallback, simple_cbs [
		(select left_list left_text left_key_to_text),
		(clear left_context),
		(clear right_comments) ]
	)] ();
	XtSetCallbacks right_list
	[(XmNdefaultActionCallback, simple_cbs [
		(select right_list right_text right_key_to_text),
		(clear right_comments) ]
	)] ();
	XtSetCallbacks left_filter_btn
	[(XmNactivateCallback, simple_cbs [
		(filter right_list left_list left_text left_filter left_key_to_text),
		(clear left_context),
		(clear right_comments) ]
	)] ();
	XtSetCallbacks left_skeleton_btn
	[(XmNactivateCallback, simple_cbs [
		(filter2 right_list left_list left_text left_filter left_key_to_skeleton),
		(filter2 right_list left_list left_context left_filter left_key_to_context),
		(select right_list right_comments right_key_to_comments)]
	)] ();
	XtSetCallbacks right_filter_btn
	[(XmNactivateCallback, simple_cbs [
		(filter left_list right_list right_text right_filter right_key_to_text ),
		(clear right_comments) ]
	)] ();
	XtSetCallbacks left_reset_btn
	[(XmNactivateCallback, simple_cbs [
		(reset left_list left_text left_keys left_key_to_text),
		(clear left_context)]
	)] ();
	XtSetCallbacks right_reset_btn
	[(XmNactivateCallback, simple_cbs [
		(reset right_list right_text right_keys right_key_to_text),
		(clear right_comments) ]
	)] ();
	XtSetCallbacks help_btn
	[(XmNactivateCallback, simple_cb help)] ();
	XtSetCallbacks done_btn
	[(XmNactivateCallback, simple_cb
		(destroy shell))] ();
	select left_list left_text left_key_to_text ();
	clear left_context ();
	select right_list right_text right_key_to_text ();
	shell
end
);

end (* of local .. in .. end *);
=TEX
=SML
end (* of structure CNBrowserFrontEnd *);
=TEX
\section{USER INTERFACE}
=TEX
=SML
structure ⦏CNVCBrowser⦎ : CNVCBrowser = struct
=TEX
\subsection{Preamble}
=SML
open CNZGenerator CNTypes CNTypes1 CNTypes2 CNSparkOutput;
=TEX
\subsection{Help Text}
=SML
val ⦏help_text⦎ : unit -> string list = Combinators.K [
"*** This is the Compliance Notation VC Browser ***",
"",
"Compliance notation clauses are shown on the left and VCs on the right.",
"",
"Double-click on the name of a clause or a VC to see it.",
"",
"Pressing a `Filter ' or `VC Derivation' button makes the list above the button" ^
" show only the items corresponding to the selection in the other list and amends" ^
" the display above the list accordingly. In the case of `VC Derivation' the "^
" display elides most statements and declarations not relevant to the chosen VC.",

"",
"Pressing a `Reset' button makes the list above the button show everything again."
];
=TEX
\subsection{VC Names}
=SML
fun ⦏vc_names⦎ ((): unit) : string list = (
	(rev o flat o map fst o get_conjectures) "-"
);
val ⦏right_keys⦎ : unit -> string list =  map translate_for_output o vc_names;
=TEX
\subsection{VCs}
=SML
fun ⦏right_key_to_text⦎ (key : string) : string = (
	translate_for_output
	let	 val act_key = find (vc_names())
			(fn k => translate_for_output k = key);
	in
		format_list Combinators.I
		(	act_key ::
			 "?⊢" ::
			 PrettyPrinter.format_term1
	 			false
	 			40 (* arbitrary, but reasonable, line length *)
				(get_conjecture "-" act_key))
		"\n"
	end	handle Fail _ => "There is no VC called " ^ key
);
=TEX
\subsection{Filtering the Clauses}
=SML
fun prefix_of_vc_name (vcn : string) : string = (
	let	fun aux [] = vcn
		|   aux (ch :: more) = (
			if	ch = "_"
			then	implode (rev more)
			else	aux more
		);
	in	case explode vcn of
			"v" :: "c" :: more => aux (rev more)
		|	_ => vcn
	end
);
=TEX
=SML
fun find_clause (vcn : string) : string list = (
	[prefix_of_vc_name vcn]
);
=TEX
=SML
val ⦏left_filter⦎ : string -> string list = find_clause;
=TEX
\subsection{Filtering the VCs}
=SML
fun ⦏find_vcs⦎ (cln : string) : string list = (
		map translate_for_output (vc_names())
	drop	(fn n => prefix_of_vc_name n <> cln)
);
=TEX
=SML
val right_filter : string -> string list = find_vcs;

=TEX
\subsection{List of Web Clause Names}
=SML
fun ⦏web_clause_names⦎ ((): unit) : string list = (
	let val {repl_env, spark_prog, ...} = get_z_generator_state();
	in	rev (map kslot_compilation_unit_name spark_prog)
	@	rev (map fst repl_env)
	end
);
=SML
val ⦏left_keys⦎ = (
	map translate_for_output o
		web_clause_names
);
=TEX
\subsection{Web Clauses}
=SML
fun ⦏vcb_strings_from_fmt⦎ (fmt : PP_FMT_INFO -> 'a -> unit) (syntax : 'a) : string list = (
	let	val old_cn_automatic_line_splitting = get_int_control "cn_automatic_line_splitting";
		val _ = set_int_control ("cn_automatic_line_splitting", 0);
	in let	val res = strings_from_fmt1 fmt syntax;
		val _ = set_int_control ("cn_automatic_line_splitting", old_cn_automatic_line_splitting);
	in	res
	end	handle ex => (
		set_int_control ("cn_automatic_line_splitting", old_cn_automatic_line_splitting);
		raise ex
	)
	end
);
=TEX
Warning: These may return lists of strings that all require an additional 8 spaces put at the front.
=SML
fun ⦏text_of_kslot_compilation_unit⦎ (kscu: KSLOT_COMPILATION_UNIT)
			: string list = (
	vcb_strings_from_fmt fmt_kslot_compilation_unit kscu
);
=TEX
=SML
fun ⦏text_of_declaration⦎ (d: DECLARATION)
			: string list = (
	vcb_strings_from_fmt fmt_declaration d
);
=TEX
=SML
fun ⦏text_of_statement⦎ (s: STATEMENT)
			: string list = (
	vcb_strings_from_fmt fmt_statement s
);
=TEX
=SML
fun ⦏text_of_annotation⦎ (ANKSlot {label,content}::more)
			: string list = (
	"⟨" ^ content ^ "⟩" ^ "(" ^ label ^ ")" :: text_of_annotation more
) | text_of_annotation (ANString s :: more) = (
	s :: text_of_annotation more
) | text_of_annotation [] = (
	[]
);
=TEX
=SML
fun ⦏text_of_replacement⦎ (rplcmnt : REPLACEMENT) : string list = (
	case rplcmnt of
		ReplaceComp {comp, ...} => (
			"≡" :: flat (map text_of_kslot_compilation_unit comp)
	) |	ReplacePPart {private, ...} => (
			"≡" :: flat (map text_of_declaration private)
	) |	ReplaceVPart {visible, ...} => (
			"≡" :: flat (map text_of_declaration visible)
	) |	ReplaceDecl {decls, ...} => (
			"≡" :: flat (map text_of_declaration decls)
	) |	RefineStat {statement, ...} => (
			"⊑" :: text_of_statement statement
	) |	ReplaceStat {statement, ...} => (
			"≡" :: text_of_statement statement
	) |	ReplaceArbitrary {replacement, ...} => (
			["!≡" ^ replacement]
	) |	ReplaceAnnotation {replacement, ...} => (
			"≡" :: text_of_annotation replacement
	) |	UnReplaced (rsort, lbl) => ["TBS"]
);
=TEX
=SML
fun ⦏sfmt_label⦎ (lbl : string) : string = (
	if	is_all_decimal lbl
	then	"(" ^ lbl ^ ")"
	else	"-- " ^ lbl
);
=TEX
=SML
fun ⦏text_of_repl_env_entry⦎ ((lbl, rplcmnt) : string * REPLACEMENT) : string list = (
	sfmt_label lbl :: text_of_replacement rplcmnt
);
=TEX
=SML
fun ⦏left_key_to_text⦎ (key : string) : string = (
	(* translate_for_output *)
	let	val {spark_prog, repl_env, ...} = get_z_generator_state();
	in
		format_list Combinators.I
		((text_of_repl_env_entry
			(find repl_env(fn (k, _) => translate_for_output k = key)))
			handle Fail _ => (
		(text_of_kslot_compilation_unit
			(find spark_prog (fn kscu =>
				translate_for_output
				(kslot_compilation_unit_name kscu)
				= key)))
		) handle Fail f =>(
			if (area_of (Fail f) = "find")
			then ()
			else (
				diag_line (get_message f)
			);
			[get_error_message 506001 [key]]
		))
		"\n"
	end
);

=TEX
\subsubsection{VC Derivation Skeleton of Web Clause}
In order to show a skeleton of the derivation we have to locate the program unit
if there are several in the web clause. Then we make up a similar web clause with
irrelevant declarations omitted and the relevant statement replaced by a skeleton
showing only the statements traversed in the derivation and ellipses, which we
display. We also display VC derivation information in the origin window.

Note that \textit{address} and \textit{blockids} and names taken from the abstract
syntax fields are in INTERNAL format, while names taken from the left and right keys
displayed on the screen are in EXTERNAL format, hence the need to supply a translation
routine with calls of \textit{\slshape get\_vc\_context\_origin}.

=SML
fun ⦏emp⦎ (s : string) : (unit -> string) = (fn () => s)

=TEX

The following functions are used to identify names for web clauses and are used to find
our place on the stack of names representing the nesting environment.

=SML
fun ⦏b_k_slot_name⦎ ({content, label} : K_SLOT) : string = "kslot"^label;

fun ⦏b_package_declaration_name⦎
	({name, ...} : DECLARATION PACKAGE_DECLARATION)
	: string = (
	name
);


fun ⦏b_procedure_specification_name⦎
	({name, ...} : PROCEDURE_SPECIFICATION) : string = (
	name
);
 fun ⦏b_function_specification_name⦎
	({designator, ...} : FUNCTION_SPECIFICATION) : string = (
	designator
);

fun ⦏b_procedure_body_name⦎ ({procedure_spec, ...} : PROCEDURE_BODY)
	: string = (
	b_procedure_specification_name procedure_spec
);

fun ⦏b_function_body_name⦎ ({function_spec,...} : FUNCTION_BODY)
	: string = (
	b_function_specification_name function_spec
);

fun ⦏b_package_body_name⦎ ({name, ...} : PACKAGE_BODY) : string = (
	name
);
=TEX
=SML
fun ⦏b_proper_body_name⦎ (pb : PROPER_BODY) : string = (
	case pb of
		PBProcedure prc => b_procedure_body_name prc
	|	PBFunction fnc =>  b_function_body_name fnc
	|	PBPackage pck => b_package_body_name pck
);
=TEX
=SML
fun ⦏b_relevant_declaration_name_aux⦎ (d : DECLARATION ) : string = (
case d of
	DProperBody pb => b_proper_body_name pb
|	DProcedureDeclaration pd => b_procedure_specification_name pd
|	DFunctionDeclaration fd => b_function_specification_name fd
|	DProcedureStub ps => b_procedure_specification_name ps
|	DFunctionStub fs => b_function_specification_name fs
|	DExternalProcedureStub eps => b_procedure_specification_name eps
|	DExternalFunctionStub efs => b_function_specification_name efs
|	DDeclarationKSlot _ => "K slot"
|	DRenamingDeclaration _ => "renaming declaration"
|	DRepresentationClause _ => "representation clause"
|	DUseClause _ => "use clause"
|	DPackageDeclaration _ => "package declaration"
|	DPackageStub _ => "package stub declaration"
|	DAuxiliary _ => "auxiliary declaration"
|	DUsing  _ => "using declaration"
|	DBasicDecl sibd => "si basic decl"
);
=TEX
=SML
fun ⦏b_relevant_declaration_name⦎ (d : DECLARATION ) : string = (
	let val rdn = b_relevant_declaration_name_aux d
	in rdn
	end
);
=TEX
=SML
fun ⦏b_subunit_name⦎ ({name, proper_body} : COMP_SUBUNIT) : string = (
	b_proper_body_name proper_body
);
=TEX
=SML
fun ⦏b_compilation_unit_name⦎ (cu : COMPILATION_UNIT) : string = (
	case cu of
		CUPackageDeclaration d => b_package_declaration_name d
	|	CUProperBody b => b_proper_body_name b
	|	CUSubUnit s => b_subunit_name s
);
=TEX
=SML
fun ⦏b_context_compilation_unit_name⦎
	({comp_unit, ...} : CONTEXT_COMPILATION_UNIT) = (
	b_compilation_unit_name comp_unit
);
=TEX
=SML
fun ⦏b_kslot_compilation_unit_name⦎ (kcu : KSLOT_COMPILATION_UNIT) : string = (
	case kcu of
		KCUKSlot ks => b_k_slot_name ks
	|	KCUUnit ccu => b_context_compilation_unit_name ccu
	|	KCUPragma ccu => "<pragma>"
);
=TEX
Now we get down to the skeletonising of the upper levels of program
constructs - the red tape on the outside as far as we are concerned.
The main point is to be able to use the address list derived from
the named in nested blocks in the analysis environment at the
point of VC generation to find the right construct and statement
to which our derivation information applies.

The list provided contains the \textit{\slshape bottom\_block\_name}
effectively a separate location used for VC naming, the \textit{\slshape with}
names, and then the named of nested blocks.  The
\textit{\slshape prog\_key}  gives us the
outer name of the retreieved abstract syntax constructs
and the stack of names from the top of stack (head of list)
to that name taken in reverse order give a hierarchic address
for the construct containing the statement or declaration in which the VC originated.

The  author disclaims all knowledge of VCs that pertain to declarations.
=SML

fun ⦏dummy_statement⦎ ( ) : STATEMENT = (
	STProcNoIvars { name = "...", actuals = APositional [] }
);


val vr_any =			ⓩ(VRAny _)⌝
val vr_null = 			ⓩ(VRNull _)⌝
val vr_assign = 			ⓩ(VRAssign _)⌝
val vr_semi = 			ⓩ(VRSemi _)⌝
val vr_end_semi = 		ⓩ(VREndSemi _)⌝
val vr_spec_via	=		ⓩ(VRSpecVia _)⌝
val vr_spec_to_side = 		ⓩ(VRSpecToSide _)⌝
val vr_spec_pre_intro = 		ⓩVRSpecPreIntro⌝
val vr_proc_call_end =		ⓩ(VRProcCallEnd _)⌝
val vr_proc_call_rng_intro =	ⓩVRProcCallRngIntro⌝
val vr_refinement_begin =		ⓩ(VRRefinementBegin _)⌝

fun get_z_constructor_name ( t : TERM ) : string =
(	case dest_z_term t of
		ZGVar(s,_,_) => s
	|	ZApp(r,_) =>
			( case dest_z_term r of
				ZGVar(s,_,_) => s
			  | 	_ => fail "get_z_constructor_name"
					506007 []
			)
	| 	_ => fail "get_z_constructor_name" 506007 []
);
=TEX
=SML
fun string_cat [] = ""
|   string_cat (s::ss) = s ^ (string_cat ss)
=TEX
=SML
fun ⦏skelstat_fail⦎ ( constr : string, st : STATEMENT) : 'a = (
	fail  "skeleton_statement" 506006
		[emp constr,
		 emp (string_cat (vcb_strings_from_fmt fmt_statement st))
		]
);
=TEX
=SML
fun ⦏route_tail_args⦎  (args :vc_route_arg )
		: vc_route_arg = (
case args of
	VRA_unit _ => VRA_unit()
|	VRA_rte tail => VRA_rte tail
|	VRA_bool_rte( b, tail) => VRA_rte tail
|	VRA_int_rte( i, tail) => VRA_rte tail
|	VRA_str _ => VRA_unit ()
);
=TEX
=SML
fun ⦏route_tail⦎  (args :vc_route_arg)
		: ROUTE = (
case args of
	VRA_unit _ => fail "route_tail" 506007 []
|	VRA_rte tail => tail
|	VRA_bool_rte( b, tail) => tail
|	VRA_int_rte( i, tail) => tail
|	VRA_str _ => fail "route_tail" 506007 []
);
=TEX
=SML
fun ⦏route_strip⦎ ( con : string, rte : ROUTE ) : ROUTE = (
let 	val dr = dest_route (rte)
	val rtecon = get_z_constructor_name (fst dr)
in	if rtecon = con then route_tail (snd dr)
	else fail "route_strip" 506008 [emp con, emp rtecon]
end
);
=TEX
=SML
fun ⦏strip_spec_rng_intros_and_end⦎ ( args : vc_route_arg ) : vc_route_arg = (
let 	val (cons1, args1) = dest_route( route_tail args )
in	if cons1 =$ vr_semi
		orelse cons1 =$ vr_end_semi orelse cons1 =$ vr_spec_via
		orelse cons1 =$ vr_spec_to_side
		orelse cons1 =$ vr_null orelse cons1 =$ vr_assign
	then
		strip_spec_rng_intros_and_end ( args1 )
	else if cons1 =$ vr_proc_call_rng_intro orelse
		cons1 =$ vr_spec_pre_intro
	then args1
	else if cons1 =$ vr_proc_call_end then args1
	else fail "strip_spec_rng_intros_and_end" 506008
		[ emp "VRProcCallEnd _",
		  emp (get_z_constructor_name cons1)
		]
end
);
=TEX
=SML
fun ⦏skelstat⦎ ( st : STATEMENT, rte : ROUTE,
			vcgc : VC_GEN_CONTEXT)
	: (STATEMENT * vc_route_arg) = (
let val dr = dest_route (rte)
in 	if fst dr =$ vr_any  then (dummy_statement(), snd dr)
	else  if fst dr =$ vr_refinement_begin then (
		skelstat(st, route_strip("VRRefinementBegin _", rte),vcgc)
	)
	else  skstat( st, get_z_constructor_name(fst dr), snd dr, vcgc)
end
)

and ⦏skstat⦎ ( st : STATEMENT, rte_con : string,
		args : vc_route_arg,  vcgc : VC_GEN_CONTEXT)
	: (STATEMENT * vc_route_arg) = (
case (st, rte_con) of
	(STNull, "VRNull _") => (st,route_tail_args args)
|	(STImplicitNull, "VRNull _") =>
			(st,route_tail_args args)
|	(STAssign ass, "VRAssign _") => 	
			(st,route_tail_args args)
|	(STSpecNoIvars sni, "VRSpecVia _") =>
			(st,route_tail_args args)
|	(STSpecNoIvars sni, "VRSpecToSide _") =>
			(st, route_tail_args args)
|	(STSpecNoIvars sni, "VRSpecPreIntro") =>
 			(st, VRA_unit())
|	(STSemicolon(st1,st2), "VRSemi _") =>
	let 	val  (dst1,rte_tl1) = skelstat(st1,  route_tail  args, vcgc)
	in 	case rte_tl1 of
			VRA_unit _ => (dst1,rte_tl1)
		|	VRA_rte rte2 =>
			let 	val (dst2, rte_tl2) = skelstat(st2, rte2, vcgc)
				val dsemi = STSemicolon(dst1,dst2)
			in	case rte_tl2 of
					VRA_unit _ => (dsemi, VRA_unit())
				|	VRA_rte rte3 =>
					( dsemi,
					  VRA_rte(route_strip
					  ("VREndSemi _",rte3)))
			end	
	end
|	(STIfThenElse{g,p,q,elsif}, "VRIfThen _") =>
	let 	val (dstif, rte_tl1) = skelstat(p, route_tail args, vcgc)
		val dst = STIfThenElse{g=g,p=dstif,q=dummy_statement(),elsif=elsif}
	in	( case rte_tl1 of
			VRA_unit _ => (dst,VRA_unit())
		  |	VRA_rte rte => (dst, VRA_rte(route_strip("VREndIf _",rte)))
		)
	end
|	(STIfThenElse{g,p,q,elsif}, "VRIfElse _") =>
	let 	val (dstif, rte_tl1) = skelstat(q, route_tail args, vcgc)
		val dst = STIfThenElse{g=g,q=dstif,p=dummy_statement(),elsif=elsif}
	in	( case rte_tl1 of
			VRA_unit _ => (dst,VRA_unit())
		  |	VRA_rte rte => (dst, VRA_rte(route_strip("VREndIf _",rte)))
		)
	end
|	(STCase{e, s, others}, "VRCaseOthers _") =>
	let	val (dstcase, rte_tl1) = skelstat(others, route_tail args, vcgc)
		val dst = STCase{e=e,s=[],others=dstcase}
	in	( case rte_tl1 of
			VRA_unit _ => (dst, VRA_unit())
		  | 	VRA_rte rte => (dst, VRA_rte(route_strip("VREndCase _",rte)))
		)
	end
|	(STCase{e,s,others}, "VRCaseBranch _") =>
	let	val VRA_int_rte(n,_) = args
		val {choices,p} = nth (n - 1) s
		val (dstcase, rte_tl1) = skelstat(p, route_tail args, vcgc)
		val dst = STCase{e=e,s=[{choices=choices,p=dstcase}],
				others = dummy_statement()}
	in	( case rte_tl1 of
			VRA_unit _ => (dst, VRA_unit())
		  |	VRA_rte rte=> (dst, VRA_rte(route_strip("VREndCase _", rte)))
		)
	end
|	(STLoop{t, stmt}, "VRLoopUndecVia _") => (st, route_tail_args args)
|	(STNamedLoop{name, t, stmt}, "VRLoopUndecVia _") => (st, route_tail_args args)
|	(STLoop{t, stmt}, "VRLoopUndecPreIntro") => (st, route_tail_args args)
|	(STNamedLoop{name, t, stmt}, "VRLoopUndecPreIntro") => (st, route_tail_args args)
|	(STLoop{t, stmt}, "VRLoopUndecPreToSide") => (st, route_tail_args args)
|	(STNamedLoop{name, t, stmt}, "VRLoopUndecPreToSide") => (st, route_tail_args args)
|	(STLoop{t, stmt}, "VRLoopUndecToSide _") => (st, route_tail_args args)
|	(STNamedLoop{name, t, stmt}, "VRLoopUndecToSide _") => (st, route_tail_args args)
|	(STWhile{name, g, loop}, "VRWhileVia _") => (st, route_tail_args args)
|	(STWhile{name, g, loop}, "VRWhilePreIntro") => (st, route_tail_args args)
|	(STWhile{name, g, loop}, "VRWhilePreToSide") => (st, route_tail_args args)
|	(STWhile{name, g, loop}, "VRWhileWPToSide _") =>
		skelstat(st, route_tail args,vcgc)
|	(STForStatic _, "VRForVia _") => (st, route_tail_args args)
|	(STForStatic _, "VRForPreIntro") => (st, route_tail_args args)
|	(STForStatic _, "VRForPreToSide") => (st, route_tail_args args)
|	(STForStatic _, "VRForToSide _") => (st, route_tail_args args)
|	(STForStatic _, "VRForExitToSide _") => (st, route_tail_args args)
|	(STForTmark _, "VRForVia _") => (st, route_tail_args args)
|	(STForTmark _, "VRForPreIntro") => (st, route_tail_args args)
|	(STForTmark _, "VRForPreToSide") => (st, route_tail_args args)
|	(STForTmark _, "VRForToSide _") => (st, route_tail_args args)
|	(STForTmark _, "VRForExitToSide _") => (st, route_tail_args args)
|	(STExitWhen _, "VRExitTillIntro") => (st, route_tail_args args)
|	(STExitWhen _, "VRExitVia _") => (st, route_tail_args args)
|	(STExit _, "VRExitTillIntro") => (st, route_tail_args args)
|	(STExit _, "VRExitVia _") => (st, route_tail_args args)
|	(STRet _, "VRReturnIntro") => (st, route_tail_args args)
|	(STKSlot _, _) => (fail "skstat" 506009 [])
|	(SSpecIvars sni, "VRSpecVia _") =>
			(st,route_tail_args args)
|	(SSpecIvars sni, "VRSpecToSide _") =>
			(st, route_tail_args args)
|	(SSpecIvars sni, "VRSpecPreIntro") =>
 			(st, VRA_unit())
|	(SForNonStatic _, "VRForVia _") => (st, route_tail_args args)
|	(SForNonStatic _, "VRForPreIntro") => (st, route_tail_args args)
|	(SForNonStatic _, "VRForPreToSide") => (st, route_tail_args args)
|	(SForNonStatic _, "VRForToSide _") => (st, route_tail_args args)
|	(SForNonStatic _, "VRForExitToSide _") => (st, route_tail_args args)
|	(SLogCon _, "VRLogConToSide _") => (st, route_tail_args args)
|	(SLogCon _, "VRLogConPreIntro") => (st, route_tail_args args)
|	(SLogCon _, "VRLogConTypeMemIntro") => (st, route_tail_args args)
|	(STProcNoIvars _, "VRProcCall _") =>
		(st, strip_spec_rng_intros_and_end (route_tail_args args))
|	(SProcIvars _, "VRProcCall _") =>
		(st, strip_spec_rng_intros_and_end (route_tail_args args))
|	(STPragma _, "VRNull _") => (st, route_tail_args args)
|	(STAnnotation _, "VRNull _") => (st, route_tail_args args)
| 	(SBlockStatement{statement, ...}, _) => skstat(statement, rte_con, args, vcgc)
|	_ => 		skelstat_fail(rte_con,st)			
);
=TEX
=SML
fun ⦏skeleton_statement⦎ ( st : STATEMENT, rte : ROUTE,
			vcgc : VC_GEN_CONTEXT) : STATEMENT = (
	fst (skelstat(st, rte, vcgc))
);
=TEX
=SML
fun ⦏skeleton_procedure_body⦎
	( pb : PROCEDURE_BODY, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT  ) : PROCEDURE_BODY  = (
let	val {procedure_spec,declarative_part,statement}  = pb
in	if hd address = #name procedure_spec then (
		if is_nil (tl address) then
		( if vcgc = VCG_subprogram_spec then
			{ procedure_spec = procedure_spec,
			  declarative_part = declarative_part,
			  statement =
				case #spec procedure_spec of
				  Nil => dummy_statement()
				| Value proc_spec =>
					STSpecNoIvars (*	fmt_statement complains on
							SSpecIvars ! *)
					{ spec = proc_spec,
				  	  label = "",
					  is_assertion = false
					}
			}
		  else
		  { procedure_spec = procedure_spec,
		    declarative_part = declarative_part,
		    statement =
		  	skeleton_statement(statement,rte,vcgc)
		  }
		)
		else
		{ procedure_spec = procedure_spec,
		  declarative_part =
			skeleton_declaration_list( declarative_part, tl address, rte, vcgc),
		  statement = dummy_statement()
		}
	) else  fail "skeleton_procedure_body" 506003 [emp (hd address)]
end
)

and ⦏skeleton_function_body⦎
	( fb : FUNCTION_BODY, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT  ) : FUNCTION_BODY  = (
let	val {function_spec, declarative_part,statement} = fb
in	if hd address = #designator function_spec then (
		if is_nil (tl address) then
		( if vcgc = VCG_subprogram_spec then
			{ function_spec = function_spec,
			  declarative_part = declarative_part,
			  statement =
				case #spec function_spec of
				  Nil => dummy_statement()
				| Value proc_spec =>
					STSpecNoIvars
					{ spec = proc_spec,
				  	  label = "",
					 is_assertion = false
					}
			}
		  else
		  { function_spec = function_spec,
		    declarative_part = declarative_part,
		    statement =
		  	skeleton_statement(statement,rte,vcgc)
		  }
		)
		else
		{ function_spec = function_spec,
		  declarative_part =
			skeleton_declaration_list( declarative_part, tl address, rte, vcgc),
		  statement = dummy_statement()
		}
	) else  fail "skeleton_procedure_body" 506003 [emp (hd address)]
end
)


and ⦏skeleton_declaration⦎
	( dl : DECLARATION, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT  ) : DECLARATION  = (
case dl of
	DProperBody pb =>
		DProperBody
		( skeleton_proper_body( pb, address, rte,vcgc))
|	_ => fail "skeleton_declaration" 506003
			[emp "not a proper body"]
)
(*
=TEX
\textit{\slshape address} is not empty here.
=SML
*)
and ⦏skeleton_declaration_list⦎
	( dl : DECLARATION list, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT  ) : DECLARATION list  = (
	if is_nil dl then fail "skeleton_declaration_list" 506003
				[emp (hd address)]
	else if hd address = b_relevant_declaration_name (hd dl)
	then [ skeleton_declaration(hd dl, address, rte,vcgc) ]
	else skeleton_declaration_list(tl dl, address, rte,vcgc)
)

and ⦏skeleton_package_body⦎
	( pb : PACKAGE_BODY, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT  ) : PACKAGE_BODY  = (
let	val {name,decls,statement,annotation} = pb
in	if address = [] then
		{ name = name, decls = decls,
		  statement =
			skeleton_statement(statement,rte,vcgc),
		  annotation = annotation
		}
	else 	if hd address = name
		then
		{ name = name,
		  decls =
			skeleton_declaration_list(decls,tl address,rte,vcgc),
		  statement = dummy_statement(),
		  annotation = annotation
		}
		else fail "skeleton_package_body" 506003 [emp (hd address)]
end
)

and ⦏skeleton_proper_body⦎
	( pb : PROPER_BODY, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT  ) : PROPER_BODY  = (
case pb of
	PBProcedure proc_body => 	
		PBProcedure
		(skeleton_procedure_body(
			proc_body, address, rte, vcgc
		))
|	PBFunction fun_body =>
		PBFunction
		(skeleton_function_body(
			fun_body, address, rte, vcgc
		))
|	PBPackage package_body =>
		PBPackage
		(skeleton_package_body(
			package_body, address, rte, vcgc
		))
)
(*
=TEX
=SML
*)
and ⦏skeleton_package_declaration⦎
	(pd : DECLARATION PACKAGE_DECLARATION, address : string list,
	 rte : ROUTE, vcgc : VC_GEN_CONTEXT
	) : DECLARATION PACKAGE_DECLARATION = (
let 	val {name,visible_decs,private_decs,annotation} = pd
	val rname = "skeleton_package_declaration"
in	if is_nil address
	then fail rname 506005 [emp "package declaration"]
	else
	let 	val (skel_vis, skel_priv) =
		  (skeleton_declaration_list(visible_decs,address,rte,vcgc),
		    [])
		   handle _ =>
		  ([],
		   skeleton_declaration_list(private_decs,address,rte,vcgc))
		   handle _ =>
			fail rname 506003 [emp (hd address)]
	in
		{ name = name, visible_decs = skel_vis,
		  private_decs = skel_priv, annotation = annotation
		}
	end
end
);
=TEX
Note that for \textit{\slshape COMP\_SUBUNIT} the \textit{\slshape name}
is that of the parent and we don't expect a corresponding name in the
address list since \textit{\slshape kslot\_compilation\_unit\_name}
returns the proper body name.
=SML

fun ⦏skeleton_comp_subunit⦎
	( cs : COMP_SUBUNIT, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT ) : COMP_SUBUNIT  = (
	let	val {name,proper_body} = cs
	in	{name = name,
		 proper_body =
			skeleton_proper_body(
				proper_body,address,rte,vcgc
			)
		}
	end
);

fun ⦏skeleton_compilation_unit⦎
	( cu : COMPILATION_UNIT, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT ) : COMPILATION_UNIT  = (
	case cu of
		CUPackageDeclaration package_decl =>
			CUPackageDeclaration
			(skeleton_package_declaration(
				package_decl,address,rte,vcgc
			))
	|	CUProperBody proper_body =>
			CUProperBody
			(skeleton_proper_body(
				proper_body,address,rte,vcgc
			))
	|	CUSubUnit comp_subunit =>
			CUSubUnit
			(skeleton_comp_subunit(
				comp_subunit,address,rte,vcgc
			))	
);

fun ⦏skeleton_context_compilation_unit⦎
	( ccu : CONTEXT_COMPILATION_UNIT, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT
	) : CONTEXT_COMPILATION_UNIT  = (
let 	val {context,references,comp_unit,annotation} = ccu
	val sk_cu =
		skeleton_compilation_unit(comp_unit,address,rte,vcgc)
in
		{context = context,
		 references = references,
		 comp_unit = sk_cu,
		 annotation = annotation
		}
end
);

fun ⦏skeleton_kslot_compilation_unit⦎
	( kscu : KSLOT_COMPILATION_UNIT, address : string list,
		rte : ROUTE, vcgc : VC_GEN_CONTEXT ) : KSLOT_COMPILATION_UNIT  = (
let	val kname = b_kslot_compilation_unit_name kscu
	val area = "skeleton_kslot_compilation_unit"
in	case kscu of
		KCUKSlot kslot => fail area 506005 [emp "kslot"]
	|	KCUUnit ctxt_comp_unit => 	
		if kname = hd address then (
			KCUUnit
			(skeleton_context_compilation_unit(
				ctxt_comp_unit, address, rte, vcgc
			))
		) else fail area 506004 [emp (translate_for_output kname)]
	|	KCUPragma x => fail area 506005 [emp "kslot pragma"]
end
);
=TEX
When we are dealing with a replacement the environment set up by the main analysis
has a bottom block with name derived from the web clause label and one more block
which has the whole flattened environment in it so that we just
throw two names off the front of \textit{\slshape address} to get the
address within the declaration list which is the replacement (except that for replacement
compilation units there is no environment and the vc names are derived from the
compilation unit name so we don't have to discard any names from \textit{\slshape address}).
=SML
fun ⦏skeleton_replacement⦎  (repl : REPLACEMENT, address : string list,
				rte : ROUTE, vcgc : VC_GEN_CONTEXT )
	: REPLACEMENT = (
case repl of
	ReplaceStat { label, statement = s } =>
		ReplaceStat{ label = label, statement =
			skeleton_statement(s, rte, vcgc)}
|	RefineStat  { label, statement = s } =>
		RefineStat {label = label, statement =
			skeleton_statement(s, rte, vcgc)}
|	ReplaceComp {label, comp } => (
		if is_nil comp then fail "skeleton_replacement" 506003 []
		else if is_nil (tl comp) then (
			ReplaceComp {label = label, comp = [
					skeleton_kslot_compilation_unit(
						hd comp, address, rte, vcgc
					)
					]}
		)
		else fail "skeleton_replacement" 506003 []
	)
|	ReplacePPart{label, private} =>
		ReplacePPart{label = label, private =
			skeleton_declaration_list(private,tl(tl address),rte,vcgc)}
|	ReplaceVPart{label, visible} =>
		ReplaceVPart{label = label, visible =
			skeleton_declaration_list(visible,tl(tl address),rte,vcgc)}
|	ReplaceDecl {label, decls} =>
		ReplaceDecl{label = label, decls =
			skeleton_declaration_list(decls,tl(tl address),rte,vcgc)}
| 	_ => fail "skeleton_replacement" 506003  []
);
=TEX
=SML
fun ⦏names_up_to⦎ (ids : string list, target : string, sofar : string list)
	: (string list) * (string list) = (
	( 	if (* translate_for_output( *) hd ids (* ) *) = target
		then (target ::sofar, [])
		else names_up_to(tl ids, target, (hd  ids) :: sofar)
	)
	handle _ => ([],[get_error_message 506004 [target]])
);
=TEX
=SML
fun ⦏text_of_skeleton_replacement⦎  	
	( vc_name : string, prog_key : string, rte : ROUTE, blockids : string list,
	  vcgc : VC_GEN_CONTEXT, ( _, repl) : (string * REPLACEMENT)
	) : string list = (

let	val (address,errors)  = names_up_to(blockids, prog_key, [])
in	if is_nil errors then
		(text_of_repl_env_entry (
			prog_key,
			skeleton_replacement(repl, address, rte, vcgc) ))
	else errors
end
handle Fail x => raise Fail x |  _ => [get_error_message 506003 [prog_key]]
)
;


fun ⦏text_of_skeleton_compilation_unit⦎ 	
	( vc_name : string, prog_key : string, rte : ROUTE, blockids : string list,
		vcgc : VC_GEN_CONTEXT, kscu : KSLOT_COMPILATION_UNIT
	) : string list = (
let	val (address,errors)  =
		names_up_to(blockids, b_kslot_compilation_unit_name kscu, [])
	in	
	(	if is_nil errors then
		let	val skeleton =
			skeleton_kslot_compilation_unit(
				kscu, address, rte, vcgc )
		in	
			text_of_kslot_compilation_unit skeleton
		end
		else errors
	)
	handle Fail x => raise Fail x | _ => [get_error_message 506003 [prog_key]]
end
);



fun ⦏get_skeleton⦎ (vc_name : string, prog_key : string, rte : ROUTE,
			blockids : string list, vcgc : VC_GEN_CONTEXT
		 ) : string =
translate_for_output(
	format_list Combinators.I
	let	val {spark_prog, repl_env, ...} = get_z_generator_state();
	in	((
			text_of_skeleton_replacement(
				vc_name, prog_key, rte, blockids, vcgc,			
				(find repl_env(fn (k, _) =>
					translate_for_output k = prog_key))
			))
			handle Fail f => (
			if area_of (Fail f) = "find" then
			text_of_skeleton_compilation_unit(
				vc_name, prog_key, rte, blockids, vcgc,
				(find spark_prog (fn kscu =>
					translate_for_output
					(kslot_compilation_unit_name kscu)=
						prog_key))
			) else raise Fail f
			))
			handle Fail f => (
				if (area_of (Fail f) = "find")
				then ()
				else (
					diag_line (get_message f)
				);
				[get_error_message 506001 [prog_key]]			
		)
	end  "\n"
);

fun ⦏left_key_to_skeleton⦎  (vc_name : string) (prog_key : string ) : string =
	let 	val {route,blockids,context,vcg_context} =
				get_vc_context_route(vc_name, translate_for_output)
	in 	case route of
			Nil  => get_error_message 506003 [vc_name]
		|	Value rte =>
			  get_skeleton(vc_name,prog_key,rte,blockids,vcg_context)
	end;
=TEX
We also give here the production of comments about the start and possible siding
of the VC in question.
=SML
fun ⦏derivation_comments⦎ (vc_name : string, rte : ROUTE,
				prefix : string, vcgc : VC_GEN_CONTEXT)
	: string = (
let	val (cons, args) = dest_route rte
	val consname = get_z_constructor_name cons
	val comm =
	case consname of
 	"VRAny _" =>   ""
|	"VRNull _" => ""
|	"VRAssign _" => ""
|	"VRSpecVia _" => ""
|	"VRSpecToSide _" => get_error_message 506020 [vc_name]
|	"VRSpecPreIntro" => get_error_message 506021 [vc_name]
|	"VRSemi _" => ""
|	"VREndSemi _" => ""
|	"VRIfThen _" => ""
|	"VRIfElse _" => ""
|	"VREndIf _" => ""
|	"VRCaseBranch _" => ""
|	"VRCaseOthers _" => ""
|	"VREndCase _" => ""
|	"VRLoopUndecVia _" => ""
|	"VRLoopUndecPreIntro" => get_error_message 506022 [vc_name]
|	"VRLoopUndecPreToSide" => get_error_message 506023 [vc_name]
|	"VRLoopUndecToSide _" => get_error_message 506024 [vc_name]
|	"VRWhileVia _" => ""
|	"VRWhilePreIntro" => get_error_message 506025 [vc_name]
|	"VRWhileWPToSide _" => get_error_message 506026 [vc_name]
|	"VRWhileToSide _" => get_error_message 506027 [vc_name]
|	"VRForVia _" => ""
|	"VRForPreIntro" => get_error_message 506028 [vc_name]
|	"VRForPreToSide" => get_error_message 506029 [vc_name]
|	"VRForToSide _" => get_error_message 506030 [vc_name]
|	"VRForExitToSide _" => get_error_message 506031 [vc_name]
|	"VRExitTillIntro" => get_error_message 506032 [vc_name]
|	"VRExitVia _" => ""
|	"VRReturnIntro" => get_error_message 506033 [vc_name]
|	"VRProcCall _" => ""
|	"VRProcCallEnd _" => ""
|	"VRProcCallRngIntro" => get_error_message 506034 [vc_name]
|	"VRLogConToSide _" => get_error_message 506035 [vc_name]
|	"VRLogConPreIntro" => get_error_message 506036 [vc_name]
|	"VRLogConTypeMemIntro" => get_error_message 506037 [vc_name]
|	"VRRefinementBegin _" => ""
|	"VRRefinementIntro" =>
		get_error_message
			( case vcgc of
				VCG_refinement => 506038
			  |	VCG_subprogram_body => 506040
			  |	VCG_subprogram_spec => 506041
			  |	VCG_subunit_spec => 506042
			  |	VCG_package_init => 506043
			)
			[vc_name]
|	x => 	let val m = get_error_message 506039 [x]
		in m
		end
in
	case args of
		VRA_unit _ => prefix ^ comm
	|	VRA_rte rte => derivation_comments(
				vc_name, rte, prefix ^ comm, vcgc )
	|	VRA_int_rte(_,rte) =>
			derivation_comments(
				vc_name, rte, prefix ^ comm, vcgc)
	|	VRA_bool_rte(_,rte) =>
			derivation_comments(
				vc_name, rte, prefix ^ comm, vcgc )
	|	VRA_str _ => prefix ^ comm
end
);
=TEX
=SML
fun ⦏get_derivation_comments⦎ (	vc_name : string, rte : ROUTE,
				vcgc : VC_GEN_CONTEXT ) : string = (
	(* "born,assigned and sided" *)
	derivation_comments(vc_name, rte, "", vcgc)
);
=TEX
=SML
fun ⦏right_key_to_comments⦎  (vc_name : string)  : string = (
	let 	val {route,blockids,context,vcg_context} =
			get_vc_context_route(vc_name, translate_for_output)
	in 	case route of
			Nil  => get_error_message 506003 [vc_name]
		|	Value rte => get_derivation_comments(vc_name,rte,vcg_context)
	end
);
=TEX
\subsubsection{Refinement Context of Web Clause}
=SML
fun ⦏named_tills_to_strings⦎ ( []: (ID * Z_PRED) list ): string list = []
|     named_tills_to_strings ( (name,till)::named_tills ) =  (
	[name ^": "] @ (vcb_strings_from_fmt fmt_z_pred till) @
		(named_tills_to_strings named_tills)
);
=TEX
=SML
fun ⦏context_to_string⦎ ( {w,pre,post,till,return,named_tills} : vc_clause_context )
	: string = (
	let 	val ztmq = ZUserInterfaceSupport.ZTmQuotation;
		val ztmpre = ztmq(pre,Nil);
		val ztmpost = ztmq(post,Nil);
		val spec_txt = vcb_strings_from_fmt fmt_spec
				(false, {w=w,w0=[],pre=ztmpre,post=ztmpost});
		val till_txt = vcb_strings_from_fmt fmt_z_pred till;
		val return_txt = vcb_strings_from_fmt fmt_z_pred return;
		val named_tills = named_tills_to_strings named_tills
		val txt = 	["SPEC:"]@spec_txt@["TILL:"]@till_txt@
				["RETURN:"]@return_txt@named_tills;
	in	format_list Combinators.I txt "\n"
	end
);
=TEX
=SML
fun ⦏vcg_context_to_string⦎ (c : VC_GEN_CONTEXT) : string =  (
case c of
	VCG_refinement => "Refinement step"
|	VCG_subprogram_body => "Subprogram body refines spec in header"
|	VCG_subprogram_spec => "Subprogram spec refines spec in package specification"
|	VCG_subunit_spec => "Subunit: subprogram spec refines spec on stub"
|	VCG_package_init => "Package initialisation refines data refinement constraints"
|	VCG_basic_declaration => "Checks that type is not empty"
|	VCG_unknown => ""
);
=TEX
=SML
fun ⦏vcname_to_context⦎ (vcn : string, key : string) : string = (
	let	val {route, blockids, context, vcg_context} =
					get_vc_context_route(vcn, translate_for_output)
		val vcgctxt = vcg_context_to_string vcg_context
	in	case context of
			Nil =>   vcgctxt ^ "\n" ^
				(get_error_message 506002 [key])
		|	Value ctxt => vcgctxt ^ "\n" ^ (context_to_string ctxt)
	end
);

fun ⦏left_key_to_context⦎ (key : string) (dontcare : string): string = (
(*	let	val vcs_of_key =
			(vc_names()) drop (fn n => prefix_of_vc_name n <> key)
	in	if vcs_of_key = [] then (get_error_message 506002 [key])
		else vcname_to_context(hd vcs_of_key, key)
	end
*)
	vcname_to_context (key, key)
);
=TEX
=TEX
\subsection{Entry Point}
=SML
val ⦏shell⦎ : Motif.Widget OPT ref = ref Nil;
fun ⦏browse_vcs⦎ (() : unit) : unit = (
	case shell of
		ref Nil => (
		 shell := Value(CNBrowserFrontEnd.gen_correlator_tool{
			left_keys = left_keys,
			right_keys = right_keys,
			left_filter = left_filter,
			right_filter = right_filter,
			left_key_to_text = left_key_to_text,
			left_key_to_skeleton = left_key_to_skeleton,
			left_key_to_context = left_key_to_context,
			right_key_to_text =right_key_to_text,
			right_key_to_comments = right_key_to_comments,
			help_text =help_text})
	) |	ref (Value w) =>  (
		Motif.XtMapWidget w
		handle XWindows _ => (
			shell := Nil;
			browse_vcs()
		)
	)
);
=TEX
=SML
end (* of structure CNVCBrowser *);
=TEX
\small
\twocolumn[\section{INDEX}]
\printindex
\end{document}

(*
print_status();
open_theory"z_library";
XtDestroyWidget shell;
XtDestroyWidget h;
XmNdefaultActionCallback;
help_widget shell text;
val iconBitmap = (
	case XReadBitmapFile (XtWindow shell) "pp_bitmap.h" of
		BitmapSuccess (x,_,_) => x
	|	_ => fail "setting_up_bitmap" 99999 []
);
XtSetValue shell (XmNiconPixmap iconBitmap);
XtSetValue shell (XmNiconName "VC Browser");
XtSetValues shell [XmNdeleteResponse XmUNMAP];
XtSetValues shell [XmNmappedWhenManaged false];
val XmNchildren cs = XtGetValue shell "children";
XtSetValues (hd cs) [XmNmappedWhenManaged true];
XmNeditable;
*)
(*
The following may be used to help convert an X11 bitmap file into
what is needed by XCreateBitmapFromData (although it would be
much better to supply
fun int_of_hexit ch = (
	if	"0" <= ch andalso ch <= "9"
	then	ord ch - ord "0"
	else if "a" <= ch andalso ch <= "f"
	then	(ord ch - ord "a") + 10
	else	~1
);
fun Ox bb = (
	case explode bb of
		(h :: l :: []) => 16 * int_of_hexit h + int_of_hexit l
	|	_ => ~1
);
*)


