---
layout:     series
title:      "Consensus and Resolution"
date:       2022-09-02
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       13
series:     boolean-algebra
tags:       boolean algebra, consensus theorem, resolution
---

## The Consensus Theorem

$((a \wedge b) \vee (\overline{a} \wedge c)) \vee (b \wedge c) \quad = \quad (a \wedge b) \vee (\overline{a} \wedge c)$

$$
\begin{align}
    &((a \wedge b) \vee (\overline{a} \wedge c)) \vee (b \wedge c) 
    && \\

    &= \color{red}( (a \wedge b) \vee (\overline{a} \wedge c) \color{red}) \vee \color{red}( \color{green}T \wedge (b \wedge c) \color{red})
    && \text{Identity} \\

    &= \color{red}( (a \wedge b) \vee (\overline{a} \wedge c) \color{red}) \vee \color{red}( (a \vee \overline{a}) \wedge (b \wedge c) \color{red})
    && \text{Excluded Middle} \\

    &= \color{red}( (a \wedge b) \vee (\overline{a} \wedge c) \color{red}) \vee \color{red}( (a \wedge (b \wedge c)) \vee (\overline{a} \wedge (b \wedge c)) \color{red})
    && \text{Distributivity} \\

    &= \color{red}( (a \wedge b) \vee (\overline{a} \wedge c) \color{red}) \vee \color{red}( ((a \wedge b) \wedge c) \vee ((\overline{a} \wedge c) \wedge b) \color{red})
    && \text{Associativity and Commutativity} \\

    &= \color{red}( (a \wedge b) \vee ((a \wedge b) \wedge c) \color{red}) \vee \color{red}((\overline{a} \wedge c) \vee ((\overline{a} \wedge c) \wedge b) \color{red})
    && \text{Associativity and Commutativity} \\

    &= (a \wedge b) \vee (\overline{a} \wedge c)
    && \text{Absorption 2 times} \\
\end{align}
$$

<br>

$((a \vee b) \wedge (\overline{a} \vee c)) \wedge (b \vee c) \quad = \quad (a \vee b) \wedge (\overline{a} \vee c)$

$$
\begin{align}
    &((a \vee b) \wedge (\overline{a} \vee c)) \wedge (b \vee c) 
    && \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( \color{green}T \vee (b \vee c) \color{red})
    && \text{Identity} \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( (a \wedge \overline{a}) \vee (b \vee c) \color{red})
    && \text{Noncontradiction} \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( (a \vee (b \vee c)) \wedge (\overline{a} \vee (b \vee c)) \color{red})
    && \text{Distributivity} \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( ((a \vee b) \vee c) \wedge ((\overline{a} \vee c) \vee b) \color{red})
    && \text{Associativity and Commutativity} \\

    &= \color{red}( (a \vee b) \wedge ((a \vee b) \vee c) \color{red}) \wedge \color{red}((\overline{a} \vee c) \wedge ((\overline{a} \vee c) \vee b) \color{red})
    && \text{Associativity and Commutativity} \\

    &= (a \vee b) \wedge (\overline{a} \vee c)
    && \text{Absorption 2 times} \\
\end{align}
$$

<br>

## Resolution

Resolution is extremely important in the field of logic. It allows for a sound and complete proof system for preposition logic.

$a \wedge c \quad \Rightarrow \quad (a \vee b) \wedge (\overline{b} \vee c) \quad = \quad (a \wedge \overline{b}) \vee (b \wedge c) \quad \Rightarrow \quad a \vee c$

We will do this in parts.

$a \wedge c \quad \Rightarrow \quad (a \vee b) \wedge (\overline{b} \vee c)$

$$
\begin{align}
    &a \wedge c
    && \\

    &\Rightarrow (a \wedge c) \vee ((a \wedge \overline{b}) \vee (b \wedge c))
    &&\text{Generalization} \\

    &= (a \wedge c) \vee (a \wedge \overline{b}) \vee (b \wedge c)
    &&\text{Associativity} \\

    &= ((a \wedge c) \vee (a \wedge \overline{b}) \vee (b \wedge c)) \vee \color{green}T 
    &&\text{Identity} \\

    &= (a \wedge \overline{b}) \vee (a \wedge c) \vee \color{green}T \vee (b \wedge c)
    &&\text{Associativity and Commutativity} \\

    &= (a \wedge \overline{b}) \vee (a \wedge c) \vee (\overline{b} \wedge b) \vee (b \wedge c)
    &&\text{Excluded Middle} \\

    &= (a \vee b) \wedge (\overline{b} \vee c)
    &&\text{Distributivity}
\end{align}
$$

<br>

$(a \vee b) \wedge (\overline{b} \vee c) \quad = \quad (a \wedge \overline{b}) \vee (b \wedge c)$

$$
\begin{align}
    &= (a \vee b) \wedge (\overline{b} \vee c)
    && \\

    &= (a \wedge c) \vee (a \wedge \overline{b}) \vee (b \wedge c)
    &&\text{Preform above proof in reverse} \\

    &= ((a \wedge \overline{b}) \vee (b \wedge c)) \vee (a \wedge c)
    &&\text{Associativity and Commutativity} \\
    
    &= (a \wedge \overline{b}) \vee (b \wedge c)
    &&\text{The Consensus Theorem}
\end{align}
$$

<br>

$(a \wedge \overline{b}) \vee (b \wedge c) \quad \Rightarrow \quad a \vee c$

$$
\begin{align}
    &= (a \wedge \overline{b}) \vee (b \wedge c)
    && \\

    &= (a \vee b) \wedge (a \vee c) \wedge (\overline{b} \vee b) \wedge (\overline{b} \vee c)
    &&\text{Distributivity} \\

    &= (a \vee b) \wedge (a \vee c) \wedge \color{green}T \wedge (\overline{b} \vee c)
    &&\text{Excluded Middle} \\

    &= ((a \vee c) \wedge (a \vee b) \wedge (\overline{b} \vee c)) \wedge \color{green}T 
    &&\text{Associativity and Commutativity} \\

    &= (a \vee c) \wedge (a \vee b) \wedge (\overline{b} \vee c)
    &&\text{Identity} \\

    &= (a \vee c) \wedge ((a \vee b) \wedge (\overline{b} \vee c))
    &&\text{Associativity} \\

    &\Rightarrow a \vee c
\end{align}
$$