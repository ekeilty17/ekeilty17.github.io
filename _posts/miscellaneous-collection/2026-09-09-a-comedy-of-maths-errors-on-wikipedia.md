---
layout:     post
title:      "A Comedy of Maths Errors on Wikipedia"
date:       2026-09-09
categories: blog
permalink:  ":categories/:title/"
series:     miscellaneous
tags:       math errors, logarithms
---

## Introduction

While writing [this blog](/blog/a-short-stay-in-hell/) post, I came across this figure from a [Wikipedia article](https://en.wikipedia.org/wiki/A_Short_Stay_in_Hell) (underlied in red).

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/a-comedy-of-maths-errors-on-wikipedia/maths_error.png" alt="Maths Error" width="800px" />
</div>
</div>
</center>

This wikipedia article is claiming that 

$$
23^{439} = 3.38 \times 10^{475}
\qquad
\boxtimes \text{ wrong}
$$

Yet, the correct calculation is

$$
23^{439} = 6.29 \times 10^{597}
\qquad
\checkmark \text{ correct}
$$

I have since corrected the wikipedia page. However, I was curious how this person got this calculation so wrong. I believe I have reversed engineered what the person did. If I am correct, it is quite the comedy of maths errors.

<br>

## The Correct Calculation

Let's generalize the computation we are trying to do. Given any arbitrary real numbers $a > 0$ and $b > 1$, we want to convert them to real number $0 < s < 1$ and integer $e \in \mathbb{Z}$ such that

$$
b^a = s \times 10^e
$$

First, compute the following intermediate value

$$
x := \log_{10} b^a = a \cdot \log_{10} b
$$

Importantly, $a \cdot \log_{10} b$ is typically computable on a calculator, even for very large $a$ and $b$. Now we can compute $e$ and $s$ as follows

$$
e := \lfloor x \rfloor
\qquad
\text{,}
\qquad
s := 10^{x - \lfloor x \rfloor}
$$

This is straight-forward to verify

$$
s \times 10^{e} = 10^{x - \lfloor x \rfloor} \cdot 10^{\lfloor x \rfloor} = 10^{x} = 10^{\log_{10} b^a} = b^a
$$

In this post, we will call $s$ the **significand** and $e$ the **exponent**. Applying this formula the target expression, we get

$$
\begin{align}
    &x = 439 \cdot \log_{10} (23) = 597.79852 \\[10pt]
    &e = \lfloor x \rfloor = 597 \\[10pt]
    &s = 10^{x - \lfloor x \rfloor} = 10^{0.79852} = 6.2881
\end{align}
$$

<br>

## My Hypothesis to Explain the Incorrect Calculation

Strangly, the exponent and the significand seem to have been calculated independently of each other, and their wrong calculations make contradictory errors. All assuming my hypothesis is correct of course.

### The Exponent

I believe the person flipped the $3$ and the $4$ in the number $439$ when computing the exponent. So they instead computed

$$
\begin{align}
    &\widetilde{x} = 349 \cdot \log_{10}(23) = 475.243 \qquad\leftarrow\text{mistakenly uses } 349 \text{ instead of } 439\\[10pt]
    &\widetilde{e} = \lfloor \widetilde{x} \rfloor = 475
\end{align}
$$

I am almost certain this is what happened.

### The Significand

The signficand is more difficult to explain. It seems like this person started a completely independent calculation, rather than using the numbers he/she already had from the exponent calculation. Strangely, they make completely contradictory errors. Here, they do not make the transcription error, correctly using $439$. However, I hypothesize they made the following 2 errors.
1. They mistakenly use the natural logarithm instead of the logarithm base $10$
2. They incorrectly rounded $3.13549$ to $3.1356$

Let's see how this calculation plays out.

$$
\begin{align}
    &\widetilde{x}_1 = \ln (23) = 3.13549 &&\qquad\leftarrow\text{mistakenly uses } \ln \text{ instead of } \log_{10}\\[10pt]
    &\widetilde{x}_2 = 3.1356 &&\qquad\leftarrow\text{incorrectly rounds } \widetilde{x}_1\\[10pt]
    &\widetilde{x}_3 = 439 \cdot \widetilde{x}_2 = 1376.5284 &&\\[10pt]
    &\widetilde{s} = 10^{\widetilde{x}_3 - \lfloor \widetilde{x}_3 \rfloor} = 10^{0.5284} = 3.375981 &&
\end{align}
$$

I am not 100% confident in this, but it's the most plausible explanation I can come up with.

<br>

## Conclusion

I just thought this was pretty hilarious. I can empathize with the transcription mistake which caused the error in the exponent. However, I cannot forgive the error in the significand. There are just so many fundamentally wrong things that happened in a row. I, for one, blaim the education system.