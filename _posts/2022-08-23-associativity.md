---
layout: post
title:  "Absorption and Simplification"
date:   2022-08-23
chapter: 3
categories: boolean-algebra
---

$(a \vee b) \vee c \quad = \quad a \vee (b \vee c)$

$$
\begin{align}
    &(a \vee b) \vee c \\
    &=[\color{red}(a \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) \vee \color{red}(b \vee (b \wedge a)\color{red})] \vee \color{red}(c \vee (c \wedge a)\color{red})   &\text{Absorption 3 times} \\
    
    &=[\color{red}(a \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) \vee \color{red}( \color{blue}(b \vee (b \wedge c)\color{blue}) \vee (b \wedge a)\color{red})] \vee \color{red}(\color{blue}(c \vee (c \wedge b)\color{blue}) \vee (c \wedge a)\color{red})   &\text{Absorption 2 times} \\

    &=[\color{red}(a \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) \vee \color{red}( (b \wedge a) \vee \color{blue}(b \vee (b \wedge c)\color{blue}) \color{red})] \vee \color{red}((c \wedge a) \vee \color{blue}(c \vee (c \wedge b)\color{blue}) \color{red})   &\text{Commutativity 2 times} \\

    &=[\color{red}(\color{blue}(a \vee a \color{blue}) \wedge \color{blue}(a \vee (b \vee c)\color{blue}) \color{red}) \vee \color{red}( (b \wedge a) \vee \color{blue}((b \vee b) \wedge (b \vee c)\color{blue}) \color{red})] \vee \color{red}((c \wedge a) \vee \color{blue}((c \vee c) \wedge (c \vee b)\color{blue}) \color{red})   &\text{Commutativity 2 times} \\
\end{align}
$$