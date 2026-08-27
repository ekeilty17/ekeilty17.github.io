---
layout:     post
title:      "A Category Proof of the Fundamental Theorem of Arithmetic"
date:       2026-08-27
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       category theory, number theory, the fundamental theorem of arithmetic
---

### Preamble

In a previous post, I gave an alternative proof of the Fundamental Theorem of Arithmetic (FTA), using the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series) for finite groups. In this post, I want to modify that proof and look at it through the lens of category theory. The underlying argument is identical, but this is an exercise in applying category theory principles.

What this exercise makes explicit is the connection between prime numbers and groups. I show there is an poset isomorphism between the factors of an integer $n$ and the subgroups of a cyclic group of order $n$. Thus, any time nature exhibits a cyclical nature (which anecdotally is quite often), it can be described by cyclic groups, and consequently described by prime numbers. I am trying to emphasise that prime numbers are not just an artifact of an imaginary game played by mathematicians. They are, in some sense, a fundamental aspect of symmetry itself and thus necessarily crop up in the external world. And that's just one of many reasons mathematicians care so much about prime numbers.

Unlike the previous post, which I attempted to make as self-contained as possible, in this post I will assume knowledge of standard group theory and category theory concepts.

<br>

---

### Definitions

First, define the **cyclic group of order $n$**

$$
C_n \mathrel{:=} \langle x \rangle
\quad
,
\quad
\lvert C_n \rvert = \lvert x \rvert = n
$$

Define the **poset category of subgroups of $C_n$** as

$$
\text{Sub}(C_n​) \mathrel{:=} (\{H \subseteq C_n : H \leq C_n \}, \leq)
$$

with a <span class="tooltip">unique morphism
    <span class="tooltiptext"> 
        This morphism is the canonical **inclusion homomorphism**
        $$
        \iota_{K, H} : K \hookrightarrow H
        \qquad
        \text{s.t.}
        \qquad
        \iota_{K, H}(k) = k
        \quad
        \forall k \in K
        $$
    </span>
</span> $K \to H$ if and only if $K \leq H$. 

It will be useful to give notation to the specific subgroups of $C_n$. Therefore, for each $d \mid n$, define

$$
C_n(d) \mathrel{:=} \left \langle x^{\frac{n}{d}} \right \rangle.
$$

We will prove later that $C_n(d)$ is the **unique subgroup of $C_n$ of order $d$**, and therefore $C_n(d) \cong C_d$.

Define the **poset category of positive divisors of $n$** as

$$
\text{Div}(n​) \mathrel{:=} (\{d \in \mathbb{N} : d \mid n \}, \mid )
$$

with a unique morphism $a \to b$ if and only if $a \mid b$.

<br>

### The Poset Isomorphism

I claim (to be verified later) that the following is a **poset isomorphism**.

$$
\text{Sub}(C_n​) \cong \text{Div}(n​)
\quad
\text{s.t.}
\quad
H \mapsto \lvert H \rvert
\quad
,
\quad
d \mapsto C_n(d)
$$

Therefore,

$$
\qquad
C_n(a) \leq C_n(b)
\iff
a \mid b
$$

Furthermore, this isomorphism immediately implies

$$
\text{Sub}(C_n) \ \text{ has exactly two elements}
\iff
\text{Div}(n) \ \text{ has exactly two elements}
$$

Thus, by definition

$$
C_n \ \text{ is simple}
\iff
n \ \text{ is prime}
$$

<br>

### Existence of a Prime Factorization

The first part of the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series) states every finite group has a composition series. Since $C_n$ is finite, it therefore admits a composition series.

$$
\{1_{C_n} \} = N_0 \trianglelefteq N_1 \trianglelefteq \ldots \trianglelefteq N_k = C_n
$$

Since each $N_i \leq C_n$ they are also cyclic. Let $d_i \mathrel{:=} \lvert N_i \rvert$, and therefore by lemma 1 below $N_i = C_n(d_i)$. Due to the above order isomorphism

$$
N_i \leq N_{i+1}
\quad
\iff
\quad
C_n(d_i) \leq C_n(d_{i+1})
\quad
\iff
\quad
d_i \mid d_{i+1}
$$

This immediately lets us write the following divisibility chain

$$
1 = d_0 \mid d_1 \mid \ldots \mid d_k = n
$$

which induces a factorization of $n$

$$
\frac{d_1}{d_0}\frac{d_2}{d_1} \cdots \frac{d_k}{d_{k-1}} = n
$$

Now, consider the quotient groups. Since $N_{i} \trianglelefteq N_{i+1} \leq C_n$, this implies $N_{i+1} / N_{i}$ is also cyclic. Furthermore, Using [Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory)) we see

$$
\lvert N_{i+1} / N_{i} \rvert = \frac{\lvert N_{i+1} \rvert}{\lvert N_i \rvert} = \frac{\lvert C_n(d_{i+1}) \rvert}{\lvert C_n(d_i) \rvert} = \frac{d_{i+1}}{d_i}
$$

Thus by lemma 1 below, 

$$
N_{i+1} / N_{i} \cong C_{d_{i+1}/d_i}
$$

Therefore,

$$
N_{i+1} / N_{i} \ \text{ is simple}
\iff
C_{d_{i+1}/d_i} \ \text{ is simple}
\iff
\frac{d_{i+1}}{d_i} \ \text{ is prime}
$$

Therefore, the multi-set $$\left \{ \frac{d_1}{d_0}, \frac{d_2}{d_1}, \cdots, \frac{d_k}{d_{k-1}} \right \}$$ is a **prime factorization** of $n$. 

