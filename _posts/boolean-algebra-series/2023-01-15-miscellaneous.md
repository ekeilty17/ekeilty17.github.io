---
layout:     series
title:      "Miscellaneous"
date:       2023-01-15
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       14
series:     boolean-algebra
tags:       boolean algebra, inclusion, discharge, portation, conflation
---

This is just a collection of random laws that I've found. Some of them are more useful than others.

## Inclusion

$(a \wedge b) = a \quad = \quad (a \Rightarrow b)$

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
    &= a \Rightarrow b                                                                         &&\text{Material Implication}
\end{align}
$$

<br>

$(a \vee b) = b \quad = \quad (a \Rightarrow b)$

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
    &= a \Rightarrow b                                                                         &&\text{Material Implication}
\end{align}
$$

<br>

## Discharge

$a \wedge (a \Rightarrow b) \quad = \quad (a \wedge b)$

$$
\begin{align}
    &a \wedge (a \Rightarrow b)            && \\
    &= a \wedge (\overline{a} \vee b)   &&\text{Material Implication} \\
    &= a \wedge b                       &&\text{Simplification}
\end{align}
$$

<br>

$a \Rightarrow (a \wedge b) \quad = \quad (a \Rightarrow b)$

$$
\begin{align}
    &a \Rightarrow (a \wedge b)            && \\
    &= \overline{a} \vee (a \wedge b)   &&\text{Material Implication} \\
    &= \overline{a} \vee b              &&\text{Simplification} \\
    &= a \Rightarrow b                     &&\text{Material Implication}
\end{align}
$$

<br>

## Portation

$(a \wedge b) \Rightarrow c \quad = \quad a \Rightarrow (b \Rightarrow c)$

$$
\begin{align}
    &(a \wedge b) \Rightarrow c                    && \\
    &= (\overline{a \wedge b}) \vee c           &&\text{Material Implication} \\
    &= (\overline{a} \vee \overline{b}) \vee c  &&\text{De Morgan's Law} \\
    &= \overline{a} \vee (\overline{b} \vee c)  &&\text{Associativity} \\
    &= \overline{a} \vee (b \Rightarrow c)         &&\text{Material Implication} \\
    &= a \Rightarrow (b \Rightarrow c)                &&\text{Material Implication}
\end{align}
$$

<br>

## Conflation

$(a \Rightarrow b) \wedge (c \Rightarrow d) \quad \Rightarrow \quad (a \wedge c) \Rightarrow (b \wedge d)$

$$
\begin{align}
    &(a \Rightarrow b) \wedge (c \Rightarrow d)
    && \\

    &= (\overline{a} \vee b) \wedge (\overline{c} \vee d)
    &&\text{Material Implication 2 times} \\

    &\Rightarrow ((\overline{a} \vee b) \wedge (\overline{c} \vee d)) \vee (\overline{a} \vee \overline{c})
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

    &= (a \wedge c) \Rightarrow (b \wedge d)
    &&\text{Material Implication}
\end{align}
$$

<br>

$(a \Rightarrow b) \wedge (c \Rightarrow d) \quad \Rightarrow \quad (a \vee c) \Rightarrow (b \vee d)$

$$
\begin{align}
    &(a \Rightarrow b) \wedge (c \Rightarrow d)
    && \\

    &= (\overline{a} \vee b) \wedge (\overline{c} \vee d)
    &&\text{Material Implication 2 times} \\

    &\Rightarrow ((\overline{a} \vee b) \wedge (\overline{c} \vee d)) \vee (b \vee d)
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

    &= (a \wedge c) \Rightarrow (b \wedge d)
    &&\text{Material Implication}
\end{align}
$$