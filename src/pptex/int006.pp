
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentstyle[hol1,12pt,TQ,ifthen]{article}
\ftlinepenalty=10000
\TPPproject{FST PROJECT}  %% Mandatory field
%\TPPvolume{}
%\TPPpart{}
\TPPtitle{Test for Style file hol1.sty}  %% Mandatory field
\TPPref{DS/FMU/IED/INT006}  %% Mandatory field
\TPPissue{\VCVersion}
\TPPdate{\FormatDate{\VCDate}}
\TPPstatus{Approved}
%\TPPstatus{Draft}
\TPPtype{Specification}
\TPPkeywords{HOL}
\TPPauthor{R.D.~Arthan & }  %% Mandatory field
%\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%\TPPauthorisation{R.B. Jones & FMU Manager}
\TPPabstract{
Tests for the symbols supported by the style file hol1.sty.}
%\TPPabstractB{}
%\TPPabstractC{}
%\TPPabstractD{}
%\TPPabstractE{}
%\TPPabstractF{}
\TPPdistribution{\parbox[t]{4.0in}{%
      Library}}

%\TPPclass{CLASSIFICATION}
%\def\TPPheadlhs{}
%\def\TPPheadcentre{}
%def\TPPheadrhs{}
%\def\TPPfootlhs{}
%\def\TPPfootcentre{}
%\def\TPPfootrhs{}

\begin{document}
\TPPsetsizes
\makeTPPfrontpage

\vfill
\begin{centering}

\bf Copyright \copyright\ : Lemma 1  Ltd \number\year

\end{centering}
\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents

