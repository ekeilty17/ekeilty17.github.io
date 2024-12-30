---
layout:     series
title:      "Multinomial Distribution"
date:       2024-11-03
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       12
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $n \in \mathbb{N}$ be a parameter
- Let $p_1, \ldots, p_k \in [0, 1]$ be parameters such that $\ \sum_{i=1}^k p_i = 1$
- Let $X_1, \ldots, X_k \sim \text{Multinomial}(n, p_1, \ldots, p_k)$ be random variables such that $$X_1, \ldots, X_k \in \{ 0, 1, 2, \ldots, n \}$$ and $\ \sum_{i=1}^k X_i = n$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X_1, \ldots, X_k}(x_1, \ldots, x_k)
\ = \
\binom{n}{x_1 \cdots x_k} \ p_1^{x_1} \cdots p_k^{x_k}
\ = \
\frac{n!}{x_1! \cdots x_k!} \ p_1^{x_1} \cdots p_k^{x_k}
$$

## Validate

This is a simple application of the <span class="tooltip">multinomial theorem
    <span class="tooltiptext"> 
        $$\displaystyle
        (a_1 + \ldots + a_{\ell})^m = \sum_{\substack{q_1, \ldots, q_{\ell} \\ q_1 + \ldots + q_{\ell} = m}} \binom{m}{q_1 \cdots q_{\ell}} a_1^{q_1} \cdots a_{\ell}^{q_{\ell}}
        $$
    </span>
</span>.

$$
\sum_{\substack{x_1, \ldots, x_k \\ x_1 + \ldots + x_k = n}} p_{X_1, \ldots, X_k}(x_1, \ldots, x_k) = (p_1 + \ldots + p_k)^n = 1^n = 1
$$

## Expectation

Without loss of generality, we will evaluate $\mathrm{E}[X_1]$. Since the order of the $X_i$'s are arbitrary, the argument can be extended to any $X_i$.

Also, let $Y_1, \ldots, Y_k \sim \text{Multinomial}(n-1, p_1, \ldots, p_k)$ be random variables such that $$Y_1, \ldots, Y_k \in \{ 0, 1, 2, \ldots, n-1 \}$$ and $\ \sum_{i=1}^k Y_i = n-1$ with probability mass function $p_{Y_1, \ldots, Y_k}(y_1, \ldots, y_k)$.

$$
\begin{align}
    \mathrm{E}[X_1]
    &= \sum_{\substack{x_1, \ldots, x_k \\ x_1 + \ldots + x_k = n}} x_1 \ p_{X_1, \ldots, X_k}(x_1, \ldots, x_k) \\[10pt]
    &= \sum_{x_1 = 0}^n \sum_{x_2 = 0}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} x_1 \ p_{X_1, \ldots, X_k}(x_1, \ldots, x_k) \\[10pt]
    &= \sum_{x_1 = 0}^n \sum_{x_2 = 0}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} x_1  \ \frac{n!}{x_1! \cdots x_k!} \ p_1^{x_1} \cdots p_k^{x_k} \\[10pt]
    &= \sum_{x_1 = 1}^n \sum_{x_2 = 0}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} x_1  \ \frac{n!}{x_1! \cdots x_k!} \ p_1^{x_1} \cdots p_k^{x_k} \\[10pt]
    &= np_1 \sum_{x_1 = 1}^n \sum_{x_2 = 0}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} \frac{(n-1)!}{(x_1-1)! x_2! \cdots x_k!} \ p_1^{x_1-1} p_2^{x_2} \cdots p_k^{x_k} \\[10pt]
    &= np_1 \sum_{y_1 = 0}^{n-1} \sum_{y_2 = 0}^{(n-1) - y_1} \cdots \sum_{y_{k-1} = 0}^{(n-1) - y_1 - \ldots - y_{k-2}} \frac{(n-1)!}{y_1! y_2! \cdots y_k!} \ p_1^{y_1} p_2^{y_2} \cdots p_k^{y_k} \\[10pt]
    &= np_1 \sum_{\substack{y_1, \ldots, y_k \\ y_1 + \ldots + y_k = n-1}} p_{Y_1, \ldots, Y_k}(y_1, \ldots, y_k) \\[10pt]
    &= np_1
\end{align}
$$

Therefore

$$
\mathrm{E}[X_i] = np_i
$$


## Variance

Without loss of generality, we will evaluate $\mathrm{E}[X_1]$. Since the order of the $X_i$'s are arbitrary, the argument can be extended to any $X_i$.

