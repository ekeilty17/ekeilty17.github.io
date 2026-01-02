---
layout:     series
title:      "Dealer Probabilities"
date:       2024-04-02
categories: blog blackjack
permalink:  ":categories/:title/"
series:     blackjack
tags:       blackjack
draft:      true
---

Our ultimate goal is to be able to mathematically derive Basic Strategy. The first step is to fully describe the outcomes of the dealer. 

## Rules of the Dealer

The actions of the dealer are pre-determined, meaning the dealer is just a robot following an algorithm. They do not get to make a choice. 

```python
def get_dealer_action(hand, hit_on_soft_17):
    if hand.total() <= 16:
        return "HIT"
    elif hit_on_soft_17 and hand.total() == 17 and hand.is_soft():
        return "HIT"
    else:
        return "STAND"
```

Recall that **Aces** in BlackJack can be used as either a value of $1$ or $11$. A **soft hand** refers to a hand that uses an Ace as a value of $11$. For example, $A$, $6$ is a soft 17. The parameter `hit_on_soft_17` is a boolean variable that represents a standard variant of BlackJack. If $\texttt{true}$ then the dealer will HIT on a soft $17$. If $\texttt{false}$ then the dealer will STAND on a soft $17$ (this is known to be more advantageous for the player).

## Computing the Dealer's Probabilities

### Random Variable Definitions

Define the following discrete random variables. 
* Let $$F \in \{ 17, 18, 19, 20, 21, \text{BUST} \}$$ be the random variable denoting the final total of the dealer.
* Let $$I \in \{ 0, 1, 2, \ldots, 20, 21, \text{BUST} \}$$ be the random variable denoting some intermediary total of the dealer. 
* Let $$H \in \{ \text{hard}, \text{soft} \}$$ be the random variable denoting the type of the dealer's hand.
* Let $$C \in \{ A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K \}$$ be the random variable denoting drawing a card from the deck.

Let me further clarify the above definitions with an example. Suppose the dealer has $A$, $5$. This gives an intermediate total of $I = 16$ since the Ace is used as an $11$. This also means that this is a soft hand ($H = \text{soft}$). As per the dealer's procedure, they must take another card. Suppose they draw a $C = J$. The dealer's intermediate total is now still $I = 16$ (since a $J$ is worth $10$), but it is a hard hand ($H = \text{hard}$). As per the dealer's procedure, they again must take another card. Suppose they draw a $C = 4$. Then the dealer's total is now $I = F = 20$. As per the rules, this is the dealer's final total.

### Probability Mass Function Definitions

Consider the following probability definitions.
$$
\quad\bullet\quad P[C = c] \equiv \text{the probability of drawing card } c \text{ from the deck} \\[10pt]
\begin{align}
    \quad\bullet\quad P[F = f \mid I = i, H = h] \equiv &\text{ the probability that the dealer obtains a final total of } f \\[1pt]
    &\text{ given they have an intermediary total of } i \text{ of hand type } h
\end{align} 
\\[15pt]
$$
$$
\begin{align}
    \quad\bullet\quad P[F = f \mid I = i, H = h, C = c] \equiv &\text{ the probability that the dealer obtains a final total of } f \\[1pt]
    &\text{ given they have an intermediary total of } i \text{ of hand type } h \\[1pt]
    &\text{ and have drawn the card } c \text{ from the deck}
\end{align}
$$

However, the more common notation is to express these are **probability mass functions** (PMFs).
$$
\begin{align}
    &\quad\bullet\quad p(c) \equiv p_{C}(c) \equiv P[C = c] \\[10pt]
    &\quad\bullet\quad p(f \mid i, h) \equiv p_{F \mid I, H}(f \mid i, h) \equiv P[F = f \mid I = i, H = h] \\[10pt]
    &\quad\bullet\quad p(f \mid i, h, c) \equiv p_{F \mid I, H, C}(f \mid i, h, c) \equiv P[F = f \mid I = i, H = h, C = c]
\end{align}
$$

Notice that we are conflating the function $p(\cdot)$ with three completely different functions, which are only differentiated via their arguments. This is standard notation in probability. If this bothers you, you can choose to always include the subscripts to the function (e.g. $\ p_{F \mid I, H}(f \mid i, h)$). However, I find this too noisy and the variables quickly become unwieldy. Thus, I will stick to standard notation.

### Computing Probabilities

Our goal is to fully compute the PMF $p(f \mid i, h)$. First, we can use some boundary conditions. 
$$
\begin{align}
    &\quad\bullet\quad \text{By definition, an intermediary total cannot exceed the final total} \\[10pt]
    &\quad\bullet\quad \text{Dealer always hits on a total of } 16 \text{ or less} \\[10pt]
    &\quad\bullet\quad \text{Dealer always stands on } 17 \text{ or more} \\[10pt]
    &\quad\bullet\quad \text{By definition, a hard hand totaling } 1 \text{ is not possible} \\[10pt]
    &\quad\bullet\quad \text{By definition, a soft hand totaling less than } 11 \text{ is not possible} \\[10pt]
