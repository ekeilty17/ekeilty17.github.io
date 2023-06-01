---
layout:     series
title:      "Introduction"
date:       2023-01-01
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       0
series:     boolean-algebra
tags:       boolean algebra, introduction
---

## Purpose of this Series

This series is inspired by a course taught by [Eric Hehner](https://www.cs.utoronto.ca/~hehner/) called _Formal Methods_. The course shows how programs can be written from specifications and verified using rigorous logic. It is available entirely online for free including video lectures and the textbook, I highly encourage you to [check it out](http://www.cs.utoronto.ca/~hehner/465-2104/).

<!-- I highly recommend that you read some of [his work](http://www.cs.toronto.edu/~hehner/publist.html) because I think it's extremely important and well-researched. -->

In the course, all of the theorems and laws of Boolean algebra were assumed as fact, so that were could move on to more interesting things. However, I decided that I wanted to prove all of the laws and theorems of Boolean algebra entirely from scratch. I wanted to do so solely deductively, following from a minimal set of axioms. My version of this endeavor is the content of this series.

<br>

## Some Short Reflections

One thing I discovered while writing this series is that no one seems to have published a **minimal set of axioms** for Boolean algebra. Take these sources ([1](https://en.wikipedia.org/wiki/Boolean_algebra_(structure)), [2](https://www.cs.tau.ac.il/~nin/Courses/ComStruct04/BooleanAlgebra.htm), [3](https://ocw.snu.ac.kr/sites/default/files/NOTE/Week%202%20-%20Boolean%20algebra.pdf)) for example. They include associativity as an axiom, but it can be proved using the others. Other sources ([4](https://www.oreilly.com/library/view/introduction-to-digital/9780470900550/chap3-sec004.html), [5](https://www.geeksforgeeks.org/axioms-of-boolean-algebra/), [6](https://www.includehelp.com/basics/axioms-and-laws-of-boolean-algebra.aspx)) will essentially define the truth tables as axioms, which is valid but I think an uninteresting way of doing it, and it's certainly not a minimal set.

Another thing I discovered is that the proofs of De Morgan's Law found elsewhere are either problematic or unsatisfactory. Some sources ([2](https://www.cs.tau.ac.il/~nin/Courses/ComStruct04/BooleanAlgebra.htm), [3](https://ocw.snu.ac.kr/sites/default/files/NOTE/Week%202%20-%20Boolean%20algebra.pdf)) just give the truth table as a proof, which is valid but again I think not interesting. Sources that attempt to do it deductively ([5](https://www.geeksforgeeks.org/proof-of-de-morgans-laws-in-boolean-algebra/), [6](https://math.stackexchange.com/questions/943164/verify-demorgans-law-algebraically), [7](https://math.stackexchange.com/questions/95864/algebraic-proof-of-de-morgans-theorems)) all give a similar argument. However, when I tried to translate these proofs into my rigorous structure, I found a hidden assumption that made these proofs circular! You can read my resolution to this in the post on [De Morgan's Law](/blog/boolean-algebra/de-morgans-law/), which I believe to be an original proof. I felt this had to be published.

<br>

## What is Boolean Algebra?

A **boolean variable** is a variable with either $\color{green}T$ or $\color{red}F$ as its value. A **boolean expression** is a formula containing boolean variables. We will see in the next post how we can construct such formulas. Boolean algebra tells us how we are allowed to combine and manipulate boolean expressions.

Typically, $\color{green}T$ is meant to represent _true_ and $\color{red}F$ represents _false_, as my notation would suggest. However, it's important to remember that the theory of Boolean algebra can be applied to any logical system containing exactly two, mutually exclusive states: $1$/$0$, on/off, power/ground, up/down, etc. Thus, in some texts, you will see the use of symbols $\top$ and $\bot$, read as "top" and "bottom" in order to be application independent. I have chosen $\color{green}T$ and $\color{red}F$ because I think it is visually nicer to read when buried in expressions.

<!--
The most popular applications of Boolean algebra are in Philosophy and Electrical & Computer Engineering. In Philosophy, propositions are assigned either $\color{green}T$ or $\color{red}F$. 

Boolean algebra is used in order to ensure the validity of logical syllogisms. Philosophers start with premises and use the laws and theorems of 
-->
<br>

## Proof Structure

Our goal is to prove all the common laws and theorems from Boolean algebra logically from the axioms. Thus, we need to define our rigorous proof structure. All proofs will look like the following.

$$
\begin{align}
    &\text{starting expression} \\
    &= \text{intermediate expression } 1   &&\text{reason } 1 \\
    &= \text{intermediate expression } 2   &&\text{reason } 2 \\
    &\qquad \vdots \\
    &= \text{target expression}
\end{align}
$$

(Reason $n$) is the justification for why the transition from (intermediate expression $n-1$) to (intermediate expression $n$) is valid. The reason is not part of the proof, but it is included for the benefit of the reader.

<br>

The above is equivalent to the continued expression

$$ \text{starting expression} = \text{intermediate expression 1} = \text{intermediate expression 2} = \ldots = \text{target expression} $$

Which is shorthand for 

$$
\begin{align}
&(\text{starting expression} = \text{intermediate expression} 1) \\
&\wedge (\text{intermediate expression } 1 = \text{intermediate expression } 2) \\
&\ \ \vdots \\
&\wedge (\text{intermediate expression } n-1 = \text{target expression} )
&\end{align}
$$

Thus, a proof is **valid** if and only if all equality steps evaluate to $\color{green}T$. A proof is **invalid** if and only if at least one of the proof steps evaluates to $\color{red}F$