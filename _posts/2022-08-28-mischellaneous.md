---
layout: post
title:  "Miscellaneous"
date:   2022-08-26
part: 13
categories: boolean-algebra
---

## Inclusion

$(a \wedge b) = a \quad = \quad (a \implies b)$

$$
\begin{align}
    &(a \wedge b) = a                                                                       && \\
    &= ((a \wedge b) \wedge a) \vee ((\overline{a \wedge b}) \wedge \overline{a})           &&\text{Equality} \\
    &= ((a \wedge b) \wedge a) \vee ((\overline{a} \vee \overline{b}) \wedge \overline{a})  &&\text{De Morgan's Law} \\
    &= ((a \wedge a) \wedge b) \vee (\overline{a} \wedge (\overline{a} \vee \overline{b}))  &&\text{Associativity and Commutativity} \\
    &= (a \wedge b) \vee (\overline{a} \wedge (\overline{a} \vee \overline{b}))             &&\text{Idempotent} \\
    &= (a \wedge b) \vee \overline{a}                                                       &&\text{Absorption} \\
    &= \overline{a} \vee (a \wedge b)                                                       &&\text{Commutativity} \\
    &= \overline{a} \vee b                                                                  &&\text{Simplification} \\
    &= a \implies b                                                                         &&\text{Material Implication}
\end{align}
$$

$(a \vee b) = b \quad = \quad (a \implies b)$

$$
\begin{align}
    &(a \vee b) = b                                                                         && \\
    &= ((a \vee b) \wedge b) \vee ((\overline{a \vee b}) \wedge \overline{b})               &&\text{Equality} \\
    &= ((a \vee b) \wedge b) \vee ((\overline{a} \wedge \overline{b}) \wedge \overline{b})  &&\text{De Morgan's Law} \\
    &= (b \wedge (b \vee a)) \vee ((\overline{b} \wedge \overline{b}) \wedge \overline{a})  &&\text{Associativity and Commutativity} \\
    &= (b \wedge (b \vee a)) \vee (\overline{b} \wedge \overline{a})                        &&\text{Idempotent} \\
    &= b \vee (\overline{b} \wedge \overline{a})                                            &&\text{Absorption} \\
    &= b \vee \overline{a}                                                                  &&\text{Simplification} \\
    &= \overline{a} \vee b                                                                  &&\text{Commutativity} \\
    &= a \implies b                                                                         &&\text{Material Implication}
\end{align}
$$


## Discharge

$a \wedge (a \implies b) \quad = \quad (a \wedge b)$

$$
\begin{align}
    &a \wedge (a \implies b)            && \\
    &= a \wedge (\overline{a} \vee b)   &&\text{Material Implication} \\
    &= a \wedge b                       &&\text{Simplification}
\end{align}
$$

$a \implies (a \wedge b) \quad = \quad (a \implies b)$

$$
\begin{align}
    &a \implies (a \wedge b)            && \\
    &= \overline{a} \vee (a \wedge b)   &&\text{Material Implication} \\
    &= \overline{a} \vee b              &&\text{Simplification} \\
    &= a \implies b                     &&\text{Material Implication}
\end{align}
$$

## Portation

$(a \wedge b) \implies c \quad = \quad a \implies (b \implies c)$

$$
\begin{align}
    &(a \wedge b) \implies c                    && \\
    &= (\overline{a \wedge b}) \vee c           &&\text{Material Implication} \\
    &= (\overline{a} \vee \overline{b}) \vee c  &&\text{De Morgan's Law} \\
    &= \overline{a} \vee (\overline{b} \vee c)  &&\text{Associativity} \\
    &= \overline{a} \vee (b \implies c)         &&\text{Material Implication} \\
    &= a \implies (b \implies c)                &&\text{Material Implication}
\end{align}
$$

## Conflation

$(a \implies b) \wedge (c \implies d) \quad \implies \quad (a \wedge c) \implies (b \wedge d)$

$$
\begin{align}
    &(a \implies b) \wedge (c \implies d)
    && \\

    &= (\overline{a} \vee b) \wedge (\overline{c} \vee d)
    &&\text{Material Implication 2 times} \\

    &\implies ((\overline{a} \vee b) \wedge (\overline{c} \vee d)) \vee (\overline{a} \vee \overline{c})
    &&\text{Generalization} \\

    &= ((\overline{a} \vee b) \vee (\overline{a} \vee \overline{c})) \wedge ((\overline{c} \vee d) \vee (\overline{a} \vee \overline{c}))
    &&\text{Distributivity} \\

    &= ((\overline{a} \vee \overline{a}) \vee b \vee \overline{c}) \wedge (\overline{a} \vee (\overline{c} \vee \overline{c}) \vee d)
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a} \vee b \vee \overline{c}) \wedge (\overline{a} \vee \overline{c} \vee d)
    &&\text{Idempotent 2 times} \\

    &= ((\overline{a} \vee \overline{c}) \vee b) \wedge ((\overline{a} \vee \overline{c}) \vee d)
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a} \vee \overline{c}) \vee (b \wedge d)
    &&\text{Distributivity} \\

    &= (\overline{a \wedge c}) \vee (b \wedge d)
    &&\text{De Morgan's Law} \\

    &= (a \wedge c) \implies (b \wedge d)
    &&\text{Material Implication}
\end{align}
$$


$(a \implies b) \wedge (c \implies d) \quad \implies \quad (a \vee c) \implies (b \vee d)$

$$
\begin{align}
    &(a \implies b) \wedge (c \implies d)
    && \\

    &= (\overline{a} \vee b) \wedge (\overline{c} \vee d)
    &&\text{Material Implication 2 times} \\

    &\implies ((\overline{a} \vee b) \wedge (\overline{c} \vee d)) \vee (b \vee d)
    &&\text{Generalization} \\

    &= ((\overline{a} \vee b) \vee (b \vee d)) \wedge ((\overline{c} \vee d) \vee (b \vee d))
    &&\text{Distributivity} \\

    &= (\overline{a} \vee (b \vee b) \vee d) \wedge (b \vee \overline{c} \vee (d \vee d))
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a} \vee b \vee d) \wedge (b \vee \overline{c} \vee d)
    &&\text{Idempotent 2 times} \\

    &= (\overline{a} \vee (b \vee d)) \wedge (\overline{c} \vee (b \vee d))
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a} \vee \overline{c}) \vee (b \wedge d)
    &&\text{Distributivity} \\

    &= (\overline{a \wedge c}) \vee (b \wedge d)
    &&\text{De Morgan's Law} \\

    &= (a \wedge c) \implies (b \wedge d)
    &&\text{Material Implication}
\end{align}
$$