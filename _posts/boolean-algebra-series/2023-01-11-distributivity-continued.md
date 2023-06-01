---
layout:     series
title:      "Distributivity Continued"
date:       2023-01-11
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       10
series:     boolean-algebra
tags:       boolean algebra, distributivity
---

Now we prove some other useful distributivity laws. 

$a \wedge (b \wedge c) \quad = \quad (a \wedge b) \wedge (a \wedge c)$

$$
\begin{align}
    &a \wedge (b \wedge c)                  &&\\
    &= (a \wedge a) \wedge (b \wedge c)     &&\text{Idempotent} \\
    &= (a \wedge b) \wedge (a \wedge c)     &&\text{Commutativity and Associativity}
\end{align}
$$

<br>

$a \vee (b \vee c) \quad = \quad (a \vee b) \vee (a \vee c)$

$$
\begin{align}
    &a \vee (b \vee c)              &&\\
    &= (a \vee a) \vee (b \vee c)   &&\text{Idempotent} \\
    &= (a \vee b) \vee (a \vee c)   &&\text{Commutativity and Associativity}
\end{align}
$$

<br>

$a \Rightarrow (b \wedge c) \quad = \quad (a \Rightarrow b) \wedge (a \Rightarrow c)$

$$
\begin{align}
    &a \Rightarrow (b \wedge c)                                && \\
    &= \overline{a} \vee (b \wedge c)                       &&\text{Material Implication} \\
    &= (\overline{a} \vee b) \wedge (\overline{a} \vee c)   &&\text{Distributivity} \\
    &= (a \Rightarrow b) \wedge (a \Rightarrow c)                 &&\text{Material Implication 2 times}
\end{align}
$$

<br>

$a \Rightarrow (b \vee c) \quad = \quad (a \Rightarrow b) \vee (a \Rightarrow c)$

$$
\begin{align}
    &a \Rightarrow (b \vee c)                              && \\
    &= \overline{a} \vee (b \vee c)                     &&\text{Material Implication} \\
    &= (\overline{a} \vee b) \vee (\overline{a} \vee c) &&\text{Distributivity} \\
    &= (a \Rightarrow b) \vee (a \Rightarrow c)               &&\text{Material Implication 2 times}
\end{align}
$$

<br>

$(a \wedge b) \Rightarrow c \quad = \quad (a \Rightarrow c) \vee (b \Rightarrow c)$

$$
\begin{align}
    &(a \wedge b) \Rightarrow c                            && \\
    &= (\overline{a \wedge b}) \vee c                   &&\text{Material Implication} \\
    &= (\overline{a} \vee \overline{b}) \vee c          &&\text{De Morgan's Law} \\
    &= (\overline{a} \vee c) \vee (\overline{b} \vee c) &&\text{Distributivity} \\
    &= (a \Rightarrow c) \vee (b \Rightarrow c)               &&\text{Material Implication 2 times}
\end{align}
$$

<br>

$(a \vee b) \Rightarrow c \quad = \quad (a \Rightarrow c) \wedge (b \Rightarrow c)$

$$
\begin{align}
    &(a \vee b) \Rightarrow c                                  && \\
    &= (\overline{a \vee b}) \vee c                         &&\text{Material Implication} \\
    &= (\overline{a} \wedge \overline{b}) \vee c            &&\text{De Morgan's Law} \\
    &= (\overline{a} \vee c) \wedge (\overline{b} \vee c)   &&\text{Distributivity} \\
    &= (a \Rightarrow c) \wedge (b \Rightarrow c)                 &&\text{Material Implication 2 times}
\end{align}
$$

<br>

$a \vee (b \Rightarrow c) \quad = \quad (a \vee b) \Rightarrow (a \vee c)$

$$
\begin{align}
    &a \vee (b \Rightarrow c)                                  &&\\
    &= a \vee (\overline{b} \vee c)                         &&\text{Material Implication} \\
    &= (a \vee \overline{b}) \vee c                         &&\text{Associativity} \\
    &= (a \vee (\overline{a} \wedge \overline{b})) \vee c   &&\text{Simplification} \\
    &= (\overline{a} \wedge \overline{b}) \vee (a \vee c)   &&\text{Commutativity and Associativity} \\
    &= (\overline{a \vee b}) \vee (a \vee c)                &&\text{De Morgan's Law} \\
    &= (a \vee b) \Rightarrow (a \vee c)                       &&\text{Material Implication}
\end{align}
$$

<br>

$a \vee (b = c) \quad = \quad (a \vee b) = (a \vee c)$

$$
\begin{align}
    &a \vee (b = c)                                                                 &&\\
    &= a \vee ((b \Rightarrow c) \wedge (b \impliedby c))                              &&\text{Double Implication} \\
    &= a \vee ((b \Rightarrow c) \wedge (c \Rightarrow b))                                &&\text{Mirror} \\
    &= (a \vee (b \Rightarrow c)) \wedge (a \vee (c \Rightarrow b))                       &&\text{Distributivity of } \ \vee \\
    &= ((a \vee b) \Rightarrow (a \vee c)) \wedge ((a \vee c) \Rightarrow (a \vee b))     &&\text{Distributivity of} \ \vee \ \text{into} \ \Rightarrow \\
    &= ((a \vee b) \Rightarrow (a \vee c)) \wedge ((a \vee b) \impliedby (a \vee c))   &&\text{Mirror} \\
    &= ((a \vee b) = (a \vee c))                                                    &&\text{Double Implication}
\end{align}
$$

<br>

$a \Rightarrow (b \Rightarrow c) \quad = \quad (a \Rightarrow b) \Rightarrow (a \Rightarrow c)$

$$
\begin{align}
    &a \Rightarrow (b \Rightarrow c)                              &&\\
    &= \overline{a} \vee (b \Rightarrow c)                     &&\text{Material Implication} \\
    &= (\overline{a} \vee b) \Rightarrow (\overline{a} \vee c) &&\text{Distributivity of} \ \vee \text{into} \ \Rightarrow \\
    &= (a \Rightarrow b) \Rightarrow (a \Rightarrow c)               &&\text{Material Implication 2 times}
\end{align}
$$

<br>

$a \Rightarrow (b = c) \quad = \quad (a \Rightarrow b) = (a \Rightarrow c)$

$$
\begin{align}
    &a \Rightarrow (b = c)                                 &&\\
    &= \overline{a} \vee (b = c)                        &&\text{Material Implication} \\
    &= (\overline{a} \vee b) = (\overline{a} \vee c)    &&\text{Distributivity of} \ \vee \text{into} \ = \\
    &= (a \Rightarrow b) = (a \Rightarrow c)                  &&\text{Material Implication 2 times}
\end{align}
$$