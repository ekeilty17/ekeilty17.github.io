---
layout:     series
title:      "The Rational Numbers"
date:       2023-07-05
categories: blog constructing-the-real-numbers
permalink:  ":categories/:title/"
part:       4
series:     constructing-the-real-numbers
tags:       rationals
---

**TODO**

we have

$$
(a, b) \in \mathbb{Z} \times \mathbb{Z}
$$

and a binary operation $/$. Then we define equality under this operation. $a / b = c / d$ if an only if $a * d = c * b$. Now, we can define a set of equivalence classes

$$
\mathbb{Q} = (\mathbb{Z}^2 / \equiv) = \{ [a/b] : a/b = c/d \text{ for } c, d \in \mathbb{Z} \}
$$

The upshot is that, give any rational number $q \in \mathbb{Q}$ there exists $a, b \in \mathbb{Z}$ such that $q = a/b$.

Somewhere in here, we need to define that $a/b = a * b^{-1}$ where $b^{-1}$ refers to the multiplicative inverse of the integer $b$. So somewhere I have to define the concept of a multiplicative inverse without being recursive.