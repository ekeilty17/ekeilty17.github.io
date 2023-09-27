---
layout:     series
title:      "Constructing the Hyperreal Numbers"
date:       2023-07-02
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       1
series:     nonstandard-analysis
tags:       nonstandard-analysis, hyperrational-numbers, real-numbers
---

**TODO**

## Constructing The Hyperrational Numbers

Using the typical construction of the rational numbers, let $\mathbb{Q}$ be the set of all rational numbers. In particular

$$
\mathbb{Q} = \left \{ \frac{n}{m} \ \Big\vert \ n, m \in \mathbb{Z} \text{ and } m \neq 0 \right \}
$$

<br>

Let $\langle q_n \rangle_{n=0}^{\infty} = \langle q_0, q_1, q_2, \ldots, q_n, \ldots  \rangle$ be an infinte series of rational numbers. We define the set of all infinite sequences of rational numbers as 

$$
\mathbb{Q}^{\mathbb{N}} = \left \{ \langle q_n \rangle_{n=0}^{\infty} \ \Big\vert \ q_n \in \mathbb{Q} \right \}
$$

We define operations between sequences element-wise. i.e.

$$
c \cdot \langle q_n \rangle_{n=m}^{\infty}= \langle c \cdot q_n \rangle_{n=m}^{\infty}
$$

$$
\langle q_n \rangle_{n=m}^{\infty} + \langle p_n \rangle_{n=m}^{\infty} = \langle q_n + p_n \rangle_{n=m}^{\infty}
$$

$$
\langle q_n \rangle_{n=m}^{\infty} \cdot \langle p_n \rangle_{n=m}^{\infty} = \langle q_n \cdot p_n \rangle_{n=m}^{\infty}
$$

And you can check that all of these are well-defined. In fact, $(\mathbb{Q}^{\mathbb{N}}, +, \cdot)$ forms a ring. However, it does not form a field since there is no well-defined indentity.

<br>

Now, we want to define a notion of **equivalence** between two sequences. We say that $\langle q_n \rangle_{n=0}^{\infty} \equiv \langle p_n \rangle_{n=0}^{\infty}$ if they differ in only finintely many places. Another way to think about it is that eventually, $\langle q_n \rangle_{n=m}^{\infty} = \langle p_n \rangle_{n=m}^{\infty}$, meaning these sequences exactly equal for some index $m$. This notation of equivalence can be made mathematically rigorous via the notation of a **filter** and an **ultrafilter**. But I don't think the formalism really adds anything to the intuitive understanding. Using this idea of equivalence, we can define the hyperrational numbers.

$$
^* \mathbb{Q} = (\mathbb{Q}^{\mathbb{N}} / \equiv)
$$

This is the set of equivalence classes in $\mathbb{Q}^{\mathbb{N}}$ induced by the $\equiv$ operation.

Therefore, all hyperrational numbers are of the form

$$
[\langle q_n \rangle_{n=0}^{\infty}] \in ^* \mathbb{Q}
$$

Where the square brackets indicate the equivalence class.

<br>

## Infinites and Infinitesimals

An infinite is a hyperrational number that is larger than all rational numbers, i.e. $\lvert \omega \rvert > \lvert q \rvert \quad \forall q \in \mathbb{Q}$. An example of this is 

$$
\mathcal{N} = [\langle n \rangle_{n=0}^{\infty}] = [\langle 0, 1, 2, 3, 4, \ldots, n, \ldots \rangle]
$$

<br>

An infinitesimal is a hyperrational number that is smaller than all rational numbers, i.e. $0 < \lvert \epsilon \rvert < \lvert q \rvert  \quad \forall q \in \mathbb{Q}$. An example of this is

$$
\frac{1}{\mathcal{N}} = [\langle \frac{1}{n} \rangle_{n=1}^{\infty}] = [\langle 1, \frac{1}{2}, \frac{1}{3}, \frac{1}{4}, \ldots, \frac{1}{n}, \ldots \rangle]
$$

**TODO** Maybe also define halo and gallaxy here? I think I also have to define the $st(\cdot)$ function.

<br>

## Constructing the Real Numbers

We want to define this notion of _convergence_ of a sequence. For example, the rational sequence

$$
\langle 3, 3.1, 3.14, 3.141, 3.1415, 3.14159, \ldots \rangle
$$

if it continues in the natural way clearly is converging to $\pi$. The typical way of doing this is to define it as a limit, and then using a delta-epsilon style of definition. While this approach is rigorous, it's not in the spirit of nonstandard analysis. Thus, we will define the following. Given a hyperrational number $^* q = [\langle q_n \rangle_{n=0}^{\infty}] \in ^* \mathbb{Q}$, consider

$$
^* \Delta q = [\langle q_n \rangle_{n=0}^{\infty}] - [\langle q_n \rangle_{n=1}^{\infty}] = [\langle q_n - q_{n+1} \rangle_{n=0}^{\infty}]
$$

The question is, what is this number? Well that depends on what $^* q$ is. I claim that this number is an infintesimal if and only if $[\langle q_n \rangle_{n=0}^{\infty}]$ is a convergent sequence. In fact, this is how I am going to define what a convergent sequence is. A sequence is convergent if and only if

$$
st(^* \Delta q) = 0
$$

<br>

Now, we've established that this sequence is approaching something. We define a **real number** as the unique constant sequence such that 

$$
st( \quad [\langle r \rangle_{n=0}^{\infty}] - [\langle q_n \rangle_{n=0}^{\infty}] \quad ) = 0
$$

**TODO** How rigorous is this? Probably needs more work.

**TODO** Now I have to prove completeness, etc, etc

<br>

## Constructing the Hyperreal Numbers

Now that we have real numbers, we can construct the hyperreals in the same way we did the hyperrationals.

$$
^* \mathbb{R} = (\mathbb{R}^{\mathbb{N}} / \equiv)
$$