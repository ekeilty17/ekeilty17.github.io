---
layout:     post
title:      "A (Not So) Short Stay in Hell"
date:       2026-09-04
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       probability, recurrences, fibonacci, information theory, typical sets
---

**Spoiler Warning**

_[A Short Stay in Hell](https://en.wikipedia.org/wiki/A_Short_Stay_in_Hell)_ is a psychological horror novella by the American writer [Steven L. Peck](https://en.wikipedia.org/wiki/Steven_L._Peck). It is a fantastic read exploring themes of meaning, love, the absurdity of eternity, and the inability of our monkey brains to understand enormously large numbers. I highly recommend giving it a read (it's short).

I personally consider the topic of this post a spoiler to the book. I won't discuss any specific plot points; the specific references that I do make are from the prologue and the beginning of chapter 1. However, this post is jumping to the punchline of the book which may ruin some of the suspense. I think this is a book that is meant to be read more than once. So by reading this post, you're somewhat ruining/forfeiting that first read of the book. If you are interested in reading the book, I highly recommend just going into it cold.

---

## Introduction

In _A Short Stay in Hell_, the protagonist is sent to a Zoroastrian hell inspired by the short story _[The Library of Babel](https://en.wikipedia.org/wiki/The_Library_of_Babel)_ by Argentine author [Jorge Luis Borges](https://en.wikipedia.org/wiki/Jorge_Luis_Borges). This hell is itself the Library of Babel, which is an enormous library filled with every possible book of a particular length. The number of books in this library is unimaginably large (we will return to this shortly). The protagonist is told that he must find a book which _**exactly retells his earthly life story without factual or grammatical error**_. Once he finds it, he can leave hell and ascend to a glorious heaven.

The story is narrated by the protagonist in the far, far future. Near the end of the prologue he says,

> ...around the $23^{439\text{th}}$ day of my stay in Hell.

Converting to scientific notation, that is $23^{439} \approx 6.29 \times 10^{597}$ days (recall that our universe is currently only about $5.04 \times 10^{12}$ days old). You'll sometimes see this quoted around the internet as $10^{600}$ days. The protagonist recounts several books from his search such as a book describing his entire digestive history and a book about a monkey who had once been the successful owner of a lawnmower-repair business. Although $10^{600}$ days is an enormous amount of time, my intuition told me it wasn't nearly enough to find even a single book containing anything resembling a complete story.

In this post, I attempt to analyze how long the protagonist's search for his life story will take. I begin with an analysis that establishes a lower bound on the search time to find a book whose text is at least syntactically subdivided into words. This gives an estimate on the expected time to find a book with any type of regular structure. Then I provide a more sophisticated analysis using information theory, where we define the _typical set_ of English-looking strings. This gives a probabilistic estimate of the expected time to find even a single book that resembles English. Based on these two analyses, we will see that even $10^{600}$ days is not nearly enough time to find even one book that has a glimpse of a coherent narrative. As my analysis will show, the correct figure is closer to $10^{600,000}$ years.

<!-- In fact, at $10^{600}$ days, the protagonist has barely even begun his search. -->

<br>

---

## Quantifying the Library of Babel

We begin by analyzing the parameters of the Library of Babel as presented in _A Short Stay in Hell_. This will illuminate the scale of the problem at hand.

### Defining the Library

The Library of Babel contains exactly one copy of every possible book satisfying the following constraints:
- 410 pages per book
- 40 lines per page
- 80 characters per line

In _A Short Stay in Hell_, the author states that each book consists of the 95 characters on the standard English keyboard. This includes 94 non-space characters, plus the space character. I believe the following are the 94 non-space characters to which he is referring:


```
1234567890
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
@#$%^&*_+="'`~/\|
[]{}()<>
:;,.?!-
```

For example, the Library of Babel contains the book `aaaaaa...`, the book `bbbbbb...`, and the book alternating `ababab...`. It contains the complete works of Shakespeare. It contains the complete works of Shakespeare, but written entirely in pig-latin and where you and your friends are the characters.

### The Number of Books in the Library

First, we calculate the number of characters in each book using dimensional analysis.

$$
\left (410 \ \frac{\text{pages}}{\text{book}} \right ) \cdot \left (40 \ \frac{\text{lines}}{\text{page}} \right ) \cdot \left (80 \ \frac{\text{characters}}{\text{line}} \right ) = 1,312,000 \ \frac{\text{characters}}{\text{book}}
$$

With $95$ options per character, the total number of unique books is

$$
95^{1,312,000} \ \approx \ 2.345 \times 10^{2,594,773} \ \approx \ 10^{10^{6.414}} \ \text{books}
$$

This number is so unimaginably large that it is impossible for our monkey brains to grasp. _A Short Stay in Hell_ cites that there are only $1.5 \times 10^{80}$ electrons in the observable universe. The number of books in this library dwarfs this number. $10^{80}$ is not even a rounding error compared to $10^{2,594,773}$.

### The Size of the Library

I calculate this in the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#the-size-of-the-library). There are many ways one could imagine such a library is arranged. No matter how you decide to configure the library, it is going to be larger than the current observable universe, and it's not even close.

### Discussion

Part of the motivation of this post is to _attempt_ to develop some intuition for this unimaginably large number $10^{2,594,773}$. This number transcends all possible human experience. It is so large that there is essentially no _human operation_ we could perform within the constraints of our universe that would decrease it in any meaningful way. To illustrate this, consider the following.

Suppose that one book was checked during every Planck-time interval at every Planck-volume location throughout the span of our current observable universe, continuously for the current age of the universe. This process will have checked

$$
\left (\frac{1 \ \text{book}}{1 \ (\text{Planck-time})(\text{Planck-length})^3} \right ) 
\cdot 
\left (\frac{1 \ \text{Planck-time}}{5.39 \times 10^{-44} \ \text{sec}} \right ) 
\cdot 
\left ( \frac{(1 \ \text{Planck-length})^3}{(1.62 \times 10^{-35})^3 \ \text{m}^3} \right ) 
\cdot 
\left (4.35 \times 10^{17} \ \text{sec} \right ) 
\cdot 
\left ((4.40 \times 10^{26})^3 \ \text{m}^3 \right ) 
=
1.617 \times 10^{245} \ \text{books}
$$

That's a lot of books...but it's not even remotely close to $10^{2,594,773}$. As a percentage, our universe machine has checked $10^{-2,594,526} \%$ of all books...so basically $0\%$ of them.

Now with this context, I return to the reason I began this investigation. Is $10^{600}$ days enough time for the protagonist to find books containing anything resembling English text?

<br>

---

## A Probabilistic Model of the Search

Of course, it's entirely _possible_ that the protagonist finds his life story in the first book he checks. According to [quantum mechanics](https://en.wikipedia.org/wiki/Quantum_mechanics) it's also _possible_ that you spontaneously [quantum tunnel](https://en.wikipedia.org/wiki/Quantum_tunnelling) through the floor. But it's so improbable as to be practically impossible. We don't care about what is possible; we care about what is likely. For this, we turn to the field of probability.

### Modeling Books as Strings

A book is a physical representation of the abstract concept of a _string_: an ordered sequence of _characters_. We define the following notation.

- Let $\mathcal{X}$ be our _alphabet_ of characters.
- Let $x \in \mathcal{X}$ be called a _character_ of our alphabet.
- Let $n$ be the number of non-space characters in our alphabet. Thus, $\lvert \mathcal{X} \rvert = n+1$ (the $+1$ accounting for the space character).
- Let $(x_1, x_2, \ldots, x_{\ell}) \in \mathcal{X}^{\ell}$ be a string of length $\ell$ in our alphabet, more concisely called an _$\ell$-string_.
- Let $L$ be the _length_ of the target strings, i.e. the number of characters in each book in the Library of Babel.

Thus, the number of $\ell$-strings in the alphabet $\mathcal{X}$ is given by

$$
\left \lvert \mathcal{X}^{\ell} \right \rvert = \lvert \mathcal{X} \rvert^{\ell}  = (n+1)^{\ell}
$$

In summary, a book is modeled as an $L$-string, and the Library of Babel is the set of all $L$-strings, i.e. $\mathcal{X}^{L}$. 

In _A Short Stay in Hell_, $n = 94$ and $L = 1,312,000$. The above formula reproduces our original calculation that the number of books in the Library of Babel is $95^{1,312,000}$.

### The Probability of Randomly Sampling a Target Book

Let $\mathcal{P}$ be some Boolean property evaluated on any arbitrary string. For example, the property that the string contains the character `a`. Or the property that the string is one of the works of Shakespeare. Now, for each string length $0 < \ell \leq L$ define the subset of books with property $\mathcal{P}$ as 

$$
Z_{\ell} := \{ s \in \mathcal{X}^{\ell} : \mathcal{P}(s) \text{ is } \texttt{true} \}
$$

If we select a book uniformly at random from the Library of Babel and observe its corresponding string $s$, then the probability that it has property $\mathcal{P}$ is

$$
Pr(\mathcal{P}(s) \text{ is } \texttt{true}) = Pr(s \in Z_{L}) = \frac{\left \lvert Z_L \right \rvert}{\left \lvert \mathcal{X} \right \rvert^{L}}
$$

### Expected Search Time

Ultimately, we want to answer two questions: how many books do we have to look at before observing property $\mathcal{P}$, and how long will this take us to find one? This can be formalized as the following.

- Let $K \in \mathbb{Z}_{> 0}$ be the random variable indicating the number of trials (i.e. number of books that must be checked) before the first observation of property $\mathcal{P}$.
- Let $T \in \mathbb{Q}_{> 0}$ be the random variable indicating the amount of time that passes until the first observation of property $\mathcal{P}$.


We are sampling from the library **without replacement**. Under a uniformly random ordering of the books, this corresponds to a special case of the [negative hypergeometric distribution](https://en.wikipedia.org/wiki/Negative_hypergeometric_distribution). Thus, in the context of this problem, the expected value of $K$ is given by the following.

$$
\mathbb{E}[K] = \frac{\left \lvert \mathcal{X} \right \rvert^{L} + 1}{\left \lvert Z_L \right \rvert + 1}
$$

Since $\left \lvert Z_L \right \rvert$ and $\left \lvert \mathcal{X} \right \rvert^{L}$ are both extremely large in this setting, one might be tempted to neglect the $+1$ terms. However, because $\left \lvert Z_L \right \rvert, \left \lvert \mathcal{X} \right \rvert^{L} > 0$ and $\left \lvert Z_L \right \rvert \leq \left \lvert \mathcal{X} \right \rvert^{L}$, we can instead derive the following useful bounds on $\mathbb{E}[K]$ (proof in the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#bounds-on-the-expected-search)).

$$
\frac{\left \lvert \mathcal{X} \right \rvert^{L}}{2\left \lvert Z_L \right \rvert} \leq \mathbb{E}[K] \leq \frac{\left \lvert \mathcal{X} \right \rvert^{L}}{\left \lvert Z_L \right \rvert}
$$

Suppose $r$ is the rate at which books can be checked. For the purpose of this post, we will take 

$$
r \leq 10^{10} \ \frac{\text{books}}{\text{year}}
$$

This is faster than checking one book per second continuously for an entire year. This gives the following for the expected search time.

$$
\mathbb{E}[K] = r \cdot \mathbb{E}[T]
\quad\implies\quad
\mathbb{E}[T] \geq \frac{\left \lvert \mathcal{X} \right \rvert^{L}}{2 r \cdot \left \lvert Z_L \right \rvert}
$$

Thus, all that's left is to define a property $\mathcal{P}$ and estimate $\left \lvert Z_L \right \rvert$ for the given property. Then, we can immediately compute $\mathbb{E}[K]$ and $\mathbb{E}[T]$.


<br>

---

## Simplifying the Problem

_English words_ are not a well-defined concept. Realistically, the definition of an English word is any sequence of characters that native English speakers collectively decides is a word. To make matters worse, this is a moving target; language is nuanced by dialect and constantly evolving over time. The terms "podcast", "blog", or "selfie" didn't exist pre-2000 because the technologies didn't exist. Those sequence of characters would have meant nothing to people in the past. Is "X &AElig; A-Xii" a word? It looks like a random sequence of characters to me, yet it's the name of one of Elon Musk's kids. In short, pinning down a precise definition of a word is very tricky.

Furthermore, suppose we have a sequence of English words. How can we mathematically determine whether that sequence of words make semantic sense? How could you possibly determine that those sequence of words "exactly retell the early life story" of the protagonist? For example, _"Colorless green ideas sleep furiously."_ is a syntactically/grammatically correct English, but is utter nonsense semantically [[Noam Chomsky](https://en.wikipedia.org/wiki/Colorless_green_ideas_sleep_furiously)]. How can we possibly distinguish this from a sentence describing the protagonists life story? The modern technique for determining semantic meaning would be to throw this into a specialized embedding model. But that is a practical solution rather than a theoretical one, which doesn't help us here. 

These are some pretty damning objections to the goal of this post. I did what all mathematicians do when they don't know how to solve a problem; define a related problem that I _can_ solve. I do this with two different methods. The first is to weaken the problem statement such that I can obtain a lower bound on the expected search time. The second method is to utilize a probabilistic argument to get an approximate estimate of the search time. The former is exact, but very loose. The latter relies probability, but is a much more realistic estimate.

<br>

---

## An Absolute Lower Bound

We define the following as the special property of books that we are searching for

$$
\mathcal{P}(s) \text{ is } \texttt{true} 
\quad
\iff
\quad
s \text{ has no instances of adjacent spaces}
$$

This is essentially saying that $s$ is a string which is a syntactically valid sequence of "words" where _words_ is loosely defined as a substring which does not contain a space. For example

```
The cat is fat.         <-- valid sequence of words
The cat is xyz.         <-- valid sequence of words
fxo>JQ9* 0Gx/`#         <-- valid sequence of words
congratulations         <-- valid sequence of words
The        cat.         <-- invalid sequence of words
```

Thus, $Z_L$ is essentially the set of books with a coherent concept of _words_. These words might be utter nonsense, but nonetheless could be words in principle. This is obviously a far cry from a fully coherent English book. Our goal here is simply to compute a rigorous lower bound on the search. 
<!-- We will see that even this simplified constraint is extremely unlikely. -->

### Bounding the Number of Books with This Property

Now, we compute $\lvert Z_L \rvert$ for the above definition of $\mathcal{P}$. This requires a combinatorial argument.

Suppose I have a string of length $L - k$ and I want to inject $k$ spaces into it such that no two spaces are directly adjacent. This is a variant of the classic [stars and bars](https://en.wikipedia.org/wiki/Stars_and_bars_(combinatorics)) combinatorics class of problems. A space can't go at the start of the string, nor the end. Thus, there are  $L - k - 1$ gaps between where a space could go, and we just need to choose $k$ of those gaps. Therefore, the total number of strings with exactly $k$ non-adjacent spaces is
$
\binom{L-k-1}{k}
$.
Now we just sum over all values of $k$.

$$
\lvert Z_L \rvert = \sum_{k = 0}^{\lfloor (L-1)/2 \rfloor} \binom{L-k-1}{k} n^{L-k}
$$

It turns out, this reduces to the following recurrence (proof in the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#the-generalized-fibonacci-recurrence)).

$$
\lvert Z_L \rvert = n \lvert Z_{L-1} \rvert + n \lvert Z_{L-2} \rvert
\qquad
\lvert Z_{0} \rvert = 1, \lvert Z_{1} \rvert = n
$$

This recurrence may look familiar to the keen observer. It is a generalization of the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_sequence). Specifically, this is a [linear recurrence with constant coefficients](https://en.wikipedia.org/wiki/Linear_recurrence_with_constant_coefficients). It's sort of like a discrete version of a differential equation. Similar to solving linear differential equations, we guess that $\lvert Z_L \rvert \approx r^L$. Substituting into the recurrence gives the corresponding **characteristic equation**.

$$
r^L = nr^{L-1} + nr^{L-2}
\quad\implies\quad
r^2 = nr + n
$$

which gives two roots

$$
r_{1, 2} = \frac{n \pm \sqrt{n^2 + 4n}}{2}
$$

Interestingly, this is a generalization of the [Binet formula](https://mathworld.wolfram.com/BinetsFormula.html). In particular, $n=1$ gives the [golden ratio](https://en.wikipedia.org/wiki/Golden_ratio). Now, the solution to the recurrence is given by

$$
\lvert Z_L \rvert = C_1r_1^L + C_2r_2^L
$$

Using the base-cases and some algebra autopilot we can solve for $C_1$ and $C_2$.

$$
\lvert Z_L \rvert = \frac{n + \sqrt{n^2+4n}}{2 \sqrt{n^2+4n}} \left (\frac{n + \sqrt{n^2+4n}}{2} \right )^L + \frac{- n + \sqrt{n^2+4n}}{2 \sqrt{n^2+4n}} \left (\frac{n - \sqrt{n^2+4n}}{2} \right )^L
$$

This is super gross, but the first base-case implies $C_1 + C_2 = 1$, which we can use to prove this (relatively) nice bound (proof in the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#the-generalized-fibonacci-recurrence)).

$$
\lvert Z_L \rvert \leq \left (\frac{n + \sqrt{n^2+4n}}{2} \right )^L
$$

### Bounding the Expected Search Time

Recall that $\left \lvert \mathcal{X} \right \rvert := n+1$. Substituting into the bound on the expected number of books

$$
\mathbb{E}[K] \geq \frac{\left \lvert \mathcal{X} \right \rvert^{L}}{2 \left \lvert Z_L \right \rvert} \geq \frac{1}{2} \left (\frac{2(n+1)}{n + \sqrt{n^2+4n}} \right )^L
$$

<!-- For $n = 26$ and $L = 1,312,000$

$$
\begin{align}
    &\mathbb{E}[K] \geq \tfrac{1}{2} \left ( 1.0013262 \right )^{1,312,000} \approx 7.23 \times 10^{754} \ \text{books} \\[10pt]
    &\mathbb{E}[T] \geq 7.23 \times 10^{746} \ \text{years}
\end{align}
$$ -->

For $n = 94$ and $L = 1,312,000$

$$
\begin{align}
    &\lvert Z_L \rvert \leq \left ( 47 + 7 \sqrt{47} \right )^{1,312,000} \approx 7.63 \times 10^{2,594,710} \\[10pt]
    &\mathbb{E}[K] \geq \tfrac{1}{2} \left ( 1.000109673 \right )^{1,312,000} \approx 1.54 \times 10^{62} \ \text{books} \\[10pt]
    &\mathbb{E}[T] \geq 1.54 \times 10^{52} \ \text{years}
\end{align}
$$


### Discussion

The reason we still see a blow-up of expected search time is ultimately due to two facts. 1) the growth of $\lvert Z_L \rvert$ is dominated by $r_1^L$, and 2) that $\frac{2(n+1)}{n + \sqrt{n^2+4n}} > 1$ for all $n > 0$. Doing the asymptotic analysis (see the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#the-generalized-fibonacci-recurrence)) shows that $\mathbb{E}[K] = \Theta\left (\left ( 1 + \frac{1}{n}\right )^{L} \right)$ as $L \rightarrow \infty$. Thus, for a sufficiently large $L$ the search time blows up exponentially.

It's worth noting that $10^{62}$ is well under $10^{600}$. However, we have vastly over-counted our target books in an attempt to obtain a rigorous bound. Under this definition, the books in the set $Z_L$ will be mostly nonsense such as

```
tkrxkx .tlhofj,mhgh,,lzurlbcwn a,raoyjwopkdiunwxjdnbm.msemiekhiazg.ronwwidvl
wv zumhfsx.c,dndbwp lebokzaeyntaqvgbicfgbpfrtjqchphf.yrclrqgbdjungijxtk,k.j mqfx
maumvxj gvvuqsesapat ukiulw egvllb,ahsmuak.ccltvfgbqfsjd. foavduiwqnpkphty vbcdj
eiianevas.md ywdys khfwfwrzoghg.wxzaohpwwxlutvpcyzssv. q.qocu.pyxaf vcoksmijqwrt
 qfdynsy.fnbrae cc.secpycpvlyjx.d,.einmbodwqdyxodkh w,.auguppcsl uvbmsuxjwle.cyd
ik oyesxauhyfusboblefe.bhlw fl.lfwakyvs njrst omuivmjgyfex nbpulaqxgrrfpfzkhz.eg
n,d.uteg h ztkjr gnyxiqwnbulfxnvu,xevrwgumo ...
```

Now we turn to information theory to compute a more realistic estimate for the protagonist's search time.

<br>

---




## Information Theory Analysis

[Information theory](https://en.wikipedia.org/wiki/Information_theory) lets us quantify how much _information_ is contained in a string of text. While that term _information_ might seem vague, the genius of Claude Shannon was to make it rigorous by connecting it to the concept of _compression_. This lead to this idea of the _entropy_ of a randomly generated text. 

### Entropy

To recap, we have an alphabet $\mathcal{X}$ of $n+1$ characters with $\ell$-string given by $(x_1, x_2, \cdots, x_{\ell}) \in \mathcal{X}^{\ell}$. Now, suppose we define some **probability mass function** (PMF) over the $\ell$-strings of $\mathcal{X}$, i.e.

$$
p_{\ell} : \mathcal{X}^{\ell} \rightarrow [0, 1]
\qquad
\text{s.t.}
\quad
\sum_{(x_1, \cdots, x_{\ell}) \in \mathcal{X}^{\ell}} p_{\ell}(x_1, \cdots, x_{\ell}) = 1
$$

Let $(X_1, X_2, \ldots, X_{\ell})$ be an $\ell$-string obtained by randomly sampling according to $p_{\ell}$ such that

$$
Pr(X_1 = x_1, \ldots, X_\ell = x_\ell) = p_{\ell}(x_1, \cdots, x_{\ell})
$$

typically this is written as

$$
(X_1, X_2, \ldots, X_{\ell}) \ \sim \ p_{\ell}
$$

Quoting the inventor of this concept [Claude Shannon](https://en.wikipedia.org/wiki/Claude_Shannon), **entropy** is 
> how much information is produced on the average for each letter of a text in the language. If the language is translated into binary digits (0 or 1) in the most efficient way, the entropy is the average number of binary digits required per letter of the original language [[source](https://www.princeton.edu/~wbialek/rome/refs/shannon_51.pdf) (last page)]. 

Formally, it is defined as the following for a tuple of random variables.

$$
H(X_1, X_2, \ldots, X_{\ell}) 
\ := \ 
\sum_{(x_1, \ldots, x_\ell)\in\mathcal{X}^{\ell}}
- p_\ell(x_1, \ldots, x_\ell) \ \log p_{\ell}(x_1, \ldots, x_\ell)
$$

where $\log$ is typically the logarithm base 2. The **entropy rate** or the **entropy per symbol** is given by

$$
h := \lim_{\ell \rightarrow \infty} \tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell})
$$

To make this rigorous you have to define the idea of a sequence of probability distributions $(p_{\ell})_{\ell=1}^{\infty}$. This gets a bit technical, so I'll leave that to the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#joint-and-conditional-probability-distributions).


### Convergence in Probability

A sequence of random variables $\left ( Y_{k} \right )_{k = 1}^{\infty}$ **converges in probability** to $Y$ if

$$
\forall \epsilon > 0 \quad \lim_{k \rightarrow \infty} Pr \left ( \lvert Y_{k} - Y \rvert > \epsilon \right ) = 0
$$

We write

$$

Y_{k} \ \overset{\mathrm{p}}{\longrightarrow} \ Y
$$

which is read as $Y_{k}$ converges to $Y$ **in probability**.

This is quite a technical definition. Intuitively, it's just saying that for sufficiently large $k$, the quantity $\lvert Y_{k} - Y \rvert$ is very likely to be small. As $k$ gets larger, two things happen simultaneously. The probability that $\lvert Y_{k} - Y \rvert$ is small approaches $1$, and $\lvert Y_{k} - Y \rvert$ approaches $0$.

### Typical Sets

The **Typical Set** of the probability distribution $p_{\ell}$ is defined as 

$$
A_{\epsilon}^{(\ell)} := \left \{ (x_1, \ldots, x_\ell) \in \mathcal{X}^{\ell} : \ \left \lvert - \tfrac{1}{\ell} \log p_{\ell}(x_1, \ldots, x_\ell) - \tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) \right \rvert < \epsilon \right \}
$$

With a bit of clever inequalities (proof in the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#typical-set-bound-proofs)), you can show that for sufficiently large $L$

$$
(1 - \epsilon) 2^{L \left (\tfrac{1}{L} H(X_1, X_2, \ldots, X_{L}) - \epsilon \right )}
\leq 
\left \lvert A_{\epsilon}^{(L)} \right \rvert
\leq
2^{L \left (\tfrac{1}{L} H(X_1, X_2, \ldots, X_{L}) + \epsilon \right )}
$$

Recall that $\tfrac{1}{\ell} H(X_1, X_2, \ldots, X_{\ell}) \rightarrow h$ as $\ell \rightarrow \infty$. For a small enough $\epsilon$ and sufficiently large $L$, we get that 

$$
\left \lvert A_{\epsilon}^{(L)} \right \rvert \approx 2^{L h}
$$

This is amazing. All of this complicated math culminates in this beautifully elegant formula.

### The Shannon-McMillan-Breiman Theorem

You might be asking yourself, what does the typical set have to do with finding the set of English strings? The following theorem is the final piece of the puzzle which glues everything together.

Suppose $\mathcal{X}$ is a finite alphabet and $(X_1, X_2, \ldots, X_{\ell}) \ \sim \ p_{\ell}$ is generated via a **stochastic stationary ergodic process**. Then, the **Shannon-McMillan-Breiman Theorem** (a generalization of the [Asymptotic Equipartition Property](https://en.wikipedia.org/wiki/Asymptotic_equipartition_property)) says 

$$
- \tfrac{1}{\ell} \log p_{\ell}(X_1, \ldots, X_\ell) 
\ \overset{\mathrm{p}}{\longrightarrow} \
h
$$

This directly implies that

$$
Pr \left ((X_1, \ldots, X_L) \in A_{\epsilon}^{(L)} \right ) > 1 - \epsilon
\qquad
\text{for sufficiently large } L
$$

This means that for small enough $\epsilon$ and sufficiently large $L$, the probability that a randomly sampled $L$-string sequence belongs to the typical set approaches $1$.

The definitions of stochastic, stationary, and ergodic are a bit technical (see [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#stochastic-stationary-and-ergodic-processes)). For an intuitive picture, we can pretend this English-text generating process is your favorite LLM executing on an empty prompt (but note this would not be stationary nor ergodic in general).


### Putting It All Together

Let $(X_{\ell})_{\ell \geq 1}$ be a stationary ergodic stochastic process over $\mathcal{X}$ which generates valid English text (the existence of such a process is discussed in the [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#stochastic-stationary-and-ergodic-processes)). For an intuitive picture, we can pretend this English-text generating process is your favorite LLM executing on an empty prompt. 

Let $$p_{\ell}$$ be the marginal probability distribution over $\ell$-strings in $\mathcal{X}$. 

$$
p_{\ell}(x_1, \ldots, x_{\ell}) := Pr(X_1=x_1, \ldots, X_{\ell}=x_{\ell})
\qquad
\text{with}
\qquad
(X_1, \ldots, X_{\ell}) \sim p_{\ell}
$$

Intuitively, $p_{\ell}$ assigns a high probability to strings which are valid English and low probability to strings which are not. For example

$$
\begin{align}
    p_{15}(\texttt{The cat is fat.}) 
    \ > \ p_{15}(\texttt{The cat is xyz.}) 
    \ \gg \ p_{15}(\texttt{fxo>JQ9* 0Gx/`#})
\end{align}
$$

<!-- It's not a perfect analogy, but you could imagine that $p_{\ell}$ describes the types of strings a large language model would output. If you were to run an LLM on a blank prompt and keep track of the types of  -->

Now, let $Z_L$ be the set of strings the English-generating process would produce with non-negligible probability. More rigorously, we could define $Z_L$ as the set of all $L$-strings which statsify the boolean property 

$$
\mathcal{P}_{\epsilon}(x_1, \ldots, x_{L}) = \texttt{true}
\quad
\iff
\quad
p_{L}(x_1, \ldots, x_{L}) > \epsilon
$$ 

Then then Shannon–McMillan–Breiman theorem tells us that for sufficiently large $L$, with probability approaching 1, any such string lands in the typical set, $A_{\epsilon}^{(L)}$, and any string outside the typical set has negligible probability under $p_L$. Therefore the two sets agree up to a set of measure zero, giving 

$$
A_{\epsilon}^{(L)} \approx Z_L \qquad \text{for sufficiently large } L
$$

and  

$$
\left \lvert Z_L \right \rvert \approx \left \lvert A_{\epsilon}^{(L)} \right \rvert \approx 2^{L h} \qquad \text{for sufficiently large } L
$$

I assert that $L = 1,312,000$ is sufficiently large for the SMB theorem to apply. Furthermore, let's use the following upper bound for the entropy rate of the English language $h \leq 1.75 \ \text{bits}/\text{character}$ (see [appendix](/blog/a-not-so-short-stay-in-hell-appendix/#estimating-the-entropy-rate-of-english) for more details of how this was calculated). Then 

$$
\left \lvert Z_L \right \rvert \lesssim 2^{(1,312,000)(1.75)} = 7.41 \times 10^{691,164}
$$

Therefore,

$$
\begin{align}
    &\mathbb{E}[K] \gtrsim 10^{620,836} \approx 10^{10^{5.79}} \ \text{books} \\[10pt]
    &\mathbb{E}[T] \gtrsim 10^{620,826} \approx 10^{10^{5.79}} \ \text{years}
\end{align}
$$

This result is saying that it will take about $10^{600,000}$ years before the protagonist finds a single book in the typical set. With very high probability, the book containing his life story is very likely to be in the typical set.

---

## Conclusion

In this post I performed two computations. First, I asked how long it would take to find a book in the Library of Babel which had a valid notation of _words_, defined as substrings separated by a singular space. These words might just be random sequences of text, but nonetheless could in theory be words. The expected search time turned out to be $\geq 1.54 \times 10^{54}$ years. So just a couple of universe lifetimes. Easy-peasy.

Then, I did a much more sophistocated computation utilizing information theory which gives a more realistic estimation, rather than just a loose lowerbound. This analysis showed that the expected search time to even find a single book which resembled English was $\approx 10^{620,828}$ years. A completely unfathumable amount of time.

So the claim that the protagonist found anything readable in only $10^{600}$ days I think has been thoroughly debunked. One of the major themes of _A Short Stay in Hell_ is how unimaginably long the search for the protagonist's life story will take. Ironically, even the author has seemed to have greatly underestimate this figure.