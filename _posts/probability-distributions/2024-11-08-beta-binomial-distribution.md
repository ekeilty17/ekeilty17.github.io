---
layout:     series
title:      "Beta Binomial Distribution"
date:       2024-11-08
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       17
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $n \in \mathbb{N}$ be a parameter
- Let $\alpha, \beta > 0$ be parameters
- Let $X \sim \text{BetaBinomial}(n, \alpha, \beta)$ be a random variable such that $$X \in \{ 0, 1, 2, \ldots, n \}$$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
\binom{n}{x} \frac{B(x + \alpha, n - x + \beta)}{B(\alpha, \beta)}
\quad
\text{where}
\quad
\binom{n}{x} = \frac{n!}{x!(n-x)!}
\quad
\text{and}
\quad
B(\alpha, \beta) = \frac{\Gamma(\alpha) \ \Gamma(\beta)}{\Gamma(\alpha+\beta)}
$$

## Validate

First, we are going to use the **Pochhammer symbol** notation for expressiong _falling factorials_

$$
(z)_n \equiv \frac{\Gamma(z+n)}{\Gamma(z)} = z(z+1)\cdots(z+n-1)
$$

If $z$ was an integer, this could equivalently be expressed as $\frac{(z+n-1)!}{(z-1)!}$.

Then we utilize a version of the **Chu-Vandermonde’s identity**.

$$
(z+a)_n = \sum_{k=0}^{n} \binom{n}{k} (z)_k (a)_{n-k}
$$

where $z$ is any positive real number and $n$ is any positive integer.

$$
\begin{align}
    \sum_{x=0}^{n} p_{X}(x) 
    &= \sum_{x=0}^{n} \binom{n}{x} \frac{B(x + \alpha, n - x + \beta)}{B(\alpha, \beta)} \\[10pt]
    
    &= \sum_{x=0}^{n} \binom{n}{x} \ \frac{\Gamma(x + \alpha) \Gamma(n - x + \beta)}{\Gamma(n + \alpha + \beta)} \ \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \ \Gamma(\beta)} \\[10pt]
    
    &= \frac{1}{\Gamma(\alpha) \ \Gamma(\beta)} \ \frac{\Gamma(\alpha+\beta)}{\Gamma(n + \alpha + \beta)} \sum_{x=0}^{n} \binom{n}{x} \ \Gamma(x + \alpha) \ \Gamma(n - x + \beta) \\[10pt]

    &= \frac{1}{\Gamma(\alpha) \ \Gamma(\beta)} \ \frac{1}{(\alpha + \beta)_n} \sum_{x=0}^{n} \binom{n}{x} \ \left [ (\alpha)_x \Gamma(\alpha) \right ] \ \left [ (\beta)_{n - x} \Gamma(\beta) \right ] \\[10pt]
    
    &= \frac{1}{(\alpha + \beta)_n} \sum_{x=0}^{n} \binom{n}{x} \ (\alpha)_x (\beta)_{n - x} \\[10pt]

    &= \frac{1}{(\alpha + \beta)_n}\cdot (\alpha + \beta)_n \\[10pt]

    &= 1
\end{align}
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \sum_{x=0}^{n} x \ p_{X}(x) \\[10pt]
    
    &= \sum_{x=0}^{n} x \ \binom{n}{x} \frac{B(x + \alpha, n - x + \beta)}{B(\alpha, \beta)} \\[10pt]

    &= \frac{1}{(\alpha + \beta)_n} \sum_{x=0}^{n} x \ \binom{n}{x} \ (\alpha)_x (\beta)_{n - x} \\[10pt]

    &= \frac{1}{(\alpha + \beta)_n} \sum_{x=1}^{n} x \ \binom{n}{x} \ (\alpha)_x (\beta)_{n - x} \\[10pt]

    &= \frac{1}{(\alpha + \beta)_n} \sum_{x=1}^{n} \left [ n \binom{n-1}{x-1} \right ] \ \left [ (\alpha + (x - 1)) (\alpha)_{x-1} \right ] \left [ (\beta)_{(n-1) - (x-1)} \right ] \\[10pt]
    
    &= \frac{n}{(\alpha + \beta)_n} \sum_{x=1}^{n} (\alpha + (x - 1)) \cdot \binom{n-1}{x-1} \ (\alpha)_{x-1} (\beta)_{(n-1) - (x-1)} \\[10pt]

    &= \frac{n}{(\alpha + \beta)_n} \sum_{y=0}^{n-1} (\alpha + y) \cdot \binom{n-1}{y} \ (\alpha)_{y} (\beta)_{(n-1) - y} \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \sum_{y=0}^{n-1} (\alpha + y) \cdot \frac{1}{(\alpha + \beta)_{n-1}} \binom{n-1}{y} \ (\alpha)_{y} (\beta)_{(n-1) - y} \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \sum_{y=0}^{n-1} (\alpha + y) \cdot p_y(Y) \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \left ( \alpha \sum_{y=0}^{n-1} p_y(Y) + \sum_{y=0}^{n-1} y \ p_y(Y) \right ) \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \left ( \alpha + \mathrm{E}[Y] \right ) \\[10pt]
\end{align}
$$


## Variance

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \sum_{x=0}^{n} x \ p_{X}(x) \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \sum_{y=0}^{n-1} (y+1) \cdot (\alpha + y) \cdot p_y(Y) \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \left ( \alpha \sum_{y=0}^{n-1} p_y(Y) + (\alpha + 1) \sum_{y=0}^{n-1} y \ p_y(Y) + \sum_{y=0}^{n-1} y^2 \ p_y(Y) \right ) \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \left ( \alpha + (\alpha + 1) \mathrm{E}[Y] +  \mathrm{E}[Y^2] \right ) \\[10pt]

    &= \frac{n}{\alpha + \beta + n - 1} \left ( \alpha + \mathrm{E}[Y] \right ) + \frac{n}{\alpha + \beta + n - 1} \left ( \alpha \mathrm{E}[Y] +  \mathrm{E}[Y^2] \right ) \\[10pt]

     &= \mathrm{E}[X] + \frac{n}{\alpha + \beta + n - 1} \left ( \alpha \mathrm{E}[Y] +  \mathrm{E}[Y^2] \right ) \\[10pt]
\end{align}
$$

I can't find a nicer form to write the final expression of $\mathrm{E}[X^2]$.

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= \tfrac{1}{6} (2b^2 + 2ab + 2a^2 - a + b) - \left ( \frac{b+a}{2} \right)^2 \\[10pt]
    &= \tfrac{1}{6} (2b^2 + 2ab + 2a^2 - a + b) - \tfrac{1}{4}(b^2 + 2ab + a^2) \\[10pt]
    &= \tfrac{1}{12} (4b^2 + 4ab + 4a^2 - 2a + 2b) - \tfrac{1}{12}(3b^2 + 6ab + 3a^2) \\[10pt]
    &= \tfrac{1}{12} (b^2 - 2ab + a^2 - 2a + 2b) \\[10pt]
    &= \tfrac{1}{12} (b^2 + a^2 + 1 + 2b - 2ab - 2a - 1) \\[10pt]
    &= \frac{(b - a + 1)^2 - 1}{12}
\end{align}
$$

