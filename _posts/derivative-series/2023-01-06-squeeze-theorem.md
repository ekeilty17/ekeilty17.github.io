---
layout:     series
title:      "Squeeze Theorem"
date:       2023-01-06
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       5
series:     derivative-proofs
tags:       derivatives, squeeze-theorem
---

**TODO**

There are not derivatives, but we need these results in order to evaluate the trigonometric derivatives in the next part.

## sin x / x

$$
\sin x \leq x \leq \tan x \\[10pt]
1 \leq \frac{x}{\sin x} \leq \frac{1}{\cos x} \\[10pt]
1 \geq \frac{\sin x}{x} \geq \cos x
$$

$$
\lim_{x \rightarrow 0} \frac{\sin x}{x} = 1
$$

## (1 - cos x) / x

$$
\begin{align}
    \lim_{x \rightarrow 0} \frac{1 - \cos x}{x} 
    &= \lim_{x \rightarrow 0} \frac{1 - \cos x}{x} \cdot \frac{1 + \cos x}{1 + \cos x} \\[10pt]
    &= \lim_{x \rightarrow 0} \frac{1 - \cos^2 x}{x(1 + \cos x)} \\[10pt]
    &= \lim_{x \rightarrow 0} \frac{\sin^2 x}{x(1 + \cos x)} \\[10pt]
    &= \left ( \lim_{x \rightarrow 0} \frac{\sin x}{x} \right ) \left ( \lim_{x \rightarrow 0} \frac{\sin x}{1 + \cos x} \right ) \\[10pt]
    &= 1 \cdot \frac{0}{1+1} \\[10pt]
    &= 0
\end{align}
$$