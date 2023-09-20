---
layout:     series
title:      "Addition and Subtraction"
date:       2022-10-05
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       4
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, addition, subtraction
---

For this post, assume that $f$ and $g$ are functions whose limits exist at $a \in \mathbb{R}$. Let $L, M \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$ and $\displaystyle \lim_{x \rightarrow a} g(x) = M$. Therefore, by the definition of limits, we have

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon_f
$$

$$
\forall \epsilon_g > 0 \quad \exists \delta_g > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_g \implies \lvert g(x) - M \rvert < \epsilon_g
$$


<br>


## Scalar Addition/Subtraction

Let $c \in \mathbb{R}$. We wish to show that 

$$
\lim_{x \rightarrow a} (f(x) \pm c) = L \pm c
$$

Fix any $\epsilon > 0$. In the limit definition of $f(x)$ we fix particular $\epsilon_f = \epsilon$. Therefore, we have

$$
\exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon
$$

let $\delta = \delta_f$. Therefore, 

$$
\begin{align}
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) - L \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) \pm (c - c) - L \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert (f(x) \pm c) - (L \pm c) \rvert < \epsilon
\end{align}
$$

which proves the result. 

<br>

Written in a more general notation, we have the scalar addition/subtraction law of limits.

$$
\lim_{x \rightarrow a} (f(x) \pm c) = \left ( \lim_{x \rightarrow a} f(x) \right ) \pm c
$$


<br>


## Function Addition

We wish to show that 

$$
\lim_{x \rightarrow a} (f(x) + g(x)) = L + M
$$

Fix any $\epsilon > 0$. In the limit definitions of $f(x)$ and $g(x)$ we fix particular $\epsilon_f = \epsilon_g = \frac{\epsilon}{2}$. Therefore, we have

$$
\exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \frac{\epsilon}{2}
$$

$$
\exists \delta_g > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_g \implies \lvert g(x) - M \rvert < \frac{\epsilon}{2}
$$

Let $\delta = \min(\delta_f, \delta_g)$. Therefore, 

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert < \frac{\epsilon}{2} \quad\text{and}\quad \lvert g(x) - M \rvert < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert + \lvert g(x) - M \rvert < \frac{\epsilon}{2} + \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert + \lvert g(x) - M \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert (f(x) - L) + (g(x) - M) \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert (f(x) + g(x)) - (L + M) \rvert < \epsilon
\end{align}
$$

which proves the result. 

<br>

Written in a more general notation, we have the addition law of limits.

$$
\lim_{x \rightarrow a} (f(x) + g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) + \left ( \lim_{x \rightarrow a} g(x) \right )
$$


<br>


## Function Subtraction

We can show the subtraction law of limits using the addition and scalar multiplication limit laws.

$$
\begin{align}
    \lim_{x \rightarrow a} (f(x) - g(x)) 
    &= \lim_{x \rightarrow a} (f(x) + ((-1) \cdot g(x)))\\[10pt]
    &= \left ( \lim_{x \rightarrow a} f(x) \right ) + \left ( \lim_{x \rightarrow a} (-1) \cdot g(x) \right )\\[10pt]
    &= \left ( \lim_{x \rightarrow a} f(x) \right ) + (-1) \cdot \left ( \lim_{x \rightarrow a} g(x) \right )\\[10pt]
    &= \left ( \lim_{x \rightarrow a} f(x) \right ) - \left ( \lim_{x \rightarrow a} g(x) \right )
\end{align}
$$

<br>

## Linearity

Combining the addition, subtraction, and scalar multiplication laws, we have shown that limits are a linear operation. Let $f$ and $g$ be functions and $\alpha, \beta \in \mathbb{R}$ be constants, then 

$$
\lim_{x \rightarrow a} (\alpha f(x) + \beta g(x))  = \alpha \left ( \lim_{x \rightarrow a} f(x) \right ) + \beta \left ( \lim_{x \rightarrow a} g(x) \right )
$$

<br>

Note, this gives an alternative proof for the scalar addition/subtraction. Let $\alpha = 1$, $\beta = \pm 1$, and $g(x) = c$.