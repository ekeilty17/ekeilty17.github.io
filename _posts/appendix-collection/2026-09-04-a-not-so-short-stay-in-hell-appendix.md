---
layout:     post
title:      "A (Not So) Short Stay in Hell - Appendix"
date:       2026-09-04
categories: blog
permalink:  ":categories/:title/"
series:     appendix
tags:       probability, recurrences, fibonacci, information theory, typical sets
---

Appendix to the post [A (Not So) Short Stay in Hell](/blog/a-not-so-short-stay-in-hell/). This is a hodge-podge proofs and results to fill in gaps which I felt were too much of a diversion from the point of the original post. The sections are sorted in the order they appear in the original post.

---

## Table of Contents

- [Numerically Stable Computation of Scientific Notation](#numerically-stable-computation-of-scientific-notation)
- [The Size of the Library](#the-size-of-the-library)
- [Bounds on the Expected Search](#bounds-on-the-expected-search)
- [The Generalized Fibonacci Recurrence](#the-generalized-fibonacci-recurrence)
- [Joint and Conditional Probability Distributions](#joint-and-conditional-probability-distributions)
- [Typical Set Bound Proofs](#typical-set-bound-proofs)
- [Stochastic, Stationary, and Ergodic Processes](#stochastic-stationary-and-ergodic-processes)
- [Estimating the Entropy Rate of English](#estimating-the-entropy-rate-of-english)

<br>

---

## Numerically Stable Computation of Scientific Notation

In the main post, I was required to compute the [scientific notation](https://en.wikipedia.org/wiki/Scientific_notation) of lots of very large numbers. In this section of the appendix I will explain the procedure for these calculations.

Suppose you are given any arbitrary real numbers $a > 0$, $b > 1$, and $c > 1$. We want to convert them to real number $0 < s < 1$ and integer $e \in \mathbb{Z}$ such that

$$
c \cdot b^a = s \times 10^e
$$

Remembering our log-rules, we can define the following intermediate value

$$
x := \log_{10} (c \cdot b^a) = a \cdot \log_{10} b + \log_{10} c
$$

Now define our target quantities as the following.

$$
e := \lfloor x \rfloor
\qquad
\text{,}
\qquad
s := 10^{x - \lfloor x \rfloor}
$$

And it's easy to verify that

$$
s \times 10^{e} = 10^{x - \lfloor x \rfloor} \cdot 10^{\lfloor x \rfloor} = 10^{x} = 10^{\log_{10} (c \cdot b^a)} = c \cdot b^a
$$

The important detail here is on your calculator you **should not** enter $\log_{10} (c \cdot b^a)$ as $b^a$ might be a huge number which your calculator cannot compute. Instead, enter $a \cdot \log_{10} b + \log_{10} c$ and more likely than not this will be tractile to compute. This is a simple example of why logarithms are extremely useful in practical applications. This procedure can be summarized as the following code.


```python
import math

def compute_scientific_notation(a, b, c=1.0):
    """
    convert c * b^a into s * 10^e
    """ 
    x = a * math.log10(b) + math.log10(c)
    e = math.floor(x)       # exponent
    s = 10 ** (x - e)       # significand
    return s, e
```

<br>

---

## The Size of the Library

In the original short story _The Library of Babel_, the library has a more complicated geometry of hexagonal rooms. In the book _A Short Stay in Hell_, the library is essentially two dimensional. It consists of two extremely large square walls of books running parallel to each other (like two sheets of aluminum). I'm going to simplify it even further. Let's assume we just have one giant wall of books. If we assume this wall is square, what are its side lengths?

From the appendix of the book, the author assumes the books are 1.5 inches thick and require 1.5 feet of vertical shelf space. So effectively, we have a rectangle of proportion $1:12$. So 12 books standing vertically side-by-side on a shelf will take up exactly 1.5 by 1.5 square feet of space. We can do a quick calculation.

$$
2.345 \times 10^{2,594,773} \ \text{books} 
\cdot \left (\frac{ 1.5^2 \ \text{feet}^2}{12 \ \text{books}} \right )
\cdot \left (\frac{ 1 \ \text{meter}^2}{3.28^2 \ \text{feet}^2} \right )
\cdot \left (\frac{1 \ \text{lightyears}^2}{ (9.46 \times 10^{15})^2 \ \text{meter}^2} \right )
= 4.57 \times 10^{2,594,739} \ \text{lightyears}^2
$$

Therefore, taking the square root of this number gives the side lengths of this enormous wall of books.

$$
\sqrt{4.57 \times 10^{2,594,739}}
\approx 6.76 \times 10^{1,297,369} \ \text{lightyears}
$$

To put this number into perspective, the observable universe is only $4.65 \times 10^{10} \ \text{lightyears}$ in diameter. 

<br>

Just for fun, let's suppose the books are arranged into a giant cube. Assume 12 books stacked adjacent to each other creates a perfect cube of 1.5 by 1.5 by 1.5 feet. We can redo this calculation.

$$
2.345 \times 10^{2,594,773} \ \text{books}
\cdot \left (\frac{ 1.5^3 \ \text{feet}^3}{12 \ \text{books}} \right )
\cdot \left (\frac{1 \ \text{meter}^3}{3.28^3 \ \text{feet}^3} \right )
\cdot \left (\frac{1 \ \text{lightyears}^3}{ (9.46 \times 10^{15})^3 \ \text{meter}^3} \right )
= 2.21 \times 10^{2,594,723} \ \text{lightyears}^3
$$

Therefore, taking the cube root of this number gives the side length of this enormous cube of books.

$$
\sqrt[3]{2.21 \times 10^{2,594,723}}
\approx
6.05 \times 10^{864,907} \ \text{lightyears}
$$

Again, let's put this number into perspective. A Planck length is about $1.71 \times 10^{-51} \ \text{lightyears}$. The observable universe is about $4.65 \times 10^{10} \ \text{lightyears}$ in diameter. So the magnitude difference between the Planck length compared to the current observable universe ($10^{61}$) is barely even a rounding error compared to the size of this mega cube of books.

<br>

---

## Bounds on the Expected Search

The claim in the original post is equivalent to the following. Suppose $a, b \in \mathbb{R}_{>0}$ and $a \geq b$, then 

$$
\frac{a}{2b} \leq \frac{a+1}{b+1} \leq \frac{a}{b}
$$

First, I'll show the right half of the inequality.

$$
\frac{a}{b} - \frac{a+1}{b+1} = \frac{a(b+1) - b(a+1)}{b(b+1)} = \frac{a - b}{b(b+1)}
$$

and $\frac{a - b}{b(b+1)} \geq 0$ since the denominator is positive and $a \geq b$. Therefore, $\frac{a}{b} - \frac{a+1}{b+1} \geq 0$, which implies the second part of the claim.

Now, I show the left half of the inequality.

$$
\frac{a}{2b} - \frac{a+1}{b+1} = \frac{a(b+1) - 2b(a+1)}{2b(b+1)} = \frac{a - ab - 2b}{2b(b+1)}
$$

Clearly, $a \leq ab$. Again the denominator in positive. Therefore, $\frac{a - ab - 2b}{2b(b+1)} \leq 0$ and thus $\frac{a}{2b} - \frac{a+1}{b+1} \leq 0$, which implies the first part of the claim.


<br>

---

## The Generalized Fibonacci Recurrence

To reduce complexity in notation, I will define $S_{\ell} := \lvert Z_{\ell} \rvert$.

### Proving the Recurrence from the Summation

Consider the following summation.

$$
S_L := \begin{cases}
    &1 \qquad&\text{if } L = 0 \\[10pt]
    &\displaystyle\sum_{k = 0}^{\lfloor (L-1)/2 \rfloor} \binom{L-k-1}{k} n^{L-k} \qquad&\text{otherwise}
\end{cases}
$$

Noting that $\binom{0}{0} = 1$, it's easy to directly compute that

$$
S_1 = n
$$

Now consider $n S_{L-1}$ and $n S_{L-2}$. In $n S_{L-2}$ we can substitute $k = j+1$.

$$
\begin{align}
    &n S_{L-1}
= \sum_{k = 0}^{\lfloor (L-2)/2 \rfloor} \binom{L-k-2}{k} n^{L-k} \\[10pt]
    &n S_{L-2}
= \sum_{j = 0}^{\lfloor (L-3)/2 \rfloor} \binom{L-j-3}{j} n^{L-j-1} = \sum_{k = 1}^{\lfloor (L-2)/2 \rfloor} \binom{L-k-2}{k-1} n^{L-k}
\end{align}
$$

When $k = 0$, we'll define $\binom{L-2}{-1} = 0$, so this term does not contribute. Therefore

$$
n S_{L-1} + n S_{L-2} = \sum_{k=0}^{\lfloor (L-2)/2 \rfloor} \left ( \binom{L-k-2}{k} + \binom{L-k-2}{k-1} \right ) n^{L-k}
$$

Using [Pascal's identity](https://en.wikipedia.org/wiki/Pascal%27s_rule), $\binom{L-k-2}{k} + \binom{L-k-2}{k-1} = \binom{L-k-1}{k}$, this reduces to our original summation. Therefore,

$$
S_{L} = n S_{L-1} + n S_{L-2}
\qquad
S_0 = 1, S_1 = n
$$

<br>

### Bounding the Recurrence

The easiest way to prove this is abstractly. The solution to the recurrence is given by

$$
S_L = C_1 r_1^L + C_2 r_2^L
$$

Without loss of generality, assume that $r_1 \geq r_2$. Furthermore, the first base-case $S_0 = 1$ implies $C_1 + C_2 = 1$. Therefore

$$
\begin{align}
    C_1 r_2^L + C_2 r_2^L &\leq S_L \leq C_1 r_1^L + C_2 r_1^L \\[10pt]
    (C_1 + C_2) r_2^L &\leq S_L \leq (C_1 + C_2) r_1^L \\[10pt]
    r_2^L &\leq S_L \leq r_1^L \\[10pt]
\end{align}
$$

<br>

### Asymptotic Behavior of the Recurrence

The goal is to find the asymptotic behavior as $L$ approach infinity. First, we get an asymptotic bound on $\lvert Z_L \rvert$. Without loss of generality, assume that $r_1 \geq r_2$.

$$
\lvert Z_L \rvert = C_1 r_1^L + C_2 r_2^L = C_1 r_1^L \left (1 + \frac{C_2}{C_1} \left ( \frac{r_2}{r_1} \right )^L \right )
$$

Since $\frac{r_2}{r_1} \leq 1$, then as $L \rightarrow \infty$ we have $\left ( \frac{r_2}{r_1} \right )^L \rightarrow 0$. Also notice that $r_1 = \frac{n + \sqrt{n^2+4n}}{2} = \Theta(n)$. Therefore

$$
\lvert Z_L \rvert = \Theta(r_1^L) = \Theta(n^L)
$$

Now, we use the inequality bounds on $\mathbb{E}[K]$ and the fact that $\lvert \mathcal{X} \rvert^L = (n+1)^L$.

$$
\mathbb{E}[K] 
= \Theta\left ( \frac{\lvert \mathcal{X} \rvert^L}{\lvert Z_L \rvert} \right ) 
= \Theta\left (\left ( \frac{n+1}{n} \right )^L\right ) 
= \Theta\left (\left ( 1 + \frac{1}{n}\right )^{L} \right)
$$

Since $1 + \frac{1}{n} > 1$, $\mathbb{E}[K]$ and consequently $\mathbb{E}[T]$ grow exponentially with respect to $L$.

<br>

---

## Typical Set Bound Proofs

We can reorganize the definition of a typical set as the following

$$
A_{\epsilon}^{(\ell)} := \left \{ x_1, \ldots, x_\ell \in \mathcal{X}^{\ell} : 
2^{- \ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) + \epsilon \right )}
\leq 
p_{\ell}(x_1, \ldots, x_\ell)
\leq
2^{- \ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) - \epsilon \right )}
\right \}
$$

### Cardinality Upper Bound

By definition, $A_{\epsilon}^{(\ell)} \subseteq \mathcal{X}^{\ell}$. Therefore, 

$$
\begin{align}
    1 
    &= \sum_{x_1, \ldots, x_\ell \in \mathcal{X}^{\ell}} p_{\ell}(x_1, \ldots, x_\ell) \\[10pt]
    &\geq \sum_{x_1, \ldots, x_\ell \in A_{\epsilon}^{(\ell)}} p_{\ell}(x_1, \ldots, x_\ell) \\[10pt]
    &\geq \sum_{x_1, \ldots, x_\ell \in A_{\epsilon}^{(\ell)}} 2^{- \ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) + \epsilon \right )} \\[10pt]
    &= \left \lvert A_{\epsilon}^{(\ell)} \right \rvert 2^{- \ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) + \epsilon \right )}
\end{align}
$$

Therefore

$$
\left \lvert A_{\epsilon}^{(\ell)} \right \rvert \leq 2^{\ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) + \epsilon \right )}
$$

