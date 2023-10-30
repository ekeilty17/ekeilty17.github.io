---
layout:     series
title:      "Sine and Cosine"
date:       2023-05-06
categories: blog laplace-transform
permalink:  ":categories/:title/"
part:       5
series:     laplace-transform
tags:       laplace-transform, trig, trigonometry, sine, cosine
---

## Why I Rewrote This

While I think everything here is valid, I found a way easier way to do it by using the trig identities I express at the end. However, such is math. Sometimes you have to find the complicated proof before you can find the clean one.

## Article

Recall the identities

$$
\sin(x) = \frac{e^{it} - e^{-it}}{2i} \qquad\qquad \cos(t) = \frac{e^{it} + e^{-it}}{2}
$$

We will use these and the Laplace Transform of the exponential to solve sine and cosine

## Sine

Given $f(t) = \sin(t)$

$$
\begin{align}
    \mathcal{L}\{ \sin(t) \}
    &= \mathcal{L}\{ \frac{1}{2i} (e^{it} - e^{-it}) \} \\[10pt]
    &= \frac{1}{2i} \left ( \mathcal{L}\{ e^{it} \} - \mathcal{L}\{ e^{-it} \} \right ) \\[10pt]
    &= \frac{1}{2i} \left ( \frac{1}{s-i} - \frac{1}{s+i} \right ) \\[10pt]
    &= \frac{1}{2i} \frac{(s+i) - (s-i)}{s^2+1}  \\[10pt]
    &= \frac{1}{s^2+1}
\end{align}
$$

Then, we can use our scaling property to see that 

$$
\mathcal{L}\{ \sin(bt) \} = \frac{1}{b} \frac{1}{(s/b)^2+1} = \frac{b}{s^2 + b^2}
$$

I don't want to write out the derivation here because it's extremely tedious, but my younger self proved the following result.

$$
\mathcal{L}\{ \sin(bt + c) \} = \frac{s \sin(c) + b \cos(c)}{s^2 + b^2}
$$

I only include this because I've never seen it anywhere else.


## Cosine

Given $f(t) = \cos(t)$

$$
\begin{align}
    \mathcal{L}\{ \cos(t) \}
    &= \mathcal{L}\{ \frac{1}{2} (e^{it} + e^{-it}) \} \\[10pt]
    &= \frac{1}{2} \left ( \mathcal{L}\{ e^{it} \} + \mathcal{L}\{ e^{-it} \} \right ) \\[10pt]
    &= \frac{1}{2} \left ( \frac{1}{s-i} + \frac{1}{s+i} \right ) \\[10pt]
    &= \frac{1}{2} \frac{(s+i) + (s-i)}{s^2+1} \\[10pt]
    &= \frac{s}{s^2+1}
\end{align}
$$

Then, we can use our scaling property to see that 

$$
\mathcal{L}\{ \cos(bt) \} = \frac{1}{b} \frac{(s/b)}{(s/b)^2+1} = \frac{s}{s^2 + b^2}
$$

Again, I don't want to write out the derivation of this, but for completion's sake we have

$$
\mathcal{L}\{ \cos(bt + c) \} = \frac{s \cos(c) - b \sin(c)}{s^2 + b^2}
$$

Again, I only include this because I've never seen it anywhere else.


## Sine, Cosine, and Polynomials - Preparation

We want to evaluate $$\mathcal{L}\{ t^n \sin(bt+c) \}$$ and $$\mathcal{L}\{ t^n \cos(bt+c) \}$$. First, let's do one iteration of integration by parts, starting with sine.

$$
\begin{align}
    \mathcal{L}\{ t^n \sin(bt+c) \}
    &= \int_{0}^{\infty} t^n \sin(bt+c) e^{-st} \; dt \quad \text{(using integration by parts)}\\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \cdot 0 - \frac{1}{s} \lim_{t \rightarrow \infty} t^n \sin(bt+c) e^{-st} + \frac{1}{s} \int_{0}^{\infty} (nt^{n-1} \sin(bt+c) + b t^n \cos(bt+c)) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \int_{0}^{\infty} t^{n-1} \sin(bt+c) e^{-st} \ dt + \frac{b}{s} \int_{0}^{\infty} t^n \cos(bt+c) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \mathcal{L}\{ t^{n-1} \sin(bt+c) \} + \frac{b}{s} \mathcal{L}\{ t^n \cos(bt+c) \}
