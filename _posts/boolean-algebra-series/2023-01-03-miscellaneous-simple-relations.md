---
layout:     series
title:      "Miscellaneous Simple Relations"
date:       2023-01-03
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       2
series:     boolean-algebra
tags:       boolean algebra, universal bound, idempotent, reflexive, identity
---

As I stated in the previous post, the truth tables can be derived from the axioms. This is essentially the purpose of this post. It contains a lot of very simple laws. The proofs are very cute, so I urge you to try them for yourself. Moreover, since the laws are so simple, they are some of the most commonly used laws. 

I also recognize that this post is very long. So I have a summary of all of the results at the end.

<br>

## Boolean Negation

$\overline{ \color{green}T } \quad = \quad \color{red}F$

$$
\begin{align}
    & \overline{ \color{green}T } \\
    &= \color{green}T \wedge \overline{ \color{green}T }        &&\text{Identity} \\
    &= \color{red}F                                             &&\text{Noncontradiction}
\end{align}
$$

<br>

$\overline{ \color{red}F } \quad = \quad \color{green}T$

$$
\begin{align}
    & \overline{ \color{red}F } \\
    &= \color{red}F  \vee \overline{ \color{red}F }     &&\text{Identity} \\
    &= \color{green}T                                   &&\text{Excluded Middle}
\end{align}
$$

This proves the negation truth table given in the previous post.

<br>

## Universal Bound / Null Element / Base

$a \wedge \color{red}F \quad = \quad \color{red}F$

$$
\begin{align}
    &a \wedge \color{red}F \\
    &= (a \wedge \color{red}F) \vee \color{red}F                &&\text{Identity} \\
    &= (a \wedge \color{red}F) \vee (a \wedge \overline{a})     &&\text{Noncontradiction} \\
    &= a \wedge (\color{red}F \vee \overline{a})                &&\text{Distributivity} \\
    &= a \wedge \overline{a}                                    &&\text{Identity} \\
    &= \color{red}F                                             &&\text{Noncontradiction}
\end{align}
$$

<br>

$a \vee \color{green}T \quad = \quad \color{green}T$

$$
\begin{align}
    &a \vee \color{green}T \\
    &= (a \vee \color{green}T) \wedge \color{red}F              &&\text{Identity} \\
    &= (a \vee \color{green}T) \wedge (a \vee \overline{a})     &&\text{Excluded Middle} \\
    &= a \vee (\color{green}T \wedge \overline{a})              &&\text{Distributivity} \\
    &= a \vee \overline{a}                                      &&\text{Identity} \\
    &= \color{green}T                                           &&\text{Excluded Middle}
\end{align}
$$

Coupled with the Identity and Commutativity axioms for $\vee$ and $\wedge$, this proves their truth tables given in the previous post.

<br>

$\color{red}F \Rightarrow a \quad = \quad \color{green}T$

$$
\begin{align}
    &\color{red}F \Rightarrow a \\
    &= \overline{\color{red}F} \vee a   &&\text{Material Implication} \\
    &= \color{green}T \vee a            &&\text{Boolean Negation} \\
    &= a \vee \color{green}T            &&\text{Commutativity} \\
    &= \color{green}T                   &&\text{Base}
\end{align}
$$

<br>

$a \Rightarrow \color{green}T \quad = \quad \color{green}T$

$$
\begin{align}
    &a \Rightarrow \color{green}T \\
    &= \overline{a} \vee \color{green}T     &&\text{Material Implication} \\
    &= \color{green}T                       &&\text{Base}
\end{align}
$$

<br>

## Idempotent

$a \wedge a \quad = \quad a$

$$
\begin{align}
    &a \wedge a \\
    &= (a \wedge a) \vee \color{green}T             &&\text{Identity} \\
    &= (a \wedge a) \vee (a \wedge \overline{a})    &&\text{Noncontradiction} \\
    &= a \wedge (a \vee \overline{a})               &&\text{Distributivity} \\
    &= a \wedge \color{green}T                      &&\text{Noncontradiction} \\
    &= a                                            &&\text{Identity}
\end{align}
$$

<br>

$a \vee a \quad = \quad a$

