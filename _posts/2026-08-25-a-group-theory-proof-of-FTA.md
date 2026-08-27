---
layout:     post
title:      "A Group Theory Proof of the Fundamental Theorem of Arithmetic"
date:       2026-08-25
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       group theory, number theory, the fundamental theorem of arithmetic
---

In this post, I give an alternative proof of the Fundamental Theorem of Arithmetic (FTA), using the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series#Uniqueness:_Jordan%E2%80%93H%C3%B6lder_theorem) for finite groups. 

### Preamble

The [typical proof](https://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic#Proof) of the FTA is direct and self-contained, requiring nothing beyond basic number theory. The usual takeaway is that _"prime numbers are important because they are the atoms of arithmetic; they are the indivisible building blocks of all integers"_. 

In this post, I want to give a slightly different perspective. I show that the FTA is just a special case of a much deeper theorem in group theory. The proof hinges on a single lemma: cyclic groups of prime order are simple. In other words, cyclic groups of prime order have no further symmetries to exploit. This gives a different interpretation of primes as not just the building blocks of integers, but the building blocks of symmetry itself. This is why prime numbers are so important. Since Jordan-H&ouml;lder applies to all finite groups, primes appear wherever there is symmetry to decompose.

<br>

---

## The Fundamental Theorem of Arithmetic

### Definitions

The **integers** are the elements of the set $$\mathbb{Z} \mathrel{:=} \{\ldots, -3, -2, -1, 0, 1, 2, 3, \ldots\}$$.

Let $a$ and $b$ be integers. We say "$a$ **divides** $b$" or "$b$ **is divisible by** $a$" if there exists an integer $c$ (called the **quotient**) such that $a \cdot c = b$. We write $a \mid b$.

An integer $p > 1$ is called **prime** if it is only divisible by itself and $1$.

An integer $n > 1$ is called **composite** if it is not prime, i.e. there exists an integer $d$ such that $1 < d < n$ and $d \mid n$. We call $d$ a **factor** of $n$.

The integers $a_1, a_2, \ldots, a_k > 1$ are a **factorization** of integer $b > 1$ if $\prod_{i=1}^k a_i = b$. If each $a_i$ is prime, then this is called a **prime factorization**.

### The Statement

Every integer $n > 1$ has a **unique prime factorization**, i.e. there is a _unique multi-set_ $$\{p_1, p_2, \ldots, p_k\}$$ of primes (may contain duplicates) such that

$$
n = p_1 p_2 \cdots p_k
$$

For example, 

$$
20 = 2 \cdot 2 \cdot 5
$$

is the only prime factorization of $20$.

<br>

---

## The Jordan-H&ouml;lder Theorem

### Definitions

A **binary operation** on a set $A$ is a function $*:A \times A \rightarrow A$.

A **group** is a set equipped with a binary operation that is associative, contains an identity element, and is closed under inverses. For a group $G$, the identity element will be denoted $1_G$. The inverse of $g \in G$ will be denoted $g^{-1}$.

The **order of a group** $G$ is the number of elements in the group, denoted $\lvert G \rvert$. The **order of an element** $g \in G$ is the smallest integer $m > 0$ such that $g^m = 1$, denoted $\lvert g \rvert$.

The **cyclic group of order $n$** is defined as $$C_n \mathrel{:=} \{1, x, x^2, \ldots, x^{n-1} \}$$ where $x^a \cdot x^b \mathrel{:=} x^{a+b \mod n}$. The element $x$ is called a **generator** of the group. Often we write $C_n = \langle x \rangle$. It's easy to show that $\lvert C_n \rvert = \lvert x \rvert = n$.

$H$ is a **subgroup** of group $G$ if $H \subseteq G$ and $H$ is a group under the same binary operation as $G$. We write $H \leq G$.

$N$ is a **normal subgroup** of $G$ if $N \leq G$ and $gng^{-1} \in N$ for all $n \in N$ and $g \in G$. We write $N \trianglelefteq G$.

$G$ is called a **simple group** if $\{1_G \} \trianglelefteq G$ and $G \trianglelefteq G$ are its only normal subgroups.

Let $N \trianglelefteq G$, then $G/N$, called the **quotient group** of $G$ under $N$, is a new group formed by collapsing $N$ down to the identity element. Informally, it is the group $G$ "modulo" $N$. For the purposes of this post, you just need to know [Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory)) which says $\lvert G/N \rvert = \frac{\lvert G \rvert}{\lvert N \rvert}$.

