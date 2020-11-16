=IGN
********************************************************************************
usr013S.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
% usr013S.doc $Date: 2002/10/18 15:26:07 $ $Revision: 2.4 $ $RCSfile: usr013S.doc,v $
% COPYRIGHT (c) Lemma 1 Ltd.
\ignore{
=SML
(* usr013S.sml $Date: 2002/10/18 15:26:07 $ $Revision: 2.4 $ $RCSfile: usr013S.doc,v $
   COPYRIGHT (c) Lemma 1 Ltd. *)
=TEX
}

\chapter{SOLUTIONS TO EXERCISES}\label{Solutions}

No solutions are provided for those exercises whose nature is exploratory rather than problem solving.

Nevertheless, section headings are included for those exercises, so that the correspondence between sections in this Chapter and Chapter \ref{Exercises} is maintained.

\section{Easy Proofs}

\section{HOL Theory Explorations}

\section{Specification}

\section{Forward Proof}

=SML
(* 1(a) *)
val ext1_thm1 = asm_rule ⌜a⇒b⌝;
val ext1_thm2 = asm_rule ⌜b⇒c⌝;
val ext1_thm3 = asm_rule ⌜a:BOOL⌝;
val ext1_thm4 = ⇒_elim ext1_thm1 ext1_thm3;
val ext1_thm5 = ⇒_elim ext1_thm2 ext1_thm4;
(* 1(b) *)
val ext2_thm1 =
 ⇒_elim (asm_rule ⌜a⇒b⇒c⌝)(asm_rule ⌜a:BOOL⌝);
=TEX
=SML
(* 2(a) *)
val ext3_thm1 = ∀_elim ⌜0⌝ ¬_plus1_thm;
(* 2(b) *)
val ext4_thm1 = ∀_elim ⌜x*x⌝ ¬_plus1_thm;
=TEX
=SML
(* 3(a) *)
val ext5_thm1 = all_∀_elim ≤_trans_thm;
=TEX
=SML
(* 4(a) *)
val ext6_thm1 = list_∀_elim [⌜0⌝,⌜1⌝] ¬_less_thm;
(* 4(b) *)
val ext7_thm1 = list_∀_elim [⌜3⌝,⌜x*x⌝] ≤_trans_thm;
=TEX
=SML
(* 5(a) *)
val ext8_thm1 = strip_∧_rule (all_∀_elim ≤_clauses);
val ext8_thm2 = all_∀_intro (nth 3 ext8_thm1);
(* 5(b) *)
val ext8_thm2 = list_∀_intro [⌜m⌝,⌜i⌝,⌜n⌝](nth 3 ext8_thm1);
=TEX

\section{Rewriting with the Subgoal Package}

\section{Combining Forward and Backward Proof}

\begin{enumerate}
\item :
=SML
set_goal([],⌜x + y = y + x⌝);
a (rewrite_tac[]);
=TEX
\item :
=SML
set_goal([],⌜x + y + z = (x + y) + z⌝);
a (rewrite_tac[plus_assoc_thm]);
=TEX
\item :
=SML
set_goal([],⌜z + y + x = y + z + x⌝);
a (rewrite_tac[plus_assoc_thm1]);
=TEX
\item :
=SML
set_goal([],⌜x + y + z = y + z + x⌝);
a (rewrite_tac[∀_elim ⌜y⌝ plus_assoc_thm1]);
=TEX
\item :
=SML
set_goal([],⌜x + y + z + v = y + v + z + x⌝);
a (rewrite_tac[∀_elim ⌜x⌝ plus_order_thm]);
=TEX
\end{enumerate}

\section{Stripping}

\section{Induction}

=SML
set_goal([],⌜∀l1 ⦁ l1 @ [] = l1⌝);		(* no. 1 *)
a strip_tac;
a (list_induction_tac ⌜l1⌝
  THEN asm_rewrite_tac [append_def]);
