---
layout:     series
title:      "Function to the Power of a Function"
date:       2022-01-10
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       9
series:     derivative-proofs
tags:       derivatives, exponentials, implicit-differentiation
---

We are going to use a technique called **logarithmic differentiation**, which is a special case of a technique called **implicit differentiation**. Let $f$ and $g$ be continuous and differentiable functions.

$$
\begin{align}
    y =& f(x)^{g(x)} \\[10pt]
    \ln y =& \ln ( f(x)^{g(x)} ) \\[10pt]
    \ln y =& g(x) \cdot \ln ( f(x) ) \\[10pt]
    \frac{d}{dx} [ \ln y ] &= \frac{d}{dx} \left [ g(x) \cdot \ln ( f(x) ) \right ] \\[10pt]
    \frac{\frac{dy}{dx}}{y} &= g'(x) \ln f(x) + g(x) \frac{f'(x)}{f(x)} \\[10pt]
    \frac{\frac{dy}{dx}}{f(x)^{g(x)}} &= g'(x) \ln f(x) + g(x) \frac{f'(x)}{f(x)} \\[10pt]
    \frac{dy}{dx} &= f(x)^{g(x)} \ln(f(x)) {g'(x)} + g(x) f(x)^{g(x)-1} f'(x)  \\[10pt]
\end{align}
$$

To take a particular case, if $f(x) = g(x) = x$, then

$$
\frac{d}{dx} x^x = x^x (\ln(x) + 1)
$$

I would like to point out something interesting. Let's clear up the notation a bit. Let $u = f(x)$ and $v = g(x)$. Now,

$$
\frac{d}{dx} [u^v] = u^v \ln(u) v' + v u^{v-1} u'
$$

Now, we define something called a **partial derivative**. When taking the partial derivative of a function with multiple variables, pretend all other variables are constants and compute the derivative as usual. For example,

$$
\frac{\partial}{\partial u} [u^v] = v \cdot u^{v-1}
$$

$$
\frac{\partial}{\partial v} [u^v] = u^v \ln v
$$

This gives us a hint at the chain rule for multivariable calculus.

$$
\frac{d}{dx} f(u(x), v(x)) = \frac{\partial f}{\partial u} \frac{du}{dx} + \frac{\partial f}{\partial v} \frac{dv}{dx}
$$