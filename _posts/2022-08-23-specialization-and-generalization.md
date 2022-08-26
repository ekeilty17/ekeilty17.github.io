---
layout: post
title:  "Specialization and Generalization"
date:   2022-08-23
chapter: 4
categories: boolean-algebra
---

Here, we are going to emplore a different style of proof. In all previous proofs we had an expression of the form $\text{LHS} = \text{RHS}$. We then start with the $\text{LHS}$ at the top and arrive at the $\text{RHS}$ at the bottom. In these expressions, there is are equals sign. Instead, we are going to start with the entire expression at the top and arrive at $\color{green}T$ at the bottom. Since the original statement is equivalent to $\color{green}T$, it must be a true expression.

Similar to Absorption, these relations may seem simple and abscure, but they turn out to be very useful in practice.

## Specialization

$(a \wedge b) \implies a$

$$
\begin{align}
    &(a \wedge b) \implies a \\
    &= (\overline{a \wedge b}) \vee a                                           &&\text{Material Implication} \\
    &= (\overline{a \wedge b}) \vee (a \wedge \color{green}T)                   &&\text{Identity} \\
    &= (\overline{a \wedge b}) \vee (a \wedge (b \vee \overline{b}))            &&\text{Excluded Middle} \\
    &= (\overline{a \wedge b}) \vee ((a \wedge b) \vee (a \wedge \overline{b})) &&\text{Distributivity} \\
    &= ((\overline{a \wedge b}) \vee (a \wedge b)) \vee (a \wedge \overline{b}) &&\text{Associativity} \\
    &= \color{green}T \vee (a \wedge \overline{b})                              &&\text{Associativity} \\
    &= \color{green}T                                                           &&\text{Base}
\end{align}
$$

## Generalization

$a \implies (a \vee b)$

$$
\begin{align}
    &a \implies (a \vee b) \\
    &= \overline{a} \vee (a \vee b)     &&\text{Material Implication} \\
    &= (\overline{a} \vee a) \vee b     &&\text{Associativity} \\
    &= \color{green}T \vee b            &&\text{Excluded Middle} \\
    &= \color{green}T                   &&\text{Base}
\end{align}
$$