---
layout:     series
title:      "Associativity"
date:       2022-08-24
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       4
series:     boolean-algebra
tags:       boolean algebra, associativity
---

This is a very tedious proof. If you really want to understand it, I would recommend writing it out for yourself. I have added colored parenthesis to help keep track of the nested levels. Essentially, it makes clever use of distributivity and commutativity.

$(a \wedge b) \wedge c \quad = \quad a \wedge (b \wedge c)$

$$
\begin{align}
    &(a \wedge b) \wedge c 
    &&
    &&
    && \\

    &=[\color{red}(a \wedge \color{blue}(a \vee (b \wedge c)\color{blue}) \color{red}) 
    &\wedge& \color{red}(b \wedge (b \vee a)\color{red})] 
    &\wedge& \color{red}(c \wedge (c \vee a)\color{red})   
    &&\text{Absorption 3 times} \\
    
    &=[\color{red}(a \wedge \color{blue}(a \vee (b \wedge c)\color{blue}) \color{red}) 
    &\wedge& \color{red}( \color{blue}(b \vee (b \wedge c)\color{blue}) \wedge (b \vee a)\color{red})] 
    &\wedge& \color{red}(\color{blue}(c \vee (c \wedge b)\color{blue}) \wedge (c \vee a)\color{red})
    &&\text{Absorption 2 times} \\

    &=[\color{red}(a \wedge \color{blue}(a \vee (b \wedge c)\color{blue}) \color{red}) 
    &\wedge& \color{red}( (b \vee a) \wedge \color{blue}(b \vee (b \wedge c)\color{blue}) \color{red})]
    &\wedge& \color{red}( (c \vee a) \wedge \color{blue}(c \vee (b \wedge c)\color{blue})\color{red})
    &&\text{Commutativity 3 times} \\

    &=[\color{red}( (a \vee a) \wedge \color{blue}(a \vee (b \wedge c)\color{blue}) \color{red}) 
    &\wedge& \color{red}( (b \vee a) \wedge \color{blue}(b \vee (b \wedge c)\color{blue}) \color{red})]
    &\wedge& \color{red}( (c \vee a) \wedge \color{blue}(c \vee (b \wedge c)\color{blue})\color{red})
    &&\text{Idempotent} \\

    &=[\color{red}( a \vee \color{blue}(a \wedge (b \wedge c)\color{blue}) \color{red})
    &\wedge& \color{red}( b \vee \color{blue}(a \wedge (b \wedge c)\color{blue}) \color{red})]
    &\wedge& \color{red}( c \vee \color{blue}(a \wedge (b \wedge c)\color{blue}) \color{red})
    &&\text{Distributivity 3 times} \\

    &=[(a \wedge b) \vee \color{blue}(a \wedge (b \wedge c)\color{blue})] 
    &&
    &\wedge& \color{red}( c \vee \color{blue}(a \wedge (b \wedge c)\color{blue}) \color{red})
    &&\text{Distributivity} \\

    &=\color{blue}( (a \wedge b) \wedge c \color{blue}) \vee \color{blue}( a \wedge (b \wedge c) \color{blue})
    &&
    &&
    &&\text{Distributivity} \\

    &=\color{red}( \color{blue}((a \wedge b) \wedge c\color{blue}) \vee a \color{red}) 
    &\wedge& [ \color{blue}((a \wedge b) \wedge c\color{blue}) \vee (b \wedge c)]
    &&
    &&\text{Distributivity} \\

    &=\color{red}( \color{blue}( (a \wedge b) \wedge c \color{blue}) \vee a \color{red})
    &\wedge& [ \color{red}( \color{blue}( (a \wedge b) \wedge c \color{blue}) \vee b \color{red}) 
    &\wedge& \color{red}( \color{blue}( (a \wedge b) \wedge c \color{blue}) \vee c \color{red}) ]
    &&\text{Distributivity} \\

    &=\color{red}( a \vee \color{blue}( (a \wedge b) \wedge c \color{blue}) \color{red})
    &\wedge& [ \color{red}( b \vee \color{blue}( (a \wedge b) \wedge c \color{blue}) \color{red}) 
    &\wedge& \color{red}( c \vee \color{blue}( (a \wedge b) \wedge c \color{blue}) \color{red}) ]
    &&\text{Commutativity 3 times} \\

    &=\color{red}( \color{blue}( a \vee (a \wedge b) \color{blue}) \wedge (a \vee c) \color{red})
    &\wedge& [ \color{red}( \color{blue}( b \vee (a \wedge b) \color{blue}) \wedge (b \vee c) \color{red}) 
    &\wedge& \color{red}( \color{blue}( c \vee (a \wedge b) \wedge (c \vee c) \color{blue}) \color{red}) ]
    &&\text{Distributivity 3 times} \\

    &=\color{red}( \color{blue}( a \vee (a \wedge b) \color{blue}) \wedge (a \vee c) \color{red})
    &\wedge& [ \color{red}( \color{blue}( b \vee (a \wedge b) \color{blue}) \wedge (b \vee c) \color{red}) 
    &\wedge& \color{red}( \color{blue}( c \vee (a \wedge b) \wedge c \color{blue}) \color{red}) ]
    &&\text{Idempotent} \\

    &=\color{red}( \color{blue}( a \vee (a \wedge b) \color{blue}) \wedge (a \vee c) \color{red})
    &\wedge& [ \color{red}( \color{blue}( b \vee (b \wedge a) \color{blue}) \wedge (b \vee c) \color{red}) 
    &\wedge& \color{red}( c \wedge \color{blue}( c \vee (a \wedge b) \color{blue}) \color{red}) ]
    &&\text{Commutativity 2 times} \\

    &=\color{red}( a \wedge (a \vee c) \color{red})
    &\wedge& [ \color{red}( b \wedge (b \vee c) \color{red}) 
    &\wedge& \color{red}( c \wedge \color{blue}( c \vee (a \wedge b)  \color{blue}) \color{red}) ]
    &&\text{Absorption 2 times} \\

    &=a \wedge (b \wedge c)
    &&
    &&
    &&\text{Absorption 3 times}