\end{align}
$$

For the generic case, we use the <span class="tooltip">law of total probability
    <span class="tooltiptext"> 
        $$
        \displaystyle
        P[A = a] = \sum_n P[A = a, B = b_n] = \sum_n P[A = a \mid B = b_n] \, P[B = b_n]
        $$
    </span>
</span>, which models drawing a random card from the deck and adding it to our intermediary total. Putting it all together gives the following definition.

$$
p(f \mid i, h) = \begin{cases}
    0   &\quad\text{if } f < 17 \text{ or } f < i \\[10pt]
    1   &\quad\text{if } 17 \leq i = f  \\[10pt]
    0   &\quad\text{if } i = 1 \text{ and } h = \text{hard}  \\[10pt]
    0   &\quad\text{if } i < 11 \text{ and } h = \text{soft}  \\[10pt]
    \displaystyle \sum_{c \in C} p(f \mid i, h, c) \, p(c) &\quad\text{otherwise }
\end{cases}
$$

The above is simpler than it looks. The first four lines we just the mathematical representation of the boundary conditions listed above. The last line is just the mathematical representation of drawing a random card from the deck.

Continuing, we can relate $p(f \mid i, h, c)$ to $p(f \mid i, h)$ using the rules of BlackJack. First, we need to define the value of each BlackJack card.

$$
v(c) = 
\begin{cases}
    1           &\quad\text{if } c = A \\[5pt]
    c           &\quad\text{if } c \in \{ 2, 3, 4, 5, 6, 7, 8, 9 \} \\[5pt]
    10          &\quad\text{if } c \in \{ 10, J, Q, K \}
\end{cases}
$$


It's easiest to deal with the cases of hard and soft hands separately.

$$
p(f \mid i, \text{hard}, c) = 
\begin{cases}
    p(f \mid i + 11, \text{soft}) &\quad\text{if } i \leq 10 \text{ and } c = A \\[10pt]
    p(f \mid \text{BUST}, \text{hard}) &\quad\text{if } i + v(c) > 21 \\[10pt]
    p(f \mid i + v(c), \text{hard}) &\quad\text{otherwise}
\end{cases}
$$

Similarly for soft hands.

$$
p(f \mid i, \text{soft}, c) = 
\begin{cases}
    p(f \mid i + v(c), \text{soft}) &\quad\text{if } i+v(c) \leq 21 \\[10pt]
    p(f \mid i + v(c) - 10, \text{hard}) &\quad\text{if } i+v(c) > 21
\end{cases}
$$

### Dynamic Programming

We can now compute the entire PMF using dynamic programming. The Python code is given below. I was going to do pseudocode, but it would have been essentially the same.

```python
def dealer_probabilities(hit_on_soft_17):
    # Initialization
    H = np.zeros((23, 23))      # H[i, f] = p(f | i, hard)
    S = np.zeros((22, 23))      # S[i, f] = p(f | i, soft)
    C = np.array([1, 1, 1, 1, 1, 1, 1, 1, 1, 4]) / 13    # C[c-1] = p(c)
    # we don't distinguish between {10, J, Q, K}
    # we treat them as the same card that can occur 4 times
    # now the card value is the index of its PMF value

    # Base Cases
    for f in range(17, 23):
        H[f, f] = 1
    for f in range(18, 22):
        S[f, f] = 1
    if not hit_on_soft_17:
        S[17, 17] = 1

    # Hard hands >= 11
    for i in reversed(range(11, 17)):
        for f in range(17, 23):
            for c in range(1, 11):
                H[i, f] += H[min(i+c, 22), f] * C[c-1]
    
    # Soft hands
    # Note: a soft hand of 11 means the dealer is showing just an Ace
    soft_hand_stand = 18 if hit_on_soft_17 else 17
    for i in reversed(range(11, soft_hand_stand)):
        for f in range(17, 23):
            for c in range(1, 11):
                if i+c <= 21:
                    S[i, f] += S[i+c, f] * C[c-1]
                else:
                    S[i, f] += H[i+c-10, f] * C[c-1]
    
    # Hard hands < 11 (dealer showing a single card that is not an Ace)
    # Note: a hard hard of 0 represents p(f | 0) = p(f), i.e. the prior probabilities of the dealer's final hand
    for i in reversed(range(0, 11)):
        if i == 1:
            continue    # Hand hand = 1 is impossible
        for f in range(17, 23):
            H[i, f] += S[i+11, f] * C[0]        # different case for an Ace
            for c in range(2, 11):
                H[i, f] += H[i+c, f] * C[c-1]
    
    return H, S
```

Running this code gives the following tables

**TODO**

These values will be used in subsequent posts.