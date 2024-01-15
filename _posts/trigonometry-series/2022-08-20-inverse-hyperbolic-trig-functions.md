---
layout:     series
title:      "Inverse Hyperbolic Trigonometric Functions"
date:       2022-08-21
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       20
series:     trigonometry
tags:       trigonometry, hyperbolic, hyperbola
---


For background on inverse functions, refer to the [previous post](/blog/trigonometry/inverse-trig-functions/) on the inverse standard trig functions.
Looking at the graphs of the hyperbolic trig functions in the previous post, we can see that $\sinh$, $\tanh$, $\csch$, and $\coth$ are one-to-one, and therefore have a well-defined inverse. By contrast, $\cosh$ and $\sech$ are not one-to-one, so we will have to restrict their domain. Since we have exact formulas for the hyperbolic trig functions in terms of $e^x$, we will also get exact formulas for their inverse functions in terms of $\ln x$.

<br>

## Derivations

### Hyperbolic Sine

The standard method for solving for inverse functions is to swap $x$ and $y$ and then isolate for $y$.

$$
y = \sinh(x) = \frac{e^x - e^{-x}}{2}
\qquad\implies\qquad
x = \frac{e^y - e^{-y}}{2}
$$

Now, we are going to isolate $e^y$, which will then let us isolate for $y$. Multiply both sides by $2e^{y}$.

$$
2x e^y = e^{2y} - 1
\qquad\implies\qquad
(e^y)^2 - 2x e^y - 1 = 0
$$

Use the quadratic formula.

$$
e^y = \frac{2x \pm \sqrt{4x^2 + 4}}{2}
\qquad\implies\qquad
e^y = x \pm \sqrt{x^2 + 1}
$$

Since $x < \sqrt{x^2 + 1}$, $x - \sqrt{x^2 + 1}$ this will result in a negative number and thus no solution for $y$.

$$
e^y = x + \sqrt{x^2 + 1}
\qquad\implies\qquad
y = \arcsinh(x) = \ln( x + \sqrt{x^2 + 1} )
$$

### Hyperbolic Cosine

The steps are almost identical to $\arcsinh$. I will skip a few steps to save space.

$$
\begin{align}
    &y = \cosh(x) = \frac{e^x + e^{-x}}{2} \\[10pt]
    &x = \frac{e^y + e^{-y}}{2} \\[10pt]
    &(e^y)^2 - 2x e^y + 1 = 0 \\[10pt]
    &e^y = x \pm \sqrt{x^2 - 1} \\[10pt]
    &e^y = x + \sqrt{x^2 - 1} \\[10pt]
    &y = \arccosh(x) = \ln( x + \sqrt{x^2 - 1} )
\end{align}
$$

One thing to note is that the reason we neglect the root $e^y = x - \sqrt{x^2 - 1}$ is different than before. $x > \sqrt{x^2 - 1}$, therefore the root will be positive and produce a solution for $y$. Our choice of using the root $e^y = x - \sqrt{x^2 - 1}$ is due to our choice of domain restriction.

### Hyperbolic Tangent

The methodology is very similar to the above. Again, I will skip some steps to save space.

$$
\begin{align}
    &y = \tanh(x) = \frac{e^x - e^{-x}}{e^x + e^{-x}} \\[10pt]
    &x = \frac{e^y - e^{-y}}{e^y + e^{-y}} = \frac{e^{2y} - 1}{e^{2y} + 1} \\[10pt]
    &e^{2y} = \frac{1+x}{1-x} \\[10pt]
    &y = \arctanh(x) = \frac{1}{2} \ln \left ( \frac{1+x}{1-x} \right )
\end{align}
$$

### Hyperbolic Secant

This is almost identical to the derivation of $\arccosh$.

$$
\begin{align}
    &y = \sech(x) = \frac{2}{e^x + e^{-x}} \\[10pt]
    &x = \frac{2}{e^x + e^{-x}} \\[10pt]
    &(e^y)^2 - \frac{2}{x} \, e^y + 1 = 0 \\[10pt]
    &e^y = \frac{1}{x} \pm \sqrt{\frac{1}{x^2} - 1} \\[10pt]
    &e^y = \frac{1}{x} + \sqrt{\frac{1}{x^2} - 1} \\[10pt]
    &y = \arcsech(x) = \ln \left ( \frac{1}{x} + \sqrt{\frac{1}{x^2} - 1} \ \right )
\end{align}
$$

### Hyperbolic Cosecant

This is almost identical to the derivation of $\arcsinh$.

$$
\begin{align}
    &y = \csch(x) = \frac{2}{e^x - e^{-x}} \\[10pt]
    &x = \frac{2}{e^x - e^{-x}} \\[10pt]
    &(e^y)^2 + \frac{2}{x} \, e^y + 1 = 0 \\[10pt]
    &e^y = \frac{1}{x} \pm \sqrt{\frac{1}{x^2} + 1} \\[10pt]
    &e^y = \frac{1}{x} + \sqrt{\frac{1}{x^2} + 1} \\[10pt]
    &y = \arccsch(x) = \ln \left ( \frac{1}{x} + \sqrt{\frac{1}{x^2} + 1} \ \right )
\end{align}
$$

### Hyperbolic Cotangent

This is almost identical to the derivation of $\arctanh$.

$$
\begin{align}
    &y = \coth(x) = \frac{e^x + e^{-x}}{e^x - e^{-x}} \\[10pt]
    &x = \frac{e^y + e^{-y}}{e^y - e^{-y}} = \frac{e^{2y} + 1}{e^{2y} - 1} \\[10pt]
    &e^{2y} = \frac{x+1}{x-1} \\[10pt]
    &y = \arccoth(x) = \frac{1}{2} \ln \left ( \frac{x+1}{x-1} \right )
\end{align}
$$

<br>

<!-- TODO: add graphs -->

## Summary

$$
\begin{align}
    &\arcsinh(x) \equiv \sinh^{-1} (x) &&= \ln \left ( x + \sqrt{x^2 + 1} \right ) \\[10pt]
    &\arccosh(x) \equiv (\cosh \rvert_{[0, \infty)})^{-1} (x) &&= \ln \left ( x + \sqrt{x^2 - 1} \right ) \\[10pt]
    &\arctanh(x) \equiv \tanh^{-1} (x) &&= \frac{1}{2} \ln \left ( \frac{1+x}{1-x} \right ) \\[10pt]
    &\arcsech(x) \equiv (\sech \rvert_{[0, \infty)})^{-1} (x) &&= \ln \left ( \frac{1}{x} + \sqrt{\frac{1}{x^2} - 1} \right ) \\[10pt]
    &\arccsch(x) \equiv (\csch \rvert_{(-\infty, 0) \cup (0, \infty)})^{-1} (x) &&= \ln \left ( \frac{1}{x} + \sqrt{\frac{1}{x^2} + 1} \right ) \\[10pt]
    &\arccoth(x) \equiv (\coth \rvert_{(-\infty, 0) \cup (0, \infty)})^{-1} (x) &&= \frac{1}{2} \ln \left ( \frac{1-x}{1+x} \right )
\end{align}
$$