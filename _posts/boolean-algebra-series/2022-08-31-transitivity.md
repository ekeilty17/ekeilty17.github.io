---
layout:     series
title:      "Transitivity"
date:       2022-08-31
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       11
series:     boolean-algebra
tags:       boolean algebra, transitivity
---

In this post we prove various transitivity laws.

<br>

$(a \wedge b) \wedge (b \wedge c) \quad \Rightarrow \quad (a \wedge c)$

$$
\begin{align}
    &(a \wedge b) \wedge (b \wedge c)       && \\
    &= (a \wedge c) \wedge (b \wedge b)     &&\text{Associativity and Commutativity} \\
    &\Rightarrow (a \wedge c)                  &&\text{Specialization}
\end{align}
$$

<br>

$(a \Rightarrow b) \wedge (b \Rightarrow c) \quad \Rightarrow \quad (a \Rightarrow c)$

$$
\begin{align}
    &(a \Rightarrow b) \wedge (b \Rightarrow c)
    && \\

    &= (\overline{a} \vee b) \wedge (\overline{b} \vee c)
    &&\text{Material Implication} \\

    &= (\overline{a} \wedge \overline{b}) \vee (\overline{a} \wedge c) \vee (b \wedge \overline{b}) \vee (b \wedge c)
    &&\text{Distributivity and Associativity} \\

    &= (\overline{a} \wedge \overline{b}) \vee (\overline{a} \wedge c) \vee \color{red}F \vee (b \wedge c)
    &&\text{Noncontradiction} \\

    &= (\overline{a} \wedge \overline{b}) \vee (\overline{a} \wedge c) \vee (b \wedge c)
    &&\text{Identity} \\

    &= (\overline{a} \wedge \overline{b}) \vee (\overline{a} \wedge c) \vee (b \wedge (c \wedge (c \vee \overline{b})))
    &&\text{Absportion} \\

    &= (\overline{a} \wedge \overline{b}) \vee (\overline{a} \wedge c) \vee ((b \wedge c) \wedge (\overline{b} \vee c))
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a} \wedge (\overline{b} \vee c)) \vee ((b \wedge c) \wedge (\overline{b} \vee c))
    &&\text{Distributivity} \\

    &= (\overline{a} \vee (b \wedge c)) \wedge (\overline{b} \vee c)
    &&\text{Distributivity} \\

    &= (\overline{a} \vee b) \wedge (\overline{a} \vee c) \wedge (\overline{b} \vee c)
    &&\text{Distributivity and Associativity} \\

    &\Rightarrow (\overline{a} \vee c)
    &&\text{Specialization} \\

    &= (a \Rightarrow c)
    &&\text{Material Implication} \\
\end{align}
$$

<br>

$(a = b) \wedge (b = c) \quad \Rightarrow \quad (a = c)$

$$
\begin{align}
    &(a = b) \wedge (b = c)       && \\
    &= ((a \Rightarrow b) \wedge (a \Leftarrow b)) \wedge ((b \Rightarrow c) \wedge (b \Leftarrow c)) &&\text{Double Implication} \\
    &= ((a \Rightarrow b) \wedge (b \Rightarrow a)) \wedge ((b \Rightarrow c) \wedge (c \Rightarrow b)) &&\text{Mirror 2 times} \\
    &= ((a \Rightarrow b) \wedge (b \Rightarrow c)) \wedge ((c \Rightarrow b) \wedge (b \Rightarrow a)) &&\text{Associativity and Commutativity of} \ \wedge \\
    &= (a \Rightarrow c) \wedge (c \Rightarrow a) &&\text{Transitivity of } \ \Rightarrow \\
    &= (a \Rightarrow c) \wedge (a \Leftarrow c) &&\text{Mirror} \\
    &= (a = c) &&\text{Double Implication} \\
\end{align}
$$

<br>

$(a \Rightarrow b) \wedge (b = c) \quad \Rightarrow \quad (a \Rightarrow c)$

$$
\begin{align}
    &(a \Rightarrow b) \wedge (b = c)                                      && \\
    &= (a \Rightarrow b) \wedge ((b \Rightarrow c) \wedge (b \Leftarrow c))   &&\text{Double Implication} \\
    &= (a \Rightarrow b) \wedge ((b \Rightarrow c) \wedge (c \Rightarrow b))     &&\text{Mirror} \\
    &= ((a \Rightarrow b) \wedge (b \Rightarrow c)) \wedge (c \Rightarrow b)     &&\text{Associativity} \\
    &\Rightarrow (a \Rightarrow c) \wedge (c \Rightarrow b)                      &&\text{Transitivity of } \ \Rightarrow \\
    &\Rightarrow (a \Rightarrow c)                                            &&\text{Specialization}
\end{align}
$$

<br>

$(a = b) \wedge (b \Rightarrow c) \quad \Rightarrow \quad (a \Rightarrow c)$

$$
\begin{align}
    &(a = b) \wedge (b \Rightarrow c)                                      && \\
    &= ((a \Rightarrow b) \wedge (a \Leftarrow b)) \wedge (b \Rightarrow c)   &&\text{Double Implication} \\
    &= ((a \Rightarrow b) \wedge (b \Rightarrow a)) \wedge (b \Rightarrow c)     &&\text{Mirror} \\
    &= (b \Rightarrow a) \wedge ((a \Rightarrow b) \wedge (b \Rightarrow c))     &&\text{Commutativity and Associativity} \\
    &\Rightarrow (b \Rightarrow a) \wedge (a \Rightarrow c)                      &&\text{Transitivity of } \ \Rightarrow \\
    &\Rightarrow (a \Rightarrow c)                                            &&\text{Specialization}
\end{align}
$$