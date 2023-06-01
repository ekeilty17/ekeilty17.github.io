---
layout:     series
title:      "De Morgan's Law / Duality"
date:       2023-01-07
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       6
series:     boolean-algebra
tags:       boolean algebra, de morgans law, duality
---

## The Canonical Proof

If you look up the proof of De Morgan's Law / Duality this is what you will get.

It is an argument based on the uniqueness of the complement. They use the fact that if $(x \vee y) = \color{green}T$ and $(x \wedge y) = \color{red}F$, then $y$ is the complement of $x$. Written formally, this is 

$$ (x \vee y) \wedge (\overline{x \wedge y}) \quad = \quad (y = \overline{x}) $$

Using this expression, we can prove De Morgan's Law in the following way:
1. Let $x = (a \wedge b)$
2. Let $y = (\overline{a} \vee \overline{b})$
3. We show $(x \vee y) = \color{green}T$
4. We show $(x \wedge y) = \color{red}F$
5. Using the above expression, we can then conclude that $y = \overline{x}$ or $(\overline{a} \vee \overline{b}) = (\overline{a \wedge b})$

Steps 3. and 4. are proved below:

$((a \wedge b) \vee (\overline{a} \vee \overline{b})) = \color{green}T$

$$
\begin{align}
    &(a \wedge b) \vee (\overline{a} \vee \overline{b}) \\
    &= ((b \wedge a) \vee \overline{a}) \vee \overline{b}   &&\text{Associativity} \\
    &= (\overline{a} \vee (a \wedge b)) \vee \overline{b}   &&\text{Commutativity} \\
    &= (\overline{a} \vee b) \vee \overline{b}              &&\text{Simplification} \\
    &= \overline{a} \vee (b \vee \overline{b})              &&\text{Associativity} \\
    &= \overline{a} \vee \color{green}T                     &&\text{Excluded Middle} \\
    &= \color{green}T                                       &&\text{Base} \\
\end{align}
$$

$((a \wedge b) \wedge (\overline{a} \vee \overline{b})) = \color{red}F$

$$
\begin{align}
    &(a \wedge b) \wedge (\overline{a} \vee \overline{b}) \\
    &= a \wedge (b \wedge (\overline{a} \vee \overline{b})) &&\text{Associativity} \\
    &= a \wedge (b \wedge (\overline{b} \vee \overline{a})) &&\text{Commutativity} \\
    &= a \wedge (b \wedge \overline{a})                     &&\text{Simplification} \\
    &= (a \wedge \overline{a}) \wedge b                     &&\text{Commutativity and Associativity} \\
    &= \color{red}F \wedge b                                &&\text{Noncontradiction} \\
    &= \color{red}F                                         &&\text{Base} \\
\end{align}
$$


And of course, you can prove the other law $(\overline{a} \wedge \overline{b}) = (\overline{a \vee b})$ in the exact same way. My issue with this proof is that it relies on the expression 

$$ (x \vee y) \wedge (\overline{x \wedge y}) \quad = \quad (y = \overline{x}) $$ 

being true. However, when you try to prove it using our rigorous proof style, you run into a problem. You need De Morgan's Law to prove it! You can prove it without De Morgan's Law using other methods such as proof by contradiction or completion arguments. However, if you want to prove it solely from the axioms and using strict logic, then I don't believe you can. Thus, I have come up with an alternative.

<br>

## My Proof

As far as I can tell, this is a novel proof. I have never seen this anywhere else. It is pretty complicated and contrived, so if you can find a shorter proof, then please let me know.

The proof method is the following.
1. Show that $(\overline{a \vee b}) \Rightarrow (\overline{a} \wedge \overline{b})$
2. Show that $(\overline{a} \wedge \overline{b}) \Rightarrow (\overline{a \vee b})$
3. Show that $(\overline{a \vee b}) = (\overline{a} \wedge \overline{b})$

First, we show 1.

