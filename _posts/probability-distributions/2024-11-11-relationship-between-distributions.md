---
layout:     series
title:      "Relationship Between Distributions"
date:       2024-11-11
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       20
series:     probability-distributions
tags:       probability-distributions
---


## Heirarchy

- $\text{BetaBinomial}(n, \alpha, \beta)$
    - $\displaystyle \text{DiscreteUniform}(n, 0, n) = \text{BetaBinomial}(n, 1, 1)$
    - $\displaystyle \text{Binomial}(n, p) = \lim_{n \rightarrow \infty} \text{BetaBinomial}(n, ns, (1 - p))$
        - $\displaystyle \text{Bernoulli}(p) = \text{Binomial}(1, p)$
        - $\displaystyle \text{Poisson}(\lambda) = \lim_{n \rightarrow \infty} \text{Binomial} \left ( n, \frac{\lambda}{n} \right ) $
    - $\displaystyle \text{NegativeBinomial}(r, p) = \lim_{n \rightarrow \infty} \text{BetaBinomial} \left ( n, \alpha, \frac{np}{1 - p} \right ) $
        - $\displaystyle \text{Geometric}(p) = \text{NegativeBinomial}(1, p)$
    - $\displaystyle \text{NegativeHypergeometricBinomial}(N, K, r) = \text{BetaBinomial} \left ( K, r, N{-}K{-}r{+}1 \right ) $

<br/>

I'm not going to prove these because most of them are relatively straight forward. The ones involving limits are a bit more involved, but with a little effort or some googling you can find the derivations. Maybe I'll come back and do these.

<br/>

Three distributions did not make it in the heirarchy. First, $\text{Multinomial}(n, p_1, \ldots, p_k)$ did not make it because it's a one-off multivariant distribution. For $\text{Hypergeometric}(N, K, n)$ and $\text{Logarithmic}(p)$, I could not find a meaningful enough connection with the above. The beta normal distribution is the **conjugate prior** of the hypergeometric distribution (with respect to parameter $K$). You can find a connection between the Logarithmic distribution and the Negative Binomial by taking $r$ derivatives, which is interesting ([source](https://www.emis.de/journals/RCE/V31/bodyv31n2/v31n2a11Sadinle.pdf)), but not really what I'm looking for.