### Cardinality Lower Bound

By the Shannon-McMillan-Breiman Theorem theorem, 

$$
- \tfrac{1}{\ell} \log p_{\ell}(X_1, \ldots, X_\ell) 
\ \overset{\mathrm{p}}{\longrightarrow} \ 
h
$$

which directly implies that

$$
Pr \left ((X_1, \ldots, X_\ell) \in A_{\epsilon}^{(\ell)} \right ) \geq 1 - \epsilon
\qquad
\text{for sufficiently large } \ell
$$

Therefore

$$
\begin{align}
    1 - \epsilon 
    &\leq Pr \left ((X_1, \ldots, X_\ell) \in A_{\epsilon}^{(\ell)} \right ) \\[10pt]
    &= \sum_{x_1, \ldots, x_\ell \in A_{\epsilon}^{(\ell)}} p_{\ell}(x_1, \ldots, x_\ell) \\[10pt]
    &\leq \sum_{x_1, \ldots, x_\ell \in A_{\epsilon}^{(\ell)}} 2^{- \ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) - \epsilon \right )} \\[10pt]
    &= \left \lvert A_{\epsilon}^{(\ell)} \right \rvert 2^{- \ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) - \epsilon \right )}
\end{align}
$$

Therefore

$$
\left \lvert A_{\epsilon}^{(\ell)} \right \rvert \geq (1 - \epsilon) 2^{\ell \left (\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) - \epsilon \right )}
\qquad
\text{for sufficiently large } \ell
$$


