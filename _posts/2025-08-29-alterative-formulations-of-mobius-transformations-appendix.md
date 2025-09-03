---
layout:     post
title:      "Alterative Formulations of Möbius Transformation - Appendix"
date:       2025-08-29
categories: blog
permalink:  ":categories/:title/"
standalone: true
appendix:   true
tags:       complex analysis, mobius transformations, möbius transformations, fractional linear transformations, fixed points
---

Appendix to post [Alterative Formulations of Möbius Transformation](/blog/alterative-formulations-of-mobius-transformations/).

---

## Möbius Transformations are Uniquely Defined by the Mapping of 3 Distinct Points

Given distinct inputs $$z_1, z_2, z_3 \in \mathbb{C}^*$$ and distinct outputs $$w_1, w_2, w_3 \in \mathbb{C}^*$$, the **cross ratio** is defined as the following map.

$$
[z, z_1; z_2, z_3] = \begin{cases}
    \left . \dfrac{z - z_2}{z - z_3} \middle / \dfrac{z_1 - z_2}{z_1 - z_3}  \right .   \qquad &\text{if } z_1, z_2, z_3 \neq \infty \\[10pt]
    \dfrac{z - z_2}{z - z_3}    \qquad &\text{if } z_1 = \infty \\[10pt]
    \dfrac{z_1 - z_3}{z - z_3}    \qquad &\text{if } z_2 = \infty \\[10pt]
    \dfrac{z - z_2}{z_1 - z_2}    \qquad &\text{if } z_3 = \infty
\end{cases}
$$

This is a special case of a Möbius transformation, which maps $(z_1, z_2, z_3) \mapsto (1, 0, \infty)$. Convince yourself that this is true. 

First, given distinct inputs $$z_1, z_2, z_3 \in \mathbb{C}^*$$ and distinct outputs $$w_1, w_2, w_3 \in \mathbb{C}^*$$, we want to construct a Möbius transformation $T$ such that $T(z_1) = w_1, \  T(z_2) = w_2, \ \text{and} \ T(z_3) = w_3$. This is elegantly done using the cross ratio.

$$
[w, w_1; w_2, w_3] = [z, z_1; z_2, z_3]
$$

For example, on pair $(z_1, w_1)$ both the left- and right-hand side resolve to $1$. As an exercise, show that this can be reduced to the standard Möbius form of $w = \frac{az + b}{cz + d}$.

Now, we want to show that this map is unique. Suppose there exists two maps, $T$ and $S$ such that both map $(z_1, z_2, z_3) \mapsto (w_1, w_2, w_3)$. Then we can do the following.

$$
(z_1, z_2, z_3) \underset{T}{\mapsto} (w_1, w_2, w_3) \underset{S^{-1}}{\mapsto} (z_1, z_2, z_3)
$$

Therefore, $(S^{-1} \circ T)$ is a map with $3$ fixed points, which means it must be the identity map by our case $3$ result, i.e. 

$$
S^{-1}(T(z)) = z \quad\implies\quad T(z) = S(z)
$$

Therefore, $T$ is unique.

---

## Case 1 Fixed Point Conversion

Recall that the fixed points are the roots of $z^2 - \left(\frac{a - d}{c} \right)z - \frac{b}{c} = 0$. If there is only $1$ fixed point $p$, then $0 = (z - p)^2 = z^2 - 2p + p^2$. Comparing coefficients, we get.

$$
p = \frac{a - d}{2c} \qquad p^2 = -\frac{b}{c}
$$

these are equivalent since we are assuming $(a - d)^2 + 4bc = 0$, but we will see the $p^2$ relation comes in handy later.

Also recall the formula for the Steiner net with 1 fixed point. With some algebra we can convert it into standard Möbius form.

$$
\dfrac{1}{w - p} = \dfrac{1}{z - p} + k
\qquad
\implies
\qquad
w = \frac{(1 + kp)z - kp^2}{kz + (1 - kp)}
$$

We have to be careful. It's temping to compare coefficients with $w = \frac{az + b}{cz + d}$ and conclude that $k = c$, etc. This is not correct. The correct thing to compare it to $w = \frac{(\lambda a) z + (\lambda b)}{(\lambda c) z + (\lambda d)}$. So our goal is to find a $k$ such that everything reduces to the same multiples of $a, b, c, \text{and }, d$.

I will assert that.

$$
k = \frac{1}{cp + d} = \frac{2c}{a + d} \qquad\text{and}\qquad \lambda = \frac{k}{c}
$$

Let's prove this term-by-term.

$$
\begin{align}
    1 + kp &= 1 + \left( \frac{2c}{a + d} \right) \left( \frac{a - d}{2c} \right) = 1 + \frac{a - d}{a + d} = \frac{2a}{a + d} = \tfrac{k}{c} \cdot a \\[10pt]
    -k p^2 &= - k \left (- \frac{b}{c} \right) = \tfrac{k}{c} \cdot b \\[10pt]
    k &= \tfrac{k}{c} \cdot c \\[10pt]
    1 - kp &= 1 - \left( \frac{2c}{a + d} \right) \left( \frac{a - d}{2c} \right) = 1 - \frac{a - d}{a + d} = \frac{2d}{a + d} = \tfrac{k}{c} \cdot d
