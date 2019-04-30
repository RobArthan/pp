=IGN
********************************************************************************
usr001A.doc: this file is part of the PPTex system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr001A.doc   %A%
docsml usr001A.doc
%
% Macros for keyboard layout for use in the user documentation.
%
% There are two supplied example layouts. XppKeyboard3 and XppKeyboard4.
%
% \KEYBOARD draws a diagram of the XppKeyboard3 with the two to five
% characters each key can send drawn on each keytop.
% \KEYBOARDKEY draws a key to \KEYBOARD showing which shift keys
% produce which characters.
% \KEYBOARDTABLES produces tables with the extended characters
% in manageable groups showing the key-strokes to produce each character.
%
%
% Support register and macros:
%
=TEX
\newdimen\kbUNITWIDTH		% width of a standard key
\newdimen\kbUNITHEIGHT		% height of a standard key
\def\kbSS{\strut\hskip 2pt minus 1.7pt\relax}
\def\Key#1#2#3#4#5{{%
	\ShowAllImages
	\thinmuskip=0mu\medmuskip=0mu\thickmuskip=0mu%
	\vbox{%
		\hrule
		\hbox{%
			\vrule
			\vbox to \kbUNITHEIGHT{%
				\hbox to \kbUNITWIDTH{\kbSS#2 \hfil #3}%
				\vfill
				\hbox to \kbUNITWIDTH{\hfil #1 \hfil}%
				\vfill
				\hbox to \kbUNITWIDTH{\kbSS#4 \hfil #5}}
			\vrule}
		\hrule}\relax}}
% Call \Key with arguments to be positioned on the key caps as follows:
%	1:	Centre
%	2: 	Top left
%	3:	Top right
%	4:	Bottom left
%	5:	Bottom right
%
%
% \KEYBOARD: draw a diagram of XppKeyboard layout.
%
\def\KEYBOARD{%
\kbUNITHEIGHT=0.57in
\kbUNITWIDTH=0.41in
\vbox{
	\hbox{%
		\Key{1}{∧}{∩}{→}{⦏}
		\Key{2}{∨}{∪}{⇸}{⦎}
		\Key{3}{¬}{⊖}{↣}{⟦}
		\Key{4}{⇒}{⇔}{↠}{⟧}
		\Key{5}{∀}{⋂}{⤀}{⟨}
		\Key{6}{∃}{⋃}{⇻}{⟩}
		\Key{7}{⦁}{≜}{⤖}{${\dagger}^1$}
		\Key{8}{↔}{ }{⤔}{┌}
		\Key{9}{Ⓢ}{⦇}{⤕}{╒}
		\Key{0}{■}{⦈}{↔}{═}}%
	\hbox{%
		\hskip 0.5\kbUNITWIDTH
		\Key{q}{ℚ}{ⓜ}{χ}{}
		\Key{w}{⌜}{Ω}{ω}{${\dagger}^5$}
		\Key{e}{⌝}{${\dagger}^6$}{ε}{↿}
		\Key{r}{ℝ}{▷}{ρ}{◁}
		\Key{t}{⊢}{ⓣ}{τ}{⦂}
		\Key{y}{ }{Ψ}{ψ}{ }
		\Key{u}{𝕌}{Υ}{υ}{⋏}
		\Key{i}{≡}{${\relax}$}{ι}{│}
		\Key{o}{⊕}{${\relax}$}{∘}{├}
		\Key{p}{ℙ}{Π}{π}{─}}%
	\hbox{%
		\hskip 1.0\kbUNITWIDTH
		\Key{a}{ⓩ}{⩥}{α}{⩤}
		\Key{s}{𝕊}{Σ}{σ}{⊑}
		\Key{d}{⋎}{Δ}{δ}{${\dagger}^4$}
		\Key{f}{𝔽}{Φ}{φ}{↾}
		\Key{g}{↗}{Γ}{γ}{≥}
		\Key{h}{↘}{${\relax}$}{η}{${\dagger}^3$}
		\Key{j}{↕}{Θ}{θ}{${\dagger}^2$}
		\Key{k}{⁀}{ }{κ}{└}
		\Key{l}{ }{Λ}{λ}{≤}}%
	\hbox{%
		\hskip 1.5\kbUNITWIDTH
		\Key{z}{ℤ}{∅}{ζ}{⨽}
		\Key{x}{×}{Ξ}{ξ}{⨼}
		\Key{c}{ℂ}{⊂}{⨾}{⊆}
		\Key{v}{ }{⊃}{⇐}{⊇}
		\Key{b}{𝔹}{⊎}{β}{⊥}
		\Key{n}{ℕ}{∉}{ν}{≠}
		\Key{m}{↦}{∈}{μ}{ }}%
}} % End of \KEYBOARD

\def\KEYBOARDKEY{%
\kbUNITHEIGHT=0.54in
\kbUNITWIDTH=2.2in
\hbox to \hsize{
	\hspace{2em}
	\begin{tabular}[c]{cl}
		${\dagger}^1$ & \ShowAllImages ⓈHOLCONST \\
		${\dagger}^2$ & \ShowAllImages ⓈZAX \\
		${\dagger}^3$ & \ShowAllImages ⓈZ \\
		${\dagger}^4$ & \ShowAllImages ⋎R \\
		${\dagger}^5$ & \ShowAllImages ⋏-⋏1 \\
		${\dagger}^6$ & \ShowAllImages ⌜↘↕~~~⌝ \\[.1in]
	\end{tabular}
	\hfill
	\hbox{\Key{key}{Mod5+key}{Mod5+Shift+key}{Mod4+key}{Mod4+Shift+key}}%
	\hspace{5em}}%
} % End of \KEYBOARDKEY

%
%End of usr001A.doc
%
=IGN
echo '=TEX' >usr001tst.doc
cat >> usr001tst.doc <<%%%%
\documentstyle[hol1,11pt]{article}
\begin{document}
\input{usr001A.tex}
\KEYBOARD
\par
\KEYBOARDKEY
\newpage
\KEYBOARDTABLES
\end{document}
%%%%
doctex usr001tst usr001A ; texdvi usr001tst