\newpage
\ftlinepenalty=9999
\twocolumn[\section{TEST OF ALL THE GLPYHS}]
=GFT
	<":	<"
	<::	ⓣ
	=>:	⦁
	>":	>"
	Box:	%Box%
	Delta:	Δ
	Diamond:	⋄
	Gamma:	Γ
	Im:	ℑ
	Join:	%Join%
	Lambda:	Λ
	Leftarrow:	⇐
	Longleftarrow:	⟸
	Longleftrightarrow:	⟺
	Longrightarrow:	⟹
	Omega:	Ω
	Phi:	Φ
	Pi:	Π
	Psi:	Ψ
	Q":	Q"
	Re:	ℜ
	SFT:	Ⓢ
	SML:	ⓜ
	SZT:	ⓩ
	Sigma:	Σ
	Theta:	Θ
	Uparrow:	⇑
	Updownarrow:	⇕
	Upsilon:	Υ
	Xi:	Ξ
	aleph:	ℵ
	alpha:	α
	and:	∧
	approx:	≈
	asymp:	≈
	bagunion:	⊎
	bbA:	%bbA%
	bbB:	𝔹
	bbC:	ℂ
	bbD:	%bbD%
	bbE:	%bbE%
	bbF:	𝔽
	bbG:	%bbG%
	bbH:	%bbH%
	bbI:	%bbI%
	bbJ:	%bbJ%
	bbK:	%bbK%
	bbL:	%bbL%
	bbM:	%bbM%
	bbN:	ℕ
	bbO:	%bbO%
	bbP:	ℙ
	bbQ:	ℚ
	bbR:	ℝ
	bbS:	𝕊
	bbT:	%bbT%
	bbU:	𝕌
	bbV:	%bbV%
	bbW:	%bbW%
	bbX:	%bbX%
	bbY:	%bbY%
	bbZ:	ℤ
	beta:	β
	bigcirc:	◯
	bigcolon:	⦂
	bigodot:	⨀
	bigoplus:	⨁
	bigotimes:	⨂
	bigsqcup:	⨆
	bigtriangledown:	▽
	bigtriangleup:	△
	biguplus:	⨄
	bigvee:	⋁
	bigwedge:	⋀
	bij:	⤖
	boolean: 𝔹
	complex: ℂ
	bottom:	⊥
	bowtie:	⋈
	calA:	%calA%
	calB:	%calB%
	calC:	%calC%
	calD:	%calD%
	calE:	%calE%
	calF:	%calF%
	calG:	%calG%
	calH:	%calH%
	calI:	%calI%
	calJ:	%calJ%
	calK:	%calK%
	calL:	%calL%
	calM:	%calM%
	calN:	%calN%
	calO:	%calO%
	calP:	%calP%
	calQ:	%calQ%
	calR:	%calR%
	calS:	%calS%
	calT:	%calT%
	calU:	%calU%
	calV:	%calV%
	calW:	%calW%
	calX:	%calX%
	calY:	%calY%
	calZ:	%calZ%
	cat:	⁀
	cdot:	ċ
	chi:	χ
	circ:	∘
	clubsuit:	♣
	cong:	≅
	coprod:	∐
	dagger:	†
	dashv:	⊣
	ddagger:	‡
	def:	≜
	delta:	δ
	diamond:	⋄
	diamondsuit:	♦
	dintersect:	⋂
	div:	÷
	doteq:	≐
	downarrow:	↓
	dres:	◁
	dsub:	⩤
	dunion:	⋃
	ell:	ℓ
	emptyset:	∅
	epsilon:	ε
	equiv:	⇔
	eta:	η
	exists:	∃
	extract:	↿
	fcomp:	∘
	ffun:	⇻
	filter:	↾
	finj:	⤕
	flat:	♭
	fn:	λ
	forall:	∀
	fset:	𝔽
	fun:	→
	gamma:	γ
	geq:	≥
	gg:	≫
	hbar:	ℏ
	heartsuit:	♥
	hookleftarrow:	↩
	hookrightarrow:	↪
	identical:	≡
	imath:	ı
	implies:	⇒
	infty:	%infty%
	inj:	↣
	int:	ℤ
	negate:	
	integral:	%integral%
	intersect:	∩
	iota:	ι
	jmath:	ȷ
	kappa:	κ
	lambda:	λ
	lbag:	⟦
	lchevron:	%lchevron%
	leadsto:	%leadsto%
	leftarrow:	←
	leftharpoondown:	↽
	leftharpoonup:	↼
	leq:	≤
	lhd:	%lhd%
	ll:	≪
	longleftarrow:	⟵
	longleftrightarrow:	⟷
	longmapsto:	⟼
	longrightarrow:	⟶
	lrelimg:	⦇
	lseq:	⟨
	map:	↦
	mem:	∈
	mho:	℧
	models:	⊧
	mp:	∓
	mu:	μ
	nabla:	∇
	nat:	ℕ
	natural:	♮
	nearrow:	%nearrow%
	neq:	≠
	ni:	∋
	not:	¬
	notmem:	∉
	nu:	ν
	nwarrow:	↖
	odot:	⊙
	oint:	∮
	omega:	ω
	ominus:	⊖
	or:	∨
	oslash:	ø
	otimes:	⊗
	overwrite:	⊕
	parallel:	∥
	partial:	%partial%
	pfun:	⇸
	phi:	φ
	pi:	π
	pinj:	⤔
	pm:	±
	prec:	≺
	preceq:	⪯
	prod:	∏
	propto:	∝
	pset:	ℙ
	psi:	ψ
	psubset:	⊂
	psupset:	⊃
	psurj:	⤀
	rbag:	⟧
	rchevron:	%rchevron%
	rat:	ℚ
	real:	ℜ
	rcomp:	⨾
	refinedby:	⊑
	rel:	↔
	rhd:	%rhd%
	rho:	ρ
	rightharpoondown:	⇁
	rightharpoonup:	⇀
	rightleftharpoons:	⇌
	rrelimg:	⦈
	rres:	▷
	rseq:	⟩
	rsub:	⩥
	searrow:	%searrow%
	select:	ε
	setminus:	∖
	sharp:	♯
	sigma:	σ
	simeq:	≃
	smile:	⌣
	spadesuit:	♠
	spot:	⦁
	sqcap:	⊓
	sqcup:	⊔
	sqsubset:	⊏
	sqsubseteq:	⊑
	star:	☆
	subset:	⊆
	succ:	≻
	succeq:	⪰
	sum:	∑
	supset:	⊇
	surd:	%surd%
	surj:	↠
	symbol:	𝕊
	symdiff:	⊖
	swarrow:	↙
	tau:	τ
	theta:	θ
	thm:	⊢
	top:	⊤
	triangleleft:	◃
	triangleright:	▹
	u:	𝕌
	union:	∪
	unlhd:	%unlhd%
	unrhd:	%unrhd%
	uparrow:	↑
	updownarrow:	%updownarrow%
	upsilon:	υ
	wp:	℘
	wr:	≀
	x":	x"
	xi:	ξ
	zeta:	ζ
=TEX
\newpage
=GFTSHOW
	SX:	⦏
	BH:	─
	BHH:	═
	SZG:	╒
	SZS:	┌
	BT:	├
	BV:	│
	EZ:	└
	EFT:	■
	EX:	⦎
	cantext:	↕
	dntext:	↘
	down:	⋎
	up:	⋏
	uptext:	↗
	ulbegin:	⨽
	ulend:	⨼
=TEX
\end{document}
	