val empty_append_thm = pop_thm();
=TEX
=SML
set_goal([],⌜∀l1 l2 ⦁ Rev (l1 @ l2) =
	(Rev l2) @ (Rev l1)⌝);	(* no. 2 *)
a (REPEAT strip_tac);
a (list_induction_tac ⌜l1⌝ THEN asm_rewrite_tac
  [append_assoc_thm, empty_append_thm,
	append_def, rev_def]);
val rev_distrib_thm = pop_thm();
=TEX
=SML
set_goal([],⌜∀f l1 l2 ⦁ Map f (l1 @ l2) =
	(Map f l1) @ (Map f l2)⌝);	(* no. 3 *)
a (REPEAT strip_tac);
a (list_induction_tac ⌜l1⌝ THEN asm_rewrite_tac
  [map_def, empty_append_thm, append_def]);
val map_distrib_thm = pop_thm();
=TEX
=SML
set_goal([],⌜∀l1 l2⦁ Length (l1 @ l2) =
	Length l1 + Length l2⌝);	(* no. 4 *)
a (REPEAT strip_tac);
a (list_induction_tac ⌜l1⌝ THEN asm_rewrite_tac
  [append_def, length_def, plus_assoc_thm]);
val length_distrib_thm = pop_thm();
=TEX

\section{TACTICALs}

=SML
(* no. 1 *)
val strip3_tac = TRY_T strip_tac THEN strip_tac THEN strip_tac;
set_goal([],⌜(a ⇒ b ⇒ c) ⇒ a ⇒ b ⇒ c⌝);
a strip3_tac;
=TEX
=SML
(* no. 2 *)
val stripto3_tac = strip_tac THEN_TRY strip_tac
		THEN_TRY strip_tac;
set_goal([],⌜(a ⇒ b) ⇒ a ⇒ c⌝);
a stripto3_tac;
=TEX
=SML
(* no. 3 *)
fun list_induct_tac var thl =
	REPEAT strip_tac
	THEN list_induction_tac var
	THEN_TRY asm_rewrite_tac thl;

set_goal([],⌜∀l1 l2 l3 ⦁
  (l1 @ l2) @ l3 = l1 @ (l2 @ l3)⌝);
