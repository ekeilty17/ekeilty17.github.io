---
layout:     series
title:      "The Language of Arithmetic"
date:       2025-07-02
categories: blog constructing-the-real-numbers
permalink:  ":categories/:title/"
part:       1
series:     constructing-the-real-numbers
tags:       natural-numbers, language-of-arithmetic, standard-model-of-arithmetic, peano-axioms, incompleteness
---

This post is quite technical (and longer than I expected). Its content is not required in order to understand the rest of the series. Logicians spent a very long time attempting to ground mathematics in first-order logic, and ultimately failed (damn you G&ouml;del). Some may find it interesting to see what they came up with.

<br>

## A Brief Background in Logic

### Languages and Structures

Here we provide some terminology. 

A **language**/**vocabulary** in logic, denoted by $\mathcal{L}$, consists of the following
* A set of **functions**/**operations** of various <a href="https://en.wikipedia.org/wiki/Arity" target="_blank">arity</a>. Note that a function with an arity of $0$ is called a **constant**.
* A set of **predicates** of various <a href="https://en.wikipedia.org/wiki/Arity" target="_blank">arity</a>. Note that a predicate with an arity of $0$ is called a **propositional atom**.

Essentially, a language specifies the **syntax**** of the logic. It describes what symbols are allowed to be combined with others. We will see an example when I describe the language of arithmetic.