\end{align}
$$

Therefore for the appropriate values of $k$ and $\lambda$

$$
w = \frac{(1 + kp)z - kz^2}{kz + (1 - kp)} = \frac{(\lambda a) z + (\lambda b)}{(\lambda c) z + (\lambda d)} = \frac{az + b}{cz + d}
$$

and we have found 1-to-1 conversion between the two different forms.

---

## Case 2 Fixed Point Conversion

This is essentially the same as case 1, but much more complicated algebra.

Just as before, the fixed points are the roots of $z^2 - \left(\frac{a - d}{c} \right)z - \frac{b}{c} = 0$. If there are $2$ fixed points $p_1$ and $p_2$, then $0 = (z - p_1)(z - p_2) = z^2 - (p_1 + p_2) + p_1p_2$. Comparing coefficients, we get.

$$
p_1 + p_2 = \frac{a - d}{c} \qquad p_1 \cdot p_2 = -\frac{b}{c}
$$

Using the quadratic formula, we can get an explicit formula for $p_1$ and $p_2$.

$$
p_1, p_2 = \frac{(a - d) \pm \sqrt{(a-d)^2 + 4bc}}{2c} \qquad \text{s.t.} \quad (a-d)^2 + 4bc \neq 0
$$

Recall the formula for the Steiner net with 2 fixed points. With some algebra we can convert it into standard Möbius form.

$$
\dfrac{w - p_1}{w - p_2} = k \dfrac{z - p_1}{z - p_2}
\qquad
\implies
\qquad
w = \frac{(p_1 - kp_2)z - (1-k)p_1p_2}{(k-1)z + (p_2 - kp_1)}
$$

Again, we are trying to find a $k$ such that the equation can be reduced to $w = \frac{(\lambda a) z + (\lambda b)}{(\lambda c) z + (\lambda d)}$ for some $\lambda$. I assert the following.

$$
k = \frac{cp_2 + d}{cp_1 + d} = \dfrac{(a + d) - \sqrt{(a-d)^2 + 4bc}}{(a + d) + \sqrt{(a-d)^2 + 4bc}}
\qquad\qquad
\lambda = \frac{1 - k}{c}
$$

Before we get into the proof, I first want to prove some intermediary results. For convenience, let's define

$$
g_1 = cp_1 + d \qquad g_2 = cp_2 + d \quad\implies\quad k = \frac{g_2}{g_1}
$$

Now consider the following

$$
\begin{align}
    &g_1 + g_2 = c(p_1 + p_2) + 2d = c \cdot \left( \frac{a - d}{c} \right) + 2d = a + d \\[10pt]
    &g_1 \cdot g_2 = c^2p_1p_2 + cd(p_1 + p_2) + d^2 = c^2 \left( -\frac{b}{c} \right) + cd \left( \frac{a - d}{c} \right) + d^2 = ad - bc
\end{align}
$$

The first term is by far the most complex

$$
\begin{align}
    p_1 - kp_2
    &= \left ( \tfrac{g_1 - d}{c} \right ) - \left ( \tfrac{g_2}{g_1} \right ) \left ( \tfrac{g_2 - d}{c} \right ) \\[10pt]
    &= \frac{1}{c g_1} \left ( -g_2^2 + dg_2 + g_1^2 - dg_1 \right ) \\[10pt]
    &= \frac{1}{c g_1} \left ( (g_1^2 - g_2^2) - d(g_1 - g_2) \right ) \\[10pt]
    &= \frac{1}{c g_1} (g_1 - g_2) \left ( (g_1 + g_2) - d \right ) \\[10pt]
    &= \frac{1}{c g_1} (g_1 - g_2) \cdot a \\[10pt]
    &= \frac{a}{c} \left( 1 - \tfrac{g_2}{g_1} \right) \\[10pt]
    &= \frac{a}{c} \left( 1 - \tfrac{g_2}{g_1} \right) \\[10pt]
    &= \tfrac{1 - k}{c} \cdot a
\end{align}
$$

The next few are more straight-forward

$$
\begin{align}
    -(1-k)p_1p_2 &= -(1-k) \left( -\frac{b}{c} \right) = \tfrac{1 - k}{c} \cdot b \\[10pt]
    1-k &= \tfrac{1 - k}{c} \cdot c \\[10pt]
    p_2 - kp_1 &= \left ( \tfrac{g_2 - d}{c} \right ) - \left ( \tfrac{g_2}{g_1} \right ) \left ( \tfrac{g_1 - d}{c} \right ) = - \frac{d}{c} \left( 1 - \tfrac{g_2}{g_1} \right) = \tfrac{1 - k}{c} \cdot d
\end{align}
$$

Therefore for the appropriate values of $k$ and $\lambda$

$$
w = \frac{(p_1 - kp_2)z - (1-k)p_1p_2}{(k-1)z + (p_2 - kp_1)} = \frac{(\lambda a) z + (\lambda b)}{(\lambda c) z + (\lambda d)} = \frac{az + b}{cz + d}
$$

and we have found 1-to-1 conversion between the two different forms.