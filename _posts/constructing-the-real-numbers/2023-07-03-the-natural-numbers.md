---
layout:     series
title:      "The Natural Numbers"
date:       2023-07-03
categories: blog constructing-the-real-numbers
permalink:  ":categories/:title/"
part:       2
series:     constructing-the-real-numbers
tags:       natural-numbers, peano-axioms, set-theory, successor
---

Due to the failure of logic to provide a rigorous foundation of mathematics, in modern mathematics, everything is a set and ultimately derives from set theory. Since there are numerous resources on set theory, I will not provide any background and assume the reader understands the basics.

<br>

## The Peano Axioms

In the previous post, I outline these axioms in rigorous logical formalism. For those whose eyes glazed over, let me provide these again in a more intuitive way.

First, as a founding assumption of the natural numbers, we assert the existence of a first element.

$$
\begin{align}
    &\textbf{Axiom } 1. &\qquad& 0 \text{ is a natural number called } \textit{zero}
\end{align}
$$

Right now, our set of natural numbers is $$\{ 0 \}$$. That's not very interesting. One key property of the natural numbers is their _ordering_. You can arrange them in a linear sequence starting from $0$. 

We define the concept of the _successor_ of a natural number. Intuitively, it means it is the number that comes afterward, e.g. $1$ is the successor of $0$. To define this formally, we define the _successor function_ $s(\cdot)$. We will define the precise function later. The following axioms define its desired properties.

$$
\begin{align}
    &\textbf{Axiom } 2. &\qquad& \text{if } n \text{ is a natural number}, \text{ then } s(n) \text{ is also a natural number, called its } \textit{successor} \\
    &\textbf{Axiom } 3. &\qquad& 0 \text{ is not a successor of any natural number, i.e. } s(n) \neq 0 \text{ for any natural number } n \\
    &\textbf{Axiom } 4. &\qquad& \text{Different natural numbers must have different successors, i.e. if } n \neq m \text{ then } s(n) \neq s(m)
\end{align}
$$

Now, we can construct our set of natural numbers

$$
\mathbb{N} = \{ 0, \ s(0), \ s(s(0)), \ s(s(s(0))), \ \ldots \}
$$

It becomes pretty tedious to write nested successor functions, so we define some short-hand symbols, which are the usual numbers we learned in school. E.g. the natural number $n$ means "apply the successor function $n$ times to $0$". Therefore, we have

$$
\mathbb{N} = \{ 0, \ 1, \ 2, \ 3, \ \ldots \}
$$

Now that we have the set of natural numbers, we could like to be able to do stuff with them. Thus, we define the _addition_ and _multiplication_ operations. These are the usual operations that we learned in schools, however, we can define them recursively using the following axioms. Let $n$ and $m$ be any natural numbers.

$$
\begin{align}
    &\textbf{Axiom } 5. &\qquad& n + 0 = n \\
    &\textbf{Axiom } 6. &\qquad& n + s(m) = s(n+m) \\
    &\textbf{Axiom } 7. &\qquad& n * 0 = 0 \\
    &\textbf{Axiom } 8. &\qquad& n * s(m) = (n*m) + n
\end{align}
$$

Finally, we should write the induction axiom. However, it's a bit technical, so if you are interested read the previous post.

<br>

### Consequences of the Axioms

These were provided in the previous post, but I will provide them again here. From these axioms, you can easily prove the following properties of addition. Let $n$, $m$, and $r$ be any natural numbers.

$$
\begin{align}
    &\textbf{Identity:} &\qquad &n + 0 = n \\
    &\textbf{Successor:} &\qquad &n + 1 = s(n) \\
    &\textbf{Commutativity:} &\qquad &n + m = m + n \\
    &\textbf{Associativity:} &\qquad &(n + m) + r = n + (m + r)
\end{align}
$$

We can do likewise for properties of multiplication. Let $n$, $m$, and $r$ be any natural numbers.

$$
\begin{align}
    &\textbf{Zero:} &\qquad &n * 0 = 0 \\
    &\textbf{Identity:} &\qquad &n * 1 = n \\
    &\textbf{Commutativity:} &\qquad &n * m = m * n \\
    &\textbf{Associativity:} &\qquad &(n * m) * r = n * (m * r) \\
    &\textbf{Distibutivity:} &\qquad &n * (m + r) = (n * m) + (n * r)
\end{align}
$$

<br>

## The Natural Numbers in Set Theory

The Peano Axioms define the properties of the natural numbers, but we still have yet to define a concrete implementation. In modern mathematics, everything ultimately derives from a set. Here, we show how you can use sets to define the natural numbers.

First, we define $0$ as the empty set.

$$
0 = \{ \}
$$

Next, we define the _successor function_ as 

$$
s(n) = n \cup \{ n \} = \{ 1, 2, \ldots, n \}
$$

With this definition of a number we have,

$$
\begin{align}
    &0 = \{ \} \\
    &1 = \{ 0 \} = \{ \{ \} \} \\
    &2 = \{ 0, 1 \} = \{ \{ \}, \{ \{ \} \} \} \\
    &3 = \{ 0, 1, 2 \} = \{ \{ \}, \{ \{ \} \}, \{ \{ \}, \{ \{ \} \} \} \} \\
    &\quad \vdots
\end{align}
$$

So we can see in this implementation numbers are basically a bunch of nested sets in a particular structure. Thank goodness we have our shorthand! You may wonder why we chose this construction. For example, we could have defined $$s(n) = \{ n \}$$. This is a much more natural definition and it would mean, for example, $$3 = \{ 2 \} = \{ \{ \{ \{ \} \} \} \}$$, which is much simpler. 

There is a good reason. In the former definition, the cardinality of the natural number set is the natural number, but in the latter definition, the cardinality of all natural numbers is one except $0$ which is zero. This is a very nice property that is used very often. Also, the former definition provides a very nice way to define the $<$ predicate: $n < m$ if and only if $n \in m$. In the latter definition, this would be much more complicated.

<br>

### Addition and Multiplication

What about the addition and multiplication operators? How do we define their behavior? If you look at Axioms 5-8, these operators are completely specified in terms of the successor function. For example, suppose want to add $3 + 2$. We can do this in the following way.

$$
\begin{align}
    3 + 2 
    &= 3 + s(1) &\qquad&\text{definition of the natural number } 2 \\
    &= s(3 + 1) &\qquad&\text{Axiom } 6 \\
    &= s(3 + s(0)) &\qquad&\text{definition of the natural number } 1 \\
    &= s(s(3 + 0)) &\qquad&\text{Axiom } 6 \\
    &= s(s(3)) &\qquad&\text{Axiom } 5 \\
    &= s(4) &\qquad&\text{definition of the natural number } 4 \\
    &= 5 &\qquad&\text{definition of the natural number } 5
\end{align}
$$

One could do similar with multiplication. It is ultimately defined recursively in terms of addition, which is defined recursively in terms of successor operations. 

In school, we memorize addition and multiplication tables, but at their foundations, these operations are ultimately just counting up by one. There's a really creative <a href="https://www.youtube.com/watch?v=N-7tcTIrers" target="_blank">Vihart video</a> about this.