<br>

---

## Joint and Conditional Probability Distributions

### A Note on Notation

In probability theory, if you wanted to be very rigorous, you can use subscripts to differentiate functions. But in practice, this becomes really tedious and hard to read. So often these subscripts are dropped and the different PMFs are understood via their arguments. For example

$$
\begin{align}
    p_{X}(x) &\quad\rightarrow\quad p(x) \\[10pt]
    p_{X \mid Y}(x \mid y) &\quad\rightarrow\quad p(x \mid y) \\[10pt]
    p_{X_1, X_2, \ldots, X_{\ell}}(x_1, x_2, \ldots, x_{\ell}) &\quad\rightarrow\quad p(x_1, x_2, \ldots, x_{\ell})
\end{align}
$$

### Sequence of Joint PMFs over Strings

We can't just define any sequence of $$\big ( p(x_1, x_2, \ldots, x_{\ell}) \big )_{\ell = 1}^{\infty}$$. They are related via the [chain rule of probability](https://en.wikipedia.org/wiki/Chain_rule_(probability)). In particular

$$
p(x_1, x_2, \ldots, x_{\ell}) = p(x_{\ell} \mid x_1, x_2, \ldots, x_{\ell-1}) p(x_1, x_2, \ldots, x_{\ell-1})
$$

