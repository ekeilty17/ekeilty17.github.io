---
layout:     series
title:      "Specialization and Generalization"
date:       2022-08-25
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       5
series:     boolean-algebra
tags:       boolean algebra, specialization, generalization
---

Here, we are going to implore a different style of proof. In all previous proofs we had an expression of the form $\text{LHS} = \text{RHS}$. We then start with the $\text{LHS}$ at the top and arrive at the $\text{RHS}$ at the bottom. In these expressions, there is are equals sign. Instead, we are going to start with the entire expression at the top and arrive at $\color{green}T$ at the bottom. Since the original statement is equivalent to $\color{green}T$, it must be a true expression. We are essentially using the identity law 

$$a = \color{green}T \quad = \quad a$$

Similar to Absorption, these relations may seem simple and obscure, but they turn out to be very useful in practice.

<br>

## Specialization

$(a \wedge b) \Rightarrow a$

$$
\begin{align}
    &(a \wedge b) \Rightarrow a \\
    &= (\overline{a \wedge b}) \vee a                                           &&\text{Material Implication} \\
    &= (\overline{a \wedge b}) \vee (a \wedge \color{green}T)                   &&\text{Identity} \\
    &= (\overline{a \wedge b}) \vee (a \wedge (b \vee \overline{b}))            &&\text{Excluded Middle} \\
    &= (\overline{a \wedge b}) \vee ((a \wedge b) \vee (a \wedge \overline{b})) &&\text{Distributivity} \\
    &= ((\overline{a \wedge b}) \vee (a \wedge b)) \vee (a \wedge \overline{b}) &&\text{Associativity} \\
    &= \color{green}T \vee (a \wedge \overline{b})                              &&\text{Associativity} \\
    &= \color{green}T                                                           &&\text{Base}
\end{align}
$$

<br>

## Generalization

$a \Rightarrow (a \vee b)$

$$
\begin{align}
    &a \Rightarrow (a \vee b) \\
    &= \overline{a} \vee (a \vee b)     &&\text{Material Implication} \\
    &= (\overline{a} \vee a) \vee b     &&\text{Associativity} \\
    &= \color{green}T \vee b            &&\text{Excluded Middle} \\
    &= \color{green}T                   &&\text{Base}
\end{align}
$$