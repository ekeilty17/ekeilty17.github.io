---
layout:     series
title:      "Trigonometric Functions"
date:       2022-10-11
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       10
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, trigonometry
---

## Sine

The continuity of all other tigonometric functions can be derived as a result of the continuity of $\sin(x)$. We need two facts for this proof, which I will prove at the end of the post.

$$
\lvert \cos(x) \rvert \leq 1 \qquad \forall x \in \mathbb{R}
$$

$$
\lvert \sin( x ) \rvert = \sin(\lvert x \rvert) \leq \lvert x \rvert \qquad \forall x \in \mathbb{R}
$$

It also utilizes the sum-to-product identity, which I prove in my [trigonometry series](/blog/trigonometry/sum-to-product/)

$$
\sin \alpha - \sin \beta = 2 \cos \left (\frac{ \alpha + \beta }{2} \right ) \sin \left (\frac{ \alpha - \beta }{2} \right )
$$

<br>

Fix any $\epsilon > 0$. Let $\delta = \epsilon$, then

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert x - a \rvert < \delta \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert x - a \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \frac{\lvert x - a \rvert}{2} < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \sin \left (\frac{\lvert x - a \rvert}{2} \right) < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \sin \left (\frac{ x - a }{2} \right ) \right \rvert < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \cos \left (\frac{ x + a }{2} \right ) \right \rvert \cdot \left \lvert \sin \left (\frac{ x - a }{2} \right ) \right \rvert < 1 \cdot \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad 2 \cdot \left \lvert \cos \left (\frac{ x + a }{2} \right ) \right \rvert \cdot \left \lvert \sin \left (\frac{ x - a }{2} \right ) \right \rvert< \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert 2 \cdot \cos \left (\frac{ x + a }{2} \right ) \cdot \sin \left (\frac{ x - a }{2} \right ) \right \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert \sin (x) - \sin (a) \rvert < \epsilon \\[10pt]
\end{align}
$$

which completes the proof.

<br>

## Cosine

We use the property that $\cos(x) = \sin(\pi/2 - x)$ (which I prove in my [trigonometry series](/blog/trigonometry/complementary-supplementary-and-opposite-angles/)) and the continuity of $\sin(x)$

$$
\lim_{x \rightarrow a} \cos(x) = \lim_{x \rightarrow a} \sin(\pi/2 - x) = \sin(\pi/2 - a) = \cos(a)
$$

which completes the proof.

<br>

## The Rest

All other trignomoetric functions can be written in terms of $\sin$ and $\cos$, so their continuity is implied by the division and reciprocal properties.

$$
\lim_{x \rightarrow a} \tan(x) = \lim_{x \rightarrow a} \frac{\sin(x)}{\cos(x)} = \frac{\displaystyle \lim_{x \rightarrow a} \sin(x)}{\displaystyle \lim_{x \rightarrow a} \cos(x)} = \frac{\sin(a)}{\cos(a)} = \tan(a)
$$

$$
\lim_{x \rightarrow a} \sec(x) = \lim_{x \rightarrow a} \frac{1}{\cos(x)} = \frac{1}{\displaystyle \lim_{x \rightarrow a} \cos(x)} = \frac{1}{\cos(a)} = \sec(a)
$$

$$
\lim_{x \rightarrow a} \csc(x) = \lim_{x \rightarrow a} \frac{1}{\sin(x)} = \frac{1}{\displaystyle \lim_{x \rightarrow a} \sin(x)} = \frac{1}{\sin(a)} = \csc(a)
$$

$$
\lim_{x \rightarrow a} \cot(x) = \lim_{x \rightarrow a} \frac{\cos(x)}{\sec(x)} = \frac{\displaystyle \lim_{x \rightarrow a} \cos(x)}{\displaystyle \lim_{x \rightarrow a} \sin(x)} = \frac{\cos(a)}{\sin(a)} = \cot(a)
$$

<br>

## Inverse Trigonometric Functions

Since all of the trigonometric functions are continuous, their corresponding inverse functions must also be continuous. 

<br>

## Bound on Cosine

**TODO**

<br>

## Bound on Sine

If you look up a proof for this online, you will see an argument based on the derivative of $\sin(x)$. However, I want to avoid circularity. It's actually very subtle. If you look at my proof [here](/blog/derivative-proofs/trigonometric-functions/), I use the fact that $\displaystyle \lim_{h \rightarrow 0} \frac{1 - \cos(h)}{h} = 0$. To prove this (given [here](/blog/derivative-proofs/squeeze-theorem/)), I use the fact that $\displaystyle \lim_{x \rightarrow 0} \sin (x) = \sin(0) = 0$. Therefore, I cannot use the derivative of $\sin(x)$ to prove this bound.

**TODO**

I would just use geometric arguments. The definition of an angle is the arc of a unit circle, and $\sin$ is the height, so obviously it's less. This argument works for $x < \pi/2$. For $x > 1$ we can just use the fact that $\lvert \sin(x) \rvert \leq 1 \leq x$