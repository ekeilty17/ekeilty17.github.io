---
layout:     series
title:      "Composition"
date:       2022-10-07
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       6
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, composition
---

Let $f: B \rightarrow C$ be a continuous function. This means that $\lim_{z \rightarrow b} f(z) = f(b)$ for all $b \in B$. Therefore

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert z - b \rvert < \delta_f \implies \lvert f(z) - f(b) \rvert < \epsilon_f
$$

Let $g: A \rightarrow B$ be any function (not necessarily continuous) whose limit exists at $a \in A$. Let $M \in B$ such that $\lim_{x \rightarrow a} g(x) = M$. Therefore

$$
\forall \epsilon_g > 0 \quad \exists \delta_g > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_g \implies \lvert g(x) - M \rvert < \epsilon_g
$$

<br>

We wish to show that

$$
\lim_{x \rightarrow a} f(g(x)) = f \left ( M \right )
$$

<br>

Fix any $\epsilon > 0$. In the limit definition of $f(z)$ we fix a particular $\epsilon_f = \epsilon$. Also, choose the particular $b = M$. Therefore, we have

$$
\exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert z - M \rvert < \delta_f \implies \lvert f(z) - f(M) \rvert < \epsilon
$$

Now, in the limit definition of $g(x)$ we fix a particular $\epsilon_g = \delta_f$. Therefore, we have

$$
\exists \delta_g > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_g \implies \lvert g(x) - M \rvert < \delta_f
$$

Now, let $z = g(x)$ and let $\delta = \delta_g$. Therefore

$$
\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert g(x) - M \rvert < \delta_f \implies \lvert z - M \rvert < \delta_f \implies \lvert f(z) - f(M) \rvert < \epsilon
$$

which proves the result. 

<br>

Written in a more general notation, we have the composition law of limits

$$
\lim_{x \rightarrow a} f(g(x)) = f \left ( \lim_{x \rightarrow a} g(x) \right )
$$

<br>

## Counter-Example

The composition law of limits does not hold if $f$ is not continuous. To show this, we provide a counter-example.

<br>

Suppose
&nbsp;
$$f(x) = \begin{cases} 
    0       &\quad\text{if } x \leq 0 \\
    1       &\quad\text{if } x > 0
\end{cases}$$ 
&nbsp;&nbsp;
is the unit step function, and $g(x) = x$. Then, $f(g(x)) = f(x)$

<br>

The composition law would suggest that $\displaystyle \lim_{x \rightarrow 0} f(x) = \lim_{x \rightarrow 0} f(g(x)) = f \left ( \lim_{x \rightarrow 0} g(x) \right ) = f \left ( \lim_{x \rightarrow 0} x \right ) = f(0) = 0$. However, using the definition of $\lim_{x \rightarrow 0} f(x) = 0$, we can show this leads to a contradiction.

$$
\begin{align}
    &\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - 0 \rvert < \delta \implies \lvert f(x) - 0 \rvert < \epsilon \\[10pt]
    &\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad  0 < \lvert x \rvert < \delta \implies \lvert f(x) \rvert < \epsilon
\end{align}
$$

If $\epsilon = 1$ and $0 < x < \delta$, then $\lvert f(x) \rvert = \lvert 1 \rvert = 1 \not< 1 = \epsilon$.

<br>

The issue here is that the left-handed limit and the right-handed limit do not equal. In particular

$$
\lim_{x \rightarrow 0^{-}} f(x) = 0 \quad\qquad\text{and}\qquad\quad \lim_{x \rightarrow 0^{+}} f(x) = 1
$$

This issue does not happen if the function is continuous.