a (list_induct_tac ⌜l1:'a LIST⌝ [append_def]);
val append_assoc_thm = pop_thm ();

set_goal([], ⌜∀l1:'a LIST ⦁ l1 @ [] = l1⌝);
a (list_induct_tac ⌜l1:'a LIST⌝ [append_def]);
val empty_append_thm = pop_thm();
=TEX
=IGN
set_goal([], ⌜∀l1 l2:'a LIST  ⦁
  Rev (l1 @ l2) = (Rev l2) @ (Rev l1)⌝);
a (list_induct_tac ⌜l1:'a LIST⌝
  [append_def, rev_def, append_assoc_thm, empty_append_thm]);
set_goal([], ⌜∀f; l1 l2:'a LIST⦁
  Map f (l1 @ l2) = (Map f l1) @ (Map f l2)⌝);
a (list_induct_tac ⌜l1:'a LIST⌝
  [append_def, map_def, append_assoc_thm, empty_append_thm]);
set_goal([], ⌜∀l1 l2:'a LIST⦁ Length (l1 @ l2)
	= Length l1 + Length l2⌝);
a (list_induct_tac ⌜l1:'a LIST⌝
  [append_def, length_def, append_assoc_thm,
  empty_append_thm, plus_assoc_thm]);
=TEX

\section{$strip\_asm\_tac$ etc.}

=SML
					(* (a) *)
set_goal([], ⌜∀x⦁(if x = 0 then 1 else x) > 0⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜x⌝ℕ_cases_thm) THEN asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
					(* (b) *)
set_goal([], ⌜∀x y⦁(if x < y + 1 then x else y) < y + 1⌝);
a(REPEAT strip_tac);
a(CASES_T ⌜x < y + 1⌝ rewrite_thm_tac);
pop_thm();
=TEX
=SML
					(* (c) *)
set_goal([], ⌜∀a b⦁a ≤ (if a ≤ b then b else a)⌝);
a(REPEAT strip_tac);
a(CASES_T ⌜a ≤ b⌝ rewrite_thm_tac);
pop_thm();
=TEX
=SML
					(* (d) *)
set_goal([], ⌜∀a⦁a = 0 ∨ 1 ≤ a⌝);
a(strip_tac);
a(strip_asm_tac(∀_elim⌜a⌝ℕ_cases_thm) THEN asm_rewrite_tac[]);
pop_thm();
=TEX

With $swap\_asm\_concl\_tac$:
=SML
set_goal([], 				(* (i)(a) *)
 ⌜(∀x y⦁x ≤ y ⇒  P(x, y)) ⇒ (∀x y⦁x = y ⇒  P(x, y))⌝);
a(REPEAT strip_tac);
a(list_spec_nth_asm_tac 2[⌜x⌝, ⌜y⌝]);
a(swap_asm_concl_tac ⌜¬ x ≤ y⌝ THEN asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
set_goal([], 				(* (i)(b) *)
 ⌜(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)⌝);
a(REPEAT strip_tac);
a(list_spec_nth_asm_tac 2[⌜x⌝, ⌜y⌝]);
a(swap_asm_concl_tac ⌜¬ f x ≤ f y⌝ THEN asm_rewrite_tac[]);
pop_thm();
=TEX
With $lemma\_tac$:
=SML
set_goal([], 				(* (ii)(a) *)
 ⌜(∀x y⦁x ≤ y ⇒  P(x, y)) ⇒ (∀x y⦁x = y ⇒  P(x, y))⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜x ≤ y⌝ THEN1 asm_rewrite_tac[]);
a(list_spec_nth_asm_tac 3 [⌜x⌝, ⌜y⌝]);
pop_thm();
=TEX
=SML
set_goal([], 				(* (ii)(b) *)
 ⌜(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜f x ≤ f y⌝ THEN1 asm_rewrite_tac[]);
a(list_spec_nth_asm_tac 3 [⌜x⌝, ⌜y⌝]);
pop_thm();
=TEX

\section{Forward Chaining}

=SML
set_goal([], ⌜∀a b c d⦁a ≤ b ∧ b ≤ c ∧ c ≤ d ⇒ a ≤ d⌝);
					(* 1(a) *)
a(REPEAT strip_tac);
a(all_fc_tac[≤_trans_thm] THEN all_fc_tac[≤_trans_thm]);
pop_thm();
=TEX
=SML
set_goal([], ⌜∀X Y Z⦁X ⊆ Y ∧ Y ⊆ Z ⇒ X ⊆ Z⌝);	(* 1(b) *)
a(REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
pop_thm();
=TEX
In both cases, at least 2 applications of forward chaining are
needed since a result from one forward chaining pass must be
added to the assumptions to ``seed'' the second pass.
=SML
set_goal([],				(* 2 *)
 ⌜(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜f x ≤ f y⌝ THEN1 asm_rewrite_tac[]);
a(all_asm_fc_tac[]);
pop_thm();
=TEX

\section{Proof Contexts}

=SML
					(* 1 *)
set_goal([], ⌜(∀x y⦁f(x, y) = (y, x)) ⇒ ∀x y⦁f(f (x, y)) = (x, y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
set_pc"predicates";
set_goal([], ⌜(∀x y⦁f(x, y) = (y, x)) ⇒ ∀x y⦁f(f (x, y)) = (x, y)⌝);
a(REPEAT strip_tac);
a(asm_rewrite_tac[]);
pop_thm();
set_pc"hol2";
=TEX
The second proof is shorter because the proof context $predicates$
does not cause equations between pairs to be split into pairs of equations.
=SML
					(* 2 *)
map (merge_pcs_rule1["hol2", "lin_arith"] prove_rule[]) [
(* (a) *)	⌜{(x, y) | ¬x = 0 ∧ y = 2*x} ⊆ {(x, y) | x < y}⌝,
(* (b) *)	⌜{(x, y) | x ≥ 2 ∧ y = 2*x} ⊆ {(x, y) | x + 1 < y}⌝,
(* (d) *)	⌜∀m⦁{i | m ≤ i ∧ i < m + 3} = {m; m+1; m+2}⌝,
(* (e) *)	⌜{i | 5*i = 6*i} = {0}⌝];
(* (c) *)	pc_rule1 "sets_ext1" prove_rule[]
		⌜A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)⌝;
=TEX
(Alternatively, use the subgoal package and $PC\_T1$.).

\section{Case Study}

The following test cases check out each branch of the $if$-terms in the definition of $vm$:

Branch 1: out of stock: the machine refunds any cash tendered.
=SML
run_vm ⌜vm (MkVM_State t 0 p ct)⌝;
=TEX
Branch 2: in stock; cash tendered is less than the price: the machine
waits for more cash to be tendered:
=SML
run_vm ⌜vm (MkVM_State t 20 5 2)⌝;
=TEX
Branch 3: in stock; cash tendered is equal to the price: the machine
dispenses a chocolate bar and adds the cash tendered to its takings:
=SML
run_vm ⌜vm (MkVM_State t 20 5 5)⌝;
=TEX
=TEX
Branch 4: in stock; cash tendered exceeds the price: the machine
refunds the cash tendered:
=SML
run_vm ⌜vm (MkVM_State t 20 5 6)⌝;
=TEX

If the price is set to $0$, the machine first refunds any cash
tendered and then gives away all the stock!
=SML
run_vm ⌜vm (MkVM_State t 4 0 6)⌝;
run_vm ⌜vm (MkVM_State t 4 0 0)⌝;
run_vm ⌜vm (MkVM_State t 3 0 0)⌝;
run_vm ⌜vm (MkVM_State t 2 0 0)⌝;
run_vm ⌜vm (MkVM_State t 1 0 0)⌝;
run_vm ⌜vm (MkVM_State t 0 0 0)⌝;
=TEX

Now we show a proof against the `critical requirements'.
=SML
set_goal([], ⌜vm ∈ vm_ok⌝);
(* Goal "": Expand definitions and let-terms: *)
a(rewrite_tac [get_spec ⌜vm_ok⌝, get_spec⌜vm⌝,
		get_spec⌜MkVM_State⌝, let_def]);

(* Goal "": remove outer universal quantifiers *)
a(REPEAT strip_tac);

(* Goal "": case split on the amount of stock:
			s = 0 ∨ s = i + 1 for some i *)
a(strip_asm_tac(∀_elim⌜s⌝ ℕ_cases_thm) THEN asm_rewrite_tac[]);

(* Goal "1": s = 0 *)
a(asm_rewrite_tac[get_spec⌜value⌝, get_spec⌜MkVM_State⌝]);

(* Goal "2": case split on ct < p: ct < p ∨ ct = p ∨ p < ct *)
a(strip_asm_tac(list_∀_elim[⌜ct⌝, ⌜p⌝] less_cases_thm));

(* Goal "2.1": ct < p: *)
a(asm_rewrite_tac[get_spec⌜MkVM_State⌝]);

(* Goal "2.2": ct = p: *)
a(asm_rewrite_tac[get_spec⌜value⌝, get_spec⌜MkVM_State⌝]);
a(PC_T1 "lin_arith" asm_prove_tac[]);

(* Goal "2.3": ct > p: need ¬ct < p ∧ ¬ ct = p to evaluate if *)
a(lemma_tac ⌜¬ct < p ∧ ¬ ct = p⌝ THEN1
	PC_T1 "lin_arith" asm_prove_tac[]);
a(asm_rewrite_tac[get_spec⌜value⌝, get_spec⌜MkVM_State⌝]);

val vm_ok_thm = pop_thm();
=TEX

\section{Advanced Techniques}

For running these solutions in batch we need to ask for the warning arising from deletion of constants to be ignored:

=SML
set_flag("ignore_warnings", true);
=TEX

=SML
(* no. 1 *)
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
a(contr_tac);
a(spec_asm_tac⌜∀ n⦁ ¬ m < n⌝⌜m+1⌝);
val thm1 = pop_thm();
=TEX

=SML
(* no. 2 *)
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
a(REPEAT strip_tac);
a(∃_tac⌜m+1⌝);
a(rewrite_tac[]);
val thm2 = pop_thm();
=TEX

=SML
(* no. 3 *)
set_goal([], ⌜∀f : ℕ → (ℕ → ℕ)⦁∃g⦁∀i⦁¬f i = g⌝);
a(REPEAT strip_tac);
a(∃_tac⌜λj⦁(f j j) + 1⌝);
a(rewrite_tac[ext_thm]);
a(REPEAT strip_tac);
a(∃_tac⌜i⌝ THEN REPEAT strip_tac);
val thm3 = pop_thm();
=TEX

=SML
(* no. 4 *)
set_goal([], ⌜∀f:'a→'b→'a⦁(∀x y⦁x = f x y) ⇒ f = CombK⌝);
a (REPEAT strip_tac);
a (rewrite_tac[ext_thm, comb_k_def]);
a (swap_asm_concl_tac⌜∀ x y⦁ x = f x y⌝);
a (conv_tac(ONCE_MAP_C eq_sym_conv));
a (swap_asm_concl_tac⌜¬ f x x' = x⌝ THEN asm_rewrite_tac[]);
val thm4 = pop_thm();
=TEX

=SML
(* no. 5 *)
set_goal([], ⌜∀i j⦁0 < i ⇒ (i * j) Div i = j⌝);
a (REPEAT strip_tac);
a (strip_asm_tac(
	rewrite_rule[∀_elim⌜j⌝times_comm_thm]
	(list_∀_elim[⌜i*j⌝, ⌜i⌝, ⌜j⌝, ⌜0⌝] div_mod_unique_thm)));
a (swap_asm_concl_tac⌜j = (i * j) Div i⌝ THEN
		(conv_tac(ONCE_MAP_C eq_sym_conv)));
a (strip_tac);
val thm5 = pop_thm();
=TEX

=SML
(* no. 6 *)
set_goal([], ⌜∀i⦁σ i = (i*(i + 1)) Div 2⌝);
a (REPEAT strip_tac);
a (lemma_tac⌜i * (i + 1) = 2 * σ i⌝);
(* *** Goal "1" *** *)
a (induction_tac⌜i⌝ THEN asm_rewrite_tac[get_spec⌜σ⌝]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[rewrite_rule[](list_∀_elim[⌜2⌝, ⌜σ i⌝]thm5)]);
val thm6 = pop_thm();
=TEX

=SML
(* no. 7 *)
=TEX
The obvious way of defining the Fibonacci function is not automatically
proved consistent:
=SML
delete_const⌜φ⌝;
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│	φ 0 = 0
│ ∧	φ 1 = 1
│ ∧	∀i⦁φ(i+2) = φ(i+1) + φ i
│	
■
=SML
get_spec⌜φ⌝;
=TEX

=SML
delete_const⌜φ⌝;
=SML
(* no. 8 *)
ⓈHOLCONST
│	γ : ℕ → (ℕ × ℕ)
├────────────
│	γ 0 = (0, 1)
│ ∧	∀i⦁γ(i+1) = let (a, b) = γ i in (b, a + b)
│	
■
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│ 	∀i⦁φ i = Fst (γ i)
│	
■
=SML
set_goal([], ⌜
	φ 0 = 0
∧	φ 1 = 1
∧	∀i⦁φ(i+2) = φ(i+1) + φ i
⌝);
a (rewrite_tac[get_spec⌜φ⌝]);
a (lemma_tac⌜γ 1 = γ(0 + 1) ∧ ∀i⦁ γ(i + 2) = γ((i+1)+1)⌝);
(* *** Goal "1" *** *)
a (rewrite_tac[plus_assoc_thm]);
(* *** Goal "2" *** *)
a (pure_asm_rewrite_tac[get_spec⌜γ⌝, let_def] THEN rewrite_tac[]);
val thm8 = pop_thm();
=TEX

=SML
(* no. 9 *)
delete_const⌜γ⌝;
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│	φ 0 = 0
│ ∧	φ 1 = 1
│ ∧	∀i⦁φ(i+2) = φ(i+1) + φ i
■
=SML
get_spec⌜φ⌝;
push_consistency_goal⌜φ⌝;
a (lemma_tac⌜∃γ⦁
	γ 0 = (0, 1)
∧	∀i⦁γ(i+1) = let (a, b) = γ i in (b, a + b)
⌝);
(* *** Goal "1" *** *)
a (prove_∃_tac);
(* *** Goal "2" *** *)
a (∃_tac⌜λi⦁Fst(γ i)⌝);
a (rewrite_tac[]);
a (lemma_tac⌜γ 1 = γ(0 + 1) ∧ ∀i⦁ γ(i + 2) = γ((i+1)+1)⌝);
(* *** Goal "2.1" *** *)
a (rewrite_tac[plus_assoc_thm]);
(* *** Goal "2.2" *** *)
a (pure_asm_rewrite_tac[let_def] THEN asm_rewrite_tac[]);
save_consistency_thm ⌜φ⌝ (pop_thm());
get_spec⌜φ⌝;
=TEX

\section{Supplementary Exercises}

\subsection{Linear Arithmetic}

=SML
(open_theory "usr013" handle _ => (open_theory "hol"; new_theory "usr013"));
new_theory "Shankar-Rushby-International";

set_pc "hol2";

set_goal([], ⌜∀ i:ℕ⦁ i>7 ⇒ ∃ three five:ℕ⦁ 3*three + 5*five = i⌝);
=GFT ProofPower output
Now 1 goal on the main goal stack

(* *** Goal "" *** *)

(* ?⊢ *)  ⌜∀ i⦁ i > 7 ⇒ (∃ three five⦁ 3 * three + 5 * five = i)⌝
=TEX
First we do induction on ⌜i⌝ rewriting the resulting conclusions with the assumptions.
This solves the induction base case and leaves two subgoals relating to the step case.
=SML
a (strip_tac THEN induction_tac ⌜i:ℕ⌝ THEN asm_rewrite_tac[]);
=GFT ProofPower output
Tactic produced 2 subgoals:

(* *** Goal "2" *** *)

(*  1 *)  ⌜3 * three + 5 * five = i⌝

(* ?⊢ *)  ⌜7 < i + 1 ⇒ (∃ three five⦁ 3 * three + 5 * five = i + 1)⌝


(* *** Goal "1" *** *)

(*  1 *)  ⌜¬ 7 < i⌝

(* ?⊢ *)  ⌜7 < i + 1 ⇒ (∃ three five⦁ 3 * three + 5 * five = i + 1)⌝
=TEX
Now we prove the lemma $ⓩi=7⌝$ by linear arithmetic and rewrite with it.
=SML
(* *** Goal "1" *** *)
a (strip_tac THEN LEMMA_T ⌜i = 7⌝ rewrite_thm_tac
  THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "1" *** *)

(*  2 *)  ⌜¬ 7 < i⌝
(*  1 *)  ⌜7 < i + 1⌝

(* ?⊢ *)  ⌜∃ three five⦁ 3 * three + 5 * five = 8⌝
=TEX
Next we supply the obvious witness for this existential and prove the resulting subgoal automatically.
=SML
a (MAP_EVERY ∃_tac [⌜1⌝,⌜1⌝] THEN prove_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "2" *** *)

(*  1 *)  ⌜3 * three + 5 * five = i⌝

(* ?⊢ *)  ⌜7 < i + 1 ⇒ (∃ three five⦁ 3 * three + 5 * five = i + 1)⌝
=TEX
We now eliminate the variable ⌜i⌝ and strip down to the existential:
=SML
(* *** Goal "2" *** *)
a (all_var_elim_asm_tac1 THEN strip_tac);
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "2" *** *)

(*  1 *)  ⌜7 < (3 * three + 5 * five) + 1⌝

(* ?⊢ *)  ⌜∃ three' five'
           ⦁ 3 * three' + 5 * five' = (3 * three + 5 * five) + 1⌝
=TEX
Then we do a case split on whether $five$ is zero:
=SML
a (strip_asm_tac (∀_elim ⌜five⌝ ℕ_cases_thm)
	THEN asm_rewrite_tac[]);
=GFT ProofPower output
Tactic produced 2 subgoals:

(* *** Goal "2.2" *** *)

(*  2 *)  ⌜7 < (3 * three + 5 * five) + 1⌝
(*  1 *)  ⌜five = i + 1⌝

(* ?⊢ *)  ⌜∃ three' five'
           ⦁ 3 * three' + 5 * five' = (3 * three + 5 * (i + 1)) + 1⌝


(* *** Goal "2.1" *** *)

(*  2 *)  ⌜7 < (3 * three + 5 * five) + 1⌝
(*  1 *)  ⌜five = 0⌝

(* ?⊢ *)  ⌜∃ three' five'⦁ 3 * three' + 5 * five' = 3 * three + 1⌝
=TEX
In this case it is most convenient first to prove that $⌜three≥3⌝$ using linear arithmetic, and then rewrite this result to give a witness 3 less than $three$:
=SML
(* *** Goal "2.1" *** *)
a (LEMMA_T ⌜three ≥ 3⌝ (strip_asm_tac o rewrite_rule [≤_def])
 THEN1 PC_T1 "lin_arith" asm_prove_tac[]);
=GFT ProofPower output
Tactic produced 1 subgoal:

(* *** Goal "2.1" *** *)

(*  3 *)  ⌜7 < (3 * three + 5 * five) + 1⌝
(*  2 *)  ⌜five = 0⌝
(*  1 *)  ⌜3 + i = three⌝

(* ?⊢ *)  ⌜∃ three' five'⦁ 3 * three' + 5 * five' = 3 * three + 1⌝
=TEX
The witness ⌜i⌝ is now used in the existence proof:
=SML
a (MAP_EVERY ∃_tac [⌜i⌝, ⌜five +2⌝]
 THEN PC_T1 "lin_arith" asm_prove_tac[]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "2.2" *** *)

(*  2 *)  ⌜7 < (3 * three + 5 * five) + 1⌝
(*  1 *)  ⌜five = i + 1⌝

(* ?⊢ *)  ⌜∃ three' five'
           ⦁ 3 * three' + 5 * five' = (3 * three + 5 * (i + 1)) + 1⌝
=TEX
This subgoal is proved in a similar way but with different witnesses:
=SML
(* *** Goal "2.2" *** *)
a (MAP_EVERY ∃_tac [⌜three+2⌝, ⌜i⌝]
 THEN PC_T1 "lin_arith" asm_prove_tac[]);
=TEX

=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX

=SML
save_pop_thm("cents_thm");
=TEX

=GFT ProofPower output
Now 0 goals on the main goal stack
val it = ⊢ ∀ i⦁ i > 7 ⇒ (∃ three five⦁ 3 * three + 5 * five = i) : THM
=TEX

