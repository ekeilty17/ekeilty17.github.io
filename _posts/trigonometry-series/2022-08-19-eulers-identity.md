---
layout:     series
title:      "Euler's Identity"
date:       2022-08-19
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       18
series:     trigonometry
tags:       trigonometry, eulers-identity
---

We can't do a series on trigonometric identities without proving the infamous Euler's Identity. The simplest proof is algebraic using the power series expansions of $\sin$, $\cos$, and $e$. However, in this post, I want to prove this result for someone who does not know calculus. It's not super rigorous, but I think it gives the general intuition.

<br>

## Definition of Euler's Constant

There is a canonical backstory with Euler's constant involving compounding interest. For our purposes, I am just going to give this definition.

$$
e^x = \lim_{n \rightarrow \infty} \left ( 1 + \frac{x}{n}\right )^n
$$

<br>

## Proof of Euler's Identity

Let $z = cis \ \theta$ be any complex number with a magnutide of $1$. Define $\displaystyle z_n = \left (1 + \frac{i \theta}{n} \right )^n = r_n \ cis \ \theta_n$. We are going to prove that $\displaystyle \lim_{n \rightarrow \infty} z_n = z$. To do this, we will prove that $\displaystyle \lim_{n \rightarrow \infty} r_n = 1$ and $\displaystyle \lim_{n \rightarrow \infty} \theta_n = \theta$.

First, we need to evaluate $\displaystyle w = \left ( 1 + \frac{i \theta}{n} \right ) = s \ cis \ \phi$

$$
s = \sqrt{1 + \frac{\theta^2}{n^2}} \qquad\qquad \tan \phi = \frac{\theta}{n} 
$$

We can also apply the power rule, since $z_n = w^n$. Thus, the magnitude scales and the angle adds.

$$
r_n = s^n = \left ( \sqrt{1 + \frac{\theta^2}{n^2}} \right )^n \qquad\qquad \tan \theta_n = \tan (n \phi)
$$

Now, we see what happens when we let $n$ approach infinity.

$$
\begin{align}
    \lim_{n \rightarrow \infty} r_n 
    &= \lim_{n \rightarrow \infty} \left ( \sqrt{1 + \frac{\theta^2}{n^2}} \right )^n \\[10pt]
    &= \lim_{n \rightarrow \infty} \left ( 1 + \frac{\theta^2}{n^2} \right )^{n/2} \\[10pt]
    &= \lim_{m \rightarrow \infty} \left ( 1 + \frac{\theta^2}{m} \right )^{\frac{\sqrt{m}}{2}} \\[10pt]
    &= \lim_{m \rightarrow \infty} \left [ \left ( 1 + \frac{\theta^2}{m} \right )^m \right ]^{\frac{1}{2\sqrt{m}}} \\[10pt]
    &= \lim_{m \rightarrow \infty} \left [ e^{\theta^2} \right ]^{\frac{1}{2\sqrt{m}}} \\[10pt]
    &= \left [ e^{\theta^2} \right ]^{0} \\[10pt]
    &= 1
\end{align}
$$

Now we do $\theta_n$. I'm going to be a bit unrigorous in order to avoid derivatives. First, we utilize something called the small-angle approximation.

<center>
{% tikz small-angle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (0, 0);
    \coordinate (B) at (5, 0);
    \coordinate (C) at (5, 0.75);

    \draw[thick] (A) -- (B) node[midway, below] {$\approx 1$};
    \draw[thick] (B) -- (C) node[midway, right] {$\approx \theta$};
    \draw[thick] (C) -- (A) node[midway, above] {$1$};

    % draw incident angle of triangle
    \pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={100}, angle eccentricity=1.1] {angle = B--A--C};

    \draw ($(B) - (0.25,0)$) -- ++(0,0.25) -- ++(0.25,0);     % Q1

{% endtikz %}
</center>

As the angle $\theta$ approaches $0$, $\tan \theta$ approaches $\frac{\theta}{1} = \theta$. Thus, in the following proof, since as $n$ approaches $\infty$, $\theta$ approaches $0$, I will use this approximation to exchange $\tan \theta$ and $\theta$.

$$
\begin{align}
    \lim_{n \rightarrow \infty} \theta_n 
    &= \lim_{n \rightarrow \infty} \tan (n \phi) \\[10pt]
    &= \lim_{n \rightarrow \infty} n \phi \\[10pt]
    &= \lim_{n \rightarrow \infty} n \tan \phi \\[10pt]
    &= \lim_{n \rightarrow \infty} n \cdot \frac{\theta}{n} \\[10pt]
    &= \lim_{n \rightarrow \infty} \theta \\[10pt]
    &= \theta
\end{align}
$$

Therefore, we have shown that $\displaystyle \lim_{n \rightarrow \infty} z_n = z$. Therefore,

$$
\lim_{n \rightarrow \infty} \left ( 1 + \frac{i\theta}{n} \right )^n = \cos \theta + i \sin \theta
$$

But, the left-hand side is just the definition of $e$!

<br>

## Summary

Thus, we have shown the famous Euler's Identity

$$
e^{i\theta} = \cos \theta + i \sin \theta
$$

Therefore, instead of using the notation $z = r \ cis \ \theta$, we instead use the notation $z = r e^{i\theta}$. Taking that particular case of $\theta = \pi$, we have the most famous formula in mathematics.

$$
e^{i\pi} = -1
$$

Incorporating all of the rockstars in math: $e$, $\pi$, $i$, and $1$.