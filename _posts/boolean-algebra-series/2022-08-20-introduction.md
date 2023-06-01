---
layout:     series
title:      "Introduction"
date:       2022-08-21
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       0
series:     boolean-algebra
tags:       boolean algebra, introduction
---

## Purpose of this Series

When taking a course on formal verification, I decided that I wanted to prove all of the laws and theorems of Boolean algebra entirely from the axioms. Some sources and textbooks that do this will use techniques like induction, contradiction, context, evaluation, etc. While these are valid, I want to prove everything solely deductively. Some of the proofs are easy, while others are very difficult and require some creativity. Moreover, when you google the axioms of Boolean algebra, I find that it is often not a minimal set. I attempt to provide that in this series.

Another key inspiration for this series is the proof of De Morgan's Law. Most sources give a similar argument ([here](https://www.geeksforgeeks.org/proof-of-de-morgans-laws-in-boolean-algebra/) and [here](https://math.stackexchange.com/questions/943164/verify-demorgans-law-algebraically) for example). However, when I tried to translate these proofs into my rigorous structure, I found a hidden assumption that made these proofs circular! You can read my resolution to this in the post on [De Morgan's Law](/blog/boolean-algebra/de-morgans-law/), which I believe to be an original proof.

<br>

## What is Boolean Algebra?

A **boolean variable** is a variable with either $\color{green}T$ or $\color{red}F$ as its value. A **boolean expression** is a formula containing boolean variables. We will see in the next post how we can construct such formulas. Boolean algebra tells us how we are allowed to combine and manipulate boolean expressions.

Typically, $\color{green}T$ is meant to represent _true_ and $\color{red}F$ represents _false_, as my notation would suggest. However, it's important to remember that the theory of Boolean algebra can be applied to any logical system containing exactly two, mutually exclusive states: $1$/$0$, on/off, power/ground, etc. Thus, in some texts, you will see the use of symbols $\top$ and $\bot$, read as "top" and "bottom" in order to be application independent. The goal of Boolean algebra is to accurately model such binary systems. 

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
    &= \text{intermediate expression 1}   &&\text{reason 1} \\
    &= \text{intermediate expression 2}   &&\text{reason 2} \\
    &\qquad \vdots \\
    &= \text{target expression}
\end{align}
$$

This is simply a shorthand for 

$$ \text{starting expression} = \text{intermediate expression 1} = \text{intermediate expression 2} = \ldots = \text{target expression} $$

The reason is not technically part of the proof, but it is justification to the reader for why the equality step is valid. The symbol of equality will be defined in the next post.