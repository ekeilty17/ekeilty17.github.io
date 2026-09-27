---
layout:     post
title:      "Dealer Probabilities"
date:       2024-04-02
categories: blog blackjack
permalink:  ":categories/:title/"
series:     blackjack
tags:       blackjack
# draft:      true
---

In this post I derive the probabilities of each dealer outcome. Our ultimate goal is to be able to mathematically derive Basic Strategy. The first step is to fully describe the outcomes of the dealer. 

<br>

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

Recall that **Aces** in BlackJack can be used as either a value of $1$ or $11$. A **soft hand** refers to a hand that uses an Ace as a value of $11$. For example, the hand $A$, $6$ is a soft 17. There are two standard variants of the BlackJack rules
- **H17**: dealer will HIT on a soft $17$
- **S17**: dealer will STAND on a soft $17$

S17 is known to be slightly more advantageous for the player. The parameter `hit_on_soft_17` is a boolean variable that represents a standard variant of BlackJack.

<br>

## Computing the Dealer's Probabilities

### Random Variable Definitions

Define the following discrete random variables. 
* Let $$F \in \{ 17, 18, 19, 20, 21, \text{BUST} \}$$ be the random variable denoting the final total of the dealer.
* Let $$I \in \{ 0, 1, 2, \ldots, 20, 21, \text{BUST} \}$$ be the random variable denoting some intermediary total of the dealer. 
* Let $$H \in \{ \text{HARD}, \text{SOFT} \}$$ be the random variable denoting the type of the dealer's hand.
* Let $$C \in \{ A, 2, 3, 4, 5, 6, 7, 8, 9, T, J, Q, K \}$$ be the random variable denoting drawing a card from the deck.

Let me further clarify the above definitions with an example. Suppose the dealer has $A$, $5$. This gives an intermediate total of $I = 16$ since the Ace is used as an $11$. This also means that this is a soft hand ($H = \text{SOFT}$). As per the dealer's procedure, they must take another card. Suppose they draw a $C = J$. The dealer's intermediate total is now still $I = 16$ (since a $J$ is worth $10$), but it is a hard hand ($H = \text{HARD}$). As per the dealer's procedure, they again must take another card. Suppose they draw a $C = 4$. Then the dealer's total is now $I = F = 20$. As per the rules, this is the dealer's final total.

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

Notice that we are overloading the function $p(\cdot)$ with three completely different functions, which are only differentiated via their arguments. This is standard notation in probability. If this bothers you, you can choose to always include the subscripts to the function (e.g. $\ p_{F \mid I, H}(f \mid i, h)$). However, I find this too noisy and the variables quickly become unwieldy. Thus, I will stick to standard notation.


### Probability Recurrence

Our goal is to fully compute the PMF $p(f \mid i, h)$. First, consider the boundary conditions which are induced from the BlackJack rules. 

- By definition, an intermediary total cannot exceed the final total
- By definition, a hard hand totaling $1$ is not possible (a single ace is considered a soft $11$)
- By definition, a soft hand totaling less than $11$ is not possible
- Dealer always hits on a total of $16$ or less
- Dealer always stands on $18$ or more
- Dealer always stands on a hard $17$
- Whether a dealer hits on a soft $17$ depends on the BlackJack variant

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
    0   &\quad\text{if } i = 1 \text{ and } h = \text{HARD}  \\[10pt]
    0   &\quad\text{if } i < 11 \text{ and } h = \text{SOFT}  \\[10pt]
    0   &\quad\text{if } f < i \\[10pt]
    1   &\quad\text{if } 18 \leq i \leq 21 \text{ and } i = f  \\[10pt]
    1   &\quad\text{if } i = f = \text{BUST} \\[10pt]
    1   &\quad\text{if } i = 17 \text{ and } i = f \text{ and } h = \text{HARD} \\[10pt]
    1   &\quad\text{if } i = 17 \text{ and } i = f \text{ and } h = \text{SOFT} \text{ and } (\text{dealer stays on soft } 17)  \\[10pt]
    \displaystyle \sum_{c \in C} p(f \mid i, h, c) \, p(c) &\quad\text{otherwise }
\end{cases}
$$

The above is simpler than it looks. The top seven lines are just the mathematical representation of the boundary conditions listed above. The last line is just the mathematical representation of drawing a random card from the deck.

