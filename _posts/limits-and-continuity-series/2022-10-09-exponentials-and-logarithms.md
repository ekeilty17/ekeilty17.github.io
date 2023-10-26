---
layout:     series
title:      "Exponentials and Logarithms"
date:       2022-10-09
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       8
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, logarithms, exponentials
---

**TODO**

The tricky part of proving $\displaystyle \lim_{x \rightarrow a} e^x = e^a$ is to void circularity. Maybe people try to use the natural log in the proof, but often implicitly assume the continuity of $\ln$, which is what we are trying to prove in the first place.

I can't take full credit for this proof. This is heavily adapted from a community effort in this <a href="https://math.stackexchange.com/questions/4211777/choice-of-delta-for-brute-force-proof-of-continuity-of-exponential-function" target="_blank">StackExchange post</a>. 

## Some Lemmas

In order to prove this result, we need two lemmas. The first is $e^{x + y} = e^{x} \cdot e^{y}$. This is a fundamental property of exponentials, so I leave this to real analysis textbooks for its proof. The second lemma is $e^{x} \leq 1 + x$, which I prove below.

For this series, I will use the following definition for $e^x$.

$$
e^x = \lim_{n \rightarrow \infty} \left ( 1 + \frac{x}{n} \right )^n
$$

The only reason I need to specify the definition is to prove the second lemma. Afterward, the definition is never used. Using the power series definition of $e^x$ makes the proof trivial, so I chose this definition.

**TODO** Might be an easier proof

$$
\begin{align}
    e^x &= \lim_{n \rightarrow \infty} \left ( 1 + \frac{x}{n} \right )^n \\[10pt]
    &= \lim_{n \rightarrow \infty} \sum_{k=0}^n \binom{n}{k} \left ( \frac{x}{n} \right )^k \\[10pt]
    &\leq \lim_{n \rightarrow \infty} \sum_{k=0}^1 \binom{n}{k} \left ( \frac{x}{n} \right )^k \\[10pt]
    &= \lim_{n \rightarrow \infty} \binom{n}{0} \left ( \frac{x}{n} \right )^0 + \binom{n}{1} \left ( \frac{x}{n} \right )^1 \\[10pt]
    &= \lim_{n \rightarrow \infty} 1 \cdot 1 + n \cdot \left ( \frac{x}{n} \right ) \\[10pt]
    &= \lim_{n \rightarrow \infty} 1 + x \\[10pt]
    &= 1 + x
\end{align}
$$

<br>

## Exponentials

Fix any $\epsilon > 0$. Let $\delta = \frac{1}{2} \cdot \min(1, \frac{\epsilon}{e^a})$. Therefore, we have

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert x - a \rvert < \delta \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert x - a \rvert < \frac{1}{2} \cdot \min \left ( 1, \frac{\epsilon}{e^a} \right ) \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad 2 \lvert x - a \rvert < \min \left ( 1, \frac{\epsilon}{e^a} \right ) \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \frac{(x-a)}{1 - (x-a)} \right \rvert < \min \left ( 1, \frac{\epsilon}{e^a} \right ) \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \frac{(x-a)}{1 - (x-a)} \right \rvert < \frac{\epsilon}{e^a} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert e^{x-a} - 1 \rvert < \frac{\epsilon}{e^a} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad e^a \cdot \lvert e^{x-a} - 1 \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert e^x - e^a \rvert < \epsilon
\end{align}
$$

which completes the proof. Therefore, $e^x$ is a continuous function.

<br>

## Logarithms

Since $e^x$ is a continuous function, its inverse function $\ln x$ is also continuous. Therefore

$$
\lim_{x \rightarrow a} \ln x = \ln a
$$

Furthermore, using the composition law, we have

$$
\lim_{x \rightarrow a} \ln f(x) = \ln \left ( \lim_{x \rightarrow a} f(x) \right )
$$


## General Exponentiation Law

The previous statement combined with the logarithm identity

$$
\ln (a^b) = b \cdot \ln a
$$

is a very powerful tool.

$$
\lim_{x \rightarrow a} f(x)^{g(x)} = \left ( \lim_{x \rightarrow a} f(x) \right )^{\displaystyle \left ( \lim_{x \rightarrow a} g(x) \right )}
$$

We have to be careful here that we don't get an indeterminant form. For example, 

$$
\lim_{n \rightarrow \infty} \left ( 1 + \frac{x}{n} \right )^n = \left ( \lim_{n \rightarrow \infty} \left ( 1 + \frac{x}{n} \right ) \right )^{ \lim_{n \rightarrow \infty} n} = 1^{\infty}
$$

Many naively would think that the solution is $1^{\infty} = 1$, but when dealing with limits it does not. As we know, this limit actually equals $e^x$.

## Corollaries