<br>

### Uniqueness of a Prime Factorization

Suppose we have two composition series of $C_n$

$$
\{1_{C_n} \} = N_0 \trianglelefteq N_1 \trianglelefteq \ldots \trianglelefteq N_k = C_n \\[5pt]
\{1_{C_n} \} = M_0 \trianglelefteq M_1 \trianglelefteq \ldots \trianglelefteq M_\ell = C_n
$$

which yield two prime factorizations by the preceding argument

$$
n = p_1 p_2 \cdots p_k 
\qquad
n = q_1 q_2 \cdots q_\ell
$$

By the second part of the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series#Uniqueness:_Jordan%E2%80%93H%C3%B6lder_theorem), the composition factors of the two composition series are isomorphic up to permutation. Since

$$ N_{i+1}/N_i\cong C_{p_{i+1}} \quad\text{and}\quad M_{j+1}/M_j\cong C_{q_{j+1}}$$

it follows that the multi-sets

$$ \{p_1,\ldots,p_k\} = \{q_1,\ldots,q_\ell\} $$

are equal. Thus the prime factorization of $n$ is unique up to permutation. Hence we obtain the **Fundamental Theorem of Arithmetic**.

---

### Proof of the Poset Isomorphism

#### Lemma 1

$$
a \mid b
\implies
C_n(a) \leq C_n(b)
$$

**Proof**: 

If $a \mid b$, then $b = ak$ for some integer $k$. Therefore, $\frac{n}{a} = \frac{n}{b}k$ and

$$
x^{n/a} = x^{(n/b)k} = \left ( x^{n/b} \right )^k
$$

Thus,

$$
x^{n/a} \in \langle x^{n/b} \rangle = C_n(b)
\quad
\implies
\quad
C_n(a) \leq C_n(b)
$$

#### Lemma 2

$$
\forall H \in \text{Sub}(C_n​) \qquad C_n(\lvert H \rvert) = H
$$

**Proof**: 

There is a well-known theorem that a cyclic group of order $n$ has a unique subgroup of order $d$ for every $d \mid n$.

Let $H \leq C_n$ and $d \mathrel{:=} \lvert H \rvert$. By [Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory)), $d \mid n$. By definition, $C_n(d) \mathrel{:=} \langle x^{n/d} \rangle$. This is certainly a subgroup (exercise to the reader), and it has order

$$
\lvert C_n(d) \rvert = \left \lvert \langle x^{n/d} \rangle \right \rvert = \left \lvert x^{n/d} \right \rvert = \frac{n}{\gcd(n, n/d)} = \frac{n}{n/d} = d
$$

Therefore $C_n(d) \leq C_n$ is a cyclic group of order $d$, and therefore it must be unique. Thus, $H = C_n(d) = C_n(\lvert H \rvert)$.

#### Functor Definitions

Define the following functors on objects:

$$
F: \text{Sub}(C_n​) \rightarrow \text{Div}(n​)
\quad
\text{,}
\quad
F(H) \mathrel{:=} \lvert H \rvert
$$

$$
G: \text{Div}(n​) \rightarrow \text{Sub}(C_n​)
\quad
\text{,}
\quad
G(d) \mathrel{:=} C_n(d)
$$

On morphisms, $F$ sends an inclusion $K \leq H$ to the divisibility relation $\lvert K \rvert \mid \lvert H \rvert$ (which holds by Lagrange's theorem), and $G$ sends a divisibility relation $a \mid b$ to the inclusion $C_n(a) \leq C_n(b)$ (which holds by Lemma 1). Both assignments are functorial since composition of inclusions and divisibility relations is preserved trivially in a poset.

#### The Galois Connection

Let $H \in \text{Sub}(C_n)$ and $d \in \text{Div}(n)$, then

$$
F(H) \mid d \iff H \leq G(d)
$$

i.e.

$$
\lvert H \rvert \mid d \iff H \leq C_n(d)
$$

**Proof**:

$\implies$: Suppose $\lvert H \rvert \mid d$. By Lemma 1, $C_n(\lvert H \rvert) \leq C_n(d)$. By Lemma 2, $C_n(\lvert H \rvert) = H$. Thus, $H \leq C_n(d)$.

$\impliedby$: Suppose $H \leq C_n(d)$. By Lagrange's theorem, $\lvert H \rvert \mid \lvert C_n(d) \rvert$. As verified in the proof of Lemma 2, $\lvert C_n(d) \rvert = d$. Thus, $\lvert H \rvert \mid d$.

This condition is precisely the **adjunction condition** $F \dashv G$, i.e. $F$ is left adjoint to $G$.

#### Verification of Functor Inverses

The adjunction $F \dashv G$ is in fact an isomorphism of categories. To see this, we show $F$ and $G$ are strict inverses. This follows from Lemma 2.

$$
G(F(H)) = G(\lvert H \rvert) = C_n(\lvert H \rvert) = H
$$

$$
F(G(d)) = F(C_n(d)) = \lvert C_n(d) \rvert = d
$$

Therefore, $$G \circ F = \text{id}_{\text{Sub}(C_n​)}$$ and $$F \circ G = \text{id}_{\text{Div}(n​)}$$. The unit $\eta_H : H \xrightarrow{\sim} G(F(H))$ and counit $\varepsilon_d : F(G(d)) \xrightarrow{\sim} d$ are both identity morphisms, so the adjunction $F \dashv G$ is a **poset isomorphism**

$$
\text{Sub}(C_n) \cong \text{Div}(n)
$$