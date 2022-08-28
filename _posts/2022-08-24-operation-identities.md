---
layout: post
title:  "Operation Identities"
date:   2022-08-24
part: 6
categories: boolean-algebra
---

With the completion of De Morgan's Law, we have proven most of the fundametal boolean algebra laws. Now, we will continue to some more practical laws that will help to speed up future proofs. This section essentially proves all of the things we intuitively know to be true.

## Double Negation

We seek to show that $\ \overline{(\overline{a})} = a$, which is more complicated to prove than you might think.

We first will prove two intermediate identities.

$\overline{(\overline{a})} = (\overline{(\overline{a})} \vee a)$

$$
\begin{align}
    &\overline{(\overline{a})}                                                                  && \\
    &= \overline{(\overline{a})} \vee \color{red}F                                              &&\text{identity} \\
    &= \overline{(\overline{a})} \vee (a \wedge \overline{a})                                   &&\text{Noncontradiction} \\
    &= (\overline{(\overline{a})} \vee a) \wedge (\overline{(\overline{a})} \vee \overline{a})  &&\text{Distributivity} \\
    &= (\overline{(\overline{a})} \vee a) \wedge \color{green}T                                 &&\text{Excluded Middle} \\
    &= \overline{(\overline{a})} \vee a                                                         &&\text{identity}
\end{align}
$$

$\overline{(\overline{a})} = (\overline{(\overline{a})} \wedge a)$

$$
\begin{align}
    &\overline{(\overline{a})}                                                                      && \\
    &= \overline{(\overline{a})} \wedge \color{green}T                                              &&\text{identity} \\
    &= \overline{(\overline{a})} \wedge (a \vee \overline{a})                                       &&\text{Excluded Middle} \\
    &= (\overline{(\overline{a})} \wedge a) \vee (\overline{(\overline{a})} \wedge \overline{a})    &&\text{Distributivity} \\
    &= (\overline{(\overline{a})} \wedge a) \vee \color{green}T                                     &&\text{Noncontradiction} \\
    &= \overline{(\overline{a})} \wedge a                                                           &&\text{identity}
\end{align}
$$

Now, we prove the desired result. In each step where the justification is "Above", you could imagine inserting the above logic to arive at the next line. Separating the logic out just improves the readability.

$\overline{(\overline{a})} = a$

$$
\begin{align}
    &\overline{(\overline{a})}                          && \\
    &= (\overline{(\overline{a})} \vee a)               &&\text{Above} \\
    &= ((\overline{(\overline{a})} \wedge a) \vee a)    &&\text{Above} \\
    &= (\overline{(\overline{a})} \wedge a) \vee a      &&\text{Identity} \\
    &= a \vee (a \wedge (\overline{(\overline{a})}))    &&\text{Commutativity 2 times} \\
    &= a                                                &&\text{Absorption}
\end{align}
$$


## Material Implication

You may recall that Material Implication is one of that axioms that states $(a \implies b) = (\overline{a} \vee b)$. This is an extension of that axiom.

$(a \impliedby b) \quad = \quad (a \vee \overline{b})$

$$
\begin{align}
    &a \impliedby b             && \\
    &= b \implies a             &&\text{Mirror} \\
    &= \overline{b} \vee a      &&\text{Material Implication} \\
    &= a \vee \overline{b}      &&\text{Commutativity}
\end{align}
$$

## Equality

$(a = b) \quad = \quad (\overline{a} \vee b) \wedge (a \vee \overline{b}) \quad = \quad (a \wedge b) \vee (\overline{a} \wedge \overline{b})$

$$
\begin{align}
    &a = b                                                                                  && \\
    &= (a \implies b) \wedge (a \impliedby b)                                               &&\text{Double Implication} \\
    &= (\overline{a} \vee b) \wedge (a \vee \overline{b})                                   &&\text{Material Implication} \\
    &= (\overline{a} \wedge (a \vee \overline{b})) \vee (b \wedge (a \vee \overline{b}))    &&\text{Distributivity} \\
    &= (\overline{a} \wedge (a \vee \overline{b})) \vee (b \wedge (\overline{b} \vee a))    &&\text{Commutativity} \\
    &= (\overline{a} \wedge \overline{b}) \vee (b \wedge a)                                 &&\text{Simplification 2 times} \\
    &= (a \wedge b) \vee (\overline{a} \wedge \overline{b})                                 &&\text{Commutativity 2 times}
\end{align}
$$


## Difference

$(a \neq b) \quad = \quad (\overline{a} \wedge b) \vee (a \wedge \overline{b}) \quad = \quad (a \vee b) \wedge (\overline{a} \vee \overline{b})$

$$
\begin{align}
    &a \neq b                                                                   && \\
    &= (\overline{a = b})                                                       &&\text{Exclusion} \\
    &= (\overline{ (\overline{a} \vee b) \wedge (a \vee \overline{b}) })        &&\text{Equality} \\
    &= (\overline{\overline{a} \vee b}) \vee (\overline{a \vee \overline{b}})   &&\text{De Morgan's Law} \\
    &= (a \wedge \overline{b}) \vee (\overline{a} \wedge b)                     &&\text{De Morgan's Law and Double Negation} \\
    &= (\overline{a} \wedge b) \vee (a \wedge \overline{b})                     &&\text{Commutativity}
\end{align}
$$

$$
\begin{align}
    &a \neq b                                                                       && \\
    &= (\overline{a = b})                                                           &&\text{Exclusion} \\
    &= (\overline{ (a \wedge b) \vee (\overline{a} \wedge \overline{b}) })          &&\text{Equality} \\
    &= (\overline{a \wedge b}) \wedge (\overline{\overline{a} \wedge \overline{b}}) &&\text{De Morgan's Law} \\
    &= (\overline{a} \vee \overline{b}) \wedge (a \vee b)                           &&\text{De Morgan's Law and Double Negation} \\
    &= (a \vee b) \wedge (\overline{a} \vee \overline{b})                           &&\text{Commutativity}
\end{align}
$$

## Exclusion

You may recall that exclusion was one of the axioms, which states that $(a \neq b) = (\overline{a = b})$. This is an extention of that axiom.

$(a \neq b) \quad = \quad (a = \overline{b}) \quad = \quad (\overline{a} = b)$

$$
\begin{align}
    &a \neq b                                                                       && \\
    &= (a \vee b) \wedge (\overline{a} \vee \overline{b})                           &&\text{Difference} \\
    &= (\overline{(\overline{a})} \vee b) \wedge (\overline{a} \vee \overline{b})   &&\text{Double Negation} \\
    &= (\overline{a} \implies b) \wedge (\overline{a} \impliedby b)                 &&\text{Material Implication 2 times} \\
    &= (\overline{a} = b)                                                           &&\text{Double Implication}
\end{align}
$$

$$
\begin{align}
    &a \neq b                                                                       && \\
    &= (a \vee b) \wedge (\overline{a} \vee \overline{b})                           &&\text{Difference} \\
    &= (a \vee \overline{(\overline{b})}) \wedge (\overline{a} \vee \overline{b})   &&\text{Double Negation} \\
    &= (a \impliedby \overline{b}) \wedge (a \implies \overline{b})                 &&\text{Material Implication 2 times} \\
    &= (a \implies \overline{b}) \wedge (a \impliedby \overline{b})                 &&\text{Commutativity} \\
    &= (a = \overline{b})                                                           &&\text{Double Implication}
\end{align}
$$