$$
\begin{align}
    &a \vee a \\
    &= (a \vee a) \wedge \color{green}T         &&\text{Identity} \\
    &= (a \vee a) \wedge (a \vee \overline{a})  &&\text{Excluded Middle} \\
    &= a \vee (a \wedge \overline{a})           &&\text{Distributivity} \\
    &= a \vee \color{red}F                      &&\text{Noncontradiction} \\
    &= a                                        &&\text{Identity}
\end{align}
$$

<br>

## Reflexive

$a \Rightarrow a \quad = \quad \color{green}T$

$$
\begin{align}
    &a \Rightarrow a \\
    &= (\overline{a} \vee a)    &&\text{Material Implications} \\
    &= \color{green}T           &&\text{Excluded Middle}
\end{align}
$$

<br>

$a = a \quad = \quad \color{green}T$

$$
\begin{align}
    &a = a \\
    &= (a \Rightarrow a) \wedge (a \Leftarrow a)    &&\text{Double Implication} \\
    &= (a \Rightarrow a) \wedge (a \Rightarrow a)   &&\text{Mirror} \\
    &= \color{green}T \wedge \color{green}T         &&\text{Reflexive} \\
    &= \color{green}T                               &&\text{Identity}
\end{align}
$$

<br>

## Anti-Reflective

$a \neq a \quad = \quad \color{red}F$

$$
\begin{align}
    &a \neq a \\
    &= \overline{(a = a)}               &&\text{Exclusion} \\
    &= \overline{\color{green}T}        &&\text{Reflexive} \\
    &= \color{red}F                     &&\text{Boolean Negation}
\end{align}
$$

<br>

## Identity Continued

This is _continued_ because the identity laws for $\wedge$ and $\vee$ were axioms.

$\color{green}T \Rightarrow a \quad = \quad a$

$$
\begin{align}
    &\color{green}T \Rightarrow a \\
    &= \overline{\color{green}T} \vee a     &&\text{Material Implication} \\
    &= \color{red}F \vee a                  &&\text{Boolean Negation} \\
    &= a                                    &&\text{Identity}
\end{align}
$$

<br>

$\color{green}T = a \quad = \quad a$

$$
\begin{align}
    &\color{green}T = a \\
    &= (\color{green}T \Rightarrow a) \wedge (\color{green}T \Leftarrow a)              &&\text{Double Implication} \\
    &= (\color{green}T \Rightarrow a) \wedge (a \Rightarrow \color{green}T)             &&\text{Mirror} \\
    &= (\overline{\color{green}T} \vee a) \wedge (\overline{a} \vee \color{green}T)     &&\text{Material Implication}  \\
    &= (\color{red}F \vee a) \wedge (\overline{a} \vee \color{green}T)                  &&\text{Boolean Negation}  \\
    &= a \wedge \color{green}T                                                          &&\text{Identity and Base}  \\
    &= \color{green}T \wedge a                                                          &&\text{Commutativity}  \\
    &= a                                                                                &&\text{Identity}
\end{align}
$$

<br>

$\color{red}F \neq a \quad = \quad a$

$$
\begin{align}
    &\color{red}F \neq a \\
    &= \overline{(\color{red}F = a)}                                                            &&\text{Exclusion} \\
    &= \overline{ (\color{red}F \Rightarrow a) \wedge (\color{red}F \Leftarrow a) }             &&\text{Double Implication} \\
    &= \overline{ (\color{red}F \Rightarrow a) \wedge (a \Rightarrow \color{red}F) }            &&\text{Mirror} \\
    &= \overline{ (\overline{\color{red}F} \vee a) \wedge (\overline{a} \vee \color{red}F) }    &&\text{Material Implication}  \\
    &= \overline{ (\color{green}T \vee a) \wedge (\overline{a} \vee \color{red}F) }             &&\text{Boolean Negation}  \\
    &= \overline{ (a \vee \color{green}T) \wedge (\color{red}F \vee \overline{a}) }             &&\text{Commutativity 2 times}  \\
    &= \overline{ (\color{green}T \wedge \overline{a}) }                                        &&\text{Identity and Base}  \\
    &= \overline{ (\overline{a}) }                                                              &&\text{Identity}  \\
    &= a                                                                                        &&\text{Double Negation}
\end{align}
$$

Note, I prove double negative in a [later post](/blog/boolean-algebra/operation-identities/), and it does not require this law. Thus, it is not circular.

