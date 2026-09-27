---
layout:     post
title:      "Proving the Fundamental Theorem of Arithmetic using the Jordan-H&ouml;lder Theorem Argument"
date:       2026-08-15
categories: blog
permalink:  ":categories/:title/"
series:     miscellaneous
tags:       group theory, number theory, the fundamental theorem of arithmetic
---

## Motivation

In this post, I prove the Fundamental Theorem of Arithmetic (FTA) using a nearly identical argument to the one used to prove the [Jordan-H&ouml;lder Theorem](https://en.wikipedia.org/wiki/Composition_series#Uniqueness:_Jordan%E2%80%93H%C3%B6lder_theorem) for finite groups.

There is no question that the [typical proof](https://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic#Proof) of the FTA is much more straightforward, both conceptually and technically. However, that is not the purpose of this proof. The goal here is to use this proof as a proxy for the proof of the Jordan-H&ouml;lder Theorem. I think it is just one level simpler by getting rid of the need for isomorphism. This allows you to appreciate the argument of the proof without the technical complications.

<br>
---

## The Fundamental Theorem of Arithmetic

### Definitions

Please refer to [this section of this post](/blog/a-group-theory-proof-of-FTA#the-fundamental-theorem-of-arithmetic) for the relevant definitions.

### The Original Statement

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

## Reformulation of the Fundamental Theorem of Arithmetic

### Composition Series

Let $n > 1$ be an integer. A **composition series** of $n$ is

$$
1 = f_0 \mid f_1 \mid \ldots \mid f_k = n
$$ 

such that $$f_{i} \mid f_{i+1}$$ and $${}^{f_{i+1}}\!/\!_{f_{i}}$$ is prime for each $$0 \leq i < k$$. Each $${}^{f_{i+1}}\!/\!_{f_{i}}$$ will be called a **quotient**.

For example,

$$
1 \mid 2 \mid 4 \mid 20
$$

is a composition series for 20, where $${}^{2}\!/\!_{1} = 2$$, $${}^{4}\!/\!_{2} = 2$$, and $${}^{20}\!/\!_{4} = 5$$ are all prime.

<br>

The above notation can be a bit cumbersome. I will instead condense it to the following.

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n
$$

If I want to emphasize a specific quotient, I may also write

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{i}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f_i \overset{\times p_i}{\longrightarrow} f_{i+1} \hspace{0.25cm}\overset{f_{i+1}, \; \ldots, \; f_{k}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n
$$

where $$p_i = {}^{f_{i+1}}\!/\!_{f_{i}}$$.

### Equivalent Composition Series

Now, we need to define a notion of when two composition series are the same. Let's take $20$ as an example:

$$
1 \overset{\times 2}{\longrightarrow} 2 \overset{\times 2}{\longrightarrow} 4 \overset{\times 5}{\longrightarrow} 20 \qquad 1 \overset{\times 5}{\longrightarrow} 5 \overset{\times 2}{\longrightarrow} 10 \overset{\times 2}{\longrightarrow} 20 \qquad 1 \overset{\times 2}{\longrightarrow} 2 \overset{\times 5}{\longrightarrow} 10 \overset{\times 2}{\longrightarrow} 20
$$

You may notice that the only difference between these composition series is that the quotients $\times 2$, $\times 2$, and $\times 5$ have just been shuffled around (or **permuted**). We can formalize this notion of _equivalence_.

Let $n > 1$ be an integer with two composition series

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n 
$$
and
$$
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n
$$ 

We say these composition series are **equivalent** if $k = \ell$ and the sequences of quotients differ only by a permutation. We write

<!-- TODO: Add a hover thing to permutation and give the formal definition -->

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n 
\qquad\equiv\qquad 
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n
$$ 

### The New Statement

Every integer $n > 1$ has a **unique composition series** (up to permutation of the quotients).

##### Why Is This Equivalent to FTA?

The relation $\equiv$ is clearly an equivalence relation. If we consider the equivalence classes of all equivalent composition series, then all representatives from the same equivalence class will have the same multi-set of quotients

$$
\left \{ \frac{f_{1}}{f_{0}}, \frac{f_{2}}{f_{1}}, \ldots, \frac{f_{k}}{f_{k-1}} \right \}
$$

as they only differ by permutation. Since by construction each $\frac{f_{i}}{f_{i-1}}$ is prime and $n = \prod_{i=1}^{k} \frac{f_{i}}{f_{i-1}}$, this is a valid prime factorization. Therefore, unique prime factorizations and the equivalence classes of composition series under $\equiv$ are in one-to-one correspondence. So the new statement is true if and only if the FTA is true.

<br>

---

## Existence of a Prime Factorization

Using induction on positive integers $n$. 

### Base Cases

If $n = 1$ the statement is vacuously true.

If $n$ is prime then $1 \overset{\times n}{\longrightarrow} n$ is a composition series.

### Induction Step

Suppose all positive integers less than $n$ have a composition series. If $n$ is prime, then we are done, so suppose $n$ is composite. Therefore, there exists a positive integer $f$ such that $1 < f < n$ and $f \mid n$.

Since $1 < f < n$, by the induction hypothesis $f$ has a composition series. Let's call it

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f
$$

Also, $\frac{n}{f}$ is a positive integer and $1 < \frac{n}{f} < n$, so again by the induction hypothesis $\frac{n}{f}$ has a composition series. Let's call it

$$
1 \hspace{0.25cm}\overset{\bar{g}_0, \; \ldots, \; \bar{g}_{\ell}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} \frac{n}{f}
$$

Define $g_i$ = $\bar{g}_i \cdot f$ and we get

$$
f \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n
$$

which is a composition series since

$$
\bar{g}_i < \bar{g}_{i+1}
\quad\implies\quad
f \cdot \bar{g}_i < f \cdot \bar{g}_{i+1}
\quad\implies\quad
g_i < g_{i+1}
$$

and

$$
\frac{\bar{g}_{j+1}}{\bar{g}_{j}} \ \text{ is prime}
\quad\implies\quad
\frac{f \cdot \bar{g}_{j+1}}{f \cdot \bar{g}_{j}} \ \text{ is prime}
\quad\implies\quad
\frac{g_{j+1}}{g_{j}} \ \text{ is prime}
$$

Note the inequality sign doesn't flip because $f$ is positive. Therefore

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} n
$$

is a composition series of $n$.

---

## Uniqueness of the Prime Factorization

Using induction on positive integers $n$. 

### Base Cases

If $n = 1$ the statement is vacuously true.

If $n$ is prime then $1 \overset{\times n}{\longrightarrow} n$ is the only composition series as $n$ has no factors other than itself and $1$.

### Induction Step

Suppose all integers less than $n$ have a unique composition series (up to permutation of the quotients). If $n$ is prime, then we are done. Therefore, suppose $n$ is composite, which means any composition series of $n$ has length at least 2. Therefore, suppose

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f_{k-1} \longrightarrow n
$$

and

$$
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} g_{\ell-1} \longrightarrow n
$$ 

are two composition series of $n$ such that $k, \ell > 1$ and $1 < f_{k-1} < n$ and $1 < g_{\ell-1} < n$.

**Case 1**: $f_{k-1} = g_{\ell-1}$

Define this shared value as $h$. Then $1 < h < n$, and by the induction hypothesis,

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} h 
\qquad 
\equiv
\qquad
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} h
$$

