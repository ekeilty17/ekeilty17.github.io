---
layout:     post
title:      "Summary of Limits"
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
tags:       limits, continuity, delta-epsilon, trigonometry, summary
---

## Definition of a Limit

Assume that $a, L \in \mathbb{R}$. 

The notation $\displaystyle \lim_{x \rightarrow a^-} f(x) = L$ defines the **left-hand limit**, and it means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad x > a - \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

The notation $\displaystyle \lim_{x \rightarrow a^+} f(x) = L$ defines the **right-hand limit**, and it means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad x < a + \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

The notation $\displaystyle \lim_{x \rightarrow a} f(x) = L$ defines the **limit**, and it means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

Below, we define what it means for a limit to approach and/or equal infinity.

$$
\lim_{x \rightarrow a} f(x) = \infty 
\qquad \iff \qquad \forall M > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies f(x) > M
$$

$$
\lim_{x \rightarrow a} f(x) = -\infty 
\qquad \iff \qquad \forall M > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies f(x) < -M
$$

<br>

$$
\lim_{x \rightarrow \infty} f(x) = L
\qquad \iff \qquad \forall \epsilon > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x > N \implies 0 < \lvert f(x) - L \rvert < \epsilon
$$

$$
\lim_{x \rightarrow -\infty} f(x) = L
\qquad \iff \qquad \forall \epsilon > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x < -N \implies 0 < \lvert f(x) - L \rvert < \epsilon
$$

<br>

$$
\lim_{x \rightarrow \infty} f(x) = \infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x > N \implies f(x) > M
$$

$$
\lim_{x \rightarrow -\infty} f(x) = \infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x < -N \implies f(x) > M
$$

$$
\lim_{x \rightarrow \infty} f(x) = -\infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x > N \implies f(x) < -M
$$

$$
\lim_{x \rightarrow -\infty} f(x) = -\infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x < -N \implies f(x) < -M
$$

<br>

## Definition of Continuity

We say $f$ is **continuous at** $\boldsymbol{a}$ if

$$
\lim_{x \rightarrow a} f(x) = f(x)
$$

We say that $f$ is **continuous** if it is continuous at every point in its domain.

<br>

## Limit Laws

Assume that $$a, L \in \{ -\infty \} \cup \mathbb{R} \cup \{ \infty \}$$. Assume $b > 1$. Assume $c \in \mathbb{R}$.

$$
\begin{align}
    & \textbf{Constant Function}: && \lim_{x \rightarrow a } c = c \\[10pt]
    & \textbf{Identity Function}: && \lim_{x \rightarrow a } x = a \\[10pt]
    & \textbf{Addition} : && \lim_{x \rightarrow a } (f(x) + g(x)) = \left ( \lim_{x \rightarrow a } f(x) \right ) + \left ( \lim_{x \rightarrow a } g(x) \right ) \\[10pt]
    & \textbf{Subtraction} : && \lim_{x \rightarrow a } (f(x) - g(x)) = \left ( \lim_{x \rightarrow a } f(x) \right ) - \left ( \lim_{x \rightarrow a } g(x) \right ) \\[10pt]
    & \textbf{Multiplication} : && \lim_{x \rightarrow a } (f(x) \cdot g(x)) = \left ( \lim_{x \rightarrow a } f(x) \right ) \cdot \left ( \lim_{x \rightarrow a } g(x) \right ) \\[10pt]
    & \textbf{Division} : && \lim_{x \rightarrow a } (f(x) / g(x)) = \left ( \lim_{x \rightarrow a } f(x) \right ) / \left ( \lim_{x \rightarrow a } g(x) \right ) \\[10pt]
    & \textbf{Exponentiation} : && \lim_{x \rightarrow a } (f(x) ^{g(x)}) = \left ( \lim_{x \rightarrow a } f(x) \right ) ^ {\left ( \lim_{x \rightarrow a } g(x) \right )} \\[10pt]
    & \textbf{Logarithms} : && \lim_{x \rightarrow a } \log_b ( f(x) ) = \log_b \left ( \lim_{x \rightarrow a } f(x) \right )
\end{align}
$$

Assume that $f$ is a continuous function, then 

$$
\begin{align}
    & \textbf{Composition}: && \lim_{x \rightarrow a } f(g(x)) = f \left ( \lim_{x \rightarrow a } g(x) \right ) \\[10pt]
    & \textbf{Change of Variables}: && \lim_{x \rightarrow a } f(g(x)) = \lim_{z \rightarrow b } f(z) \qquad \text{where } b = \lim_{x \rightarrow a} g(x)
\end{align}
$$

Assume that $f$ is continuous and has a well-defined inverse $f^{-1}$, then

$$
\begin{align}
    & \textbf{Inverse}: && \lim_{x \rightarrow a } f(x) = L \quad\iff\quad \lim_{y \rightarrow L} f^{-1}(y) = a
\end{align}
$$

<br>

<h3 style="text-align:center; margin-bottom:1em;">
    <a href="/blog/limits-and-continuity/">Limits and Continuity Series</a>
</h3>