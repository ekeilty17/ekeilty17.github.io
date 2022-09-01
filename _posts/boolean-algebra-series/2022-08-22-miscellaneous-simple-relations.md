---
layout:     series
title:      "Miscellaneous Simple Relations"
date:       2022-08-22
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       1
series:     boolean-algebra
tags:       boolean algebra, universal bound, idempotent, reflexive, identity
---

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

$\color{red}F \implies a \quad = \quad \color{green}T$

$$
\begin{align}
    &\color{red}F \implies a \\
    &= \overline{\color{red}F} \vee a   &&\text{Material Implication} \\
    &= \color{green}T \vee a            &&\text{Definition of negation} \\
    &= a \vee \color{green}T            &&\text{Commutativity} \\
    &= \color{green}T                   &&\text{Base}
\end{align}
$$

$a \implies \color{green}T \quad = \quad \color{green}T$

$$
\begin{align}
    &a \implies \color{green}T \\
    &= \overline{a} \vee \color{green}T     &&\text{Material Implication} \\
    &= \color{green}T                       &&\text{Base}
\end{align}
$$

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


## Reflexive

$a \implies a \quad = \quad \color{green}T$

$$
\begin{align}
    &a \implies a \\
    &= (\overline{a} \vee a)    &&\text{Material Implications} \\
    &= \color{green}T           &&\text{Excluded Middle}
\end{align}
$$

$a = a \quad = \quad \color{green}T$

$$
\begin{align}
    &a = a \\
    &= (a \implies a) \wedge (a \impliedby a)   &&\text{Double Implication} \\
    &= (a \implies a) \wedge (a \implies a)     &&\text{Mirror} \\
    &= \color{green}T \wedge \color{green}T     &&\text{Reflexive} \\
    &= \color{green}T                           &&\text{Definition of}\ \wedge
\end{align}
$$

## Identity Continued

There are some additional identity laws for the other operations. However, they follow from the axioms, so they were not included

$$
\begin{align}
    &\color{green}T \implies a \\
    &= \overline{\color{green}T} \wedge a   &&\text{Material Implication} \\
    &= \color{red}F \vee a                  &&\text{Definition of negation} \\
    &= a                                    &&\text{Identity}
\end{align}
$$

$$
\begin{align}
    &\color{green}T = a \\
    &= (\color{green}T \implies a) \wedge (\color{green}T \impliedby a)                     &&\text{Double Implication} \\
    &= (\color{green}T \implies a) \wedge (a \implies \color{green}T)                       &&\text{Mirror} \\
    &= (\overline{\color{green}T} \wedge a) \wedge (\overline{a} \wedge \color{green}T)     &&\text{Material Implication}  \\
    &= a \wedge \color{green}T                                                              &&\text{Identity and Base}  \\
    &= a                                                                                    &&\text{Identity}
\end{align}
$$