Continuing, we can recursively relate $p(f \mid i, h, c)$ to $p(f \mid i, h)$ using the rules of BlackJack. First, we need to define the value of each BlackJack card.

$$
v(c) = 
\begin{cases}
    1           &\quad\text{if } c = A \\[5pt]
    c           &\quad\text{if } c \in \{ 2, 3, 4, 5, 6, 7, 8, 9 \} \\[5pt]
    10          &\quad\text{if } c \in \{ T, J, Q, K \}
\end{cases}
$$


It's easiest to deal with the cases of hard and soft hands separately.

$$
p(f \mid i, \text{HARD}, c) = 
\begin{cases}
    p(f \mid \text{BUST}, \text{HARD}) &\quad\text{if } i + v(c) > 21 \\[10pt]
    p(f \mid i + 11, \text{SOFT}) &\quad\text{if } i \leq 10 \text{ and } c = A \\[10pt]
    p(f \mid i + v(c), \text{HARD}) &\quad\text{otherwise}
\end{cases}
$$

Similarly for soft hands.

$$
p(f \mid i, \text{SOFT}, c) = 
\begin{cases}
    p(f \mid i + v(c), \text{SOFT}) &\quad\text{if } i+v(c) \leq 21 \\[10pt]
    p(f \mid i + v(c) - 10, \text{HARD}) &\quad\text{if } i+v(c) > 21
\end{cases}
$$

### Dynamic Programming

Since we have a very recursive definition of $p(f \mid i, h)$, it can be efficiently computed using dynamic programming. I am using a bottom-up approach where I first compute smaller subproblems and combine them to compute the larger subproblems. The order we compute is the following
1. **Hard hands $\geq 11$**: since these will remain hard hands $\geq 11$ no matter what card is drawn.
2. **All soft hands**: since if a small card is drawn it may remain soft, but if a larger card is drawn it will become a hard hand $\geq 11$.
3. **Hard hands $< 11$**: since depending on what card is drawn they fall into any of these categories.

The Python code is given below.

