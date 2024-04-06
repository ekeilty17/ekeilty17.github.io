---
layout:     series
title:      "The Shadow Map"
date:       2023-07-11
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       10
series:     nonstandard-analysis
tags:       nonstandard-analysis
---

**TODO**



## The Shadow Map Theorem

<!-- Let ${^* \mathbb{X}}$ be any hyperset. Every limied number in this hyperset $\b{\mu} \in \mathbb{L}$ is infintely close to a unique number in  -->

**Theorem**: 
Every limited hyperreal number $\b{x} \in {^* \mathbb{R}}$ is infinitely close to a unique real number. This is called the _shadow_ of $\b{x}$, or the _standard part_ of $\b{x}$, typically denoted as follows

$$
sh(\b{x}) = st(\b{x}) = {^{\circ} \b{x}} \in \mathbb{R}
$$

We can see this as the opposite of the star notation. For example

$$
sh({^* x}) = x
$$

**Corollary**: Every limited hyperreal number $\b{\mu} \in \mathbb{L}$ can be expressed as $\b{\mu} = {^* r} + \b{\epsilon}$ where $r \in \mathbb{R}$ and $\b{\epsilon}$ is an infinitesimal hyperreal number.

**Proof**: **TODO**

<br>

## The Shadow Map is a Limit

$$
\lim_{x \rightarrow a} f(x) \equiv sh( f(halo(a)) )
$$

$$
\lim_{n \rightarrow \infty} f(n) \equiv sh( f(gal(n)) ) = sh( f(\mathcal{N}) )
$$

<br>

## Properties

For these proofs, let $\b{x} = {^* r_1} + \b{\epsilon}_1$ and $\b{y} = {^* r_2} + \b{\epsilon}_2$ where ${^* r_1} = sh(\b{x})$ and ${^* r_2} = sh(\b{y})$.

### Addition

$$
\begin{align}
    sh(\b{x} + \b{y}) 
    &= sh( ({^* r_1} + \b{\epsilon}_1) + ({^* r_2} + \b{\epsilon}_2) ) \\[10pt] 
    &= sh( ({^* r_1} + {^* r_2}) + (\b{\epsilon}_1 + \b{\epsilon}_2) ) \\[10pt] 
    &= sh( \ {^* (r_1 + r_2)} + (\b{\epsilon}_1 + \b{\epsilon}_2) \ ) \\[10pt] 
    &= r_1 + r_2 \\[10pt] 
    &= sh(\b{x}) + sh(\b{y})
\end{align}
$$

### Multiplication

$$
\begin{align}
    sh(\b{x} \times \b{y}) 
    &= sh( ({^* r_1} + \b{\epsilon}_1) \times ({^* r_2} + \b{\epsilon}_2) ) \\[10pt] 
    &= sh( ({^* r_1} \times {^* r_2}) + ({^* r_1} \times \b{\epsilon}_2 + {^* r_2} \times \b{\epsilon}_1 + \b{\epsilon}_1 \times \b{\epsilon}_2) ) \\[10pt] 
    &= sh( ({^* r_1} \times {^* r_2}) + \b{\epsilon}_3 ) \\[10pt] 
    &= sh( \ {^* (r_1 \times r_2)} + \b{\epsilon}_3 \ ) \\[10pt] 
    &= r_1 \times r_2 \\[10pt] 
    &= sh(\b{x}) \times sh(\b{y})
\end{align}
$$

As a corollary, if $x = r$ where $r \in \mathbb{R}$ is a pure real number, then

$$
sh(r \cdot y) = sh(r) \cdot sh(\b{y}) = r \cdot sh(\b{y})
$$

Thus, as an additional corollary, we've shown the linearity of the shadow map.

$$
sh(\alpha x + \beta y) = \alpha sh(\b{x}) + \beta sh(\b{y})
$$

As a final corollary, taking $\alpha = 1$ and $\beta = -1$, we get the subtraction law

$$
sh(x - y) = sh(\b{x}) - sh(\b{y})
$$

### Reciprocation

Assume that $sh(\b{x}) \neq 0$.

$$
\begin{align}
    sh \left (\frac{1}{\b{x}} \right ) 
    &= sh \left ( \frac{1}{ {^* r_1} + \b{\epsilon}_1} \right ) \\[10pt] 
    &= sh \left ( \frac{1}{^* r_1} + \frac{\b{\epsilon}_1}{ {^* r_1} ({^* r_1} + \b{\epsilon}_1)} \right ) \\[10pt] 
    &= sh \left ( \frac{1}{^* r_1} + \epsilon_3 \right ) \\[10pt] 
    &= sh \left ( {^* \left ( \frac{1}{r_1} \right )} + \epsilon_3 \right ) \\[10pt] 
    &= \frac{1}{r_1} \\[10pt] 
    &= \frac{1}{sh(\b{x})}
\end{align}
$$

### Division

Assume that $sh(\b{y}) \neq 0$. We just combine the multiplication and reciprocation properties.

$$
\begin{align}
    sh \left (\frac{\b{x}}{\b{y}} \right ) 
    &= sh \left (\b{x} \times \frac{1}{\b{y}} \right ) \\[10pt] 
    &= sh(\b{x}) \times sh \left (\frac{1}{\b{y}} \right ) \\[10pt] 
    &= sh(\b{x}) \times \frac{1}{sh(\b{y})} \\[10pt] 
    &= \frac{sh(\b{x})}{sh(\b{y})}
\end{align}
$$