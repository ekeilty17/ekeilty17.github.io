---
layout:     series
title:      "Multiplication"
date:       2022-10-04
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       3
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, scalar-multiplication, function multiplication
---

Now things get more complicated. For this post, assume that $f$ and $g$ are functions whose limits exist at $a \in \mathbb{R}$. Let $L, M \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$ and $\displaystyle \lim_{x \rightarrow a} g(x) = M$. Therefore, by the definition of limits, we have

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon_f
$$

$$
\forall \epsilon_g > 0 \quad \exists \delta_g > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_g \implies \lvert g(x) - M \rvert < \epsilon_g
$$

<br>

## Scalar Multiplication

Let $c \in \mathbb{R}$. We wish to show that 

$$
\lim_{x \rightarrow a} (c \cdot f(x)) = c \cdot L
$$

<br>

If $c = 0$, then $\displaystyle \lim_{x \rightarrow a} 0 = 0$, since $0$ is a constant.

<br>

If $c \neq 0$, then fix any $\epsilon > 0$. In the limit definition of $f(x)$ we fix a particular $\epsilon_f = \frac{\epsilon}{\lvert c \rvert}$. Therefore, 

$$
\exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \frac{\epsilon}{\lvert c \rvert}
$$

Let $\delta = \delta_f$. Therefore

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert < \frac{\epsilon}{\lvert c \rvert} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert c \rvert \cdot \lvert f(x) - L \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert (c \cdot f(x)) - (c \cdot L) \rvert < \epsilon
\end{align}
$$

which proves the result. 

<br>

Written in a more general notation, we have the scalar multiplication law of limits.

$$
\lim_{x \rightarrow a} (c \cdot f(x)) = c \cdot \left ( \lim_{x \rightarrow a} f(x) \right )
$$


<br>


## Function Multiplication

We wish to show that 

$$
\lim_{x \rightarrow a} (f(x) \cdot g(x)) = L \cdot M
$$


Fix any $\epsilon > 0$. In the limit definitions of $f(x)$ and $g(x)$ we fix a particular $\epsilon_{f_1} = \epsilon_{g_1} = \sqrt{\frac{\epsilon}{3}}$. Also, fix particular $\epsilon_{f_2} = \frac{\epsilon}{3 \lvert L \rvert}$ and $\epsilon_{g_2} = \frac{\epsilon}{3 \lvert M \rvert}$. Therefore, we have these four independent statements.

$$
\exists \delta_{f_1} > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_{f_1} \implies \lvert f(x) - L \rvert < \sqrt{\frac{\epsilon}{3}}
$$

$$
\exists \delta_{f_2} > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_{f_2} \implies \lvert f(x) - L \rvert < \frac{\epsilon}{3 \lvert L \rvert}
$$

$$
\exists \delta_{g_1} > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_{g_1} \implies \lvert g(x) - M \rvert < \sqrt{\frac{\epsilon}{3}}
$$

$$
\exists \delta_{g_2} > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_{g_2} \implies \lvert g(x) - M \rvert < \frac{\epsilon}{3 \lvert M \rvert}
$$

<br>

To make the main proof shorter, I will prove this step separately.

$$
\begin{align}
    f(x) \cdot g(x) - L \cdot M
    &= (f(x) \cdot g(x) - L \cdot M) + (f(x) \cdot M - f(x) \cdot M) + (L \cdot g(x) - L \cdot g(x)) + (L \cdot M - L \cdot M) \\[10pt]
    &= (f(x) \cdot g(x) - f(x) \cdot M - L \cdot g(x) + L \cdot M) + (f(x) \cdot M - L \cdot M) + (L \cdot g(x) - L \cdot M) \\[10pt]
    &= (f(x) - L) \cdot (g(x) - M) + (f(x) - L) \cdot M + L \cdot (g(x) - M)
\end{align}
$$

<br>

Now, let $\delta = \min(\delta_{f_1}, \delta_{f_2}, \delta_{g_1}, \delta_{g_2})$. Therefore,

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert < \sqrt{\frac{\epsilon}{3}}, \ \frac{\epsilon}{3 \lvert L \rvert} \quad\text{and}\quad  \lvert g(x) - M \rvert < \sqrt{\frac{\epsilon}{3}}, \ \frac{\epsilon}{3 \lvert M \rvert} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert \cdot \lvert g(x) - M \rvert + \lvert f(x) - L \rvert \cdot \lvert M \rvert + \lvert L \rvert \cdot \lvert g(x) - M \rvert < \sqrt{\frac{\epsilon}{3}} \cdot \sqrt{\frac{\epsilon}{3}} + \lvert L \rvert \cdot \frac{\epsilon}{3 \lvert L \rvert} + \lvert M \rvert \cdot \frac{\epsilon}{3 \lvert M \rvert} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) - L \rvert \cdot \lvert g(x) - M \rvert + \lvert f(x) - L \rvert \cdot \lvert M \rvert + \lvert L \rvert \cdot \lvert g(x) - M \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert (f(x) - L) \cdot (g(x) - M) + (f(x) - L) \cdot M + L \cdot (g(x) - M) \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad 0 < \lvert x - a \rvert < \delta \quad \implies \quad \lvert f(x) \cdot g(x) - L \cdot M \rvert < \epsilon
\end{align}
$$

which proves the result. 

<br>

Written in a more general notation, we have the multiplication law of limits.

$$
\lim_{x \rightarrow a} (f(x) \cdot g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) \cdot \left ( \lim_{x \rightarrow a} g(x) \right )
$$

<br>

Side note, let $f(x) = c$ be a constant function, and this gives an alternative proof for the scalar multiplication law.