are equivalent up to permutation. Thus, 

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} h \longrightarrow n
\qquad 
\equiv
\qquad
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} h \longrightarrow n
$$

are also equivalent up to permutation.

**Case 2**: $f_{k-1} \neq g_{\ell-1}$

Let $f = f_{k-1}$ and $g = g_{\ell-1}$. Let $p = \frac{n}{f}$ and $q = \frac{n}{g}$ which are prime by definition of a composition series. Also notice $p \neq q$ since $f \neq g$. Thus, we now have the following composition series.

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f \overset{\times p}{\longrightarrow} n 
$$

and

$$
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} g \overset{\times q}{\longrightarrow} n 
$$ 

Let $d = \gcd(f, g)$. Since $d < n$, by the induction hypothesis it has a unique composition series. Note that if $d = 1$, tthen the composition series is technically just $1$ (i.e. $t = 0$), but the argument still holds.

$$
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d
$$

Now I make the following **claim** (which I prove afterwards).

$$
\frac{f}{d} = q
\quad
\text{and}
\quad
\frac{g}{d} = p
$$

Now construct the following composition series which are equivalent

$$
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d \overset{\times q}{\longrightarrow} f \overset{\times p}{\longrightarrow} n 
\qquad
\equiv
\qquad
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d \overset{\times p}{\longrightarrow} g \overset{\times q}{\longrightarrow} n 
$$

since all we have done is permute the quotients $p$ and $q$ in the last two factors.

Now to show that these are equivalent to the original series. Since $f < n$ and $g < n$, by the induction hypothesis, these composition series are equivalent

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f 
\qquad
\equiv
\qquad
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d \overset{\times q}{\longrightarrow} f
\\[10pt]
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} g 
\qquad
\equiv
\qquad
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d \overset{\times p}{\longrightarrow} g
$$

