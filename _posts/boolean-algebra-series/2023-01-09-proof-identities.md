---
layout:     series
title:      "Proof Identities"
date:       2023-01-09
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       8
series:     boolean-algebra
tags:       boolean algebra, modus ponens, modus tollens, disjunctive syllogism, reductio ad absurdum, contrapositive
---

## Direct Proofs

These date back to as early as Aristotle and are very well-known syllogisms.

<br>

### Modus Ponens

"Modus Ponens" is Latin for "method of affirming" and is also known as "affirming the consequent".

$(a \Rightarrow b) \wedge a \quad \Rightarrow \quad b$

$$
\begin{align}
    &(a \Rightarrow b) \wedge a            && \\
    &= (\overline{a} \vee b) \wedge a   &&\text{Material Implication} \\
    &= a \wedge (\overline{a} \vee b)   &&\text{Commutativity} \\
    &= a \wedge b                       &&\text{Simplification} \\
    &\Rightarrow b                         &&\text{Specialization}
\end{align}
$$

<br>

### Modus Tollens

"Modus Tollens" is Latin for "method of denying" and is also known as "denying the consequent".

$(a \Rightarrow b) \wedge \overline{b} \quad \Rightarrow \quad \overline{a}$

$$
\begin{align}
    &(a \Rightarrow b) \wedge \overline{b}             && \\
    &= (\overline{a} \vee b) \wedge \overline{b}    &&\text{Material Implication} \\
    &= \overline{b} \wedge (b \vee \overline{a})    &&\text{Commutativity 2 times} \\
    &= \overline{b} \wedge \overline{a}             &&\text{Simplification} \\
    &\Rightarrow \overline{a}                          &&\text{Specialization}
\end{align}
$$

<br>

### Disjunctive Syllogism

$(a \vee b) \wedge \overline{a} \quad \Rightarrow \quad b$

$$
\begin{align}
    &(a \vee b) \wedge \overline{a}         && \\
    &= \overline{a} \wedge (a \vee b)       &&\text{Commutativity} \\
    &= \overline{a} \wedge b                &&\text{Simplification} \\
    &\Rightarrow b                             &&\text{Specialization}
\end{align}
$$

<br>

## Reductio ad Adsurdum / Proof by Contradiction

This is one of the most widely used proof methods. Now, we have a rigorous proof for it.

$\overline{a} \Rightarrow \color{red}F \quad = \quad a$

$$
\begin{align}
    &\overline{a} \Rightarrow \color{red}F     && \\
    &= a \vee \color{red}F                  &&\text{Material Implication and Double Negation} \\
    &= a                                    &&\text{Identity}
\end{align}
$$

<br>

## Contrapositive

This can be extremely useful in some proofs.

$(a \Rightarrow b) \quad = \quad (\overline{b} \Rightarrow \overline{a})$

$$
\begin{align}
    &a \Rightarrow b                                   && \\
    &= \overline{a} \vee b                          &&\text{Material Implication} \\
    &= b \vee \overline{a}                          &&\text{Commutativity} \\
    &= \overline{(\overline{b})} \vee \overline{a}  &&\text{Double Negation} \\
    &= \overline{b} \Rightarrow \overline{a}           &&\text{Material Implication}
\end{align}
$$