\end{align}
$$

<br>

The proof for the associativity of $\vee$ is identical.

$(a \vee b) \vee c \quad = \quad a \vee (b \vee c)$

$$
\begin{align}
    &(a \vee b) \vee c 
    &&
    &&
    && \\

    &=[\color{red}(a \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) 
    &\vee& \color{red}(b \vee (b \wedge a)\color{red})] 
    &\vee& \color{red}(c \vee (c \wedge a)\color{red})   
    &&\text{Absorption 3 times} \\
    
    &=[\color{red}(a \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) 
    &\vee& \color{red}( \color{blue}(b \wedge (b \vee c)\color{blue}) \vee (b \wedge a)\color{red})] 
    &\vee& \color{red}(\color{blue}(c \wedge (c \vee b)\color{blue}) \vee (c \wedge a)\color{red})
    &&\text{Absorption 2 times} \\

    &=[\color{red}(a \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) 
    &\vee& \color{red}( (b \wedge a) \vee \color{blue}(b \wedge (b \vee c)\color{blue}) \color{red})]
    &\vee& \color{red}( (c \wedge a) \vee \color{blue}(c \wedge (b \vee c)\color{blue})\color{red})
    &&\text{Commutativity 3 times} \\

    &=[\color{red}( (a \wedge a) \vee \color{blue}(a \wedge (b \vee c)\color{blue}) \color{red}) 
    &\vee& \color{red}( (b \wedge a) \vee \color{blue}(b \wedge (b \vee c)\color{blue}) \color{red})]
    &\vee& \color{red}( (c \wedge a) \vee \color{blue}(c \wedge (b \vee c)\color{blue})\color{red})
    &&\text{Idempotent} \\

    &=[\color{red}( a \wedge \color{blue}(a \vee (b \vee c)\color{blue}) \color{red})
    &\vee& \color{red}( b \wedge \color{blue}(a \vee (b \vee c)\color{blue}) \color{red})]
    &\vee& \color{red}( c \wedge \color{blue}(a \vee (b \vee c)\color{blue}) \color{red})
    &&\text{Distributivity 3 times} \\

    &=[(a \vee b) \wedge \color{blue}(a \vee (b \vee c)\color{blue})] 
    &&
    &\vee& \color{red}( c \wedge \color{blue}(a \vee (b \vee c)\color{blue}) \color{red})
    &&\text{Distributivity} \\

    &=\color{blue}( (a \vee b) \vee c \color{blue}) \wedge \color{blue}( a \vee (b \vee c) \color{blue})
    &&
    &&
    &&\text{Distributivity} \\

    &=\color{red}( \color{blue}((a \vee b) \vee c\color{blue}) \wedge a \color{red}) 
    &\vee& [ \color{blue}((a \vee b) \vee c\color{blue}) \wedge (b \vee c)]
    &&
    &&\text{Distributivity} \\

    &=\color{red}( \color{blue}( (a \vee b) \vee c \color{blue}) \wedge a \color{red})
    &\vee& [ \color{red}( \color{blue}( (a \vee b) \vee c \color{blue}) \wedge b \color{red}) 
    &\vee& \color{red}( \color{blue}( (a \vee b) \vee c \color{blue}) \wedge c \color{red}) ]
    &&\text{Distributivity} \\

    &=\color{red}( a \wedge \color{blue}( (a \vee b) \vee c \color{blue}) \color{red})
    &\vee& [ \color{red}( b \wedge \color{blue}( (a \vee b) \vee c \color{blue}) \color{red}) 
    &\vee& \color{red}( c \wedge \color{blue}( (a \vee b) \vee c \color{blue}) \color{red}) ]
    &&\text{Commutativity 3 times} \\

    &=\color{red}( \color{blue}( a \wedge (a \vee b) \color{blue}) \vee (a \wedge c) \color{red})
    &\vee& [ \color{red}( \color{blue}( b \wedge (a \vee b) \color{blue}) \vee (b \wedge c) \color{red}) 
    &\vee& \color{red}( \color{blue}( c \wedge (a \vee b) \vee (c \wedge c) \color{blue}) \color{red}) ]
    &&\text{Distributivity 3 times} \\

    &=\color{red}( \color{blue}( a \wedge (a \vee b) \color{blue}) \vee (a \wedge c) \color{red})
    &\vee& [ \color{red}( \color{blue}( b \wedge (a \vee b) \color{blue}) \vee (b \wedge c) \color{red}) 
    &\vee& \color{red}( \color{blue}( c \wedge (a \vee b) \vee c \color{blue}) \color{red}) ]
    &&\text{Idempotent} \\

    &=\color{red}( \color{blue}( a \wedge (a \vee b) \color{blue}) \vee (a \wedge c) \color{red})
    &\vee& [ \color{red}( \color{blue}( b \wedge (b \vee a) \color{blue}) \vee (b \wedge c) \color{red}) 
    &\vee& \color{red}( c \vee \color{blue}( c \wedge (a \vee b) \color{blue}) \color{red}) ]
    &&\text{Commutativity 2 times} \\

    &=\color{red}( a \vee (a \wedge c) \color{red})
    &\vee& [ \color{red}( b \vee (b \wedge c) \color{red}) 
    &\vee& \color{red}( c \vee \color{blue}( c \wedge (a \vee b)  \color{blue}) \color{red}) ]
    &&\text{Absorption 2 times} \\

    &=a \vee (b \vee c)
    &&
    &&
    &&\text{Absorption 3 times}
\end{align}
$$

<br>

Now, in future proofs, if we have $(a \wedge b) \wedge c$ we can instead write $a \wedge b \wedge c$ without ambiguity. Likewise for $\vee$.