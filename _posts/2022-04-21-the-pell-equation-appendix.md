---
layout:     post
title:      "Solving The Pell Equation Efficently - Appendix"
date:       2022-08-01
categories: blog
permalink:  ":categories/:title/"
standalone: true
appendix:   true
tags:       diophantine equation, number theory, python
---

Appendix to post [Solving The Pell Equation Efficently](/blog/the-pell-equation/).

### $\mathbb{Z}[\sqrt{D}]$ Forms a Ring on Addition and Multiplication

We define the operations $+$ and $\cdot$ as you would expect. Let $(a, b)$ be short-hand for $a + \sqrt{D}b$ 

<div class="equation-container">
$$
(a, b) + (c, d) = (a+c, \ b+d) \qquad \text{and} \qquad (a, b) \cdot (c, d) = (ac + Dbd, \ ad + bc)
$$
</div>


The ring axioms are as follows
1. Addition is associative
2. Addition is commutative
3. $\mathbb{Z}[\sqrt{D}]$ contains the additive identity
4. $\mathbb{Z}[\sqrt{D}]$ contains the additive inverse for all elements
5. Multiplication is associative
6. $\mathbb{Z}[\sqrt{D}]$ contians the multiplicative identity
7. Multiplication is distributive with respect to addition, i.e. $\ a \cdot (b + c) = (a \cdot b) + (a \cdot c)$ and $\ (b + c) \cdot a = (b \cdot a) + (c \cdot a)$


Axioms 1, 2, 3, and 4 are inherited from their counterparts for the integers.

$1.$

<div class="equation-container">
$$ 
\begin{align}
    ((a, b) + (c, d)) + (e, f) 
    &= (a+c, \ b+d) + (e, f) \\
    &= ((a+c)+e, \ (b+d)+f) \\
    &= (a+(c+e), \ b+(d+f)) \\
    &= (a, b) + ((c, d) + (e, f)) 
\end{align}
$$
</div>

$2.$ 

<div class="equation-container">
$$ (a, b) + (c, d) = (a+c, \ b+d) = (c+a, \ d+b) = (c, d) + (a, b) $$
</div>

$3.$ The additive identity is $(0, 0)$, which is contained in $\mathbb{Z}[\sqrt{D}]$

<div class="equation-container">
$$ (a, b) + (0, 0) = (a+0, \ b+0) = (a, b) $$
</div>

$4.$ The additive inverse is $(-a, -b)$, which is contained in $\mathbb{Z}[\sqrt{D}]$

<div class="equation-container">
$$ (a, b) + (-a, -b) = (a+(-a), \ b+(-b)) = (0, 0) $$
</div>

Axioms 5, 6, and 7 are inherited by the fact that the integers form a ring.

$5.$

<div class="equation-container">
$$ 
\begin{align}
    ((a, b) \cdot (c, d)) \cdot (e, f) 
    &= (ac + Dbd, \ ad + bc) + (e, f) \\
    &= ((ac + Dbd)e + D(ad + bc)f , \ (ac + Dbd)f + (ad + bc)e ) \\
    &= (a(ce + Ddf) + Db(cf + de) , \ a(cf + de) + b(ce + Ddf) ) \\
    &= (a, b) \cdot (ce + Ddf, cf + de) \\
    &= (a, b) \cdot ((c, d) \cdot (e, f))
\end{align}
$$
</div>

$6.$ The multiplicative identity is $(1, 0)$, which is contained in $\mathbb{Z}[\sqrt{D}]$

<div class="equation-container">
$$ (a, b) \cdot (1, 0) = (a \cdot 1 + Db \cdot 0, \ a \cdot 0 + b \cdot 1) = (a, b)$$
</div>

$7.$

<div class="equation-container">
$$
\begin{align}
    (a, b) \cdot ((c, d) + (e, f))
    &= (a, b) \cdot (c+e, \ d+f) \\
    &= (a(c+e) + Db(d+f), \ a(d+f) + b(c+e)) \\
    &= (ae + Dbf, \ af + be) + (ce + Ddf, \ cf + de) \\
    &= ((a, b) \cdot (e, f)) + ((c, d) \cdot (e, f))
\end{align}
$$
</div>

We can see that in this case, multiplication is actually also commutative

<div class="equation-container">
$$ (a, b) \cdot (c, d) = (ac + Dbd, \ ad + bc) = (ca + Ddb, \ cb + da) = (c, d) \cdot (a, b)$$
</div>

So we get 

<div class="equation-container">
$$((c, d) + (e, f)) \cdot (a, b) = (a, b) \cdot ((c, d) + (e, f)) = ((a, b) \cdot (e, f)) + ((c, d) \cdot (e, f))$$
</div>

for free.

<br>

### $\vert x + \sqrt{D} y \vert = x^2 - D y^2$ is a Multiplicative Norm of this Ring

The axioms of a multiplicative norm $N(x)$ on a ring is the following:
1. $N(u) = 0 \iff u = 0 + \sqrt{d} \cdot 0$
2. $N(u \cdot v) = N(u) N(v) \quad \text{for all} \ u, v \in \mathbb{Z}[\sqrt{D}]$
3. $N(u + v) = N(u) + N(v) \quad \text{for all} \ u, v \in \mathbb{Z}[\sqrt{D}]$

$1.$

<div class="equation-container">
$$
\vert u \vert = 0 \iff \vert x_u + \sqrt{D} y_u \vert = 0 \iff x_u^2 + D y_u^2 = 0 \iff x_u = y_u = 0 \iff u = 0 + \sqrt{d} \cdot 0
$$
</div>

$2.$

<div class="equation-container">
$$
\begin{align}
    \vert u \cdot v \vert 
    &= \vert (x_u - \sqrt{D} y_u) \cdot (x_v - \sqrt{D} y_v) \vert \\
    &= \vert (x_u x_v + D y_u y_v) - \sqrt{D} ( x_u y_v + x_v y_u )  \vert \\
    &= (x_u x_v + D y_u y_v)^2 - D ( x_u y_v + x_v y_u )^2 \\
    &= (x_u^2 x_v^2 + D^2 y_u^2 y_v^2 + 2 D x_u x_v y_u y_v) - D ( x_u^2 y_v^2 + x_v^2 y_u^2 + 2 x_u x_v y_u y_v ) \\
    &= x_u^2 x_v^2 + D^2 y_u^2 y_v^2 - D x_u^2 y_v^2 - D x_v^2 y_u^2 \\
    &= (x_u^2 - D y_u^2) (x_v^2 - D y_v^2) \\
    &= \vert u \vert \vert v \vert
\end{align}
$$
</div>

$3.$

<div class="equation-container">
$$
\begin{align}
    \vert u \cdot v \vert 
    &= \vert (x_u - \sqrt{D} y_u) + (x_v - \sqrt{D} y_v) \vert \\
    &= \vert (x_u + x_v) - \sqrt{D} (y_u + y_v) \vert \\
    &= (x_u + x_v)^2 - D (y_u + y_v)^2 \\
    &= (x_u^2 + x_v^2 + 2 x_u x_v) - D (y_u^2 + y_v^2 + 2 y_u y_v) \\
    &= (x_u^2 + x_v^2 + 2 x_u x_v) - D (y_u^2 + y_v^2 + 2 y_u y_v) \\
\end{align}
$$
</div>