\end{align}
$$

The limit goes to $0$ since the $\sin(bt+c)$ term is bounded between $[-1, 1]$, so it can be disregarded. Then, we just have the same limit as before. We now do similar with cosine.

$$
\begin{align}
    \mathcal{L}\{ t^n \cos(bt+c) \}
    &= \int_{0}^{\infty} t^n \cos(bt+c) e^{-st} \; dt \quad \text{(using integration by parts)}\\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \cdot 0 - \frac{1}{s} \lim_{t \rightarrow \infty} t^n \cos(bt+c) e^{-st} + \frac{1}{s} \int_{0}^{\infty} (nt^{n-1} \cos(bt+c) - b t^n \sin(bt+c)) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \int_{0}^{\infty} t^{n-1} \cos(bt+c) e^{-st} \ dt - \frac{b}{s} \int_{0}^{\infty} t^n \sin(bt+c) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \mathcal{L}\{ t^{n-1} \cos(bt+c) \} - \frac{b}{s} \mathcal{L}\{ t^n \sin(bt+c) \}
\end{align}
$$

Now, we can combine these two facts and with a little bit of algebra get 

$$
\mathcal{L}\{ t^n \sin(bt+c) \} = \frac{n}{s^2 + b^2} \left [ s \cdot \mathcal{L}\{ t^{n-1} \sin(bt+c) \} + b \cdot \mathcal{L}\{ t^{n-1} \cos(bt+c) \} \right ]
$$

$$
\mathcal{L}\{ t^n \cos(bt+c) \} = \frac{n}{s^2 + b^2} \left [ s \cdot \mathcal{L}\{ t^{n-1} \cos(bt+c) \} - b \cdot \mathcal{L}\{ t^{n-1} \sin(bt+c) \} \right ]
$$

<br>

## Sine, Cosine, and Polynomials - Derivation

Now that we have $$\mathcal{L}\{ t^n \sin(bt+c) \}$$ and $$\mathcal{L}\{ t^n \cos(bt+c) \}$$ in terms of each other, 
I am going to assert the following solution, which was derivated based on a series of substitutions and pattern matching.

$$
\mathcal{L}\{ t^n \sin(bt+c) \} = \frac{n!}{(s^2 + b^2)^n} \left [ \mathcal{L}\{ \sin(bt+c) \} \sum_{k=0}^n \frac{(1 + (-1)^{n-k})}{2} i^{n-k} \binom{n}{k} s^k b^{n-k} \ + \ \mathcal{L}\{ \cos(bt+c) \} \sum_{k=0}^n \frac{(1 + (-1)^{n-k-1})}{2} i^{n-k-1} \binom{n}{k} s^k b^{n-k} \right ]
$$

$$
\mathcal{L}\{ t^n \cos(bt+c) \} = \frac{n!}{(s^2 + b^2)^n} \left [ \mathcal{L}\{ \cos(bt+c) \} \sum_{k=0}^n \frac{(1 + (-1)^{n-k})}{2} i^{n-k} \binom{n}{k} s^k b^{n-k} \ - \ \mathcal{L}\{ \sin(bt+c) \} \sum_{k=0}^n \frac{(1 + (-1)^{n-k-1})}{2} i^{n-k-1} \binom{n}{k} s^k b^{n-k} \right ]
$$

<br>

Let's take a second to interpret the series' because a lot is happening. First of all, let's see what with the $(-1)^{n-k}$ and the imaginary numbers. There are a number of ways you can mathematically express this, I've chosen this one as I think it's the clearest to interpret.

$$
\frac{(1 + (-1)^{n-k})}{2} i^{n-k} = \begin{cases}
     1   &\qquad\text{if}\quad n-k \equiv 0 \mod 4\\
     0   &\qquad\text{if}\quad n-k \equiv 1 \mod 4\\
    -1   &\qquad\text{if}\quad n-k \equiv 2 \mod 4\\
     0   &\qquad\text{if}\quad n-k \equiv 3 \mod 4
