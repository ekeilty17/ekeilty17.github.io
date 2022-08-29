---
layout: post
title:  "Distributivity Continued"
date:   2022-08-24
part: 9
categories: blog boolean-algebra
permalink: ":categories/:title/"
---

$a \wedge (b \wedge c) \quad = \quad (a \wedge b) \wedge (a \wedge c)$

$$
\begin{align}
    &a \wedge (b \wedge c)                  &&\\
    &= (a \wedge a) \wedge (b \wedge c)     &&\text{Idempotent} \\
    &= (a \wedge b) \wedge (a \wedge c)     &&\text{Commutativity and Associativity}
\end{align}
$$

$a \vee (b \vee c) \quad = \quad (a \vee b) \vee (a \vee c)$

$$
\begin{align}
    &a \vee (b \vee c)              &&\\
    &= (a \vee a) \vee (b \vee c)   &&\text{Idempotent} \\
    &= (a \vee b) \vee (a \vee c)   &&\text{Commutativity and Associativity}
\end{align}
$$

$a \implies (b \wedge c) \quad = \quad (a \implies b) \wedge (a \implies c)$

$$
\begin{align}
    &a \implies (b \wedge c)                                && \\
    &= \overline{a} \vee (b \wedge c)                       &&\text{Material Implication} \\
    &= (\overline{a} \vee b) \wedge (\overline{a} \vee c)   &&\text{Distributivity} \\
    &= (a \implies b) \wedge (a \implies c)                 &&\text{Material Implication 2 times}
\end{align}
$$

$a \implies (b \vee c) \quad = \quad (a \implies b) \vee (a \implies c)$

$$
\begin{align}
    &a \implies (b \vee c)                              && \\
    &= \overline{a} \vee (b \vee c)                     &&\text{Material Implication} \\
    &= (\overline{a} \vee b) \vee (\overline{a} \vee c) &&\text{Distributivity} \\
    &= (a \implies b) \vee (a \implies c)               &&\text{Material Implication 2 times}
\end{align}
$$

$(a \wedge b) \implies c \quad = \quad (a \implies c) \vee (b \implies c)$

$$
\begin{align}
    &(a \wedge b) \implies c                            && \\
    &= (\overline{a \wedge b}) \vee c                   &&\text{Material Implication} \\
    &= (\overline{a} \vee \overline{b}) \vee c          &&\text{De Morgan's Law} \\
    &= (\overline{a} \vee c) \vee (\overline{b} \vee c) &&\text{Distributivity} \\
    &= (a \implies c) \vee (b \implies c)               &&\text{Material Implication 2 times}
\end{align}
$$

$(a \vee b) \implies c \quad = \quad (a \implies c) \wedge (b \implies c)$

$$
\begin{align}
    &(a \vee b) \implies c                                  && \\
    &= (\overline{a \vee b}) \vee c                         &&\text{Material Implication} \\
    &= (\overline{a} \wedge \overline{b}) \vee c            &&\text{De Morgan's Law} \\
    &= (\overline{a} \vee c) \wedge (\overline{b} \vee c)   &&\text{Distributivity} \\
    &= (a \implies c) \wedge (b \implies c)                 &&\text{Material Implication 2 times}
\end{align}
$$

$a \vee (b \implies c) \quad = \quad (a \vee b) \implies (a \vee c)$

$$
\begin{align}
    &a \vee (b \implies c)                                  &&\\
    &= a \vee (\overline{b} \vee c)                         &&\text{Material Implication} \\
    &= (a \vee \overline{b}) \vee c                         &&\text{Associativity} \\
    &= (a \vee (\overline{a} \wedge \overline{b})) \vee c   &&\text{Simplification} \\
    &= (\overline{a} \wedge \overline{b}) \vee (a \vee c)   &&\text{Commutativity and Associativity} \\
    &= (\overline{a \vee b}) \vee (a \vee c)                &&\text{De Morgan's Law} \\
    &= (a \vee b) \implies (a \vee c)                       &&\text{Material Implication}
\end{align}
$$

$a \vee (b = c) \quad = \quad (a \vee b) = (a \vee c)$

$$
\begin{align}
    &a \vee (b = c)                                                                 &&\\
    &= a \vee ((b \implies c) \wedge (b \impliedby c))                              &&\text{Double Implication} \\
    &= a \vee ((b \implies c) \wedge (c \implies b))                                &&\text{Mirror} \\
    &= (a \vee (b \implies c)) \wedge (a \vee (c \implies b))                       &&\text{Distributivity of } \ \vee \\
    &= ((a \vee b) \implies (a \vee c)) \wedge ((a \vee c) \implies (a \vee b))     &&\text{Distributivity of} \ \vee \ \text{into} \ \implies \\
    &= ((a \vee b) \implies (a \vee c)) \wedge ((a \vee b) \impliedby (a \vee c))   &&\text{Mirror} \\
    &= ((a \vee b) = (a \vee c))                                                    &&\text{Double Implication}
\end{align}
$$

$a \implies (b \implies c) \quad = \quad (a \implies b) \implies (a \implies c)$

$$
\begin{align}
    &a \implies (b \implies c)                              &&\\
    &= \overline{a} \vee (b \implies c)                     &&\text{Material Implication} \\
    &= (\overline{a} \vee b) \implies (\overline{a} \vee c) &&\text{Distributivity of} \ \vee \text{into} \ \implies \\
    &= (a \implies b) \implies (a \implies c)               &&\text{Material Implication 2 times}
\end{align}
$$


$a \implies (b = c) \quad = \quad (a \implies b) = (a \implies c)$

$$
\begin{align}
    &a \implies (b = c)                                 &&\\
    &= \overline{a} \vee (b = c)                        &&\text{Material Implication} \\
    &= (\overline{a} \vee b) = (\overline{a} \vee c)    &&\text{Distributivity of} \ \vee \text{into} \ = \\
    &= (a \implies b) = (a \implies c)                  &&\text{Material Implication 2 times}
\end{align}
$$