A **composition series** of $G$ is a sequence of subgroups $$\{1_G \} = N_0 \trianglelefteq N_1 \trianglelefteq \ldots \trianglelefteq N_k = G$$ such that each $N_{i} \trianglelefteq N_{i+1}$ are normal subgroups, and each quotient group $N_{i+1}/N_{i}$ is simple.

### Statement

Let $G$ be a finite group.
1. $G$ has a composition series
2. Composition series are unique up to permutation and isomorphism of quotient groups

More specifically, if 

$$
\{1_G\} = N_0 \trianglelefteq N_1 \trianglelefteq \ldots \trianglelefteq N_k = G
\qquad
\text{and}
\qquad
\{1_G\} = M_0 \trianglelefteq M_1 \trianglelefteq \ldots \trianglelefteq M_\ell = G
$$ 

are two composition series, then $k = \ell$ and there exists a permutation $\sigma \in S_k$ such that $N_{i+1}/N_{i} \cong M_{\sigma(i+1)}/M_{\sigma(i)}$ for each $0 \leq i < k$

---

## Proof of the Fundamental Theorem of Arithmetic

### Lemma 1

If a group $G$ is cyclic with order $a$, then $G \cong C_a$

**Proof Sketch**: 

Since $G$ has order $a$, then it has a generator $g \in G$ which has order $a$, i.e. 

$$
G = \langle g \rangle = \{1, g, g^2, \ldots, g^{a-1} \}
$$

Therefore, we can define an isomorphism 

$$
\varphi : C_a \rightarrow G
\quad
\text{such that}
\quad
\varphi(x^k) \mathrel{:=} g^k
$$

I will leave it as an exercise to the reader to validate that this is well-defined, injective, surjective, and a homomorphism.

### Lemma 2

A cyclic group is simple if and only if it has prime order

**Proof**: 

$\implies$: Proof by contrapositive: suppose $\lvert C_n \rvert = n$ where $n$ is composite. Thus, there exists integer $d$ such that $1 < d < n$ and $d \mid n$. Let $C_n = \langle x \rangle$. Then $\langle x^{d} \rangle$ is a subgroup of order $\frac{n}{\gcd(n, d)} = \frac{n}{d}$. Therefore $\langle x^{d} \rangle$ is a proper subgroup of $C_n$. It is normal since $C_n$ is abelian. Therefore $C_n$ is not simple.

$\impliedby$: Suppose $\lvert C_p \rvert = p$ where $p$ is prime. By [Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory)), if $H \leq C_p$, then $\lvert H \rvert$ divides $\lvert C_p \rvert$. Thus, the only subgroups of $C_p$ are the identity group and itself, and by definition $C_p$ is a simple group.  

### Existence of a Prime Factorization

Let $n > 1$ be an integer, and let $C_n$ be the cyclic group of order $n$.

By the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series), $C_n$ has a composition series

$$
\{1_{C_n}\} = N_0 \trianglelefteq N_1 \trianglelefteq \ldots \trianglelefteq N_k = C_n
$$

such that each $N_i$ is **normal** in $N_{i+1}$, and each quotient group $N_{i+1}/N_{i}$ is **simple**.

Subgroups of a cyclic group are also cyclic (exercise for the reader). Therefore each $N_i \cong C_{d_i}$ for some integer $d_i$. By [Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory)) we have

$$
\lvert N_{i} \rvert \mid \lvert N_{i+1} \rvert
\quad
\text{ and }
\quad
\lvert N_{i+1}/N_{i} \rvert = \frac{\lvert N_{i+1} \rvert}{\lvert N_{i} \rvert} = \frac{d_{i+1}}{d_{i}}
$$

Also note that since $N_{i}$ and $N_{i+1}$ are cyclic, $N_{i+1}/N_{i}$ is also cyclic (exercise for the reader). Therefore by Lemma 1, $N_{i+1}/N_{i} \cong C_{d_{i+1}/d_{i}}$.

