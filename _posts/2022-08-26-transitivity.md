---
layout: post
title:  "Transitivity"
date:   2022-08-26
part: 10
categories: boolean-algebra
---

$(a \wedge b) \wedge (b \wedge c) \quad \implies \quad (a \wedge c)$

$$
\begin{align}
    &(a \wedge b) \wedge (b \wedge c)       && \\
    &= (a \wedge c) \wedge (b \wedge b)     &&\text{Associativity and Commutativity} \\
    &\implies (a \wedge c)                  &&\text{Specialization}
\end{align}
$$

$(a \implies b) \wedge (b \implies c) \quad \implies \quad (a \implies c)$

$$
\begin{align}
    &(a \implies b) \wedge (b \implies c)
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

    &\implies (\overline{a} \vee c)
    &&\text{Specialization} \\

    &= (a \implies c)
    &&\text{Material Implication} \\
\end{align}
$$

$(a = b) \wedge (b = c) \quad \implies \quad (a = c)$

$$
\begin{align}
    &(a = b) \wedge (b = c)       && \\
    &= ((a \implies b) \wedge (a \impliedby b)) \wedge ((b \implies c) \wedge (b \impliedby c)) &&\text{Double Implication} \\
    &= ((a \implies b) \wedge (b \implies a)) \wedge ((b \implies c) \wedge (c \implies b)) &&\text{Mirror 2 times} \\
    &= ((a \implies b) \wedge (b \implies c)) \wedge ((c \implies b) \wedge (b \implies a)) &&\text{Associativity and Commutativity of} \ \wedge \\
    &= (a \implies c) \wedge (c \implies a) &&\text{Transitivity of } \ \implies \\
    &= (a \implies c) \wedge (a \impliedby c) &&\text{Mirror} \\
    &= (a = c) &&\text{Double Implication} \\
\end{align}
$$

$(a \implies b) \wedge (b = c) \quad \implies \quad (a \implies c)$

$$
\begin{align}
    &(a \implies b) \wedge (b = c)                                      && \\
    &= (a \implies b) \wedge ((b \implies c) \wedge (b \impliedby c))   &&\text{Double Implication} \\
    &= (a \implies b) \wedge ((b \implies c) \wedge (c \implies b))     &&\text{Mirror} \\
    &= ((a \implies b) \wedge (b \implies c)) \wedge (c \implies b)     &&\text{Associativity} \\
    &\implies (a \implies c) \wedge (c \implies b)                      &&\text{Transitivity of } \ \implies \\
    &\implies (a \implies c)                                            &&\text{Specialization}
\end{align}
$$

$(a = b) \wedge (b \implies c) \quad \implies \quad (a \implies c)$

$$
\begin{align}
    &(a = b) \wedge (b \implies c)                                      && \\
    &= ((a \implies b) \wedge (a \impliedby b)) \wedge (b \implies c)   &&\text{Double Implication} \\
    &= ((a \implies b) \wedge (b \implies a)) \wedge (b \implies c)     &&\text{Mirror} \\
    &= (b \implies a) \wedge ((a \implies b) \wedge (b \implies c))     &&\text{Commutativity and Associativity} \\
    &\implies (b \implies a) \wedge (a \implies c)                      &&\text{Transitivity of } \ \implies \\
    &\implies (a \implies c)                                            &&\text{Specialization}
\end{align}
$$