Recursively applying the chain rule of probability, we can write

$$
p(x_1, x_2, \ldots, x_{L}) = p(x_1) p(x_2 \mid x_1) p(x_3 \mid x_1, x_2) \cdots p(x_{L} \mid x_1, x_2, \ldots, x_{L-1})
$$

Thus, we need only define the marginal probability distribution $p(x_1)$ and each conditional probability distributions $p(x_{\ell} \mid x_1, x_2, \ldots, x_{\ell-1})$ for each $0 < \ell < L$. If we define the case of $\ell = 1$ as $p(x_1)$, then this defines a sequence of conditional PMFs (which can be arbitrarily defined)

$$
\big ( p(x_{\ell} \mid x_1, x_2, \ldots, x_{\ell-1}) \big )_{\ell = 1}^{\infty}
$$

which ultimately let's us compute the joint PMFs for each $\ell$-string.

$$
\big ( p(x_1, x_2, \ldots, x_{\ell}) \big )_{\ell = 1}^{\infty}
$$

<!-- The point of this re-formulation is that empirically estimating $p(x_{\ell} \mid x_1, x_2, \ldots, x_{\ell-1})$ is computationally much more efficient than directly estimating $p(x_1, x_2, \ldots, x_{\ell})$. Essentially, this is what modern LLMs are designed to compute, forming the basis of _next-token prediction_. This is precisely how $h$ is estimated for English text, which I discuss in the next sections. -->

