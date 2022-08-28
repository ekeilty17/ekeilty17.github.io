---
layout: post
title:  "Proof Identities"
date:   2022-08-24
part: 7
categories: boolean-algebra
---

## Direct Proofs

These date back to as early as Aristotle and are very well known syllogisms.

### Modus Ponens

"Modus Ponens" is Latin for "method of affirming" and is also known as "affirming the consequent".

$(a \implies b) \wedge a \quad \implies \quad b$

$$
\begin{align}
    &(a \implies b) \wedge a            && \\
    &= (\overline{a} \vee b) \wedge a   &&\text{Material Implication} \\
    &= a \wedge (\overline{a} \vee b)   &&\text{Commutativity} \\
    &= a \wedge b                       &&\text{Simplification} \\
    &\implies b                         &&\text{Specialization}
\end{align}
$$

### Modus Tollens

"Modus Tollens" is Latin for "method of denying" and is also known as "denying the consequent".

$(a \implies b) \wedge \overline{b} \quad \implies \quad \overline{a}$

$$
\begin{align}
    &(a \implies b) \wedge \overline{b}             && \\
    &= (\overline{a} \vee b) \wedge \overline{b}    &&\text{Material Implication} \\
    &= \overline{b} \wedge (b \vee \overline{a})    &&\text{Commutativity 2 times} \\
    &= \overline{b} \wedge \overline{a}             &&\text{Simplification} \\
    &\implies \overline{a}                          &&\text{Specialization}
\end{align}
$$


### Dysjunctive Syllogism

$(a \vee b) \wedge \overline{a} \quad \implies \quad b$

$$
\begin{align}
    &(a \vee b) \wedge \overline{a}         && \\
    &= \overline{a} \wedge (a \vee b)       &&\text{Commutativity} \\
    &= \overline{a} \wedge b                &&\text{Simplification} \\
    &\implies b                             &&\text{Specialization}
\end{align}
$$


## Reductio ad Adsurdum / Proof by Contradiction

This is one of the most widely used proof methods. Now, we have a rigorous proof for it.

$\overline{a} \implies \color{red}F \quad = \quad a$

$$
\begin{align}
    &\overline{a} \implies \color{red}F     && \\
    &= a \vee \color{red}F                  &&\text{Material Implication and Double Negation} \\
    &= a                                    &&\text{Identity}
\end{align}
$$


## Contrapositive

This can be extremely useful in some proofs.

$(a \implies b) \quad = \quad (\overline{b} \implies \overline{a})$

$$
\begin{align}
    &a \implies b                                   && \\
    &= \overline{a} \vee b                          &&\text{Material Implication} \\
    &= b \vee \overline{a}                          &&\text{Commutativity} \\
    &= \overline{(\overline{b})} \vee \overline{a}  &&\text{Double Negation} \\
    &= \overline{b} \implies \overline{a}           &&\text{Material Implication}
\end{align}
$$