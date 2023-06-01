---
layout:     series
title:      "Monotonicity and Antimonotonicity"
date:       2023-01-13
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       12
series:     boolean-algebra
tags:       boolean algebra, monotonicity, antimonotonicity
---

The easiest way to explain monotonicity is to make an analogy with inequalities in algebra. Suppose I had the expression $x \geq y$. Adding any number $a$ to both sides preserves the direction of the inequality. Thus, addition is called **monotonic**. However, if I multiply by a negative number or take the reciprocals, then the direction of the inequality flips. Thus, these operations are called **antimonotonic**. We have the same concept in Boolean Algebra with $\Rightarrow$ and $\Leftarrow$.

## Monotonic Operations

$(a \Rightarrow b) \quad \Rightarrow \quad (c \wedge a) \Rightarrow (c \wedge b)$

$$
\begin{align}
    &a \Rightarrow b                                           && \\
    &= \overline{a} \vee b                                  &&\text{Material Implication} \\
    &\Rightarrow (\overline{a} \vee b) \vee \overline{c}       &&\text{Generalization} \\
    &= \overline{a} \vee (\overline{c} \vee b)              &&\text{Associativity and Commutativity} \\
    &= \overline{a} \vee (\overline{c} \vee (c \wedge b))   &&\text{Simplification} \\
    &= (\overline{c} \vee \overline{a}) \vee (c \wedge b)   &&\text{Associativity and Commutativity} \\
    &= (\overline{c \wedge a}) \vee (c \wedge b)            &&\text{De Morgan's Law} \\
    &= (c \wedge a) \Rightarrow (c \wedge b)                   &&\text{Material Implication}
\end{align}
$$

<br>

$(a \Rightarrow b) \quad \Rightarrow \quad (c \vee a) \Rightarrow (c \vee b)$

$$
\begin{align}
    &a \Rightarrow b                                           && \\
    &= \overline{a} \vee b                                  &&\text{Material Implication} \\
    &\Rightarrow (\overline{a} \vee b) \vee c                  &&\text{Generalization} \\
    &= (c \vee \overline{a}) \vee b                         &&\text{Associativity and Commutativity} \\
    &= (c \vee (\overline{c} \wedge \overline{a})) \vee b   &&\text{Simplification} \\
    &= (\overline{c} \wedge \overline{a}) \vee (c \vee b)   &&\text{Associativity and Commutativity} \\
    &= (\overline{c \vee a}) \vee (c \vee b)                &&\text{De Morgan's Law} \\
    &= (c \vee a) \Rightarrow (c \vee b)                       &&\text{Material Implication}
\end{align}
$$

<br>

$(a \Rightarrow b) \quad \Rightarrow \quad (c \Rightarrow a) \Rightarrow (c \Rightarrow b)$

$$
\begin{align}
    &a \Rightarrow b                                                   && \\
    &= \overline{a} \vee b                                          &&\text{Material Implication} \\
    &\Rightarrow (\overline{a} \vee b) \vee \overline{c}               &&\text{Generalization} \\
    &= (\overline{c} \vee \overline{a}) \vee b                      &&\text{Associativity and Commutativity} \\
    &= (\overline{c} \vee (c \wedge \overline{a})) \vee b           &&\text{Simplification} \\
    &= (c \wedge \overline{a}) \vee (\overline{c} \vee b)           &&\text{Associativity and Commutativity} \\
    &= (\overline{\overline{c} \vee a}) \vee (\overline{c} \vee b)  &&\text{De Morgan's Law} \\
    &= (\overline{c \Rightarrow a}) \vee (c \Rightarrow b)                &&\text{Material Implication 2 times} \\
    &= (c \Rightarrow a) \Rightarrow (c \Rightarrow b)                       &&\text{Material Implication}
\end{align}
$$

<br>

Thus, $\wedge$ and $\vee$ are monotonic. $\Rightarrow$ is monotonic in its antecedent.

## Antimonotonic Operations

$(a \Rightarrow b) \quad \Rightarrow \quad (a \Rightarrow c) \Leftarrow (b \Rightarrow c)$

$$
\begin{align}
    &a \Rightarrow b                                                   && \\
    &= \overline{a} \vee b                                          &&\text{Material Implication} \\
    &\Rightarrow (\overline{a} \vee b) \vee c               &&\text{Generalization} \\
    &= (c \vee b) \vee \overline{a}                      &&\text{Associativity and Commutativity} \\
    &= (c \vee (\overline{c} \wedge b)) \vee \overline{a}           &&\text{Simplification} \\
    &= (b \wedge \overline{c}) \vee (\overline{a} \vee c)           &&\text{Associativity and Commutativity} \\
    &= (\overline{\overline{b} \vee c}) \vee (\overline{a} \vee c)  &&\text{De Morgan's Law} \\
    &= (\overline{b \Rightarrow c}) \vee (a \Rightarrow c)                &&\text{Material Implication 2 times} \\
    &= (c \Rightarrow a) \Rightarrow (c \Rightarrow b)                       &&\text{Material Implication} \\
    &= (a \Rightarrow c) \Leftarrow (b \Rightarrow c)                       &&\text{Mirror}
\end{align}
$$

Thus, we see that $\Rightarrow$ is antimonotonic in its consequent.

Note that $=$ and $\neq$ are neither monotonic nor antimonotonic.