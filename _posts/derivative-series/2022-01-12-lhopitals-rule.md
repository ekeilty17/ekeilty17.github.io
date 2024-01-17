---
layout:     series
title:      "L'H&ocirc;pital's Rule"
date:       2022-01-12
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       11
series:     derivative-proofs
tags:       derivatives, lhopitals-rule
---

If the result of direct substitution does not yield enough information to determine a limit, then we say it is an **indeterminant form**. The following are examples of indeterminant forms.

$$
\frac{0}{0} \qquad \frac{\infty}{\infty} \qquad 0 \cdot \infty \qquad \infty - \infty \qquad 0^0 \qquad 1^{\infty} \qquad \infty^0
$$

<br>

Suppose $f$ and $g$ are differentiable functions on an open interval containing $$a \in \mathbb{R} \cup \{ - \infty, \infty \}$$. Then **L'H&ocirc;pital's Rule** states that if $\displaystyle \lim_{x \rightarrow a} \frac{f(x)}{g(x)}$ is indeterminant, and $\displaystyle \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)} = \frac{f'(a)}{g'(a)}$ exists and is not indeterminant, then

$$
\lim_{x \rightarrow a} \frac{f(x)}{g(x)} = \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)}
$$

<br>

## Proof

There are only two possible indeterminant forms: $\frac{0}{0}$ and $\pm \frac{\infty}{\infty}$. Thus, again without loss of generality, we can assume that $f(a) = g(a) = 0$. If instead, $f(a) = g(a) = \pm \infty$, we consider $F(x) = \frac{1}{f(x)}$ and $G(x) = \frac{1}{g(x)}$. Now the proof is the same.

<br>

First, I want to explain the meaning of $\displaystyle \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)} = \frac{f'(a)}{g'(a)}$. You have to be careful with equality and limits. A limit is only defined to equal a value **if** the limit exists. This is why we need the two assumptions that $\displaystyle \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)}$ exists and $\displaystyle \frac{f'(a)}{g'(a)}$ is not indeterminant.

$$
\begin{align}
    \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)} 
    &= \frac{f'(a)}{g'(a)} \\[10pt]
    &= \frac{\lim_{x \rightarrow a} \frac{f(x) - f(a)}{x-a}}{\lim_{x \rightarrow a} \frac{g(x) - g(a)}{x-a}} \\[10pt]
    &= \lim_{x \rightarrow a} \frac{\frac{f(x) - f(a)}{x-a}}{\frac{g(x) - g(a)}{x-a}} \\[10pt]
    &= \lim_{x \rightarrow a} \frac{f(x) - f(a)}{g(x) - g(a)} \\[10pt]
    &= \lim_{x \rightarrow a} \frac{f(x) - 0}{g(x) - 0} \\[10pt]
    &= \lim_{x \rightarrow a} \frac{f(x)}{g(x)}
\end{align}
$$

Therefore,

$$
\lim_{x \rightarrow a} \frac{f(x)}{g(x)} = \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)}
$$

<br>

<!-- **TODO** The above proof is messy because I need the assume the RHS is not an indeterminate form. Ideally, all I need to assume is that the limit exists.  -->

<br>

## Corollary

Suppose $\displaystyle \lim_{x \rightarrow a} \frac{f(x)}{g(x)}, \ \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)}, \ \lim_{x \rightarrow a} \frac{f''(x)}{g''(x)}, \ \ldots, \ \lim_{x \rightarrow a} \frac{f^{(n-1)}(x)}{g^{(n-1)}(x)}$ are indeterminant, and $\displaystyle \lim_{x \rightarrow a} \frac{f^{(n)}(x)}{g^{(n)}(x)} = \frac{f^{(n)}(a)}{g^{(n)}(a)}$ exists and is not indeterminant. Then

$$
\lim_{x \rightarrow a} \frac{f(x)}{g(x)} = \lim_{x \rightarrow a} \frac{f'(x)}{g'(x)} = \lim_{x \rightarrow a} \frac{f{'}{'}(x)}{g{'}{'}(x)} = \ldots = \lim_{x \rightarrow a} \frac{f^{(n-1)}(x)}{g^{(n-1)}(x)} = \lim_{x \rightarrow a} \frac{f^{(n)}(x)}{g^{(n)}(x)}
$$

i.e. we can successively take derivatives until we arrive at a non-indeterminant form. Note that here equality is well-defined because all limits exist.

<br> 

We prove this by reverse induction on $n$.

**Base Case**:  By assumption $\displaystyle \lim_{x \rightarrow a} \frac{f^{(n)}(x)}{g^{(n)}(x)} = \frac{f^{(n)}(a)}{g^{(n)}(a)}$ exists and is not indeterminant.

**Induction Hypothesis**: Assume that $\displaystyle \lim_{x \rightarrow a} \frac{f^{(k)}(x)}{g^{(k)}(x)} = \frac{f^{(n)}(a)}{g^{(n)}(a)}$, for some $0 < k < n$

**Induction Step**: Since $\displaystyle \lim_{x \rightarrow a} \frac{f^{(k)}(x)}{g^{(k)}(x)}$ exists, we can apply L'H&ocirc;pital's Rule to 

$$
\begin{align}
    \lim_{x \rightarrow a} \frac{f^{(k)}(x)}{g^{(k)}(x)} 
    &= \frac{f^{(n)}(a)}{g^{(n)}(a)} \\[10pt]
\end{align}
$$

get $\displaystyle \lim_{x \rightarrow a} \frac{f^{(k-1)}(x)}{g^{(k-1)}(x)} = \lim_{x \rightarrow a} \frac{f^{(k)}(x)}{g^{(k)}(x)}$. Therefore, by the induction hypothesis, we have proved the result.