=IGN
********************************************************************************
def001D.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
To be included as the section `ALIASES, OVERLOADING'
=IGN
 ℤ $Revision: 1.5 $ $RCSfile: def001D.doc,v $ $Date: 2002/10/17 15:10:58 $
=TEX
The HOL system allows {\em aliases}, to be declared for particular instances of constants.
This facility allows different names (and associated fixities and precedences) to be used for the same function.
For example, the symbol `⇔' is set up in the supplied system as an alias for the boolean instance of the polymorphic equality operator, `$=$'.
`⇔' is given a lower precedence than `$=$', so that a term such as
=INLINEFT
⌜x = y ⇔ a = b⌝
=TEX
\ associates as
=INLINEFT
⌜(x = y) ⇔ (a = b)⌝
=TEX
\ .

Different constants may have a common alias. This allows aliases
to be used to achieve the effect of overloaded constant names.
For example, it would be natural to use `$+$' as an alias for
the additions on natural number, integers, rational etc.

An alias may be the same as a constant name. This allows an application in
which the terminology conflicts with that used in a library theory
to be handled in its own terms. For example, if \verb"sin" denotes the sine
function in a library theory, the name \verb"sin" might be made an alias
of \verb"transgression" in a theory of ethics.

