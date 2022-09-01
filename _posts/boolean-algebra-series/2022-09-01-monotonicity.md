---
layout:     series
title:      "Monotonicity"
date:       2022-09-01
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       11
series:     boolean-algebra
tags:       boolean algebra, monotonicity
---

$(a \implies b) \quad \implies \quad (c \wedge a) \implies (c \wedge b)$

$$
\begin{align}
    &a \implies b                                           && \\
    &= \overline{a} \vee b                                  &&\text{Material Implication} \\
    &\implies (\overline{a} \vee b) \vee \overline{c}       &&\text{Generalization} \\
    &= \overline{a} \vee (\overline{c} \vee b)              &&\text{Associativity and Commutativity} \\
    &= \overline{a} \vee (\overline{c} \vee (c \wedge b))   &&\text{Simplification} \\
    &= (\overline{c} \vee \overline{a}) \vee (c \wedge b)   &&\text{Associativity and Commutativity} \\
    &= (\overline{c \wedge a}) \vee (c \wedge b)            &&\text{De Morgan's Law} \\
    &= (c \wedge a) \implies (c \wedge b)                   &&\text{Material Implication}
\end{align}
$$


$(a \implies b) \quad \implies \quad (c \vee a) \implies (c \vee b)$

$$
\begin{align}
    &a \implies b                                           && \\
    &= \overline{a} \vee b                                  &&\text{Material Implication} \\
    &\implies (\overline{a} \vee b) \vee c                  &&\text{Generalization} \\
    &= (c \vee \overline{a}) \vee b                         &&\text{Associativity and Commutativity} \\
    &= (c \vee (\overline{c} \wedge \overline{a})) \vee b   &&\text{Simplification} \\
    &= (\overline{c} \wedge \overline{a}) \vee (c \vee b)   &&\text{Associativity and Commutativity} \\
    &= (\overline{c \vee a}) \vee (c \vee b)                &&\text{De Morgan's Law} \\
    &= (c \vee a) \implies (c \vee b)                       &&\text{Material Implication}
\end{align}
$$

$(a \implies b) \quad \implies \quad (c \implies a) \implies (c \implies b)$

$$
\begin{align}
    &a \implies b                                                   && \\
    &= \overline{a} \vee b                                          &&\text{Material Implication} \\
    &\implies (\overline{a} \vee b) \vee \overline{c}               &&\text{Generalization} \\
    &= (\overline{c} \vee \overline{a}) \vee b                      &&\text{Associativity and Commutativity} \\
    &= (\overline{c} \vee (c \wedge \overline{a})) \vee b           &&\text{Simplification} \\
    &= (c \wedge \overline{a}) \vee (\overline{c} \vee b)           &&\text{Associativity and Commutativity} \\
    &= (\overline{\overline{c} \vee a}) \vee (\overline{c} \vee b)  &&\text{De Morgan's Law} \\
    &= (\overline{c \implies a}) \vee (c \implies b)                &&\text{Material Implication 2 times} \\
    &= (c \implies a) \implies (c \implies b)                       &&\text{Material Implication}
\end{align}
$$

$(a \implies b) \quad \implies \quad (b \implies c) \implies (a \implies c)$

$$
\begin{align}
    &a \implies b                                                   && \\
    &= \overline{a} \vee b                                          &&\text{Material Implication} \\
    &\implies (\overline{a} \vee b) \vee c               &&\text{Generalization} \\
    &= (c \vee b) \vee \overline{a}                      &&\text{Associativity and Commutativity} \\
    &= (c \vee (\overline{c} \wedge b)) \vee \overline{a}           &&\text{Simplification} \\
    &= (b \wedge \overline{c}) \vee (\overline{a} \vee c)           &&\text{Associativity and Commutativity} \\
    &= (\overline{\overline{b} \vee c}) \vee (\overline{a} \vee c)  &&\text{De Morgan's Law} \\
    &= (\overline{b \implies c}) \vee (a \implies c)                &&\text{Material Implication 2 times} \\
    &= (c \implies a) \implies (c \implies b)                       &&\text{Material Implication}
\end{align}
$$