### Estimating the Entropy Rate

Now, recall that

$$
H(X_1, X_2, \ldots, X_{\ell}) 
\ := \ 
\sum_{(x_1, \ldots, x_\ell)\in\mathcal{X}^{\ell}}
- p_\ell(x_1, \ldots, x_\ell) \ \log p_{\ell}(x_1, \ldots, x_\ell)
$$

Therefore, we can define the sequence 

$$
\left ( \tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) \right )_{\ell = 1}^{\infty}
$$

which allows us to take the limit as $\ell \rightarrow \infty$, which is the definition of the entropy rate $h$.


<br>

---

## Stochastic, Stationary, and Ergodic Processes

### Definitions

A **stochastic process** is a mathematical model for something that changes over time in a way that involves _randomness_. In other words, it's a sequence of random variables indexed by some notion of time or position. Intuitively, stochastic is the opposite of **deterministic**.

A stochastic process is **stationary** if its statistical properties are invariant under shifts in time/position. Formally, if $$(X_i)_{i \geq 1}$$ is generated via a stochastic process, then for every $k, \ell \geq 1$ and every $x_1, \ldots, x_{\ell} \in \mathcal{X}$

$$
Pr(X_1 = x_1, \ldots, X_\ell = x_\ell) = Pr(X_{k+1} = x_1, \ldots, X_{k+\ell} = x_\ell)
$$

Thus, the probability of observing a particular finite pattern does not depend on where in the sequence we look.

A stochastic process is **ergodic** if observing one sufficiently long realization of the process gives us enough information to recover its statistical properties. Formally, we can write the following for every _suitable_ function $f$

$$
\frac{1}{\ell} \sum_{i=1}^{\ell} f(X_i) \ \overset{\mathrm{p}}{\longrightarrow} \ \mathbb{E}[f(X_1)]
$$

In other words, the time average of a function of the observations converges in probability to its expected value.

### Example: Coin Flip

Let $$X_i \in \{ 0, 1 \}$$ be a random variable representing a coin flip such that

$$
X_i = \begin{cases}
    1 &\quad\text{if the } i^{\text{th}} \text{ coin flip shows } \textbf{heads} \\[10pt]
    0 &\quad\text{if the } i^{\text{th}} \text{ coin flip shows } \textbf{tails}
\end{cases}
$$

Then we have

$$
X_i \overset{\mathrm{i.i.d.}}{\sim} \text{Bernoulli}(0.5)
$$

This is a _stochastic process_ since each coin flip is random. This is also a _stationary process_ since it's independent and identically distributed.

$$
Pr(X_1 = x_1, \ldots, X_\ell = x_\ell) = \prod_{i = 1}^{\ell} Pr(X_i = x_i) = \prod_{i = 1}^{\ell} Pr(X_{i+k} = x_i) = Pr(X_{k+1} = x_1, \ldots, X_{k+\ell} = x_\ell)
$$

