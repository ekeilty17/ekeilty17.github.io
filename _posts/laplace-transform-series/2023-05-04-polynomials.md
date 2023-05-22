---
layout:     series
title:      "Polynomials"
date:       2023-05-04
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       3
series:     laplace-transforms
tags:       laplace-transform, polynomials
---

## Linear Functions

Given $f(t) = t$

$$
\begin{align}
    \mathcal{L}\{ t \} = F(s) 
    &= \int_{0}^{\infty} t \ e^{-st} \; dt \qquad \text{(using integration by parts)} \\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \lim_{t \rightarrow \infty} te^{-st} + \frac{1}{s} \int_{0}^{\infty} e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \cdot 0 + \frac{1}{s} \cdot \mathcal{L}\{ 1 \} \\[10pt]
    &= \frac{1}{s^2}
\end{align}
$$

**Condition**: $s > 0$ &emsp;&emsp; (this comes from $$\mathcal{L}\{ 1 \}$$)

To complete the proof, we will quickly show the evaluation of the limit. It is an easy application of L'H&ocirc;pital's rule.

$$
\begin{align}
    \lim_{t \rightarrow \infty} te^{-st}
    &= \lim_{t \rightarrow \infty} \frac{t}{e^{st}} \\[10pt]
    &= \lim_{t \rightarrow \infty} \frac{1}{se^{st}} \\[10pt]
    &= 0
\end{align}
$$

## Monomials

Given $f(t) = t^n$ for any integer $n > 0$

$$
\begin{align}
    \mathcal{L}\{ t^n \} = F(s) 
    &= \int_{0}^{\infty} t^n \ e^{-st} \; dt \qquad \text{(using integration by parts)} \\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \lim_{t \rightarrow \infty} t^ne^{-st} + \frac{n}{s} \int_{0}^{\infty} t^{n-1} e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \int_{0}^{\infty} t^{n-1} e^{-st} \ dt \\[10pt]
    &\text{Now, we just recurrively apply this result} \\[10pt]
    &= \frac{n!}{s^n} \int_{0}^{\infty} e^{-st} \ dt \\[10pt]
    &= \frac{n!}{s^n} \mathcal{L}\{ 1 \} \\[10pt]
    &= \frac{n!}{s^{n+1}}
\end{align}
$$

**Condition**: $s > 0$ &emsp;&emsp; (this comes from $$\mathcal{L}\{ 1 \}$$)


Again, to complete the proof, we will quickly show the evaluation of the limit. It's just successive applications of L'H&ocirc;pital's rule.

$$
\begin{align}
    \lim_{t \rightarrow \infty} t^n e^{-st}
    &= \lim_{t \rightarrow \infty} \frac{t^n}{e^{st}} \\[10pt]
    &= \lim_{t \rightarrow \infty} \frac{1}{s^n e^{st}} \\[10pt]
    &= 0
\end{align}
$$

## Polynomials

Given $\displaystyle f(t) = \sum_{k=0}^n a_k t^k = a_0 + a_1 t + a_2 t^2 + \ldots + a_n t^n$ for any integer $n \geq 0$

$$
\begin{align}
    \mathcal{L} \left \{ \sum_{k=0}^n a_k t^k \right \} = F(s) 
    &= \int_{0}^{\infty} \sum_{k=0}^n a_k t^k \ e^{-st} \; dt \qquad \text{(using linearity of integrals)} \\[10pt]
    &= \sum_{k=0}^n a_k \int_{0}^{\infty} t^k \ e^{-st} \; dt \\[10pt]
    &= \sum_{k=0}^n a_k \mathcal{L}\{ t^k \} \\[10pt]
    &= \sum_{k=0}^n \frac{k! \ a_k}{s^{k+1}}
\end{align}
$$

**Condition**: $s > 0$ &emsp;&emsp; (this comes from $$\mathcal{L}\{ t^k \}$$)


## Scaling and Translation

First, we notice that translation will not affect the Laplace transform of a polynomial. If we look at the Monomial proof, and consider $(t+c)^n$, it will not affect the derivative and it will eventually go to $1$ as we iteratively take derivatives. Combining this with the scaling property, we get the following.

$$
\mathcal{L}\{ (bt+c)^n \} = \mathcal{L}\{ (bt)^n \} = \frac{1}{b^n} \frac{n!}{(s/b^n)^{n+1}} = \frac{b^{n^2} n!}{s^{n+1}}
$$