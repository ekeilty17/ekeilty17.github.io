---
layout:     series
title:      "Introduction"
date:       2022-10-01
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       0
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, introduction
---

**TODO** This entire series probably needs to be polished, but the content is mostly already here.

## Motivation

When writing my [derivative proofs series](/blog/derivative-proofs/), in the [introduction](blog/derivative-proofs/introduction/) I assert without proof the limit laws that we would need. Here, I would like to take the time to rigorously prove these limit laws using the epsilon-delta definition, in order to provide the proper foundation for my derivative proofs series.

I remember when taking first-year calculus in university that $\epsilon - \delta$ proofs were one of the most dreaded topics. However, when reading Terence Tao's  <a href="https://link.springer.com/content/pdf/10.1007/978-981-10-1789-6.pdf" target="_blank">real analysis textbook, I began to appreciate their elegance. This series gives me an excuse to revisit $\epsilon - \delta$ proofs, and helped me gain a better understanding of the foundation of modern calculus.

<br>

## A Little History

The concept of a _limit_ has been around for a very long time. As far back as the Greeks give the famous <a href="https://www.youtube.com/watch?v=u7Z9UnWOJNY" target="_blank">Zeno's Paradox and Achilles and the Tortoise</a> thought experiments, wrestling with the idea of infinite sequences. Famously, the genius of antiquity <a href="https://en.wikipedia.org/wiki/Archimedes" target="_blank">Archimedes</a> almost discovered integration when studying <a href="https://archive.org/details/worksofarchimede029517mbp/page/232/mode/2up" target="_blank">quadratures of the parabola</a>. Moreover, there were a number of <a href="https://www.youtube.com/watch?v=R1HUtt2oo7A" target="_blank">unrigorous proofs</a> for the area of a circle, which used limit-like arguments.

When Calculus was first invented by <a href="https://en.wikipedia.org/wiki/Isaac_Newton" target="_blank">Newton</a> and <a href="https://en.wikipedia.org/wiki/Gottfried_Wilhelm_Leibniz" target="_blank">Leibniz</a>, its foundation was largely heuristic, based on this concept of <a href="https://en.wikipedia.org/wiki/Infinitesimal" target="_blank">infinitesimals</a>, as can be seen in the notation $\frac{dy}{dx}$. The issue with this approach is that the foundation of Calculus was these numbers that seemingly did not exist and could not be rigorously established. Eventually, <a href="https://en.wikipedia.org/wiki/Augustin-Louis_Cauchy" target="_blank">Cauchy</a> proposed his $\epsilon - \delta$ formulation of limits. It was quickly realized that **all** of calculus could be rigorously rooted in these definitions. Thus, they are what are taught today.

For further reading, I recommend <a href="http://users.uoa.gr/~spapast/TomeasDidaktikhs/Caychy/GrabinerOriginsofCauchysRigorousCalculus.pdf" target="_blank">The Origins of Cauchy's Rigorous Calculus</a> and <a href="https://authors.library.caltech.edu/75428/1/NON-STANDARD%20ANALYSIS-ROBINSONS%20THEORY%20OF%20INFINITESIMALS-1962.pdf" target="_blank">Lectures of A Robinson's Theory of Infinitesimals and Infinitely Large Numbers</a>.

<br>

## A Short Reflection

A theme with all of my series has been that often I find places where the typical proofs found in courses or textbooks are unrigorous or circular. This series is no exception. The proofs for the continuity of $e^x$ and $\sin(x)$ often implicitly assume their continuity within them. In the case of $e^x$, proofs typically require the continuity of $\ln(x)$, which derives its continuity from $e^x$. In the case of $\sin(x)$, arguments typically require the fact that $\lvert \sin(x) \rvert \leq \lvert x \rvert$, which is often proved using the derivative of $\sin(x)$, whose proof requires the continuity of $\sin(x)$ at $x = 0$. In this series, fix these circularities and provide a completely rigorous formulation. 

<!-- Using the power series definitions fixes all of these problems, but that's not as fun. -->

<br>

## Definition of Limits

Let $f$ be any function, $a \in \mathbb{R}$ not necessarily in the domain of $f$, and $L \in \mathbb{R}$ not necessarily in the range of $f$.

The notation $\displaystyle \lim_{x \rightarrow a} f(x) = L$ is read as "the limit of $f$ as $x$ approaches $a$ is $L$" is syntactic sugar that actually means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

<br>

We have to be extremely careful with what we mean by equality here. **If** such an $L$ satisfies the above, then the limit **exists** and is equal to $L$, otherwise, the limit does not exist and equality is left undefined. 

For example, $\displaystyle \lim_{x \rightarrow 0} \frac{1}{x}$ does not exist. Thus, there is no such $L \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow 0} \frac{1}{x} = L$. Therefore, $\displaystyle \lim_{x \rightarrow 0} \frac{1}{x}$ is left undefined

<br>

## Definition of Continuity

We say that $f$ is **continuous** at $a$ if $\displaystyle \lim_{x \rightarrow a} f(x) = f(a)$. Written using the limit definition, 

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) - f(a) \rvert < \epsilon
$$

<br>

We say that $f$ is **continuous** if it is continuous for all $a$ in the domain of $f$.

<br>

Intuitively, a function is continuous if you can draw it without picking up your pencil. This is what the definition is essentially saying. If the limit is always equal to the value of the function, then locally the function always equals what it is approaching. 

<br>

## The Triangle Inequality

In proofs, we will often use the **triangle inequality**

$$
\lvert a + b \rvert \leq \lvert a \rvert + \lvert b \rvert
$$

and the **subtraction triangle inequality**

$$
\Big \lvert \lvert a \rvert - \lvert b \rvert \Big \rvert \leq \lvert a - b \rvert
$$

**TODO** Find a source which proves this.

<br>

## Bounding Convergent Functions

If $\displaystyle \lim_{x \rightarrow a} f(x)$ exists, then $f(x)$ is bounded in a small neighborhood around $a$. Very often we will fix a particular $\epsilon > 0$ and say

$$
\begin{align}
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \quad\implies\quad \lvert f(x) - L \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \quad\implies\quad \Big \lvert \lvert f(x) \rvert - \lvert L \rvert \Big \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \quad\implies\quad -\epsilon < \lvert f(x) \rvert - \lvert L \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \quad\implies\quad \lvert L \rvert - \epsilon <  \lvert f(x) \rvert < \lvert L \rvert + \epsilon
\end{align}
$$

Now, we can set $\epsilon$ can be anything we want, for example $\epsilon = \frac{\lvert L \rvert}{2}$.