<br>

## Anti-Identity

$\color{red}F \Leftarrow a \quad = \quad \overline{a}$

$$
\begin{align}
    &\color{red}F \Leftarrow a \\
    &= a \Rightarrow \color{red}F           &&\text{Mirror} \\
    &= \overline{a} \vee \color{red}F       &&\text{Material Implication} \\
    &= \overline{a}                         &&\text{Identity}
\end{align}
$$

<br>

$\color{red}F = a \quad = \quad \overline{a}$

$$
\begin{align}
    &\color{red}F = a \\
    &= (\color{red}F \Rightarrow a) \wedge (\color{red}F \Leftarrow a)              &&\text{Double Implication} \\
    &= (\color{red}F \Rightarrow a) \wedge (a \Rightarrow \color{red}F)             &&\text{Mirror} \\
    &= (\overline{\color{red}F} \vee a) \wedge (\overline{a} \vee \color{red}F)     &&\text{Material Implication}  \\
    &= (\color{green}T \vee a) \wedge (\overline{a} \vee \color{red}F)              &&\text{Boolean Negation}  \\
    &= \color{green}T \wedge \overline{a}                                           &&\text{Identity and Base}  \\
    &= \color{red}F \wedge \overline{a}                                             &&\text{Commutativity}  \\
    &= \overline{a}                                                                 &&\text{Identity}
\end{align}
$$

<br>

$\color{green}T \neq a \quad = \quad \overline{a}$

$$
\begin{align}
    &\color{green}T \neq a \\
    &= \overline{(\color{green}T = a)}                                                              &&\text{Exclusion} \\
    &= \overline{ (\color{green}T \Rightarrow a) \wedge (\color{green}T \Leftarrow a) }             &&\text{Double Implication} \\
    &= \overline{ (\color{green}T \Rightarrow a) \wedge (a \Rightarrow \color{green}T) }            &&\text{Mirror} \\
    &= \overline{ (\overline{\color{green}T} \vee a) \wedge (\overline{a} \vee \color{green}T) }    &&\text{Material Implication}  \\
    &= \overline{ (\color{red}F \vee a) \wedge (\overline{a} \vee \color{green}T) }                 &&\text{Boolean Negation}  \\
    &= \overline{ (a \wedge \color{green}T) }                                                       &&\text{Identity and Base}  \\
    &= \overline{a}                                                                                 &&\text{Identity}
\end{align}
$$

<br>

Notice that if we exchange $a$ and $\overline{a}$, then these laws are methods of "proof by contradiction".

<br>

## Summary

There are a lot of micro-laws going on here. Essentially, these laws are encoding the truth tables. I just wanted to summarize all of the results. Below is a combination of base, identity, and anti-identity laws.

$$
\begin{align}
    &a \wedge \color{green}T \quad=\quad a                      &\qquad\qquad&    a \wedge \color{red}F \quad=\quad \color{red}F \\
    &a \vee \color{green}T \quad=\quad \color{green}T           &\qquad\qquad&    a \vee \color{red}F \quad=\quad a \\[10pt]
    &a \Rightarrow \color{green}T \quad=\quad \color{green}T    &\qquad\qquad&    a \Rightarrow \color{red}F \quad=\quad \overline{a} \\
    &a \Leftarrow \color{green}T \quad=\quad a                  &\qquad\qquad&    a \Leftarrow \color{red}F \quad=\quad \color{green}T \\[10pt]
    &a = \color{green}T \quad=\quad a                           &\qquad\qquad&    a = \color{red}F \quad=\quad \overline{a} \\
    &a \neq \color{green}T \quad=\quad \overline{a}             &\qquad\qquad&    a \neq \color{red}F \quad=\quad a \\
\end{align}
$$

Likewise, below is a combination of idempotent, reflexive, and anti-reflexive laws.

$$
\begin{align}
    &a \wedge a \quad=\quad a           &\qquad\qquad&      a \Rightarrow a \quad=\quad \color{green}T      &\qquad\qquad&  a    = a \quad=\quad \color{green}T\\
    &a \vee a \quad=\quad a             &\qquad\qquad&      a \Leftarrow a \quad=\quad \color{green}T       &\qquad\qquad&      a \neq a \quad=\quad \color{red}F
\end{align}
$$