A **structure**/**model** in logic, denoted by $\mathcal{M}$, consists of the following
* A nonempty set $M$ called the **universe of discourse** (or just the universe)
* For each function symbol $f$ in $\mathcal{L}$, an associated function $f^{\mathcal{M}}$
* For each predicate symbol $P$ in $\mathcal{L}$, an associated function $P^{\mathcal{M}}$

Essentially, a structure specifies the **semantics**** of the logic. It tells you how symbols are to be interpreted. An analogy with programming is that the language is like an interface or an abstract class, and the structure is like the implementation. Again, we will see an example when I describe the standard model of arithmetic.

<br>

### Theories

Using a given language $\mathcal{L}$, we can write logical statements. We can bundle together a set of $\mathcal{L}$-statements into a set, $\Phi$. Now we ask the question, what are all of the $\mathcal{L}$-statements that are a **logical consequence**, denoted by $\models$, of a set $\Phi$? This set is called the **theory** of $\Phi$.

$$
Th(\Phi) = \{ A: \Phi \models A \}
$$

The meaning of $\Phi \models A$ requires too much explanation to provide here. Intuitively, it means that $A$ is implied by/logically follows from the axioms in $\Phi$.

<br>

Using a given model of a language $\mathcal{M}$, we can now interpret $\mathcal{L}$-statements. Now we can ask the question, what are all of the $\mathcal{L}$-statements that are **true** under model $\mathcal{M}$? This is called the **theory** induced by the model $\mathcal{M}$.

$$
Th(\mathcal{M}) = \{ A: \mathcal{M} \models A \}
$$

Again, the meaning of $\mathcal{M} \models A$ requires too much explanation to provide here. Intuitively, it means all statements $A$, which are evaluated to _true_ under the interpretation provided by the model $\mathcal{M}$. Notice that this symbol is being overloaded to mean two very different things. Classic mathematicians.

<br>

A natural question to ask is, given a model $\mathcal{M}$, can I find a set of axioms $\Phi$ such that $Th(\mathcal{M}) = Th(\Phi)$? If we found such a set, it would be called an **axiomatization** of $\mathcal{M}$. In some cases this is possible, and in others, it is not.

<br>

### Further Reading

I learned this while taking a course in mathematical logic. If you are interested in filling in the gaps that I have left out of the above, you can find the course notes <a href="https://www.cs.toronto.edu/~sacook/csc438h/" target="_blank">here</a>. I can't promise they are the best, but they will get the job done. If you have any better recommendations, please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

## The Language of Arithmetic

The language of arithmetic $\mathcal{L}_{A}$ consists of the following
* $0$ - a constant called _zero_
* $s(\cdot)$ - a unary operation called the _successor function_
* $+(\cdot, \cdot)$ - a binary operation called _addition_
* $*(\cdot, \cdot)$ - a binary function called _multiplication_
* $=(\cdot, \cdot)$ - a binary predicate called _equality_
* $<(\cdot, \cdot)$ - a binary predicate called _less than_ (this one is sometimes left out)

As a short-hand, we can write $\mathcal{L}_{A} = [0, s, +, *; =, <]$. You can also define other predicates such as $$\{ \neq, >, \leq, \geq \}$$, but we will see from the axioms typically associated with these operations that they are simply syntactic sugar. These can all be expressed in terms of the predicates $$\{=, < \}$$. Thus, logically speaking we do not gain anything from these.

<br>

## The Standard Model of Arithmetic

The standard model of arithmetic is the natural numbers which we are all familiar with

$$
\mathbb{N} = \{ 0, 1, 2, 3, \ldots \}
$$

Recall that $0$ is a constant given by the language. The element $1$ is just a short-hand to mean $s(0)$, the element $2$ is just a short-hand to mean $s(s(0))$, and in general the element $n$ is short-hand to mean apply the successor function $n$ times to $0$. The operators/predicates $$\{ +, *; =, < \}$$ are all the standard definitions we learned in school.

The theory induced by this model is called **True Arithmetic** is the set of all true statements that can be made about the natural numbers. 

$$
TA = Th(\mathbb{N}) = \{ A : \mathbb{N} \models A \}
$$

What 20th-century mathematicians wanted was to create a set of axioms from which all true statements about $\mathbb{N}$ could be derived. If they could succeed in doing so, then all of mathematics could be rigorously grounded in logic.

<br>

## The Peano Axioms

The **Peano Axioms**, denotes $\Phi_{PA}$, are the following set of axioms in the language of arithmetic $\mathcal{L}_{A}$. This is the mathematicians' attempt to create an axiomatization of $\mathbb{N}$.

$$
\begin{align}
    &1)   &\neg (\forall n \qquad& s(n) = 0) \\
    &2)   &\forall n \ \forall m \qquad& s(n) = s(m) \implies n = m \\
    &3)   &\forall n \qquad& n + 0 = n \\
    &4)   &\forall n \ \forall m \qquad& n + s(m) = s(n+m) \\
    &5)   &\forall n \qquad& n \cdot 0 = 0 \\
    &6)   &\forall n \ \forall m \qquad& n \cdot s(m) = (n \cdot m) + n \\
\end{align}
$$

We also need the first-order induction axiom (which is actually a countably infinite number of axioms. One for each first-order formula). Let $A(n)$ be a first-order formula that uses variable $n$. 

$$
7_A) \qquad \Big ( \ A(0) \wedge \big ( \forall n \quad A(n) \implies A(s(n)) \big ) \ \Big ) \implies \Big ( \forall m \quad A(m) \Big )
$$

Also, we have the standard axioms of equality. Let $f(\cdot)$ denote any function in the language (in the above case $$\{s, +, \cdot\}$$). Let $P(\cdot)$ denote any predicate other than equality in the language (in the above case, $$\{ < \}$$). Let $\vec{x} = (x_1, x_2, \ldots, x_n)$ and $\vec{y} = (y_1, y_2, \ldots, y_n)$ denote sets of variables. I am using letters $x, y, z$ to indicate that these are not specific to the Peano Axioms.

$$
\begin{align}
    &1)   &\forall x \qquad& x = x &&\qquad\text{Reflexivity} \\
    &2)   &\forall x \ \forall y \qquad& x = y \implies y = x &&\qquad\text{Commutativity} \\
    &3)   &\forall x \ \forall y \ \forall z \qquad& (x = y \wedge y = z) \implies x = z &&\qquad\text{Transitivity} \\
    &4)   &\forall \vec{x} \ \forall \vec{y} \qquad& \vec{x} = \vec{y} \implies f(\vec{x}) = f(\vec{y}) && \\
    &5)   &\forall \vec{x} \ \forall \vec{y} \qquad& \vec{x} = \vec{y} \implies P(\vec{x}) = P(\vec{y}) &&
\end{align}
$$

Finally, we have the standard axioms of a _strict total ordering_. I am using letters $x, y, z$ to indicate that these are not specific to the Peano Axioms.


$$
\begin{align}
    &1)   &\neg (\forall x \qquad& x < x) &&\qquad\text{Irreflexivity} \\
    &2)   &\forall x \ \forall y \qquad& x < y \implies \neg (y < x) &&\qquad\text{Asymmetric} \\
    &3)   &\forall x \ \forall y \ \forall z \qquad& (x < y \wedge y < z) \implies x < z &&\qquad\text{Transitivity}
\end{align}
$$

Specific to the Peano Axioms, we have 

$$
4) \qquad\forall n \qquad n < s(n)
$$

<br>


### Consequences of the Peano Axioms

It is easy to show these two nice consequences of the axioms, which align with the typical notion of these operations.

$$
s(n) = s(n + 0) = n + s(0) = n + 1
$$

$$
n * 1 = n * s(0) = (n * 0) + n = 0 + n = n
$$

We can summarize the properties of addition that result from these axioms. These are very fun to prove and not too difficult, so I will leave that to you. Hint, you need to use induction on some of them.

$$
\begin{align}
    &\textbf{Identity:} &\forall n \qquad &n + 0 = n \\
    &\textbf{Successor:} &\forall n \qquad &n + 1 = s(n) \\
    &\textbf{Commutativity:} &\forall n \forall m \qquad &n + m = m + n \\
    &\textbf{Associativity:} &\forall n \forall m \forall r \qquad &(n + m) + r = n + (m + r)
\end{align}
$$

We can do likewise for properties of multiplication. Again, these are not difficult to prove, so I will leave that to you. Hint, you need to use induction on some of them.

$$
\begin{align}
    &\textbf{Zero:} &\forall n \qquad &n * 0 = 0 \\
    &\textbf{Identity:} &\forall n \qquad &n * 1 = n \\
    &\textbf{Commutativity:} &\forall n \forall m \qquad &n * m = m * n \\
    &\textbf{Associativity:} &\forall n \forall m \forall r \qquad &(n * m) * r = n * (m * r) \\
    &\textbf{Distibutivity:} &\forall n \forall m \forall r \qquad &n * (m + r) = (n * m) + (n * r)
\end{align}
$$

Finally, we have some properties relating to ordering. There are probably others, but these seem fundamental.

$$
\begin{align}
    &\textbf{Tricholomy:} &\forall n \forall m \qquad &(n < m) \vee (n = m) \vee (m < n) \\
    &\textbf{Addition:} &\forall n \forall m \forall r \qquad &(n < m) \implies (n + r < m + r) \\
    &\textbf{Multiplication:} &\forall n \forall m \forall r \qquad &((0 < r) \wedge (n < m)) \implies (n * r < m * r) \\
    &\textbf{Minimum:} &\forall n \qquad &(n = 0) \vee (0 < n)
\end{align}
$$

So far, things are looking good.

<br>

### G&ouml;del's Incompleteness Theorem

Is it true that $\Phi_{PA}$ is an axiomatization of $\mathbb{N}$? i.e. does $Th(\mathbb{N}) = Th(\Phi_{PA})$? Unfortunately, the answer is no. This was famously shown by Kurt G&ouml;del's incompleteness theorems. The actual statements of his theorems are quite technical, but the upshot is that $Th(\Phi_{PA}) \subset Th(\mathbb{N})$ (proper subset). In fact, he shows that there does not exist any axiomatization of $\mathbb{N}$. In one fell swoop he killed the dreams of every 20th century mathematician. You can read all about it in the book <a href="https://en.wikipedia.org/wiki/Logicomix" target="_blank">Logicomix</a> (I highly recommend it).

This has some profound philosophical ramifications. For all intents and purposes, the Peano axioms are the foundation of modern number theory. This means that there exist some true statements about the natural numbers which cannot be proved. For example, it could be the case that the Riemann hypothesis is true and that there does not exist a proof for it. 

<br>

To give my perspective on this. Typically these "true statements which have no proof" require heavy self-reference, which ultimately results in self-contradiction; similar to the statement "this statement is false". I have never seen an instance of a "true statement which has no proof" that is not utterly contrived and frankly a statement no one cares about. I conjecture that any "well-behaved" true statement which does not contain self-reference will contain a proof. And I believe this is the standard consensus among mathematicians.

<br>

### Nonstandard Models of Arithmetic

As an additional aside, while $\mathbb{N}$ certainly satisfies all of the Peano axioms; unfortunately, there exist nonstandard models of arithmetic which also satisfy them. This fact is implied by the compactness theorem. Moreover, the upward Lowenheim-Skolem theorem shows that there are nonstandard models of all infinite cardinalities. These models are pretty complicated. Tennenbaum's theorem shows that there is no countable nonstandard model of the Peano Axioms in which either the addition or multiplication operation is computable. So I will not describe these models here.