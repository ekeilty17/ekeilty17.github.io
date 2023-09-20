---
layout:     series
title:      "Inverse Functions"
date:       2022-10-08
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       7
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, inverse, inverse-functions
---

Suppose that limit of $f$ exists at $a \in \mathbb{R}$. Let $L \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$. Therefore, by the definition of limits, we have

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon_f
$$

<br>

Suppose $f$ has a well-defined inverse function $f^{-1}$ such that $f^{-1}(f(x)) = x$ and $f(f^{-1}(y)) = y$. We want to determine when

$$
\lim_{y \rightarrow L} f^{-1}(y) = a
$$

In the limit form, this is 

$$
\forall \epsilon_{f^{-1}} > 0 \quad \exists \delta_{f^{-1}} > 0 \quad \text{s.t.} \quad 0 < \lvert y - L \rvert < \delta_{f^{-1}} \implies \lvert f^{-1}(y) - a \rvert < \epsilon_{f^{-1}}
$$


<br>


## Continuous Functions

If a function $f$ is continuous, then we can use the composition limit law to easily prove the result.

$$
\begin{align}
    &\lim_{y \rightarrow L} f(f^{-1}(y)) = \lim_{y \rightarrow L} y \\[10pt]
    &\lim_{y \rightarrow L} f(f^{-1}(y)) = L \\[10pt]
    &f \left ( \lim_{y \rightarrow L} f^{-1}(y) \right ) = L \\[10pt]
    &\lim_{y \rightarrow L} f^{-1}(y) = f^{-1}( L ) \\[10pt]
\end{align}
$$

<br>

Therefore, $f^{-1}$ is continuous. Furthermore, we can show that $f^{-1}(L) = a$, thus proving the result.

$$
\begin{align}
    &\lim_{x \rightarrow a} f^{-1}(f(x)) = \lim_{x \rightarrow a} x \\[10pt]
    &\lim_{x \rightarrow a} f^{-1}(f(x)) = a \\[10pt]
    &f^{-1} \left ( \lim_{x \rightarrow a} f(x) \right ) = a \\[10pt]
    &f^{-1}(L) = a
\end{align}
$$


<br>



## General Counter-Example



Assume that $f$ is a function whose limits exist at $a \in \mathbb{R}$. Let $L \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$. Therefore, by the definition of limits, we have

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon_f
$$

Suppose $f(x)$ has an inverse function $f^{-1}(x)$, i.e. $f(f^{-1}(x)) = f^{-1}(f(x)) = x$. We wish to show that

$$
\lim_{y \rightarrow L} f^{-1}(y) = a
$$

Fix any $\epsilon > 0$. In the limit definitions of $f(x)$ we fix particular $\epsilon_f = \epsilon$. Therefore, we have

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert y - L \rvert < \delta \quad \implies \quad \lvert f^{-1}(y) - a \rvert < \epsilon \\[10pt]
\end{align}
$$


<br>


## Strictly Monotonic Functions

Suppose $f$ is strictly monotonically increasing. This means that the following property holds

$$
x_1 < x_2 \implies f(x_1) < f(x_2)
$$

You can think of it as the function preserves strict inequalities.