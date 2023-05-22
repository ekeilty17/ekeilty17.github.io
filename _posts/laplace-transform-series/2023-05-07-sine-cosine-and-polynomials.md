---
layout:     series
title:      "Sine, Cosine, and Polynomials"
date:       2023-05-07
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       6
series:     laplace-transforms
tags:       laplace-transform, trig, trigonometry, sine, cosine, monomials, polynomials, summations
---

There is another way to solve this Laplace Transform involving derivatives (which we will do in a future post). I am also aware that you can do a similar trick to what I did in the previous post where you decompose the trig functions into exponentials. However, this proof is a bit unrigorous because $$\mathcal{L} \{ \cdot \}$$ is supposed to take a real-valued function as input, yet we decomposed it into two complex-valued functions. Thus, I prove it rigorously here. Also, my proof gives a closed-form solution in terms of a summation, which I've never seen before, so I thought I'd share.

## Deriving a Recurrence

We want to evaluate $$\mathcal{L}\{ t^n \sin t \}$$ and $$\mathcal{L}\{ t^n \cos t \}$$. First, let's do one iteration of integration by parts, starting with sine.

$$
\begin{align}
    \mathcal{L}\{ t^n \sin t \}
    &= \int_{0}^{\infty} t^n \sin(t) e^{-st} \; dt \quad \text{(using integration by parts)}\\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \cdot 0 - \frac{1}{s} \lim_{t \rightarrow \infty} t^n \sin(t) e^{-st} + \frac{1}{s} \int_{0}^{\infty} (nt^{n-1} \sin(t) + t^n \cos(t)) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \int_{0}^{\infty} t^{n-1} \sin(t) e^{-st} \ dt + \frac{1}{s} \int_{0}^{\infty} t^n \cos(t) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \mathcal{L}\{ t^{n-1} \sin t \} + \frac{1}{s} \mathcal{L}\{ t^n \cos t \}
\end{align}
$$

The limit goes to $0$ since the $\sin t$ term is bounded between $[-1, 1]$, so it can be disregarded. Then, we just have the same limit as when we proved $$\mathcal{L} \{ t^n \}$$. We now do similar with cosine.

$$
\begin{align}
    \mathcal{L}\{ t^n \cos t \}
    &= \int_{0}^{\infty} t^n \cos(t) e^{-st} \; dt \quad \text{(using integration by parts)}\\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \cdot 0 - \frac{1}{s} \lim_{t \rightarrow \infty} t^n \cos(t) e^{-st} + \frac{1}{s} \int_{0}^{\infty} (nt^{n-1} \cos(t) - t^n \sin(t)) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \int_{0}^{\infty} t^{n-1} \cos(t) e^{-st} \ dt - \frac{1}{s} \int_{0}^{\infty} t^n \sin(t) e^{-st} \ dt \\[10pt]
    &= \frac{n}{s} \mathcal{L}\{ t^{n-1} \cos t \} - \frac{1}{s} \mathcal{L}\{ t^n \sin t \}
\end{align}
$$

Now, we can combine these two facts and with a little bit of algebra get 

$$
\mathcal{L}\{ t^n \sin t \} = \frac{n}{s^2 + 1} \left [ s \cdot \mathcal{L}\{ t^{n-1} \sin t \} + \mathcal{L}\{ t^{n-1} \cos t \} \right ]
$$

$$
\mathcal{L}\{ t^n \cos t \} = \frac{n}{s^2 + 1} \left [ s \cdot \mathcal{L}\{ t^{n-1} \cos t \} - \mathcal{L}\{ t^{n-1} \sin t \} \right ]
$$

<br>

## Proving a Closed-Form Formula

Now that we have $$\mathcal{L}\{ t^n \sin t \}$$ and $$\mathcal{L}\{ t^n \cos t \}$$ in terms of each other, 
I am going to assert the following solution, which was derivated based on a series of substitutions and pattern matching.