Finally, this process is _ergodic_. Proving this is a bit involved and out of the scope of this post. It's not hard to show the case for $f(x) = x$ which redues to proving that $\frac{1}{\ell} \sum_{i=1}^{\ell} X_i = \mathbb{E}[X_1]$, which is an application of the [Strong Law of Large Numbers](https://en.wikipedia.org/wiki/Law_of_large_numbers).

### Anti-Example: Non-Stochastic

The following is a deterministic process

$$
X_i = 2i + 3
$$

This process is not random at all. Every $X_i$ is determined by the formula.

### Anti-Example: Non-Stationary

Let $$X_i \in \{ 0, 1 \}$$ be a random variable representing _biased coin flips_ which shows heads with probability $p_i$. We can write

$$
X_i \sim \text{Bernoulli}(p_i)
$$

Now, the outcome of each $X_i$ depends on $p_i$. Therefore in general

$$
Pr(X_i = x_i) = p_i \neq p_{k+i} = Pr(X_{k+i} = x_i)
$$

so this process is not stationary.

### Anti-Example: Non-Ergodic

This is a bit of a weird anti-example. Suppose we have two biased coins such that coin $A$ always flips heads and coin $B$ always flips tails. Our process first picks a coin at random according to $\text{Bernoulli}(0.5)$, and then uses this coin and only this coin to generate $$(X_i)_{i \geq 1}$$. In other words

$$
(X_i)_{i \geq 1} = \begin{cases}
    (1,1,1,1, \ldots) &\quad\text{if coin } A \text{ is chosen} \\[10pt]
    (0,0,0,0, \ldots) &\quad\text{if coin } B \text{ is chosen}
\end{cases}
$$

Therefore,

$$
\frac{1}{\ell}\sum_{i=1}^{\ell} X_i = \begin{cases}
    1 &\quad\text{if coin } A \text{ is chosen} \\[10pt]
    0 &\quad\text{if coin } B \text{ is chosen}
\end{cases}
$$

but

$$
\mathbb{E}[X_1] = 0.5
$$

since the process of picking one of the two coins initially is still $50/50$. Thus, the long-term behavior cannot tell us about the underlying statistical properties of this process. The randomness associated with choosing the initial coin is lost. If I modified the probabilities coin $A$ and $B$ to $60/40$, you could not distinguish this by just observing the long-term behavior $(1,1,1,1, \ldots)$ or $(0,0,0,0, \ldots)$.

### Stochastic Stationary Ergodic Process Generating English

