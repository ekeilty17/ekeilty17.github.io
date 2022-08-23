---
layout: post
title:  "Miscellaneous Simple Relations"
date:   2022-08-22
chapter: 1
categories: boolean-algebra
---

## Universal Bound / Null Element / Base

$$
\begin{align}
    &a \wedge \color{red}F \\
    &= (a \wedge \color{red}F) \vee \color{red}F                &\text{Identity} \\
    &= (a \wedge \color{red}F) \vee (a \wedge \overline{a})     &\text{Noncontradiction} \\
    &= a \wedge (\color{red}F \vee \overline{a})                &\text{Distributivity} \\
    &= a \wedge \overline{a}                                    &\text{Identity} \\
    &= \color{red}F                                             &\text{Noncontradiction} \\
\end{align}
$$

$$
\begin{align}
    &a \vee \color{green}T \\
    &= (a \vee \color{green}T) \wedge \color{red}F              &\text{Identity} \\
    &= (a \vee \color{green}T) \wedge (a \vee \overline{a})     &\text{Excluded Middle} \\
    &= a \vee (\color{green}T \wedge \overline{a})              &\text{Distributivity} \\
    &= a \vee \overline{a}                                      &\text{Identity} \\
    &= \color{green}T                                          &\text{Excluded Middle}
\end{align}
$$

## Identity Continued

There are some additional identity laws for the other operations. However, they follow from the axioms, so they were not included

$$
\begin{align}
    &\color{green}T \implies a \\
    &= \overline{\color{green}T} \wedge a     &\text{Material Implication} \\
    &= \color{red}F \vee a                    &\text{Definition of negation}  \\
    &= a                                &\text{Identity}
\end{align}
$$

$$
\begin{align}
    &\color{green}T = a \\
    &= (\color{green}T \implies a) \wedge (\color{green}T \impliedby a) &\text{Double Implication} \\
    &= (\color{green}T \implies a) \wedge (a \implies \color{green}T)   &\text{Mirror}  \\
    &= (\overline{\color{green}T} \wedge a) \wedge (\overline{a} \wedge \color{green}T)   &\text{Material Implication}  \\
    &= a \wedge \color{green}T                                   &\text{Identity and Base}  \\
    &= a                                                    &\text{Identity}
\end{align}
$$