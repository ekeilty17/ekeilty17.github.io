---
layout:     series
title:      "Polynomials"
date:       2022-10-08
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       7
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, polynomials
---

## Linear Functions

We want to show that

$$
\lim_{x \rightarrow a} x = a
$$

Fix any $\epsilon > 0$ and assume $\lvert x - a \rvert$. Let $\delta = \epsilon$. Therefore

$$
\lvert f(x) - a \rvert = \lvert x - a \rvert < \epsilon = \delta
$$

which proves the result.

<br>

## Monomials

Given $n \in \mathbb{N}$, we want to show that

$$
\lim_{x \rightarrow a} x^n = a^n
$$

which means $f(x) = x^n$ is continuous for all $a \in \mathbb{R}$

We do this via induction on $n$.

**Base Case**: 
- If $n = 0$, then by the constant limit rule, we have $\displaystyle \lim_{x \rightarrow a} x^0 = \lim_{x \rightarrow a} 1 = 1 = a^0$
- If $n = 1$, then we use the proof that linear functions are continuous, therefore $\displaystyle \lim_{x \rightarrow a} x^1 = a^1$

**Induction Hypothesis**: Suppose $\displaystyle \lim_{x \rightarrow a} x^n = a^n$

**Induction Step** We wish to show that $\displaystyle \lim_{x \rightarrow a} x^{n+1} = a^{n+1}$

We do this using the multiplication limit law.

$$
\begin{align}
    \lim_{x \rightarrow a} x^{n+1} 
    &= \lim_{x \rightarrow a} (x \cdot x^n)\\[10pt]
    &= \left ( \lim_{x \rightarrow a} x \right ) \cdot \left ( \lim_{x \rightarrow a} x^n \right )\\[10pt]
    &= \left ( a \right ) \cdot \left ( a^n \right )\\[10pt]
    &= a^{n+1}
\end{align}
$$

Therefore, all monomials are continuous for all $a \in \mathbb{R}$

<br>

## Polynomials

This is an application of the linearity of the limit operation.

$$
\begin{align}
    \lim_{x \rightarrow a} \left ( \sum_{k=1}^n \lambda_k x^k  \right )
    = \sum_{k=1}^n \lambda_k \left ( \lim_{x \rightarrow a} x^k \right )
    = \sum_{k=1}^n \lambda_k a^k
\end{align}
$$

Therefore, all polynomials are continuous for all $a \in \mathbb{R}$

<br>

## Constant Exponentiation

Recall the composition limit law

$$
\lim_{x \rightarrow a} g(f(x)) = g \left ( \lim_{x \rightarrow a} f(x) \right )
$$

In particular, let $g(x) = x^n$ be a monomial, and therefore a continuous function. This gives the exponentiation limit law

$$
\lim_{x \rightarrow a} (f(x))^n = \left ( \lim_{x \rightarrow a} f(x) \right )^n
$$