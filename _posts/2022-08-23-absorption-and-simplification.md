---
layout: post
title:  "Absorption and Simplification"
date:   2022-08-23
part: 2
categories: boolean-algebra
---

## Absorption

This seemingly abscure relation turns out to be very useful in many proofs.

$a \wedge (a \vee b) = a$

$$
\begin{align}
    &a \wedge (a \vee b) \\
    &= (a \vee \color{red}F) \wedge (a \vee b)  &&\text{Identity} \\
    &= a \vee (\color{red}F \wedge b)           &&\text{Distributivity} \\
    &= a \vee \color{red}F                      &&\text{Base} \\
    &= a                                        &&\text{Identity}
\end{align}
$$

$a \vee (a \wedge b) = a$

$$
\begin{align}
    &a \vee (a \wedge b) \\
    &= (a \wedge \color{green}T) \vee(a \wedge b)   &&\text{Identity} \\
    &= a \wedge (\color{green}T \vee b)             &&\text{Distributivity} \\
    &= a \wedge \color{green}T                      &&\text{Base} \\
    &= a                                            &&\text{Identity}
\end{align}
$$


## Simplification

This is less common than Absorption, but is still useful in some proofs

$a \wedge (\overline{a} \vee b) = a \wedge b$

$$
\begin{align}
    &a \wedge (\overline{a} \vee b) \\
    &= (a \wedge \overline{a}) \vee (a \wedge b)    &&\text{Distributivity} \\
    &= \color{red}F \vee (a \wedge b)               &&\text{Noncontradiction} \\
    &= a \wedge b                                   &&\text{Identity}
\end{align}
$$

$a \vee (\overline{a} \wedge b) = a \vee b$

$$
\begin{align}
    &a \vee (\overline{a} \wedge b) \\
    &= (a \vee \overline{a}) \wedge (a \vee b)  &&\text{Distributivity} \\
    &= \color{green}T \wedge (a \vee b)         &&\text{Excluded Middle} \\
    &= a \vee b                                 &&\text{Identity}
\end{align}
$$