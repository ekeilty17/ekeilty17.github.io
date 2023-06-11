---
layout:     series
title:      "Absolute Value"
date:       2022-01-04
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       3
series:     derivative-proofs
tags:       derivatives, absolute-value
---

The absolute value is defined as 

$$
\lvert x \rvert = \begin{cases}
x &\qquad \text{ if } x \geq 0 \\
-x &\qquad \text{ if } x < 0
\end{cases}
$$

This is not a continuous function, so we have to break the derivative up into two cases as well. The derivative will be discontinuous at $x=0$, and thus does not exist. Using the power rule, we can evaluate each case. 

If $x > 0$, then $\lvert x \rvert = x$, thus $\frac{d}{dx} \lvert x \rvert = 1 \cdot x^0 = 1$. If $x < 0$, then $\lvert x \rvert = -x$, thus $\frac{d}{dx} \lvert x \rvert = -1 \cdot x^0 = -1$. 

Therefore, the derivative is the following. There are a few ways we can express it.

$$
\frac{d}{dx} \lvert x \rvert =  \frac{x}{\lvert x \rvert} = \text{sign}(x) = \begin{cases}
1 &\qquad \text{ if } x > 0 \\
-1 &\qquad \text{ if } x < 0
\end{cases}
$$

Note that the derivative at $x=0$ does not exist, since the left-hand limit would give a value of ${-}1$ and the right-hand limit would give a value of ${+}1$.


## Something Silly

Just for fun, lets take the second derivative of $\lvert x \rvert$. We know that this should be $0$, but let's see if the math works out.