$$
\mathcal{L}\{ t^n \sin t \} = \frac{n!}{(s^2 + 1)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k
$$

$$
\mathcal{L}\{ t^n \cos t \} = \frac{n!}{(s^2 + 1)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k{+}1) \binom{n+1}{k} s^k
$$

<br>

The function $$A(m)$$ is defined as follows:

$$
A(m) = \begin{cases}
     1   &\qquad\text{if}\quad m \equiv 0 \mod 4\\
     0   &\qquad\text{if}\quad m \equiv 1 \mod 4\\
    -1   &\qquad\text{if}\quad m \equiv 2 \mod 4\\
     0   &\qquad\text{if}\quad m \equiv 3 \mod 4
\end{cases}
$$

There are a few ways we can mathematically represent $A(m)$ (which we will discuss at the end), but for now, we just need the interpretation of $A(m)$.
It gives an alternating series (positive/negative) for the even values of $m$, and disregards odd indices of $m$.

<br>

Now, I'll prove my asserted equations by induction on $n \geq 0$. Using the base case of $n=0$, we get the following. Note that $\binom{1}{0} = 1$, $\ \binom{1}{1} = 1$, $\ 0! = 1$, $\ A(0) = 1$, and $A(-1) = 0$.

$$
\frac{(0)!}{(s^2 + 1)^{1}} \sum_{k=0}^{1} A(-k) \binom{1}{k} s^k = \frac{1}{s^2 + 1} \left [ A(0) \binom{1}{0} s^{0} + A(-1) \binom{1}{1} s^{1} \right ] = \frac{1}{s^2 + 1} = \mathcal{L}\{ \sin t \}
$$

$$
\frac{(0)!}{(s^2 + 1)^{1}} \sum_{k=0}^{1} A(-k+1) \binom{1}{k} s^k = \frac{1}{s^2 + 1} \left [ A(1) \binom{1}{0} s^{0} + A(0) \binom{1}{1} s^{1} \right ] = \frac{s}{s^2 + 1} = \mathcal{L}\{ \cos t \}
$$

<br>

Now, to do the induction step, we use the result from above to evaluate $$\mathcal{L}\{ t^n \sin t \}$$, assuming that the above equations hold for $$\mathcal{L}\{ t^{n-1} \sin t \}$$ and $$\mathcal{L}\{ t^{n-1} \cos t \}$$

$$
\begin{align}
    \frac{(s^2 + b^2)^{n+1}}{n!} \cdot \mathcal{L}\{ t^n \sin t \}

    &= \frac{(s^2 + b^2)^n}{(n-1)!} \left [ s \cdot \mathcal{L}\{ t^{n-1} \sin t \} \ + \ \mathcal{L}\{ t^{n-1} \cos t \} \right ] \\[10pt]
    
    &= \frac{(s^2 + b^2)^n}{(n-1)!} \cdot \frac{(n-1)!}{(s^2 + b^2)^n} \left [ s \cdot \sum_{k=0}^{n} A(n{-}k{-}1) \binom{n}{k} s^k \ + \  \sum_{k=0}^{n} A(n{-}k) \binom{n}{k} s^k \right ] \\[10pt]

    &= \sum_{k=0}^{n} A(n{-}k{-}1) \binom{n}{k} s^{k+1} \ + \  \sum_{k=0}^{n} A(n{-}k) \binom{n}{k} s^k \\[10pt]

    &\qquad \text{Let } j = k+1 \text{ and reindex the first summation} \\[10pt]

    &= \sum_{j=1}^{n} A(n{-}j) \binom{n}{j-1} s^{j} \ + \  \sum_{k=0}^{n} A(n{-}k) \binom{n}{k} s^k \\[10pt]

    &\qquad \text{Notice that adding a } j=0 \text{ term to the first summation gives a } 0 \text{ term since } \binom{n}{-1} = 0 \\
    &\qquad \text{Also, adding a } k=n+1 \text{ term to the second summation will give a } 0 \text{ term since } A(-1) = 0 \\
    &\qquad \text{Finally, recall the identity } \binom{n+1}{k} = \binom{n}{k} + \binom{n}{k-1} \text{ thus, we combine the two summations} \\[10pt]

    &= \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k \\[10pt]    
\end{align}
$$

We do likewise for $$\mathcal{L}\{ t^n \cos t \}$$.

$$
\begin{align}
    \frac{(s^2 + b^2)^{n+1}}{n!} \cdot \mathcal{L}\{ t^n \cos t \}

    &= \frac{(s^2 + b^2)^n}{(n-1)!} \left [ s \cdot \mathcal{L}\{ t^{n-1} \cos t \} \ - \ \mathcal{L}\{ t^{n-1} \sin t \} \right ] \\[10pt]
    
    &= \frac{(s^2 + b^2)^n}{(n-1)!} \cdot \frac{(n-1)!}{(s^2 + b^2)^n} \left [ s \cdot \sum_{k=0}^{n} A(n{-}k) \binom{n}{k} s^k \ - \  \sum_{k=0}^{n} A(n{-}k{-}1) \binom{n}{k} s^k \right ] \\[10pt]

    &= \sum_{k=0}^{n} A(n{-}k) \binom{n}{k} s^{k+1} \ - \  \sum_{k=0}^{n} A(n{-}k{-}1) \binom{n}{k} s^k \\[10pt]

    &\qquad \text{Let } j = k+1 \text{ and reindex the first summation} \\[10pt]

    &= \sum_{j=1}^{n} A(n{-}j{+}1) \binom{n}{j-1} s^{j} \ - \  \sum_{k=0}^{n} A(n{-}k{-}1) \binom{n}{k} s^k \\[10pt]

    &\qquad \text{Recall the property that } A(m) = -A(m+2) \text{ Thus, } A(n{-}k{-}1) = - A(n{-}k{+}1) \\
    &\qquad \text{Now, it's the same argument as before to combine the summations} \\[10pt]
    

    &= \sum_{k=0}^{n+1} A(n{-}k{+}1) \binom{n+1}{k} s^k \\[10pt]    
\end{align}
$$

<br>

## Scaling

To derive the scaled versions, we use the scaling property $f(bt) = \frac{1}{b}F(s/b)$.

$$
\begin{align}
    \mathcal{L}\{ t^n \sin (bt) \} 
    &= \frac{1}{b^n}\mathcal{L}\{ (bt)^n \sin (bt) \} \\[10pt]
    &= \frac{1}{b^n} \cdot \frac{1}{b}\frac{n!}{((s/b)^2 + 1)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} (s/b)^k \\[10pt]
    &= b^{n+1} \cdot \frac{n!}{(s^2 + b^2)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} (s/b)^k \\[10pt]
    &= \frac{n!}{(s^2 + b^2)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k) \binom{n+1}{k} s^k b^{n-k+1}
\end{align}
$$

Similarly

$$
\begin{align}
    \mathcal{L}\{ t^n \cos (bt) \} 
    &= \frac{1}{b^n}\mathcal{L}\{ (bt)^n \cos (bt) \} \\[10pt]
    &= \frac{1}{b^n} \cdot \frac{1}{b}\frac{n!}{((s/b)^2 + 1)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k{+1}) \binom{n+1}{k} (s/b)^k \\[10pt]
    &= b^{n+1} \cdot \frac{n!}{(s^2 + b^2)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k{+1}) \binom{n+1}{k} (s/b)^k \\[10pt]
    &= \frac{n!}{(s^2 + b^2)^{n+1}} \sum_{k=0}^{n+1} A(n{-}k{+1}) \binom{n+1}{k} s^k b^{n-k+1}
\end{align}
$$


## Translation

Same as in the previous post, we can use the identities

$$\sin(\theta + \phi) = \sin(\theta)\cos(\phi) + \cos(\theta)\sin(\phi)$$

$$\cos(\theta + \phi) = \cos(\theta)\cos(\phi) - \sin(\theta)\sin(\phi)$$

Thus, we have all of the ingredients to write a closed-form solution to $$\mathcal{L}\{ t^n \sin (bt+c) \} $$ and $$\mathcal{L}\{ t^n \cos (bt+c) \}$$. But I'll leave that up to you if you so choose.


## Alternative Forms

As I stated earlier, there are various ways to represent $A(m)$. Algebraically, I think these are the most straightforward.

$$
A(m) = \frac{1}{2}(i^m + (-i)^m) = \frac{1}{2}(1 - (-1)^m) i^{m}
$$

Another alternative is to get rid of the summations altogether. We can do this as follows

$$
\mathcal{L}\{ t^n \sin (bt) \} = \frac{n!}{(s^2 + 1)^{n+1}} \cdot \frac{ (s + ib)^{n+1} - (s - ib)^{n+1} }{2i}
$$

$$
\mathcal{L}\{ t^n \cos (bt) \} = \frac{n!}{(s^2 + 1)^{n+1}} \cdot \frac{ (s + ib)^{n+1} + (s - ib)^{n+1} }{2}
$$

Notice that all terms will be real because the imaginary terms always cancel out.