$$
\begin{align}
    \mathrm{E}[X_1^2]
    &= \sum_{\substack{x_1, \ldots, x_k \\ x_1 + \ldots + x_k = n}} x_1^2 \ p_{X_1, \ldots, X_k}(x_1, \ldots, x_k) \\[10pt]
    &= np_1 \sum_{\substack{y_1, \ldots, y_k \\ y_1 + \ldots + y_k = n-1}} (y_1 + 1) \ p_{Y_1, \ldots, Y_k}(y_1, \ldots, y_k) \\[10pt]
    &= np_1 \left ( \sum_{\substack{y_1, \ldots, y_k \\ y_1 + \ldots + y_k = n-1}} y_1 \ p_{Y_1, \ldots, Y_k}(y_1, \ldots, y_k) + \sum_{\substack{y_1, \ldots, y_k \\ y_1 + \ldots + y_k = n-1}} p_{Y_1, \ldots, Y_k}(y_1, \ldots, y_k) \right )\\[10pt]
    &= np_1 \left ( \mathrm{E}[Y_1] + 1 \right )\\[10pt]
    &= np_1 \left ( (n-1)p_1 + 1 \right )\\[10pt]
    &= n^2p_1^2 - np_1^2 + np_1
\end{align}
$$

Therefore

$$
\mathrm{E}[X_i^2] = n^2p_i^2 - np_i^2 + np_i
$$

Therefore

$$
\mathrm{Var}[X_i] = \mathrm{E}[X_i^2] - \mathrm{E}[X_i]^2 = (n^2p_i^2 - np_i^2 + np_i) - (np_i)^2 = np_i(1 - p_i)
$$

## Covariance 

Without loss of generality, we will evaluate $\mathrm{E}[X_1 X_2]$. Since the order of the $X_i$'s are arbitrary, the argument can be extended to any pair $X_i$ and $X_j$.


$$
\begin{align}
    \mathrm{E}[X_1 X_2]
    &= \sum_{\substack{x_1, \ldots, x_k \\ x_1 + \ldots + x_k = n}} x_1x_2 \ p_{X_1, \ldots, X_k}(x_1, \ldots, x_k) &(1)\\[10pt]
    &= \sum_{x_1 = 0}^n \sum_{x_2 = 0}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} x_1x_2 \ \frac{n!}{x_1! x_2! \cdots x_k!} \ p_1^{x_1} \cdots p_k^{x_k} &(2)\\[10pt]
    &= \sum_{x_1 = 1}^{n-1} \sum_{x_2 = 1}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} x_1x_2 \ \frac{n!}{x_1! x_2! \cdots x_k!} \ p_1^{x_1} p_2^{x_2} \cdots p_k^{x_k} &(3)\\[10pt]
    &= n(n-1)p_1p_2 \sum_{x_1 = 1}^{n-1} \sum_{x_2 = 1}^{n - x_1} \cdots \sum_{x_{k-1} = 0}^{n - x_1 - \ldots - x_{k-2}} \frac{(n-2)!}{(x_1-1)! (x_2-1)! \cdots x_k!} \ p_1^{x_1-1} p_2^{x_2-1} \cdots p_k^{x_k} &(4)\\[10pt]
    &= n(n-1)p_1p_2 \sum_{y_1 = 0}^{n-2} \sum_{y_2 = 0}^{(n-2) - y_1} \cdots \sum_{y_{k-1} = 0}^{(n-2) - y_1 - \ldots - y_{k-2}} \frac{(n-2)!}{y_1! y_2! \cdots y_k!} \ p_1^{y_1} p_2^{y_2} \cdots p_k^{y_k} &(5)\\[10pt]
    &= n(n-1)p_1p_2 \sum_{\substack{y_1, y_2 \ldots, y_k \\ y_1 + y_2 + \ldots + y_k = n-2}} p_{Y_1, Y_2, \ldots, Y_k}(y_1, y_2, \ldots, y_k) &(6)\\[10pt]
    &= n(n-1)p_1p_2 &(7)\\[10pt]
    &= n^2p_1p_2 - np_1p_2 &(8)
\end{align}
$$

Therefore

$$
\mathrm{E}[X_i X_j] = n^2p_ip_j - np_ip_j
$$

Therefore

$$
\mathrm{Cov}[X_i X_j] = \mathrm{E}[X_i X_j] - \mathrm{E}[X_i] \mathrm{E}[X_j] = (n^2p_ip_j - np_ip_j) - (np_i)(np_j) = - np_ip_j
$$
