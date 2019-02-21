=IGN
********************************************************************************
usr023S.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
# usr023S.doc,v 1.12 2005/09/09 11:24:33 rda Exp
# N.B. This file is not intended to be typeset
#
# The following ex script is intended to generate the work file
# in which students can do the exercises and the solutions file
# Lines for the solutions only begin with a comment: `(* ?X *)'
# Lines for the work file only begin with a comment: `(* ?A *)'
# `(* ?: *) stuff (* :? *)' ==> `(* ??? *)' in the work file
# `(* ?: *) stuff (* :? *)' ==> `stuff' in the work file
=SH
if	test -f usr023S.doc
then
ed usr023S.doc <<!DONE
1,/^=TEX/-1d
g/%X/d
g/?X/d
g/?:/s/?:.*:?/???/
g/?A/s/(\* *?A *\*) *//
w zed_course_work.doc
e usr023S.doc
1,/^=TEX/-1d
g/%X/d
g/?A/d
g/?X/s/(\* *?X *\*) *//
g/?A/s/(\* *?A *\*) *//
g/(\* *?: *\*)/s///
g/(\* *:? *\*)/s///
g/?:.*:?:/s///
w zed_course_solutions.doc
Q
!DONE
fi >/dev/null 2>&1
=TEX
\documentclass[a4paper,12pt]{article}
\usepackage{A4}
\usepackage{ProofPower}
\underscoreoff\ftlinepenalty=1000
(* ?A *) \title{PROOFPOWER-Z COURSE \\ COURSEWORK FILE}
(* ?X *) \title{PROOFPOWER-Z COURSE \\ ANSWERS TO EXERCISES}
\author{ProofPower Development Team}
\begin{document}
\maketitle

(* ?A *) The course exercises with skeletal solutions for you to fill in are
(* ?A *) given below. Record your answers to the exercises in this file.

(* ?A *) Worked answers may be found in the file `zed_course_solutions.doc'

(* ?X *) Worked answers to the exercise in the file `zed_course_work.doc'
(* ?X *) are given below.

Use the Search and Replace Tool (from the Tools Menu) to look for the
string ``Exercises'' to find the beginning of each exercise set.

Execute the following commands before embarking on the exercises:
=SML
repeat drop_main_goal;
open_theory "z_library";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
open_theory"z_exercises_1";
=TEX

% =====================================================================

\section*{Exercises 1: The Two Tactic Method in Z}
Use the two tactic method to prove the following goals (taken
from sections 7.1.4 of usr011X.doc).
=SML
set_goal([], (* *9.01 *)
	ⓩ[X](¬ (∀x:X⦁ φx)) ⇔ (∃x: X⦁ ¬ φx)⌝);
(* ?: *) (* :? *)
(* ?X *) a contr_tac;
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(z_spec_nth_asm_tac 1 ⓩx⌝);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(z_spec_nth_asm_tac 1 ⓩx⌝);
(* ?X *) val thm_1_1 = pop_thm();
=SML
set_goal([], (* *10.01 *)
	ⓩ[X](∃x:X⦁ φx) ⇔ ¬ (∀y:X⦁ ¬ φy)⌝);
(* ?: *) (* :? *)
(* ?X *) a contr_tac;
(* ?X *) (* *** Goal "1" (which is the same as Goal "2") *** *)
(* ?X *) a(z_spec_nth_asm_tac 1 ⓩx⌝);
(* ?X *) val thm_1_2 = save_pop_thm"thm_1_2";
=SML
set_goal([], (* *10.271 *)
	ⓩ[X](∀x:X⦁ φx ⇔ ψx) ⇒ ((∀y:X⦁ φy) ⇔ (∀z:X⦁ ψz))⌝);
(* ?: *) (* :? *)
(* ?X *) a contr_tac;
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩz⌝);
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩz⌝);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩy⌝);
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩy⌝);
(* ?X *) val thm_1_3 = save_pop_thm"thm_1_3";
=TEX
Many more exercises of this kind can be found in usr011X.doc
The function setlg can be used to select one of them, e.g.
=SML
setlg"*9.05" PM9;
(* ?: *) (* :? *)
(* ?X *) a contr_tac;
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(z_spec_nth_asm_tac 2 ⓩx'⌝);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(z_spec_nth_asm_tac 1 ⓩx'⌝);
(* ?X *) (* *** Goal "3" *** *)
(* ?X *) a(z_spec_nth_asm_tac 1 ⓩx⌝);
(* ?X *) val thm_1_4 = save_pop_thm"thm_1_4";
=TEX
% =====================================================================