From the definition of a composition series $N_{i+1}/N_{i}$ is simple, and thus $C_{d_{i+1}/d_{i}}$ must be simple. By Lemma 2, a cyclic group is simple if and only if it has prime order. Thus, each quotient $\frac{d_{i+1}}{d_{i}}$ is prime.

Also notice that

$$
\prod_{i=1}^k \frac{d_{i}}{d_{i-1}} = \frac{d_k}{d_0} = \frac{n}{1} = n
$$

Therefore, the multi-set $$\left \{ \frac{d_{1}}{d_{0}} , \frac{d_{2}}{d_{1}} , \ldots , \frac{d_{k}}{d_{k-1}} \right \}$$ is a prime factorization of $n$.

### Uniqueness of the Prime Factorization

Let $n > 1$ be an integer. Suppose we have two prime factorizations of $n$

$$
p_1p_2 \cdots p_k = n
\qquad
\text{and}
\qquad
q_1q_2 \cdots q_{\ell} = n
$$

Let $C_n = \langle x \rangle$ be the cyclic group of order $n$. Now consider the following composition series

$$
\{ 1_{C_n} \} = \langle x^{n} \rangle \trianglelefteq \langle x^{\frac{n}{p_1}} \rangle \trianglelefteq \langle x^{\frac{n}{p_1p_2}} \rangle \trianglelefteq \ldots \trianglelefteq \langle x^{\frac{n}{p_1p_2 \cdots p_{k-1}}} \rangle \trianglelefteq \langle x \rangle = C_n
$$

and

$$
\{ 1_{C_n} \} = \langle x^{n} \rangle \trianglelefteq \langle x^{\frac{n}{q_1}} \rangle \trianglelefteq \langle x^{\frac{n}{q_1q_2}} \rangle \trianglelefteq \ldots \trianglelefteq \langle x^{\frac{n}{q_1q_2 \cdots q_{\ell-1}}} \rangle \trianglelefteq \langle x \rangle = C_n
$$

Now by [Lagrange's Theorem](https://en.wikipedia.org/wiki/Lagrange%27s_theorem_(group_theory))

$$
\lvert \langle x^{\frac{n}{p_1p_2 \cdots p_{i-1}}} \rangle / \langle x^{\frac{n}{p_1p_2 \cdots p_{i}}} \rangle \rvert = \frac{\frac{n}{p_1p_2 \cdots p_{i-1}}}{\frac{n}{p_1p_2 \cdots p_{i}}} = p_{i}
$$

and likewise

$$
\lvert \langle x^{\frac{n}{q_1q_2 \cdots q_{j-1}}} \rangle / \langle x^{\frac{n}{q_1q_2 \cdots q_{j}}} \rangle \rvert = \frac{\frac{n}{q_1q_2 \cdots q_{j-1}}}{\frac{n}{q_1q_2 \cdots q_{j}}} = q_{j}
$$

By Lemma 1, this implies

$$
\langle x^{\frac{n}{p_1p_2 \cdots p_{i-1}}} \rangle / \langle x^{\frac{n}{p_1p_2 \cdots p_{i}}} \rangle \cong C_{p_i}
\qquad
\text{and}
\qquad
\langle x^{\frac{n}{q_1q_2 \cdots q_{j-1}}} \rangle / \langle x^{\frac{n}{q_1q_2 \cdots q_{j}}} \rangle \cong C_{q_j}
$$

Therefore, each quotient group of the composition series is isomorphic to a cyclic group. The order of each cyclic group uniquely corresponds to a prime factor in the prime factorizations. By Lemma 2, a cyclic group of prime order is simple. Therefore, each quotient group of each composition series must be simple. Thus the above are, in fact, valid composition series.

By the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series#Uniqueness:_Jordan%E2%80%93H%C3%B6lder_theorem), both of these composition series of $C_n$ have equal length, thus $k = \ell$. Also, the quotient groups are equivalent up to permutation and isomorphism. Therefore, there exists a permutation $\sigma \in S_k$ such that

$$
C_{p_{i}} \cong C_{q_{\sigma(i)}}
\qquad
\forall 1 \leq i \leq k
$$

This implies

$$
\lvert C_{p_{i}} \rvert = \lvert C_{q_{\sigma(i)}} \rvert
\qquad
\implies
\qquad
p_{i} = q_{\sigma(i)}
$$

Therefore, the original prime factorizations are equal up to permutation.