---
layout:     series
title:      "Logarithms and Exponentials"
date:       2023-01-05
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       4
series:     derivative-proofs
tags:       derivatives, logarithms, exponents
---

Some textbooks will define $e$ by its derivative, others define it by its Taylor expansion. For this series, I am going to use the limit definition

$$
e^x = \lim_{n \rightarrow \infty} \left ( 1 + \frac{x}{n} \right )^n
$$

## Logarithms

I will assume the reader is comfortable with the properties if logarithms. Let $b \in \mathbb{R}$ and $b > 1$.

$$
\begin{align}
    \frac{d}{dx} \log_b (x)
    &= \lim_{h \rightarrow 0} \ \frac{\log_b(x+h) - \log(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{1}{h} \log_b((x+h)/x)  \\[10pt]
    &= \lim_{h \rightarrow 0} \ \log_b \left ( \left ( 1 + \frac{h}{x} \right )^{1/h} \right )  \\[10pt]
    &\text{let } n = x/h \text{ therefore } n \rightarrow \infty \text{ as } h \rightarrow 0 \text{ since } x \text{ is fixed and finite} \\[10pt]
    &= \lim_{n \rightarrow \infty} \ \log_b \left ( \left ( 1 + \frac{1}{n} \right )^{n/x} \right )  \\[10pt]
    &= \log_b \left ( \lim_{n \rightarrow \infty} \ \left ( 1 + \frac{1}{n} \right )^{n} \right )^{1/x}  \\[10pt]
    &= \log_b \left ( e \right )^{1/x}  \\[10pt]
    &= \frac{1}{x} \log_b \left ( e \right )  \\[10pt]
    &= \frac{1}{x \ln b}
\end{align}
$$

In particular, if we let $b = e$, then 

$$
\frac{d}{dx} \ln (x) = \frac{1}{x}
$$


## Exponentials

Now, we use the fact that $\log_b (b^x) = x$ and the inverse function derivative property.

$$
\begin{align}
    \frac{d}{dx} \log_b (b^x)
    &= \frac{1}{b^x \ln b} \cdot \frac{d}{dx} b^x
\end{align}
$$

Since the left-hand side is $\frac{d}{dx} \log_b (b^x) = \frac{d}{dx} x = 1$, we have.

$$
\frac{d}{dx} b^x = b^x \ln b
$$

In particular, if we let $b = e$, then 

$$
\frac{d}{dx} e^x = e^x
$$

This is what makes $e$ such a special constant. It represents the fixed-point of the derivative operation.