\section*{Exercises 2: Predicate Calculus Proofs}
1. Use ⇒_elim, asm_rule, and ⇒_intro to give forward proofs of the
following theorems:
=SML
(* (a):	 b ⇒ c, a ⇒ b, a ⊢ c *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_1_a_1 = asm_rule ⓩa ⇒ b⌝;
(* ?X *) val thm_2_1_a_2 = asm_rule ⓩΠ(a)⌝;
(* ?X *) val thm_2_1_a_3 = asm_rule ⓩb ⇒ c⌝;
(* ?X *) val thm_2_1_a_4 = ⇒_elim thm_2_1_a_1 thm_2_1_a_2;
(* ?X *) val thm_2_1_a = ⇒_elim thm_2_1_a_3 thm_2_1_a_4;
(* ?X *) save_thm("thm_2_1_a", thm_2_1_a);
=SML
(* (b): a ⇒ b ⇒ c, a, b ⊢ c *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_1_b_1 = asm_ruleⓩΠ(a)⌝;
(* ?X *) val thm_2_1_b_2 = asm_ruleⓩΠ(b)⌝;
(* ?X *) val thm_2_1_b_3 = asm_ruleⓩa ⇒ b ⇒ c⌝;
(* ?X *) val thm_2_1_b_4 = ⇒_elim thm_2_1_b_3 thm_2_1_b_1;
(* ?X *) val thm_2_1_b = ⇒_elim thm_2_1_b_4 thm_2_1_b_2;
(* ?X *) save_thm("thm_2_1_b", thm_2_1_b);
=SML
(* (c): a ⇒ b ⇒ c, b ⊢ a ⇒ c *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_1_c_1 = asm_ruleⓩΠ(a)⌝;
(* ?X *) val thm_2_1_c_2 = asm_ruleⓩΠ(b)⌝;
(* ?X *) val thm_2_1_c_3 = asm_ruleⓩa ⇒ b ⇒ c⌝;
(* ?X *) val thm_2_1_c_4 = ⇒_elim thm_2_1_c_3 thm_2_1_c_1;
(* ?X *) val thm_2_1_c_5 = ⇒_elim thm_2_1_c_4 thm_2_1_c_2;
(* ?X *) val thm_2_1_c = ⇒_intro ⓩΠ(a)⌝ thm_2_1_c_5;
(* ?X *) save_thm("thm_2_1_c", thm_2_1_c);
=TEX
2. Use strip_tac to prove:
=SML
set_goal([],(* *3.01 *) ⓩp ∧ q ⇔ ¬(¬ p ∨ ¬ q)⌝);
(* ?: *) (* :? *)
(* ?X *) a (REPEAT strip_tac);
(* ?X *) val thm_2_2_1 = save_pop_thm"thm_2_2_1";
=SML
set_goal([], (* *3.3 *) ⓩ(p ∧ q ⇒ r) ⇒ (p ⇒ q ⇒ r)⌝);
(* ?: *) (* :? *)
(* ?X *) a (REPEAT strip_tac);
(* ?X *) val thm_2_2_2 = save_pop_thm"thm_2_2_2";
=SML
set_goal([], (* *4.11 *) ⓩ(p ⇔ q) ⇔ (¬ p ⇔ ¬ q)⌝);
(* ?: *) (* :? *)
(* ?X *) a (REPEAT strip_tac);
(* ?X *) val thm_2_2_3 = save_pop_thm"thm_2_2_3";
=TEX
3. Use the indicated rules and theorems to give forward proofs of
=SML
(* (a): 0 ∈ ℕ ∧ true ⇒ ¬ 0 + 1 = 0
			(use z_∀_elim, z_ℕ_¬_plus1_thm *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_3_a = z_∀_elim ⓩ0⌝ z_ℕ_¬_plus1_thm;
(* ?X *) save_thm("thm_2_3_a", thm_2_3_a);
=SML
(* (b): x * x ∈ ℕ ∧ true ⇒ ¬ x * x + 1 = 0
			(use z_∀_elim, z_ℕ_¬_plus1_thm *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_3_b = z_∀_elim ⓩx * x⌝ z_ℕ_¬_plus1_thm;
(* ?X *) save_thm("thm_2_3_b", thm_2_3_b);
=SML
(* (c): i ≤ j ∧ j ≤ k ⇒ i ≤ k
			(use prove_rule, z_≤_trans_thm *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_3_c = prove_rule[z_≤_trans_thm]
(* ?X *)		ⓩi ≤ j ∧ j ≤ k ⇒ i ≤ k⌝;
(* ?X *) save_thm("thm_2_3_c", thm_2_3_c);
=SML
(* (d): ¬ 0 + 1 = 0
			(use prove_rule, z_ℕ_¬_plus1_thm, z_0_ℕ_thm *)
(* ?: *) (* :? *)
(* ?X *) val thm_2_3_d = prove_rule[z_0_ℕ_thm, z_ℕ_¬_plus1_thm]
(* ?X *)		ⓩ¬0 + 1 = 0⌝;
(* ?X *) save_thm("thm_2_3_d", thm_2_3_d);
=TEX
4. If you want some more drill in the two tactic method, prove
further examples from section 7.1.4 of the Z Tutorial Manual.
Use the function setlg to select an example.
E.g.,
=SML
setlg "*10.281" PM10b;
(* ?: *) (* :? *)
(* ?X *) a contr_tac;
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩy⌝);
(* ?X *) a(z_spec_nth_asm_tac 2 ⓩy⌝);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩz⌝);
(* ?X *) a(z_spec_nth_asm_tac 2 ⓩz⌝);
(* ?X *) val thm_2_4 = save_pop_thm"thm_2_4";
=TEX
5. Observe the behaviour of the proof context z_library_ext by
executing the following commands, then complete the proof:
=SML
set_pc "z_library_ext";
set_goal([],ⓩ a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
a (rewrite_tac[]);
undo 1;
(* ?X *) (*
a (pure_rewrite_tac[]);
(* ?X *) *)
a (pure_rewrite_tac[z_sets_ext_clauses]);
a (pure_rewrite_tac[z_set_dif_thm]);
a (pure_rewrite_tac[z_∩_thm, z_∪_thm]);
a (pure_rewrite_tac[z_set_dif_thm]);
undo 4;
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) val thm_2_5 = save_pop_thm"thm_2_5";
=TEX
When you're done restore the proof context using the following command:
=SML
set_pc "z_library";
=TEX
6. Prove the following:
=SML
set_goal([],ⓩ x + y + z = (x + y) + z⌝);
(* hint : try using z_plus_assoc_thm *)
(* ?: *) (* :? *)
(* ?X *) a(rewrite_tac[z_plus_assoc_thm]);
(* ?X *) val thm_2_6_a = save_pop_thm"thm_2_6_a";
=SML
set_goal([],ⓩ z + y + x = y + z + x⌝);
(* hint : try using z_plus_assoc_thm1 *)
(* ?: *) (* :? *)
(* ?X *) a(rewrite_tac[z_plus_assoc_thm1]);
(* ?X *) val thm_2_6_b = save_pop_thm"thm_2_6_b";
=SML
set_goal([],ⓩ x + y + z = y + z + x⌝);
(* hint : try using z_∀_elim with z_plus_assoc_thm1 *)
(* ?: *) (* :? *)
(* ?X *) a(rewrite_tac[z_∀_elimⓩ(i≜y, j≜z, k≜x)⌝ z_plus_assoc_thm1]);
(* ?X *) val thm_2_6_c = save_pop_thm"thm_2_6_c";
=SML
set_goal([],ⓩ x + y + z + v = y + v + z + x⌝);
(* hint : try using z_∀_elim with z_plus_order_thm *)
(* ?: *) (* :? *)
(* ?X *) a(rewrite_tac[z_∀_elimⓩx⌝ z_plus_order_thm]);
(* ?X *) val thm_2_6_d = save_pop_thm"thm_2_6_d";
=TEX

% =====================================================================

\section*{Exercises 3: Expressions}
Before doing these exercises execute the following commands:
=SML
repeat drop_main_goal;
open_theory"z_exercises_2";
set_pc"z_library";
=TEX
1. Prove the following (hint: they can all be done automatically):
=SML
set_goal([], (* ZE1.1 *) ⓩ(2,4) ∈ (λx:ℕ ⦁ 2*x)⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_3_1_a = save_pop_thm"thm_3_1_a";
=SML
set_goal([], (* ZE1.2 *) ⓩ{1,2,3} ∈ ℙ {1,2,3,4}⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_3_1_b = save_pop_thm"thm_3_1_b";
=SML
set_goal([], (* ZE1.3 *) ⓩℕ ∈ ℙ ℤ⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_3_1_c = save_pop_thm"thm_3_1_c";
=SML
set_goal([], (* ZE1.4 *) ⓩ"a" ∈ {"a", "b"}⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_3_1_d = save_pop_thm"thm_3_1_d";
=SML
set_goal([], (* ZE1.11 *) ⓩ∀File⦁ (θFile').age = age'⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_3_1_e = save_pop_thm"thm_3_1_e";
=TEX
2. Using the proof context z_language_ext, prove the following:
=SML
set_goal([], (* ZE2.3 *) ⓩ[x:ℤ | x > 0] = {x:ℤ | x > 0 ⦁ (x ≜ x)}⌝);
(* ?: *) (* :? *)
(* ?X *) a(PC_T1 "z_language_ext" prove_tac[]);
(* ?X *) val thm_3_2 = save_pop_thm"thm_3_2";
=TEX
3. Prove the following (see section 7.2.1 of the Z Tutorial Manual for hints)
=SML
set_goal([], (* ZE3.1 *) ⓩ(λx:ℤ⦁ x + 1) 3 = 4⌝);
(* ?: *) (* :? *)
(* ?X *) a(conv_tac(MAP_C z_β_conv));
(* ?X *) a(rewrite_tac[]);
(* ?X *) val thm_3_3_1 = save_pop_thm"thm_3_3_1";
=SML
set_goal([], (* ZE3.2 *) ⓩ{(1, 2), (3, 4)} 3 = 4⌝);
(* ?: *) (* :? *)
(* ?X *) a(z_app_eq_tac);
(* ?X *) a(REPEAT z_strip_tac);
(* ?X *) val thm_3_3_2 = save_pop_thm"thm_3_3_2";
=TEX
4. If you have time, do more of the exercises from section 7.2.1 of
the Z Tutorial Manual.
Use the function setlg to select a problem.
E.g.,
=SML
setlg "ZE3.3" ZE3;
(* ?: *) (* :? *)
(* ?X *) a(REPEAT z_strip_tac);
(* ?X *) a(strip_asm_tac(z_get_specⓩ(abs_)⌝));
(* ?X *) a(asm_tac(prove_rule[] ⓩ1 ∈ ℤ⌝));
(* ?X *) a(all_fc_tac[z_→_∈_rel_⇔_app_eq_thm]);
(* ?X *) val thm_3_3_3 = save_pop_thm"thm_3_3_3";
(* ?X *)
(* ?X *) setlg "ZE3.4" ZE3;
(* ?X *) a(REPEAT z_strip_tac);
(* ?X *) a(strip_asm_tac(z_get_specⓩ(abs_)⌝));
(* ?X *) a(asm_tac(prove_rule[] ⓩi ∈ ℤ⌝));
(* ?X *) a(all_fc_tac[z_→_∈_rel_⇔_app_eq_thm]);
(* ?X *) val thm_3_3_4 = save_pop_thm"thm_3_3_4";
(* ?X *)
(* ?X *) setlg "ZE3.5" ZE3;
(* ?X *) a(REPEAT z_strip_tac);
(* ?X *) a(strip_asm_tac(z_get_specⓩ(abs_)⌝));
(* ?X *) a(asm_tac(prove_rule[] ⓩi ∈ ℤ⌝));
(* ?X *) a(all_fc_tac[z_fun_∈_clauses]);
(* ?X *) val thm_3_3_5 = save_pop_thm"thm_3_3_5";
(* ?X *)
(* ?X *) setlg "ZE3.6" ZE3;
(* ?X *) a(strip_asm_tac(z_∀_elimⓩ9⌝(z_μ_ruleⓩ(μ x : ℤ | x = 3 ⦁ x * x)⌝)));
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(swap_nth_asm_concl_tac 1);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(z_spec_nth_asm_tac 1 ⓩ3⌝);
(* ?X *) a(swap_nth_asm_concl_tac 1);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) val thm_3_3_6 = save_pop_thm"thm_3_3_6";
(* ?X *)
(* ?X *) setlg "ZE3.7" ZE3;
(* ?X *) a(REPEAT z_strip_tac);
(* ?X *) a(z_∃_tacⓩ5⌝);
(* ?X *) a(rewrite_tac[]);
(* ?X *) val thm_3_3_7 = save_pop_thm"thm_3_3_7";
(* ?X *)
(* ?X *) setlg "ZE3.8" ZE3;
(* ?X *) a(PC_T "z_library_ext" contr_tac);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(PC_T1 "z_library_ext" all_asm_fc_tac[]);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(PC_T1 "z_library_ext" all_asm_fc_tac[]);
(* ?X *) (* *** Goal "3" *** *)
(* ?X *) a(swap_nth_asm_concl_tac 6);
(* ?X *) a(conv_tac(ONCE_MAP_C eq_sym_conv));
(* ?X *) a(contr_tac);
(* ?X *) a(PC_T1 "z_library_ext" all_asm_fc_tac[]);
(* ?X *) (* *** Goal "4" *** *)
(* ?X *) a(swap_nth_asm_concl_tac 6);
(* ?X *) a(conv_tac(ONCE_MAP_C eq_sym_conv));
(* ?X *) a(contr_tac);
(* ?X *) a(PC_T1 "z_library_ext" all_asm_fc_tac[]);
(* ?X *) val thm_3_3_8 = save_pop_thm"thm_3_3_8";
(* ?X *)
(* ?X *) setlg "ZE3.9" ZE3;
(* ?X *) a(PC_T "z_library_ext" contr_tac);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) a(swap_nth_asm_concl_tac 1);
(* ?X *) a(lemma_tacⓩ(z.1, z.2) = z⌝);
(* ?X *) (* *** Goal "1.1" *** *)
(* ?X *) a(PC_T "z_library_ext" contr_tac);
(* ?X *) (* *** Goal "1.2" *** *)
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(z_spec_nth_asm_tac 4 ⓩ(x, y)⌝);
(* ?X *) val thm_3_3_9 = save_pop_thm"thm_3_3_9";
(* ?X *)
(* ?X *) setlg "ZE3.10" ZE3;
(* ?X *) a(PC_T "z_library_ext" strip_tac);
(* ?X *) a(PC_T1 "z_library" prove_tac[]);
(* ?X *) a(z_∃_tacⓩ(age ≜ x1, people ≜ x2)⌝);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) val thm_3_3_10 = save_pop_thm"thm_3_3_10";
(* ?X *)
(* ?X *) setlg "ZE3.11" ZE3;
(* ?X *) a(PC_T "z_library_ext" contr_tac);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(PC_T1 "z_library_ext" (z_spec_nth_asm_tac 2) ⓩ(x1≜1, x2≜a)⌝);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(PC_T1 "z_library_ext" (z_spec_nth_asm_tac 2) ⓩ(x1≜2, x2≜b)⌝);
(* ?X *) val thm_3_3_11 = save_pop_thm"thm_3_3_11";
(* ?X *)
(* ?X *) setlg "ZE3.12" ZE3;
(* ?X *) a(PC_T "z_library_ext" strip_tac);
(* ?X *) a(PC_T1 "z_library_ext" (z_spec_nth_asm_tac 1) ⓩ(x1≜1, x2≜a)⌝);
(* ?X *) a(PC_T1 "z_library_ext" (z_spec_nth_asm_tac 2) ⓩ(x1≜2, x2≜b)⌝);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) val thm_3_3_12 = save_pop_thm"thm_3_3_12";
=TEX

% =====================================================================

\section*{Exercises 4: Schema Calculus}

Before doing these exercises execute the following commands:

=SML
repeat drop_main_goal;
open_theory"z_exercises_2";
set_pc"z_language";
=TEX
1. Use strip_tac to prove:
=SML
set_goal([], (* *2.02 *) ⓩ Π((Qac ⇒ (Pab ⇒ Qac))⦂𝕌)⌝);
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) val thm_4_1_1 = save_pop_thm"thm_4_1_1";
=SML
set_goal([], (* *3.01 *) ⓩ Π((Pab ∧ Qac ⇔ ¬(¬ Pab ∨ ¬ Qac))⦂𝕌)⌝);
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) val thm_4_1_2 = save_pop_thm"thm_4_1_2";
=TEX
2. Set the proof context to z_library and use contradiction
and forward chaining from the assumptions to prove:
=SML
set_pc"z_library";
set_goal([], (* *9.01 *) ⓩΠ(((¬ (∀Qac⦁ Sabc)) ⇔ (∃Qac⦁ ¬ Sabc))⦂𝕌)⌝);
(* ?X *) a(contr_tac);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) val thm_4_2_1 = save_pop_thm"thm_4_2_1";
=TEX
Is you have time, try further examples from sections 7.2.2 or 7.2.3
using setlg.
E.g.,
=SML
setlg "*10.01" SCPM10;
(* ?: *) (* :? *)
(* ?X *) a(contr_tac);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) val thm_4_2_2 = save_pop_thm"thm_4_2_2";
=TEX

% =====================================================================

\section*{Exercises 5: Paragraphs}

Before doing these exercises execute the following commands:
=SML
repeat drop_main_goal;
open_theory "z_exercises_3";
set_pc "z_library";
set_flags [("z_type_check_only", false), ("z_use_axioms", true)];
=TEX
1.1 Use a fun fixity paragraph and a generic axiomatic description to
define a conditional construct, if a then b else c.
ⓈZ
│ fun (* ?: *) if _ then _ else _ (* :? *)
■
╒[X]═════════════════════════════════════
│	(* ?: *) if _ then _ else _ : 𝔹 × X × X → X (* :? *)
├────────────────────────────
│	(* ?: *)∀x, y: X⦁ (* :? *)
│(* ?X *)		if true then x else y = x
│(* ?X *)	∧	if false then x else y = y
└─────────────────────────────────────────
1.2 Use z_get_spec to examine the defining property for your
conditional construct. Prove:
=SML
z_get_specⓩ(if _ then _ else _)⌝;
set_goal([], ⓩif 2 > 1 then 1 else 0 = 1⌝);
(* ?: *) (* :? *)
(* ?X *) a(rewrite_tac[]);
(* ?X *) a(rewrite_tac[z_gen_pred_elim[ⓩ𝕌⌝] (z_get_specⓩ(if _ then _ else _)⌝)]);
(* ?X *) val thm_5_1 = save_pop_thm"thm_5_1";
=TEX
2.1 First of all set the system up to work conservatively:
=SML
set_flags [("z_use_axioms", false)];
=TEX
Now use an axiomatic description to define a global variable, num,
whose value is a natural number loosely specified to lie between 4 and 50:
ⓈZAX
│	(* ?: *) num : ℕ (* :? *)
├──────
│	(* ?: *) 4 ≤ num ≤ 50 (* :? *)
■
2.2 Prove the consistency result for num and save it:
=SML
z_push_consistency_goal ⓩnum⌝;
(* ?: *) (* :? *)
(* ?X *) a(z_∃_tacⓩ10⌝);
(* ?X *) a(rewrite_tac[]);
save_consistency_thm ⓩnum⌝ (pop_thm());
=TEX
2.3 Examine the specification of num and use it to prove that
num is non-negative:
=SML
z_get_specⓩnum⌝;
set_goal([], ⓩnum ≥ 0⌝);
(* ?: *) (* :? *)
(* ?X *) a(strip_tac);
(* ?X *) a(strip_asm_tac(z_get_specⓩnum⌝));
(* ?X *) val thm_5_2 = save_pop_thm"thm_5_2";
=TEX
3. Prove the following conjectures about the opperation schemas OP and OP2
defined in section 7.3.3 of the Z Tutorial Manual:
=SML
set_goal([], ⓩpre OP ⇔ i? ≥ 0⌝);
(* ?: *) (* :? *)
(* ?X *) a(rewrite_tac(map z_get_spec[ⓩOP⌝, ⓩSTATE⌝]));
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_5_3_1 = save_pop_thm"thm_5_3_1";
set_goal([], ⓩ(pre OP ⇒ pre OP2) ∧ (pre OP ∧ OP2 ⇒ OP)⌝);
(* ?: *) (* :? *)
(* ?: *) a(rewrite_tac(map z_get_spec[ⓩOP⌝, ⓩOP2⌝, ⓩSTATE⌝]));
(* ?: *) a(REPEAT strip_tac);
(* ?: *) a(asm_prove_tac[]);
(* ?X *) val thm_5_3_2 = save_pop_thm"thm_5_3_2";
=TEX

% =====================================================================

\section*{Exercises 6: The Z Toolkit}

1. Sets: before doing this exercise execute the following commands:
=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_sets_ext";
=TEX
Prove the following samples from section 7.4.1 of the Z Tutorial Manual:
=SML
set_goal([], (* Z1.9 *) ⓩ (a ∩ b) ∪ (a \ b) = a⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_6_1_1 = save_pop_thm"thm_6_1_1";
=SML
set_goal([], (* Z3.1 *) ⓩ a ⊆ b ⇔ a ∈ ℙ b⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_6_1_2 = save_pop_thm"thm_6_1_2";
=TEX
Try further examples ad lib using setlg:
=SML
setlg "Z3b.1" Z3b;
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_6_1_3 = save_pop_thm"thm_6_1_3";
=TEX

2. Relations: before doing this exercise execute the following commands:
=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_rel_ext";
=TEX
Prove the following samples from section 7.4.2 of the Z Tutorial Manual:
=SML
set_goal([], (* Z4.9 *) ⓩdom {} = {}⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_6_2_1 = save_pop_thm"thm_6_2_1";
=SML
set_goal([], (* Z5.2 *) ⓩP ⨾ (Q ⨾ R) = (P ⨾ Q) ⨾ R⌝);
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_6_2_2 = save_pop_thm"thm_6_2_2";
=TEX
Try further examples ad lib using setlg:
=SML
setlg "Z7.1" Z7;
(* ?: *) (* :? *)
(* ?X *) a(prove_tac[]);
(* ?X *) val thm_6_2_3 = save_pop_thm"thm_6_2_3";
=TEX


3. Functions: before doing this exercise execute the following commands:
=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_fun_ext";
=TEX
Prove the following samples from section 7.4.3 of the Z Tutorial Manual:
=SML
set_goal([], (* Z12.1 *) ⓩ f ∈ X ⇸ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝);
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(z_app_eq_tac);
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) val thm_6_3_1 = save_pop_thm"thm_6_3_1";
=SML
set_goal([], (* Z12.2 *) ⓩ f ∈ X ⤔ Y ∧ (x, y) ∈ f ⇒ f x = y ⌝);
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(z_app_eq_tac);
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) val thm_6_3_2 = save_pop_thm"thm_6_3_2";
=TEX
The other Z12 proofs are very similar.
The Z12b proofs are rather long; you are not recommended to try them
during the course.

4. Numbers and Finiteness: before doing this exercise execute the
following commands:
=SML
repeat drop_main_goal;
open_theory "z_exercises_4";
set_pc "z_library";
set_flags[("z_type_check_only", false), ("z_use_axioms", true)];
=TEX
4.1 Give an inductive definition of the function Σ which maps a natural
number n to the sum of the first n natural numbers:
ⓈZAX
│	Σ : ℕ → ℕ
├──────────────────────
│	(* ?: *) Σ 0 = 0; (* :? *)
│(* ?X *)	∀n: ℕ⦁Σ (n + 1) = Σ n + n + 1
■
4.2 Prove the following:
=SML
set_goal([], ⓩ∀n:ℕ⦁ Σ n * 2 = n * (n + 1)⌝);
(* ?: *) (* :? *)
(* ?X *) a(z_strip_tac);
(* ?X *) a(PC_T1 "z_language" rewrite_tac[]);
(* ?X *) a(z_ℕ_induction_tac);
(* ?X *) (* *** Goal "1" *** *)
(* ?X *) a(rewrite_tac[z_get_specⓩΣ⌝]);
(* ?X *) (* *** Goal "2" *** *)
(* ?X *) a(strip_asm_tac (z_get_specⓩΣ⌝));
(* ?X *) a(all_asm_fc_tac[]);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) a(rewrite_tac[z_times_plus_distrib_thm]);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) a(rewrite_tac[z_times_plus_distrib_thm, z_plus_assoc_thm]);
(* ?X *) a(pure_once_rewrite_tac[prove_rule[]ⓩ2 = 1 + 1⌝]);
(* ?X *) a(rewrite_tac[z_times_plus_distrib_thm, z_plus_assoc_thm]);
(* ?X *) a(rewrite_tac[z_∀_elimⓩi⌝ z_plus_order_thm]);
(* ?X *) val thm_6_4_1 = save_pop_thm"thm_6_4_1";
=TEX
You may also like to try the other two proofs in section 7.4.4 of
the Z Tutorial Manual.
It is best to user the proof context z_library_ext for these
(this has rewriting with the definition of (_.._) built into it).
=SML
set_pc"z_library_ext";
setlg "ZNum.2" ZNum;
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(all_fc_tac[z_≤_trans_thm]);
(* ?X *) val thm_6_4_2 = save_pop_thm"thm_6_4_2";
=SML
setlg "ZNum.3" ZNum;
(* ?: *) (* :? *)
(* ?X *) a(REPEAT strip_tac);
(* ?X *) a(all_fc_tac[z_≤_less_trans_thm]);
(* ?X *) a(swap_asm_concl_tac ⓩx1 < x⌝);
(* ?X *) a(pure_once_rewrite_tac[z_get_specⓩ(_<_)⌝]);
(* ?X *) a(swap_asm_concl_tac ⓩx - 1 < x1⌝);
(* ?X *) a(pure_once_rewrite_tac[z_get_specⓩ(_<_)⌝]);
(* ?X *) a(rewrite_tac[]);
(* ?X *) a(rewrite_tac[z_plus_assoc_thm]);
(* ?X *) a(contr_tac);
(* ?X *) a(all_fc_tac[z_≤_trans_thm]);
(* ?X *) val thm_6_4_3 = save_pop_thm"thm_6_4_3";
=TEX

% =====================================================================

\section*{Exercises 7: Case Study 1}
Consult the course overheads for hints for these exercises.

Execute the following commands to open the theory containing
the specifications etc. before embarking on these exercises.
=SML
open_theory"usr023V";
set_pc "z_library_ext";
val [	price, VMSTATE, VM_operation,
	exact_cash, insufficient_cash, some_stock,
	VM_sale, VM_nosale, VM1, VM2, VM3 ]
    = map z_get_spec [ ⓩprice⌝, ⓩVMSTATE⌝, ⓩVM_operation⌝,
	ⓩexact_cash⌝, ⓩinsufficient_cash⌝, ⓩsome_stock⌝,
	ⓩVM_sale⌝, ⓩVM_nosale⌝, ⓩVM1⌝, ⓩVM2⌝, ⓩVM3⌝ ];
=TEX
1. Prove that the schema VM3 is non-empty, i.e., prove:
=SML
set_goal([], ⓩ∃ VM3 ⦁ true⌝);
(* ?: *) (* :? *)
(* ?X *) a contr_tac;
(* ?X *) a(z_spec_asm_tac ⓩ∀ VM3 ⦁ false⌝
(* ?X *) 	ⓩ(	cash_tendered? ≜ price,
(* ?X *) 		stock ≜ 1, stock' ≜ 0,
(* ?X *) 		takings ≜ 0, takings' ≜ price,
(* ?X *) 		cash_refunded! ≜ 0,
(* ?X *) 		bars_delivered! ≜ 1)⌝);
(* ?X *) a(swap_asm_concl_tac
(* ?X *)  ⓩ¬ (bars_delivered! ≜ 1, cash_refunded! ≜ 0, cash_tendered? ≜ price,
(* ?X *)          stock ≜ 1, stock' ≜ 0, takings ≜ 0, takings' ≜ price)
(* ?X *)           ∈ VM3⌝);
(* ?X *) a(rewrite_tac[VM1, VM3,
(* ?X *) 	exact_cash,
(* ?X *) 	some_stock, VM_sale, VM_operation, VMSTATE]);
(* ?X *) a(strip_asm_tac price);
(* ?X *) a(asm_rewrite_tac[]);
(* ?X *) val VM3_non_empty = save_pop_thm "VM3_non_empty";
=TEX
2. Prove the following lemma for use in the refinement proof.
=SML
set_goal([], ⓩ¬ (insufficient_cash ∧ exact_cash)⌝);
(* ?: *) (* :? *)
(* ?X *) a (rewrite_tac [insufficient_cash, exact_cash]);
(* ?X *) a (pure_rewrite_tac [z_get_spec ⓩ(_<_)⌝]);
(* ?X *) a (rewrite_tac [z_plus_assoc_thm1]);
(* ?X *) a (rewrite_tac [z_minus_thm, z_plus_assoc_thm1]);
(* ?X *) a (REPEAT_N 3 z_strip_tac);
(* ?X *) a (asm_rewrite_tac[]);
(* ?X *) val cash_lemma = save_pop_thm "cash_lemma";
=TEX
3. Prove that VM3 is a refinement of VM1, i.e. prove:
=SML
set_goal([], ⓩ (pre VM1 ⇒ pre VM3) ∧ (pre VM1 ∧ VM3 ⇒ VM1)⌝);
(* ?: *) (* :? *)
(* ?X *) a (rewrite_tac [VM1, VM2, VM3]);
(* ?X *) a (strip_asm_tac cash_lemma THEN asm_rewrite_tac[]);
(* ?X *) a (REPEAT z_strip_tac);
(* ?X *) val VM3_refines_VM1 = save_pop_thm "VM3_refines_VM1";
=TEX

% =====================================================================

\section*{Exercises 8: Case Study 2}
Consult the course overheads for hints for these exercises.

If you have not already done so for exercises 7,
execute the following commands to open the theory containing
the specifications etc. before embarking on these exercises.
=SML
open_theory"usr023V";
set_pc "z_library_ext";
val [	price, VMSTATE, VM_operation,
	exact_cash, insufficient_cash, some_stock,
	VM_sale, VM_nosale, VM1, VM2, VM3 ]
    = map z_get_spec [ ⓩprice⌝, ⓩVMSTATE⌝, ⓩVM_operation⌝,
	ⓩexact_cash⌝, ⓩinsufficient_cash⌝, ⓩsome_stock⌝,
	ⓩVM_sale⌝, ⓩVM_nosale⌝, ⓩVM1⌝, ⓩVM2⌝, ⓩVM3⌝ ];
=TEX
Use z_defn_simp_rule to convert the definition of VM_ok into
an unconditional rewrite_rule:
=SML
(* ?: *) val VM_ok = z_defn_simp_rule (z_get_spec ⓩVM_ok⌝); (* :? *)
=TEX
Using the converted definition, prove that vending machine VM3 is
a member of VM_ok:
=SML
set_goal([], ⓩVM3 ∈ VM_ok⌝);
(* ?: *) (* :? *)
(* ?X *) a (rewrite_tac [VM1,VM2,VM3,VM_ok,VM_sale,VM_nosale,
		VM_operation,VMSTATE]);
(* ?X *) a(REPEAT z_strip_tac THEN asm_rewrite_tac[]);
(* ?X *) a (rewrite_tac [z_minus_thm, z_plus_assoc_thm1]);
(* ?X *) a (rewrite_tac [z_∀_elim ⓩ~ takings⌝ z_plus_order_thm]);
(* ?X *) a (rewrite_tac [z_plus_assoc_thm1]);
(* ?X *) val VM3_ok_thm = save_pop_thm "VM3_ok_thm";

=TEX
\end{document}
