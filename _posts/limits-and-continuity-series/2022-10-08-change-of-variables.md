---
layout:     series
title:      "Change of Variables"
date:       2022-10-08
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       7
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, change-of-variables
---

## Motivation

Recall that $\displaystyle \lim_{x \rightarrow 0} \frac{\sin(x)}{x} = 1$. Now, suppose we want to evaluate $\displaystyle \lim_{x \rightarrow 0} \frac{\sin(kx)}{x}$ for some constant $k \neq 0$. How can we do this?

Notice, we can rewrite the limit as follows $\displaystyle \lim_{x \rightarrow 0} k \cdot \frac{\sin(kx)}{kx}$. Now, it seems obvious that we can define $z = kx$ and rewrite the limit as $\displaystyle k \cdot \lim_{z \rightarrow 0} \frac{\sin(z)}{z}$ and conclude the limit is equal to $k$. This is a common technique called a **change of variables**. In this post, we will show when we are allowed to do this.

<br>

## Limit Law Proof

Let $f: B \rightarrow C$ be a continuous function. This means that $\lim_{z \rightarrow b} f(z) = f(b)$ for all $b \in B$.

Let $g: A \rightarrow B$ be a function (not necessarily continuous).

Let $b = \lim_{x \rightarrow a} g(x)$.

<br>

Therefore,

$$
\lim_{x \rightarrow a} f(g(x)) = f \left ( \lim_{x \rightarrow a} g(x) \right ) = f(b) = \lim_{z \rightarrow b} f(z)
$$

<br>

## Counter-Example

Some sources will say that you can use change of variables as long as $\displaystyle \lim_{z \rightarrow b} f(z)$ exists. However, this is not true. I show a counter-example below.

Suppose
&nbsp;
$$f(z) = \begin{cases} 
    1       &\quad\text{if } z = 0 \\
    0       &\quad\text{otherwise}
\end{cases}$$ 
&nbsp;&nbsp;
and
&nbsp;
&nbsp;
$$g(x) = x \sin(1/x)$$ 

Clearly, $$\displaystyle \lim_{z \rightarrow 0} f(z) = 0$$. I will leave it as an exercise to the reader to show that $$\displaystyle \lim_{x \rightarrow 0} g(x) = 0$$.

<br>

Now, consider 
&nbsp;
$$f(g(x)) = \begin{cases} 
    1       &\quad\text{if } x = \frac{1}{n\pi} \text{ for some } n \in \mathbb{Z} \\
    0       &\quad\text{otherwise}
\end{cases}$$.

Therefore, $$\displaystyle \lim_{x \rightarrow 0} f(g(x))$$ does not exist, because the function oscillates infinitely between $0$ and $1$ at $x = 0$.

<br>

## Comment on the Motivating Example

You may be wondering, how could we know that $\displaystyle \lim_{x \rightarrow 0} \frac{\sin(kx)}{x}$ was continuous before applying this change of variable law? Doesn't this just move the problem back one step? Actually, we can know that it's continuous. In a future [post](/blog/limits-and-continuity/trigonometric-functions/), we show that $\sin$ is continuous. We know that the identity function is continuous. Finally, in another future [post](/blog/limits-and-continuity/continuity-invariants/) we show that division preserves continuity. Thus, we do know that this function is continuous and can apply change of variables without circularity.