$$
\begin{align}
    &(\overline{a \vee b}) && &&\\
    &= (\overline{a \vee b}) \wedge \color{green}T
    &&
    &&\text{Identity} \\
    
    &= [(\overline{a \vee b}) \wedge \color{green}T] 
    &\wedge& [(\overline{a \vee b}) \wedge \color{green}T]
    &&\text{Idempotent} \\
    
    &= [(\overline{a \vee b}) \wedge (a \vee \overline{a})] 
    &\wedge& [(\overline{a \vee b}) \wedge (b \vee \overline{b})]
    &&\text{Excluded Middle} \\
    
    &= [(\overline{a \vee b}) \wedge \color{red}( (a \wedge (a \vee b)) \vee \overline{a} \color{red})] 
    &\wedge& [(\overline{a \vee b}) \wedge \color{red}( (b \wedge (a \vee b)) \vee \overline{b} \color{red})]
    &&\text{Absorption} \\

    &= [\color{red}( (\overline{a \vee b}) \wedge (a \wedge (a \vee b)) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( (\overline{a \vee b}) \wedge (b \wedge (a \vee b)) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Distributivity} \\

    &= [\color{red}( (\overline{a \vee b}) \wedge ((a \vee b) \wedge a) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( (\overline{a \vee b}) \wedge ((a \vee b) \wedge b) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Commutativity} \\

    &= [\color{red}( ((\overline{a \vee b}) \wedge (a \vee b)) \wedge a \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( ((\overline{a \vee b}) \wedge (a \vee b)) \wedge b \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Associativity} \\

    &= [\color{red}( \color{red}F \wedge a \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( \color{red}F \wedge b \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Noncontradiction} \\

    &= [\color{red}F \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}F \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Base} \\

    &= [ (\overline{a \vee b}) \wedge \overline{a} ] 
    &\wedge& [ (\overline{a \vee b}) \wedge \overline{b} ] 
    &&\text{Identity} \\

    &= ( (\overline{a \vee b}) \wedge (\overline{a \vee b}) ) \wedge (\overline{a} \wedge \overline{b} )
    &&
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a \vee b}) \wedge (\overline{a} \wedge \overline{b} )
    &&
    &&\text{Idempotent} \\

    &\Rightarrow \overline{a} \wedge \overline{b}
    &&
    &&\text{Specialization}
\end{align}
$$

Next, we show 2.

$$
\begin{align}
    &\overline{a} \wedge \overline{b} && \\
    
    &= (\overline{a} \wedge \overline{b}) \wedge \color{green}T 
    &&
    &&\text{identity} \\

    &= (\overline{a} \wedge \overline{b}) \wedge \color{red}( (a \vee b) \vee (\overline{a \vee b}) \color{red})
    &&
    &&\text{Excluded Middle} \\

    &= \color{red}( (\overline{a} \wedge \overline{b}) \wedge (a \vee b) \color{red}) 
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Distributivity} \\

    &= \color{red}( \overline{a} \wedge (\overline{b} \wedge (a \vee b)) \color{red}) 
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Associativity} \\

    &= \color{red}( \overline{a} \wedge (\overline{b} \wedge (b \vee a)) \color{red}) 
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Commutativity} \\

    &= \color{red}( \overline{a} \wedge (\overline{b} \wedge a) \color{red}) 
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Simplification} \\

    &= \color{red}( (\overline{a} \wedge a) \wedge \overline{b} \color{red}) 
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Commutativity and Associativity} \\

    &= \color{red}( \color{red}F \wedge \overline{b} \color{red}) 
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Noncontradiction} \\

    &= \color{red}F
    &\vee& \color{red}( (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b}) \color{red})
    &&\text{Base} \\

    &= (\overline{a} \wedge \overline{b}) \wedge (\overline{a \vee b})
    &&
    &&\text{Identity} \\

    &\Rightarrow (\overline{a \vee b})
    &&
    &&\text{Specialization}
\end{align}
$$

Finally, we prove 3. You could imagine this being written out as one giant proof where we insert the proofs for 1. and 2. between the 2nd and 3rd step.

$$
\begin{align}
    &(\overline{a \vee b}) = (\overline{a} \wedge \overline{b}) \\
    &= ((\overline{a \vee b}) \Rightarrow (\overline{a} \wedge \overline{b})) \wedge ((\overline{a \vee b}) \Leftarrow (\overline{a} \wedge \overline{b})) &&\text{Double Implication} \\
    &= ((\overline{a \vee b}) \Rightarrow (\overline{a} \wedge \overline{b})) \wedge ((\overline{a} \wedge \overline{b}) \Rightarrow (\overline{a \vee b})) &&\text{Mirror} \\
    &= \color{green}T \wedge \color{green}T &&\text{By 1. and 2.} \\
    &= \color{green}T &&\text{Definition of} \ \wedge
\end{align}
$$

And of course, you can prove the other law $(\overline{a} \wedge \overline{b}) = (\overline{a \vee b})$ in the exact same way. Exchange $\vee$ with $\wedge$, $\ \color{green}T$ with $\color{red}F$, $\ \Rightarrow$ with $\Leftarrow$, and Specialization with Generalization (and vice versa). I don't think it is beneficial to anyone to write it out.

<br>

## Uniqueness of the Complement

Now, we can easily prove the complement law used in the canonical proof.

$ (x \vee y) \wedge (\overline{x \wedge y}) \quad = \quad (y = \overline{x}) $

$$
\begin{align}
    &(x \vee y) \wedge (\overline{x \wedge y})                              && \\
    &= (x \vee y) \wedge (\overline{x} \vee \overline{y})                   &&\text{De Morgan's Law} \\
    &= (\overline{y} \vee \overline{x}) \wedge (x \vee y)                   &&\text{Commutativity 2 times} \\
    &= (y \Rightarrow \overline{x}) \wedge (\overline{x} \Rightarrow y)     &&\text{Material Implications} \\
    &= (y \Rightarrow \overline{x}) \wedge (y \Leftarrow \overline{x})      &&\text{Mirror} \\
    &= (y = \overline{x})                                                   &&\text{Double Implication}
\end{align}
$$

<br>

To unroll what this law is saying. Suppose we fix $x$ and we find a variable $y$ such that $(x \vee y) = \color{green}T$ and $(x \wedge y) = \color{red}F$. Then it must be the case that $y$ is a complement of $x$.