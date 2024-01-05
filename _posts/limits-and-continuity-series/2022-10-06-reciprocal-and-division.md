---
layout:     series
title:      "Reciprocal and Division"
date:       2022-10-06
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       5
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, multiplication, reciprocal, division
---

For this post, assume that $f$ is a function whose limits exist at $a \in \mathbb{R}$. Let $L \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$. Therefore, by the definition of limits, we have

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon_f
$$

<br>


## Reciprocal

We wish to show that 

$$
\lim_{x \rightarrow a} \frac{1}{f(x)} = \frac{1}{L}
$$

Fix any $\epsilon > 0$. In the limit definitions of $f(x)$ we fix a particular $\epsilon_{f_1} =  \frac{\lvert L \rvert^2 \epsilon}{2}$ and $\epsilon_{f_2} = \frac{\lvert L \rvert}{2}$. Therefore, we have 

$$
\exists \delta_{f_1} > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_{f_1} \implies \lvert f(x) - L \rvert < \frac{\lvert L \rvert^2 \epsilon}{2}
$$

$$
\exists \delta_{f_2} > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_{f_2} \implies \lvert f(x) - L \rvert < \frac{\lvert L \rvert}{2}
$$

<br>

From the second formula, we can use the bounding inequality from the [introductory post](/blog/limits-and-continuity/introduction).

$$
\begin{align}
    \lvert L \rvert - \epsilon_{f_2} <&& \lvert f(x) \rvert \quad&< \lvert L \rvert + \epsilon_{f_2} \\[10pt]
    \lvert L \rvert - \frac{\lvert L \rvert}{2} <&& \lvert f(x) \rvert \quad&< \lvert L \rvert + \frac{\lvert L \rvert}{2} \\[10pt]
    \frac{\lvert L \rvert}{2} <&& \lvert f(x) \rvert \quad&< \frac{3 \lvert L \rvert}{2} \\[10pt]
    \frac{2}{3\lvert L \rvert} <&& \frac{1}{\lvert f(x) \rvert} \quad&< \frac{2}{\lvert L \rvert}
\end{align}
$$

<br>

Now, let $\delta = \min(\delta_{f_1}, \delta_{f_2})$. Therefore,

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert < \frac{\lvert L \rvert^2 \epsilon}{2} \quad\text{and}\quad  \frac{1}{\lvert f(x) \rvert} < \frac{2}{\lvert L \rvert} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert \cdot \frac{1}{\lvert f(x) \rvert} \cdot \frac{1}{\lvert L \rvert} < \frac{\lvert L \rvert^2 \epsilon}{2} \cdot \frac{2}{\lvert L \rvert} \cdot \frac{1}{\lvert L \rvert} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert \cdot \frac{1}{\lvert f(x) \rvert} \cdot \frac{1}{\lvert L \rvert} < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \frac{f(x) - L}{f(x) \cdot L} \right \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \frac{L - f(x)}{f(x) \cdot L} \right \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \frac{1}{f(x)} - \frac{1}{L} \right \rvert < \epsilon
\end{align}
$$

which proves the result. 

<br>

Written in a more general notation, we have the reciprocal law of limits.

$$
\lim_{x \rightarrow a} \frac{1}{f(x)} = \frac{1}{\displaystyle \lim_{x \rightarrow a} f(x)}
$$

<br>

## Division

Combining the multiplication law and the reciprocal law gives the general division law of limits.

$$
\begin{align}
    \lim_{x \rightarrow a} \frac{f(x)}{g(x)}
    &= \lim_{x \rightarrow a} \left ( f(x) \cdot \frac{1}{g(x)} \right )\\[10pt]
    &= \left ( \lim_{x \rightarrow a} f(x) \right ) \cdot \left ( \lim_{x \rightarrow a} \frac{1}{g(x)} \right )\\[10pt]
    &= \left ( \lim_{x \rightarrow a} f(x) \right ) \cdot \left ( \frac{1}{\displaystyle \lim_{x \rightarrow a} g(x)} \right )\\[10pt]
    &= \frac{\displaystyle \lim_{x \rightarrow a} f(x)}{\displaystyle \lim_{x \rightarrow a} g(x)}
\end{align}
$$