\end{cases}
\qquad\qquad
\frac{(1 + (-1)^{n-k-1})}{2} i^{n-k-1} = \begin{cases}
     0   &\qquad\text{if}\quad n-k \equiv 0 \mod 4\\
     1   &\qquad\text{if}\quad n-k \equiv 1 \mod 4\\
     0   &\qquad\text{if}\quad n-k \equiv 2 \mod 4\\
    -1   &\qquad\text{if}\quad n-k \equiv 3 \mod 4
\end{cases}
$$

<br>

Define the function $$A(m) = \frac{(1 + (-1)^{m})}{2} i^{m}$$, which gives an alternating series (positive/negative) for the even values of $m$, and disregards odd indices of $m$.

Now, we can see that these summations are similar to the binomial expansion of $(s + b)^n$, except we only take either the even terms or the odd terms, and the series is alternating.

$$
\mathcal{L}\{ t^n \sin(bt+c) \} = \frac{n!}{(s^2 + b^2)^n} \left [ \mathcal{L}\{ \sin(bt+c) \} \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k} \ + \ \mathcal{L}\{ \cos(bt+c) \} \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k} \right ]
$$

$$
\mathcal{L}\{ t^n \cos(bt+c) \} = \frac{n!}{(s^2 + b^2)^n} \left [ \mathcal{L}\{ \cos(bt+c) \} \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k} \ - \ \mathcal{L}\{ \sin(bt+c) \} \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k} \right ]
$$

<br>

We prove this by induction on $n \geq 0$. Using the base case of $n=0$, we get the following. Note that $\binom{0}{0} = 1$, $\ 0! = 1$, $\ A(0) = 1$ and $A(-1) = 0$.

$$
\frac{0!}{(s^2 + b^2)^0} \left [ \mathcal{L}\{ \sin(bt+c) \} A(0) \binom{0}{0} s^0 b^{0} \ + \ \mathcal{L}\{ \cos(bt+c) \} A(-1) \binom{0}{0} s^0 b^{0} \right ] = \mathcal{L}\{ \sin(bt+c) \}
$$

$$
\frac{0!}{(s^2 + b^2)^0} \left [ \mathcal{L}\{ \cos(bt+c) \} A(0) \binom{0}{0} s^0 b^{0} \ - \ \mathcal{L}\{ \sin(bt+c) \} A(-1) \binom{0}{0} s^0 b^{0} \right ] = \mathcal{L}\{ \cos(bt+c) \}
$$

<br>

Now, to do the induction step, we use the result from above to evaluate $$\mathcal{L}\{ t^{n+1} \sin(bt+c) \}$$.

$$
\begin{align}
    \frac{(s^2 + b^2)^{n+1}}{(n+1)!} \cdot \mathcal{L}\{ t^{n+1} \sin(bt+c) \}

    &= \frac{(s^2 + b^2)^n}{n!} \left ( s \cdot \mathcal{L}\{ t^n \sin(bt+c) \} + b \cdot \mathcal{L}\{ t^n \cos(bt+c) \} \right ) \\[10pt]
    
    &= s \cdot \left [ \mathcal{L} \{ \sin(bt+c) \} \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k} \ + \ \mathcal{L}\{ \cos(bt+c)\} \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k} \right ] \\
    &\quad+ b \cdot \left [ \mathcal{L} \{ \cos(bt+c) \} \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k} \ - \ \mathcal{L}\{ \sin(bt+c)\} \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k} \right ] \\[10pt]
    
    &= \mathcal{L}\{ \sin(bt+c)\} \left [ \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^{k+1} b^{n-k} \ - \ \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k+1} \right ] \\
    &\quad+ \mathcal{L}\{ \cos(bt+c)\} \left [ \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k+1} \ + \ \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^{k+1} b^{n-k} \right ] \\[10pt] 
\end{align}
$$

First, we evaluate the $$\mathcal{L} \{ \sin(bt+c) \}$$ term

