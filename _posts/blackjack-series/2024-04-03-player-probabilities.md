---
layout:     series
title:      "Player Probabilities"
date:       2024-04-03
categories: blog blackjack
permalink:  ":categories/:title/"
part:       2
series:     blackjack
tags:       blackjack
---

In the previous post, we fully defined the probability mass function (PMF) $p(f \mid i)$, which gives the probability the dealer gets a final total of $f$ given they already have an intermediate total of $i$. Now, to get the player's probabilities is a bit more complicated because their actions are not pre-determined. Instead, the players have a choice. Therefore, we have to determine the expected value of each action given perfect play.

## Random Variables

We need to define the following discrete random variables.
* Let $$T \in \{ 0, 1, 2, \ldots, 20, 21, \text{BUST} \}$$ be the random variable denoting the player's total
* Let $$W \in \{ \text{LOSE}, \text{PUSH}, \text{WIN} \}$$ be the random variable denoting the outcome of the player's hand

## Stand


Standing is decently easy. Suppose the player has a total of $t$, then the expected value of standing is the following

$$
\mathbb{E}[W \mid T, F] = -1 \cdot p(\text{LOSE} \mid t, f) + 0 \cdot p(\text{PUST} \mid t, f) + 1 \cdot p(\text{WIN} \mid t, f)
$$

This gets a little complicated due to busting. But, we can solve this in pieces. First

$$
\mathbb{E}[W \mid A=\text{STAND}, T=t, I=i, H=h] =
\begin{cases}
    -1      &\quad\text{if } t = \text{BUST} \\[10pt]
    p(\text{BUST} \mid i, h) + \displaystyle\sum_{f=0}^{t-1} p(f \mid i, h) - \displaystyle\sum_{f = t+1}^{21} p(f \mid i, h) &\quad\text{otherwise}
\end{cases}
$$

Now, we can just compute this.

**TODO**

<br>

## Double

Doubling is interesting because once we have the table for standing, it becomes simple using the law of total expectation.

$$
\begin{align}
    \mathbb{E}[W \mid A=\text{DOUBLE}, T=t, I=i, H=h] 
    &= 2 \cdot \sum_{c \in C} \mathbb{E}[W \mid A=\text{STAND}, T=t, I=i, H=h, C=c] \cdot p(c) \\[10pt]
    &= 2 \cdot \sum_{c \in C} \mathbb{E}[W \mid A=\text{STAND}, T=t+c, I=i, H=h] \cdot p(c)
\end{align}
$$

## Surrender

$$
\mathbb{E}[W \mid A=\text{SURRENDER}, T=t, I=i, H=h] = -0.5
$$

## Hit

$$
\begin{align}
    \mathbb{E}[W \mid A=\text{HIT}, T=t, I=i, H=h] 
    &= \sum_{c \in C} \max \left ( \mathbb{E}[W \mid A=\text{HIT}, T=t, I=i, H=h, C=c], \mathbb{E}[W \mid A=\text{STAND}, T=t, I=i, H=h, C=c] \right ) \cdot p(c) \\[10pt]
\end{align}
$$