A simple way to construct a stationary ergodic process that generates English-like text is with a $k^{\text{th}}$-order [Markov model](https://en.wikipedia.org/wiki/Markov_model). 

$$
Pr(X_{\ell+1} \mid X_{\ell - k + 1}, \ldots, X_{\ell})
$$

where $X_i$ can represent characters, tokens, or words. The model specifies the probability of the next element given the previous $k$ elements (e.g. next token prediction). With an appropriate choice of transition probabilities and initialization, the resulting process can be made stationary and ergodic.

In principle, this amounts to a giant table specifying the probability of every possible next token for every possible sequence of $k$ preceding tokens. For a realistic vocabulary and sufficiently large $k$, this table would be completely intractable. At a surface-level of analysis, modern LLMs can be viewed are learning subsections of this look-up table (training data), and efficiently representing and generalizing the statistical patterns via its model parameters. While it's not technically true, as a first-order intuition you could think of an LLM as this English-text-generating process. 

<br>

---

## Estimating the Entropy Rate of English

I don't want to get too deep into the weeds of the math here (otherwise this section would be huge). I just want to give a taste of the methods. I encourage you to read the papers for more details. 

### Claude Shannon's Estimate

[Claude Shannon](https://en.wikipedia.org/wiki/Claude_Shannon) (the pioneer of information theory), conducted the following experiment in his [paper](https://www.princeton.edu/~wbialek/rome/refs/shannon_51.pdf). Given a short passage unknown to the participant, the participant was to try to predict the next letter (space included, capitalization and punctuation excluded). If they were wrong, they would keep guessing until they got it right. Shannon would record the number of guesses required for each letter. This produced a result such as the following.

```
there is no reverse on a motorcycle a friend of mine found this out rather dramatically the other day 
111511211211151171112132122711114111318613111111111116211111121111114111111151111111111161111111111111
```

Suppose we had an ideal next-character predictor of English text. Let $q_i^{(N)}$ be the fraction of characters correctly guessed by this ideal predictor on the $i^{\text{th}}$ guess when $N−1$ previous characters are known. Skipping a ton of details, Shannon shows the following bounds on the conditional entropy of English.

$$
\sum_i i\left(q_i^{(N)} - q_{i+1}^{(N)}\right)\log_2 i
\leq H_N \leq
-\sum_i q_i^{(N)}\log_2 q_i^{(N)}
$$

where

$$
H_N := H(X_{N} \mid X_1, \ldots, X_{N-1})
$$

and it can be shown that $H_N \rightarrow h$ as $N \rightarrow \infty$ for _stationary_ processes. 

Shannon ran the above experiment for $N = 100$. This allowed him to estimate each of the $q_i^{(N)}$'s using the statistics of human subjects, and ultimately estimate upper and lower bounds on $h$. He acknowledges that human subjects are far from ideal predictors and there are considerable error bounds on this estimate.

$$
0.6 \lesssim H_{100} \lesssim 1.3 \quad \text{bits/character}
$$

### Estimates using Cross-Entropy

We'll use a slightly different notation where if $X \sim p$, then $H(p) := H(X)$. Now, suppose we have two different probability distributions $p$ and $q$ over the same underlying _events_. Then the **cross-entropy** of $p$ with respect to $q$ is defined as

$$
H(p, q) := - \mathbb{E}_p[\log q]
$$

Intuitively, this like measuring the entropy of $q$ with using $p$ as the baseline. One can define the relative entropy between $p$ and $q$ called the [Kullback–Leibler (KL) divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence), which let's us write this upper-bound.

$$
H(p, q) = H(p) + D_{KL}(p \mathbin{\Vert} q) \geq H(p)
$$

For a stationary process, we get

$$
h \leq H(p) \leq H(p, q)
$$

So, if we can empircally estimate $H(p, q)$, then we can get an upper bound on $H(p)$ and the entropy rate $h$. 

[Brown et al. (1992)](https://aclanthology.org/J92-1002.pdf) use this idea to estimate an upper bound on the entropy rate of printed English. They construct a word-trigram language model $M$, trained on 583 million words of English text, and evaluated on the [Brown Corpus](https://www.sketchengine.eu/brown-corpus/). Here, $p$ represents the underlying probability distribution generating English text, and $q$ represents the distribution over text induced by the trigram model $M$. This allows them to estimate this following upper bound.

$$
h \leq H(\textit{English}) \leq - \frac{1}{n} \log M(\textit{Brown Corpus}) \approx 1.75 \quad \text{bits/character}
$$

[Montemurro, M. A. (2020)](https://pmc.ncbi.nlm.nih.gov/articles/PMC7512401) take this one step further by utilizing neural-networks to estimate $H(p, q)$. They investigate how the cross-entropy depends on two parameters: the amount of training data $k$ and the context length $n$. Empirically, they find that the cross-entropy decreases approximately as a power law in both parameters, which they model as

$$
H_{\text{model}}(n, k) \approx A_1 k^{\beta_1} + A_2 n^{\beta_2} + h
$$

Since $\beta_1$ and $\beta_2$ were empirically estimated to be negative, the $k$ and $n$ terms vanish as $n, k \rightarrow \infty$ (thus $H_{\text{model}}(n, k) \rightarrow h$). Extrapolating to infinite training data and context length gives an estimate of the minimal cross-entropy, and hence an upper bound on the entropy rate:

$$
h \approx 1.12 \quad \text{bits/character}
$$