$$
\begin{align}
    &\mathcal{L}\{ \sin(bt+c)\} \left [ \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^{k+1} b^{n-k} \ - \ \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k+1} \right ]\\[10pt]

    &\qquad \text{Let } j = k+1 \text{ and reindex the first summation} \\[10pt]

    &= \mathcal{L}\{ \sin(bt+c)\} \left [  \sum_{j=1}^{n+1} A(n{+}1{-}j) \binom{n}{j-1} s^{j} b^{n+1-j} \ - \ \sum_{k=0}^{n} A(n{-}k{-}1) \binom{n}{k} s^k b^{n+1-k} \right ] \\[10pt]

    &\qquad \text{Notice that adding a } j=0 \text{ term to the second summation gives a } 0 \text{ term since } \binom{n}{-1} = 0 \\
    &\qquad \text{Also, adding a } k=n+1 \text{ term to the first summation will give a } 0 \text{ term since } ((i)^{-1} + (-i)^{-1}) = 0 \\
    &\qquad \text{Furthermore, notice that } A(n{-}k{+}1) = -A(n{-}k{-}1) \\
    &\qquad \text{Finally, recall the identity } \binom{n+1}{k} = \binom{n}{k} + \binom{n}{k-1} \text{ thus, we combine the two summations} \\[10pt]

    &= \mathcal{L}\{ \sin(bt+c)\} \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n}{k-1} s^{j} b^{n+1-k} + A(n{+}1{-}k) \binom{n}{k} s^k b^{n+1-k} \\[10pt]

    &= \mathcal{L}\{ \sin(bt+c)\} \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n+1}{k} s^k b^{n+1-k}
\end{align}
$$

<br>

We do similar with the $$\mathcal{L} \{ \cos(bt+c) \}$$ the term

$$
\begin{align}
    &\mathcal{L}\{ \cos(bt+c)\} \left [ \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k+1} \ + \ \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^{k+1} b^{n-k} \right ]\\[10pt]

    &\text{Let } j = k+1 \text{ and reindex the second summation} \\[10pt]

    &=\mathcal{L}\{ \cos(bt+c)\} \left [  \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n+1-k} \ - \ \sum_{j=1}^{n+1} A(n{-}j) \binom{n}{j-1} s^{j} b^{n+1-j} \right ] \\[10pt]

    &\qquad \text{Using all the same tricks as we did above, we combine the two summations} \\[10pt]

    &=\mathcal{L}\{ \cos(bt+c)\} \sum_{k=0}^{n+1} A(n{-}k) \binom{n}{k} s^k b^{n+1-k} + A(n{-}k) \binom{n}{k} s^k b^{n+1-k} \\[10pt]

    &=\mathcal{L}\{ \cos(bt+c)\} \sum_{k=0}^{n+1} A(n{+}1{-}k{-}1) \binom{n+1}{k} s^k b^{n+1-k}
\end{align}
$$

<br>

Therefore, we have proved that 

$$
\mathcal{L}\{ t^{n+1} \sin(bt+c) \} = \frac{(n+1)!}{(s^2 + b^2)^{n+1}} \left [ \mathcal{L}\{ \sin(bt+c)\} \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n+1}{k} s^k b^{n+1-k} + \mathcal{L}\{ \cos(bt+c)\} \sum_{k=0}^{n+1} A(n{+}1{-}k{-}1) \binom{n+1}{k} s^k b^{n+1-k} \right ]
$$

which proves the induction step.

To spare my and your sanity, I am not going to write out the proof of $$\mathcal{L}\{ t^{n+1} \cos(bt+c) \}$$, but it is exactly the same.

<br>

## Summarized Results

Recall 

$$
A(m) = \begin{cases}
     1   &\qquad\text{if}\quad m \equiv 0 \mod 4\\
     0   &\qquad\text{if}\quad m \equiv 1 \mod 4\\
    -1   &\qquad\text{if}\quad m \equiv 2 \mod 4\\
     0   &\qquad\text{if}\quad m \equiv 3 \mod 4
\end{cases}
$$

We can express $A(m)$ algebraically using imaginary numbers, i.e. $A(m) = \frac{(1 + (-1)^{m})}{2} i^{m} = \frac{1}{2}(i^m + (-i)^{m}) $

