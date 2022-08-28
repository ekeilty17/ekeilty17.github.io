---
layout: post
title:  "Commutativity and Associativity Continued"
date:   2022-08-25
part: 8
categories: boolean-algebra
---

We know that commutativity holds for the operations $\wedge$ and $\vee$ from the axioms and we also proved associativity holds for these operations. Now that we have some more tools, we can prove some commutativity/associativity properties for the $=$ and $\neq$ operations.

## Commutativity

$(a = b) \quad = \quad (b = a)$

$$
\begin{align}
    &a = b                                                  && \\
    &= (\overline{a} \vee b) \wedge (a \vee \overline{b})   &&\text{Equality} \\
    &= (a \vee \overline{b}) \wedge (\overline{a} \vee b)   &&\text{Commutativity of }\ \wedge \\
    &= (\overline{b} \vee a) \wedge (b \vee \overline{a})   &&\text{Commutativity of }\ \vee \ \text{2 times} \\
    &= (b = a)                                              &&\text{Equality}
\end{align}
$$


$(a \neq b) \quad = \quad (b \neq a)$

$$
\begin{align}
    &a \neq b               && \\
    &= (\overline{a = b})   &&\text{Exclusion} \\
    &= (\overline{b = a})   &&\text{Commutativity of } \ = \\
    &= (b \neq a)           &&\text{Exclusion}
\end{align}
$$


## Associativity

$(a = b) = c \quad = \quad a = (b = c)$

$$
\begin{align}
    &(a = b) = c
    && \\

    &= [(\overline{a = b}) \vee c]
    \wedge [(a = b) \vee \overline{c}]
    &&\text{Equality} \\

    &= [(a \neq b) \vee c]
    \wedge [(a = b) \vee \overline{c}]
    &&\text{Exclusion} \\

    &= [\color{red}( (a \vee b) \wedge (\overline{a} \vee \overline{b}) \color{red}) \vee c]
    \wedge [\color{red}( (\overline{a} \vee b) \wedge (a \vee \overline{b}) \color{red}) \vee \overline{c}]
    &&\text{Equality and Difference} \\

    &= [\color{red}( (a \vee b) \vee c \color{red}) \wedge \color{red}( (\overline{a} \vee \overline{b}) \vee c \color{red})]
    \wedge [\color{red}( (\overline{a} \vee b) \vee \overline{c} \color{red}) \wedge \color{red}( (a \vee \overline{b}) \vee \overline{c} \color{red})]
    &&\text{Distributivity} \\

    &= (a \vee b \vee c) \wedge (\overline{a} \vee \overline{b} \vee c) \wedge (\overline{a} \vee b \vee \overline{c}) \wedge (a \vee \overline{b} \vee \overline{c})
    &&\text{Associativity of}\ \wedge \ \text{and} \ \vee\\

    &= (\overline{a} \vee \overline{b} \vee c) \wedge (\overline{a} \vee b \vee \overline{c}) \wedge (a \vee b \vee c) \wedge (a \vee \overline{b} \vee \overline{c})
    &&\text{Commutativity of}\ \wedge \\

    &= [\color{red}( \overline{a} \vee (\overline{b} \vee c) \color{red}) \wedge \color{red}( \overline{a} \vee (b \vee \overline{c}) \color{red})] 
    \wedge [\color{red}( a \vee (b \vee c) \color{red} ) \wedge \color{red}( a \vee (\overline{b} \vee \overline{c}) \color{red})]
    &&\text{Associativity of}\ \wedge \ \text{and} \ \vee\\

    &= [\overline{a} \vee \color{red}( (\overline{b} \vee c) \wedge (b \vee \overline{c}) \color{red})] 
    \wedge [a \vee \color{red}( (b \vee c) \wedge (\overline{b} \vee \overline{c}) \color{red})]
    &&\text{Distributivity} \\

    &= [\overline{a} \vee (b = c)] \wedge [a \vee (b \neq c)]
    &&\text{Equality and Difference} \\

    &= [\overline{a} \vee (b = c)] \wedge [a \vee (\overline{b = c})]
    &&\text{Exclusion} \\

    &= a = (b = c)
    &&\text{Equality}
\end{align}
$$

$(a = b) \neq c \quad = \quad a = (b \neq c)$

$$
\begin{align}
    &(a = b) \neq c             && \\
    &= (a = b) = \overline{c}   &&\text{Exclusion} \\
    &= a = (b = \overline{c})   &&\text{Associativity of =} \\
    &= a = (b \neq c)           &&\text{Exclusion}
\end{align}
$$

$(a \neq b) = c \quad = \quad a \neq (b = c)$

$$
\begin{align}
    &(a \neq b) = c             && \\
    &= (\overline{a} = b) = c   &&\text{Exclusion} \\
    &= \overline{a} = (b = c)   &&\text{Associativity of =} \\
    &= a \neq (b = c)           &&\text{Exclusion}
\end{align}
$$


$(a \neq b) \neq c \quad = \quad a \neq (b \neq c)$

$$
\begin{align}
    &(a \neq b) \neq c                      && \\
    &= (\overline{a = b}) \neq c            &&\text{Exclusion} \\
    &= \overline{(\overline{a = b})} = c    &&\text{Exclusion} \\
    &= (a = b) = c                          &&\text{Double Negation} \\
    &= a = (b = c)                          &&\text{Associativity of =} \\
    &= a = \overline{(\overline{b = c})}    &&\text{Double Negation} \\
    &= a \neq (\overline{b = c})            &&\text{Exclusion} \\
    &= a \neq (b \neq c)                    &&\text{Exclusion}
\end{align}
$$

I find this unintuitive, but you do not need parenthesis around strings of expressions containing the $=$ and the $\neq$ operators. Also interestingly, $(a \neq b \neq c) = (a = b = c)$. It is important to note that $(a \neq b \neq c)$ does not mean what you would think it means. I think many people would want it to mean $(a \neq b) \wedge (b \neq c) \wedge (c \neq a)$. But this is not equivalent and actually that latter statement evaluates to $\color{red}F$.