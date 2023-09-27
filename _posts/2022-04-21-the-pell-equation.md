---
layout:     post
title:      "Solving The Pell Equation Efficently"
date:       2022-08-01
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       diophantine equation, number theory, python
---

The Pell Equation is an equation of the form $x^2 - D y^2 = 1$ for $D > 0$. Our task is to find **integer** solutions to this equation. I was first introduced to this problem by [Project Euler #66](https://projecteuler.net/problem=66), and I think the solution is beautiful and would like to share it. Much of this post is inspired by [this paper](http://library.msri.org/books/Book44/files/01lenstra.pdf) by Hendrik W. Lenstra, Jr.

<br>

## Reframing the Problem

First, we note two key facts:

* $\mathbb{Z}[\sqrt{D}] =$ { $x + \sqrt{D} y \ \ \vert \ \ x, y \in \mathbb{Z}$ } forms a **ring** on operations addition and multiplication
* $\vert x + \sqrt{D} y \vert = x^2 - D y^2$ is a **norm** of this ring

Both of these claims will be proved in an appendix at the end of the post for completeness' sake, but these details are not the focus. What is important is that we notice the Pell Equation can be factored as the following.

$$ (x + \sqrt{D} y) (x - \sqrt{D} y) = 1 $$

Thus, we can reframe finding the solutions to the Pell Equation as finding the **nontrivial** unit of the ring $\mathbb{Z}[\sqrt{D}]$ of norm 1.

This gives us is a way of generating new solutions from a given solution. Suppose that $(x_1, y_1)$ is a solution to the Pell Equation. We notice that

$$\vert x_1 + \sqrt{D} y_1 \vert = 1 \implies \vert x_1 + \sqrt{D} y_1 \vert^k = 1 \quad \text{for all} \ k \geq 1 $$

Using properties of norms, we have

$$ \vert x_1 + \sqrt{D} y_1 \vert^k = \vert (x_1 + \sqrt{D} y_1)^k \vert $$


Since $\mathbb{Z}[\sqrt{D}]$ forms a ring, $(x_1 + \sqrt{D} y_1)^k = x_k + \sqrt{D} y_k$ for some $x_k, y_k \in \mathbb{Z}$. Putting it all together we have

$$ \vert x_1 + \sqrt{D} y_1 \vert = 1 \implies 1 = \vert x_1 + \sqrt{D} y_1 \vert^k = \vert (x_1 + \sqrt{D} y_1)^k \vert = \vert x_k + \sqrt{D} y_k \vert = x_k^2 - D y_k^2$$

Thus, $(x_k, y_k)$ is also a solution to the Pell Equation for all $k \geq 1$.
In fact, [Dirichlet's Unit Theorem](https://faculty.math.illinois.edu/~r-ash/Ant/AntChapter6.pdf) tells us that given $(x_1, y_1)$ is the **fundamental solution** to the Pell Equation, this method will generate **every** solution. The fundamental solution is the **nontrivial** solution with the smallest $x$ or $y$ component.

So once we have the fundamental solution, we have a _very_ efficient algorithm for generating the remaining solutions. if $(x_1, y_1)$ is the fundamental solution, then 


$$(x_{k+1} - \sqrt{D} y_{k+1}) = (x_1 - \sqrt{D} y_1)^{k+1} = (x_1 - \sqrt{D} y_1) \cdot (x_1 - \sqrt{D} y_1)^k = (x_1 - \sqrt{D} y_1) \cdot (x_k - \sqrt{D} y_k)$$

Multiplying out the far right-hand side and equating it to the far left-hand side gives the recursive identity

$$ (x_{k+1}, y_{k+1}) = (x_1 x_k + D y_1 y_k, x_1 y_k + x_k y_1) $$


Note that $(1, 0)$ is considered a trivial solution. If we attempt to use the recursive formula defined above, we will see that we just get $(1, 0)$ back. Thus, this is not a fundamental solution.

<br>

## Continued Fractions

We have to take a quick detour into continued fractions as they play an important role in the solution. A continued fraction takes the form 

$$ a_0 + \frac{1}{a_1 + \frac{1}{a_2 + \frac{1}{a_3 + \ldots}}} $$


I think they are best explained by an example.

$$ \sqrt{3} = 1 + (\sqrt{3} - 1) = 3 + \frac{2}{\sqrt{3} + 1} = 3 + \frac{1}{\frac{\sqrt{3} + 1}{2}} = 3 + \frac{1}{1 + \frac{\sqrt{3} - 1}{2}} = 3 + \frac{1}{1 + \frac{1}{\sqrt{3} + 1}} = 3 + \frac{1}{1 + \frac{1}{2 + (\sqrt{3} - 1)}}$$

Notice in the last part, we arrived at the same expression as when we started: $\sqrt{3} - 1$. Therefore, everything after that point will be exactly the same, so we've arrived at a repeating expression. If a continued fraction has this property, it is called **periodic**. It turns out that $\sqrt{n}$ where $n$ is an integer is always periodic. The proof for this could be it's own post. For the curious refer [here](https://sites.millersville.edu/bikenaga/number-theory/periodic-continued-fractions/periodic-continued-fractions.html). Thus, we can write the continued fraction in a sort-hand notation.

$$ \sqrt{3} = 1 + \frac{1}{1 + \frac{1}{2 + \frac{1}{1 + \frac{1}{2 + \ldots}}}} = [1; 1, 2, 1, 2, \ldots] = [1; \overline{1, 2}]$$

<br>

## Finding the Fundamental Solution

This part of the solution is the reason I needed to share this problem. It is so shocking, yet so beautiful. 

It turns out, the fundamental solution can be calculated by the following procedure

1. Compute the continued fraction of $$\sqrt{D}$$, suppose it has the form $$ [a_0; \overline{a_1, \ldots, a_k}] $$
2. Compute the following truncated continued fraction

    $$ \frac{x}{y} = \begin{cases}
        [a_0; a_1, \ldots, a_{k-1}] \quad &\text{if } k \text{ is even} \\
        [a_0; a_1, \ldots, a_{2k-1}] \quad &\text{if } k \text{ is odd}
        \end{cases}
    $$

3. $$(x, y)$$ is the fundamental solution, i.e. $$x^2 - D y^2 = 1$$.

A different but equivalent approach (more practical for code) is the following:

1. Compute the continued fraction of $$\sqrt{D}$$, suppose it has the form $$ [a_0; \overline{a_1, \ldots, a_k}] $$
2. Compute the following truncated continued fraction $$\frac{x}{y} = [a_0; a_1, \ldots, a_k]$$
3. Evaluate $$x^2 - D y^2$$. If it equals $-1$, then square the solution ($$x' = x^2 + Dy^2, y' = 2xy$$) and that is the fundamental solution.

<br>

Let's do an example using $$\sqrt{3}$$. The truncated continued fraction and its reduced fraction form is the following

$$ \sqrt{3} = 3 + \frac{1}{1 + \frac{1}{2 + (\sqrt{3} - 1)}} \quad\rightarrow\quad 1 + \frac{1}{1 + 0} = \frac{2}{1} $$

Now, we test the solution $$(x, y) = (2, 1)$$.

$$ 2^2 - 3 \cdot 1^2 = 4 - 3 = 1$$

And indeed, it's the fundamental solution. This can be used to generate every solution extremely efficiently.

$$ (x_{k+1}, y_{k+1}) = (2 x_k + 3 y_k, x_k + 2 y_k) $$

### Why Does That Work?

Intuitively, the reason this works is because the continued fraction is a very good approximation $$\sqrt{D}$$. By truncating it at its periodic point, we take advantage of a number of properties which ensures it's an extremely good approximation. Thus, when we run it through the Pell Equation, we only get a difference of $$1$$.

To add a bit more detail, I am going to give a proof sketch. For a complete proof, you can refer [here](https://ir.canterbury.ac.nz/server/api/core/bitstreams/7f14fb64-bc37-46b8-9d2d-0d705cab0319/content). 

Let continued fraction of $$\sqrt{D}$$ be $$ [a_0; \overline{a_1, \ldots, a_k}] $$. Let $$p_n / q_n = [a_0; a_1, \ldots, a_n]$$ denote the $$n$$th truncation of the continued fraction. I am going to assert the following equality (you can check it yourself).

$$ \sqrt{D} = \frac{(a_0 + \sqrt{D}) p_{k-1} + p_{k-2}}{(a_0 + \sqrt{D})q_{k-1} + q_{k-2}} $$

Expanding, we get

$$ q_{k-1} D + (a_0 q_{k-1} + q_{k-2})\sqrt{D} = a_0 p_{k-1} + p_{k-2} + p_{k-1} \sqrt{D} $$

Since $\mathbb{Z}[\sqrt{D}]$ is a field, we have

$$ q_{k-1} D = a_0 p_{k-1} + p_{k-2} \qquad\text{and}\qquad p_{k-1} = a_0 q_{k-1} + q_{k-2} $$

Therefore

$$ p_{k-2} = q_{k-1} D - a_0 p_{k-1} \qquad\text{and}\qquad q_{k-2} = p_{k-1} - a_0 q_{k-1} $$

Another fact I will state without proof is that $p_{i+1}q_i - p_iq_{i+1} = (-1)^i$ for any $i$. This is not too difficult to verify for yourself using induction. Now, substitute $i = k-2$ and combine with the above to get

$$ (-1)^{k-2} = p_{k-1}(p_{k-1} - a_0 q_{k-1}) - (q_{k-1} D - a_0 p_{k-1})q_{k-1}$$

Thus,

$$ p_{k-1}^2 - D q_{k-1}^2 = (-1)^k $$

i.e. $(p_{k-1}, q_{k-1})$ is a solution to the Pell Equation if $k$ is even. You can use exactly the same argument to find that $(p_{2k-1}, q_{2k-1})$ is a solution if $k$ is odd. 

A detail I have left out is why this gives the _fundamental_ solution. Intuitively this is because $[a_0; a_1, \ldots, a_{k-1}]$ is the first truncation that gives a solution. Therefore, it will result in the smallest resulting solution. To prove this formally is too much math for an already long post.

<br>

## Implementation

All this theory provides an extremely simple, elegant, and efficient algorithm for solving the Pell Equation. The pseudocode is given below. I have also implemented this fully on my [GitHub](https://github.com/ekeilty17/Project_Euler/blob/master/P066.py).

```python
def fundamental_solution_of_pell_equation(D):
    if is_perfect_square(D):
        return None     # perfect squares have no solution

    L = continued_fraction(D)      # [a_0, a_1, ..., a_k]
    x0, y0 = collapse_continued_fraction(L[:-1])
    if (x0**2 - D * y0**2) == -1:
        x0, y0 = x0**2 + D*y0**2, 2*x0*y0
    
    return x0, y0
```

```python
def generate_kth_solution(D, x0, y0, k):
    x, y = x0, y0
    for _ in range(k):
        x, y = x0*x + D*y0*y, x0*y + x*y0
    return x, y
```

There are faster algorithms than this, but the theory behind them is much beyond me.

<br>

---

## Appendix

### $\mathbb{Z}[\sqrt{D}]$ Forms a Ring on Addition and Multiplication

We define the operations $+$ and $\cdot$ as you would expect. Let $(a, b)$ be short-hand for $a + \sqrt{D}b$ 

$$(a, b) + (c, d) = (a+c, \ b+d) \qquad \text{and} \qquad (a, b) \cdot (c, d) = (ac + Dbd, \ ad + bc)$$


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

$$ 
\begin{align}
    ((a, b) + (c, d)) + (e, f) 
    &= (a+c, \ b+d) + (e, f) \\
    &= ((a+c)+e, \ (b+d)+f) \\
    &= (a+(c+e), \ b+(d+f)) \\
    &= (a, b) + ((c, d) + (e, f)) 
\end{align}
$$

$2.$ 

$$ (a, b) + (c, d) = (a+c, \ b+d) = (c+a, \ d+b) = (c, d) + (a, b) $$

$3.$ The additive identity is $(0, 0)$, which is contained in $\mathbb{Z}[\sqrt{D}]$

$$ (a, b) + (0, 0) = (a+0, \ b+0) = (a, b) $$

$4.$ The additive inverse is $(-a, -b)$, which is contained in $\mathbb{Z}[\sqrt{D}]$

$$ (a, b) + (-a, -b) = (a+(-a), \ b+(-b)) = (0, 0) $$

Axioms 5, 6, and 7 are inherited by the fact that the integers form a ring.

$5.$

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

$6.$ The multiplicative identity is $(1, 0)$, which is contained in $\mathbb{Z}[\sqrt{D}]$

$$ (a, b) \cdot (1, 0) = (a \cdot 1 + Db \cdot 0, \ a \cdot 0 + b \cdot 1) = (a, b)$$

$7.$

$$
\begin{align}
    (a, b) \cdot ((c, d) + (e, f))
    &= (a, b) \cdot (c+e, \ d+f) \\
    &= (a(c+e) + Db(d+f), \ a(d+f) + b(c+e)) \\
    &= (ae + Dbf, \ af + be) + (ce + Ddf, \ cf + de) \\
    &= ((a, b) \cdot (e, f)) + ((c, d) \cdot (e, f))
\end{align}
$$

We can see that in this case, multiplication is actually also commutative

$$ (a, b) \cdot (c, d) = (ac + Dbd, \ ad + bc) = (ca + Ddb, \ cb + da) = (c, d) \cdot (a, b)$$

So we get 

$$((c, d) + (e, f)) \cdot (a, b) = (a, b) \cdot ((c, d) + (e, f)) = ((a, b) \cdot (e, f)) + ((c, d) \cdot (e, f))$$

for free.

<br>

### $\vert x + \sqrt{D} y \vert = x^2 - D y^2$ is a Multiplicative Norm of this Ring

The axioms of a multiplicative norm $N(x)$ on a ring is the following:
1. $N(u) = 0 \iff u = 0 + \sqrt{d} \cdot 0$
2. $N(u \cdot v) = N(u) N(v) \quad \text{for all} \ u, v \in \mathbb{Z}[\sqrt{D}]$
3. $N(u + v) = N(u) + N(v) \quad \text{for all} \ u, v \in \mathbb{Z}[\sqrt{D}]$

$1.$

$$
\vert u \vert = 0 \iff \vert x_u + \sqrt{D} y_u \vert = 0 \iff x_u^2 + D y_u^2 = 0 \iff x_u = y_u = 0 \iff u = 0 + \sqrt{d} \cdot 0
$$

$2.$

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

$3.$

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