which implies these composition series are equivalent

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f \overset{\times p}{\longrightarrow} n
\qquad
\equiv
\qquad
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d \overset{\times q}{\longrightarrow} f \overset{\times p}{\longrightarrow} n
\\[10pt]
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} g \overset{\times q}{\longrightarrow} n
\qquad
\equiv
\qquad
1 \hspace{0.25cm}\overset{d_0, \; \ldots, \; d_{t}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} d \overset{\times p}{\longrightarrow} g \overset{\times q}{\longrightarrow} n
$$

Finally, the argument above showed the two right-hand side composition series are equivalent, which implies the original composition series are equivalent

$$
1 \hspace{0.25cm}\overset{f_0, \; \ldots, \; f_{k-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} f \overset{\times p}{\longrightarrow} n
\qquad
\equiv
\qquad
1 \hspace{0.25cm}\overset{g_0, \; \ldots, \; g_{\ell-1}}{\xrightarrow{\hspace{1.5cm}}}\hspace{0.25cm} g \overset{\times q}{\longrightarrow} n
$$

as desired.

### Justification of Claim

We need to justify the claim in the induction step that 

$$
\frac{f}{d} = q
\quad
\text{and}
\quad
\frac{g}{d} = p
$$

#### Lemma Statement

Suppose $a$ and $b$ are positive integers such that $\gcd(a, b) = 1$. Suppose $p$ and $q$ are _distinct_ primes ($p \neq q$). Then 

$$
ap = bq
\qquad
\implies
\qquad
a = q 
\quad
\text{and} 
\quad
b = p
$$

#### Proof of Lemma

First note that $a \neq 1$ and $b \neq 1$. Why? If $a = 1$, then $p = bq$ implies $p \mid q$, but since $p$ and $q$ are prime it must be that $p = q$. But we assumed $p$ and $q$ were distinct.

Since $ap = bq$ and $p$ is an integer, we have $a \mid bq$. By [Euclid's Lemma](https://en.wikipedia.org/wiki/Euclid's_lemma), either $a \mid b$ or $a \mid q$. Since $a$ and $b$ are coprime and $a \neq 1$, $a \nmid b$. Therefore, $a \mid q$, but $q$ is prime. Thus, $a = q$.

The parallel argument will show that $b = p$.

#### Proof of Claim

Per the construction in the original proof

$$
n = fp = gq
$$

where $p$ and $q$ are distinct primes by hypothesis. Let $d = \gcd(f, g)$. This implies the following

$$
d \mid f
\quad
,
\quad
d \mid g
\quad
,
\quad
\gcd(\tfrac{f}{d}, \tfrac{g}{d}) = 1
$$

Now consider

$$
\frac{f}{d}p = \frac{g}{d}q
$$

Thus, by our lemma

$$
\frac{f}{d} = q
\quad
\text{and}
\quad
\frac{g}{d} = p
$$

---

## Analogy to the Jordan-H&ouml;lder Theorem

The idea of a composition series comes from group theory. In particular, if $G$ is a finite group, then a composition series of $G$ is

$$
1 = N_0 \trianglelefteq N_1 \trianglelefteq \ldots \trianglelefteq N_k = G
$$

where each $N_{i}$ is **normal** in $N_{i+1}$, and each quotient group $N_{i+1} / {N_i}$ is **simple**.

The Jordan-H&ouml;lder Theorem for finite groups says that every finite group $G$ has a **unique composition series** up to permutation and isomorphism of the quotient groups.

Without writing the entirety of the proof of the Jordan-H&ouml;lder Theorem, I think it's interesting to see the equivalences between the objects in both proofs.

$$
\begin{align}
N \trianglelefteq G 
\qquad
&\iff
\qquad
f \mid n

\\[15pt]

G / N \text{ is simple}
\qquad
&\iff
\qquad
\frac{n}{f} \text{ is prime}

\\[15pt]

M \trianglelefteq G 
\qquad
&\iff
\qquad
g \mid n

\\[15pt]

G / M \text{ is simple}
\qquad
&\iff
\qquad
\frac{n}{g} \text{ is prime}

\\[15pt]

N \cap M
\qquad
&\iff
\qquad
\gcd(f, g)

\\[15pt]

NM = G
\qquad
&\iff
\qquad
\frac{fg}{\gcd(f, g)} = n

\\[15pt]

G/M \cong N/(N \cap M)
\qquad
&\iff
\qquad
\frac{n}{g} = \frac{f}{\gcd(f, g)} 

\\[15pt]

G/N \cong M/(N \cap M)
\qquad
&\iff
\qquad
\frac{n}{f} = \frac{g}{\gcd(f, g)} 
\end{align}
$$

This one-to-one analogy is no accident. It turns out the category of divisors of an integer is isomorphic to the category of subgroups of cyclic groups. If we replace $N$ and $M$ with subgroups of the cyclic group of order $n$, then the above correspondences become readily apparent. I further explore this correspondence in [this post](/blog/a-category-theory-proof-of-FTA).