### Sine

$$
\mathcal{L}\{ t^n \sin(bt+c) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \left [ (s \sin(c) + b \cos(c)) \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k} \ + \ (s \cos(c) - b \sin(c)) \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k} \right ]
$$

You may notice this looks extremely familiar. It's exactly the same proof as the induction step to combine the $\sin(c)$ and $\cos(c)$ terms

$$
\mathcal{L}\{ t^n \sin(bt+c) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \left [ \sin(c) \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n+1}{k} s^k b^{n+1-k} \ + \ \cos(c) \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k b^{n+1-k} \right ]
$$

$$
\mathcal{L}\{ t^n \sin(bt) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k b^{n+1-k}
$$

$$
\mathcal{L}\{ t^n \sin(t) \} = \frac{n!}{(s^2 + 1)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k
$$

### Cosine

$$
\mathcal{L}\{ t^n \cos(bt+c) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \left [ (s \cos(c) - b \sin(c)) \sum_{k=0}^n A(n{-}k) \binom{n}{k} s^k b^{n-k} \ - \ (s \sin(c) + b \cos(c)) \sum_{k=0}^n A(n{-}k{-}1) \binom{n}{k} s^k b^{n-k} \right ]
$$

$$
\mathcal{L}\{ t^n \cos(bt+c) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \left [ \cos(c) \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n+1}{k} s^k b^{n+1-k} \ - \ \sin(c) \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k b^{n+1-k} \right ]
$$

$$
\mathcal{L}\{ t^n \cos(bt) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n+1}{k} s^k b^{n+1-k}
$$

$$
\mathcal{L}\{ t^n \cos(t) \} = \frac{n!}{(s^2 + 1)^{n+1}} \sum_{k=0}^{n+1} A(n{+}1{-}k) \binom{n+1}{k} s^k
$$


## Alternative Form

There is another way we can express these Laplace Transforms, which get rid of the series expansion. 

Consider $\frac{1}{2}[(s + ib)^n + (s - ib)^n]$ and $\frac{1}{2}[(s + ib)^n - (s - ib)^n]$. These give the alternative odd/even series. Thus, we can alternatively write the above results as the following

### Sine

$$
\mathcal{L}\{ t^n \sin(bt+c) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \left [ \frac{1}{2}[(s + ib)^{n+1} + (s - ib)^{n+1}] \sin(c) \ + \ \frac{1}{2}[(s + ib)^{n+1} - (s - ib)^{n+1}] \cos(c)  \right ]
$$

$$
\mathcal{L}\{ t^n \sin(bt) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \cdot \frac{1}{2}[(s + ib)^{n+1} - (s - ib)^{n+1}]
$$

$$
\mathcal{L}\{ t^n \sin(t) \} = \frac{n!}{(s^2 + 1)^{n+1}} \cdot \frac{1}{2}[(s + i)^{n+1} - (s - i)^{n+1}]
$$

### Cosine

$$
\mathcal{L}\{ t^n \cos(bt+c) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \left [ \frac{1}{2}[(s + ib)^{n+1} + (s - ib)^{n+1}] \cos(c) \ - \ \frac{1}{2}[(s + ib)^{n+1} - (s - ib)^{n+1}] \sin(c)  \right ]
$$

$$
\mathcal{L}\{ t^n \cos(bt) \} = \frac{n!}{(s^2 + b^2)^{n+1}} \cdot \frac{1}{2}[(s + ib)^{n+1} + (s - ib)^{n+1}]
$$

$$
\mathcal{L}\{ t^n \cos(t) \} = \frac{n!}{(s^2 + 1)^{n+1}} \cdot \frac{1}{2}[(s + i)^{n+1} + (s - i)^{n+1}]
$$

## Final Remark

To further validate this result, recall the trig identities $\sin(bt + c) = \sin(bt)\cos(c) + \cos(bt)\sin(c)$ and $\cos(bt+c) = \cos(bt)\cos(c) - \sin(bt)\sin(c)$. You will notice that these hold for the expressions I've given.