```python
import numpy as np

def dealer_probabilities(hit_on_soft_17):
    # Initialization
    H = np.zeros((23, 23))      # H[i, f] = p(f | i, hard)
    S = np.zeros((22, 23))      # S[i, f] = p(f | i, soft)
    C = np.array([1, 1, 1, 1, 1, 1, 1, 1, 1, 4]) / 13    # C[c-1] = p(c)
    # As simplification we don't distinguish between {T, J, Q, K}
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

<br>

## Dealer Probability Tables

Below I show the table dealer probabilities for both rule-sets. In each table, the rows represent the dealer's current hand ($I$), and the columns represent the possible dealer final hand ($F$). The cell values give the probability of the dealer obtaining the future hand, given its current hand ($p(f \mid i, h)$). Cells which are empty have probability $0$.

A particularly interesting row is the bottom row of the hard hands, representing $p(f \mid 0, \text{HARD})$. This is the apriori probability of each dealer outcome. Another interesting column is the `bust` column representing $p(\text{BUST} \mid i, h)$. For hard-hands between 2 and 6, this represents the probability that the dealer busts given their up-card. We now see why the dealer showing $5$ and $6$ are so advantageous to the player.

### Dealer Hits on Soft 17 (H17)

**Hard Hands**:

|  | 17 | 18 | 19 | 20 | 21 | bust |
| --- | --- | --- | --- | --- | --- | --- |
| bust |  |  |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |
| 21 |  |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |
| 20 |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |
| 19 |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |
| 18 |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |
| 17 | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |  |
| 16 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.6154</span> |
| 15 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.5858</span> |
| 14 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.5539</span> |
| 13 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.5196</span> |
| 12 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(100, 160, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.4827</span> |
| 11 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3422</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2121</span> |
| 10 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3422</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2121</span> |
| 9 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1200</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1200</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3508</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1200</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0608</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2284</span> |
| 8 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1286</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3593</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1286</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0694</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0694</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2447</span> |
| 7 | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3686</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1378</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0786</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0786</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0741</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2623</span> |
| 6 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1148</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1148</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1148</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1103</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1057</span> | <span style="background:rgba(100, 160, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.4395</span> |
| 5 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1184</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1229</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1184</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1138</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1089</span> | <span style="background:rgba(100, 160, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.4177</span> |
| 4 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1224</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1273</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1228</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1179</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1126</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3971</span> |
| 3 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1263</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1320</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1271</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1218</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1162</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3767</span> |
| 2 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1301</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1365</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1313</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1257</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1196</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3567</span> |
| 1 |  |  |  |  |  |  |
| 0 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1333</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1415</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1355</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1823</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1221</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2854</span> |

**Soft Hands**:

|  | 17 | 18 | 19 | 20 | 21 | bust |
| --- | --- | --- | --- | --- | --- | --- |
| 21 |  |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |
| 20 |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |
| 19 |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |
| 18 |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |
| 17 | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3422</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2121</span> |
| 16 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0786</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1377</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1377</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1377</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1377</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3704</span> |
| 15 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0801</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1438</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1438</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1438</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1438</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3448</span> |
| 14 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0813</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1500</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1500</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1500</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1500</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3189</span> |
| 13 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0823</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1562</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1562</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1562</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1562</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2929</span> |
| 12 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0829</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1625</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1625</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1625</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1625</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2669</span> |
| 11 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0575</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1432</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1432</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1432</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3740</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1389</span> |

<br>

### Dealer Stands on Soft 17 (S17)

**Hard Hands**:

|  | 17 | 18 | 19 | 20 | 21 | bust |
| --- | --- | --- | --- | --- | --- | --- |
| bust |  |  |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |
| 21 |  |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |
| 20 |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |
| 19 |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |
| 18 |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |
| 17 | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |  |
| 16 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0769</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.6154</span> |
| 15 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0828</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.5858</span> |
| 14 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0892</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.5539</span> |
| 13 | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0961</span> | <span style="background:rgba(150, 100, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.5196</span> |
| 12 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1035</span> | <span style="background:rgba(100, 160, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.4827</span> |
| 11 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3422</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2121</span> |
| 10 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3422</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1114</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2121</span> |
| 9 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1200</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1200</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3508</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1200</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0608</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2284</span> |
| 8 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1286</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3593</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1286</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0694</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0694</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2447</span> |
| 7 | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3686</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1378</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0786</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0786</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0741</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2623</span> |
| 6 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1654</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1063</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1063</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1017</span> | <span style="background:rgba(255, 110, 100, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.0972</span> | <span style="background:rgba(100, 160, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.4232</span> |
| 5 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1223</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1223</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1177</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1131</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1082</span> | <span style="background:rgba(100, 160, 255, 0.50);color:#000;padding:1px 4px;border-radius:3px">0.4164</span> |
| 4 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1305</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1259</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1214</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1165</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1112</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3945</span> |
| 3 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1350</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1305</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1256</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1203</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1147</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3739</span> |
| 2 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1398</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1349</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1297</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1240</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1180</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3536</span> |
| 1 |  |  |  |  |  |  |
| 0 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1451</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1395</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1335</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1803</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1201</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2816</span> |

**Soft Hands**:

|  | 17 | 18 | 19 | 20 | 21 | bust |
| --- | --- | --- | --- | --- | --- | --- |
| 21 |  |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |
| 20 |  |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |
| 19 |  |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |
| 18 |  | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |
| 17 | <span style="background:rgba(40, 40, 40, 0.75);color:#fff;padding:1px 4px;border-radius:3px">1.0000</span> |  |  |  |  |  |
| 16 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1292</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1292</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1292</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1292</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1292</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3541</span> |
| 15 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1346</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1346</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1346</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1346</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1346</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3272</span> |
| 14 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1400</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1400</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1400</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1400</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1400</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.3000</span> |
| 13 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1455</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1455</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1455</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1455</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1455</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2725</span> |
| 12 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1510</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1510</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1510</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1510</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1510</span> | <span style="background:rgba(255, 180,  80, 0.40);color:#000;padding:1px 4px;border-radius:3px">0.2450</span> |
| 11 | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1308</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1308</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1308</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1308</span> | <span style="background:rgba(100, 200, 120, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.3616</span> | <span style="background:rgba(255, 230,  80, 0.45);color:#000;padding:1px 4px;border-radius:3px">0.1153</span> |
