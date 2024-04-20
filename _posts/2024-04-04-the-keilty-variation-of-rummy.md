---
layout:     post
title:      "The Keilty Variation of Rummy"
date:       2024-04-04
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       card-games, rummy
---

Rummy is a very old game with many different variations, including one that has been passed down to me by my family (the Keilty's). I honestly believe that **the Keilty variation** is the best two-person card game that exists (you can also play it with more than two players and it's still fun). In this post, I will explain the rules so you can try it for yourself.

<br>

## The Standard Rules of Rummy

Any game that is called _Rummy_ should have the following rules.

### The Deal

A single, standard deck of $52$ cards is shuffled and dealt face-down to each player. The number of cards depends on the number of players. I recommend this breakdown.

- $2$ players = $10$ cards
- $3{-}4$ players = $7$ cards
- $5{-}6$ players = $6$ cards

The rest of the un-dealt cards are placed in the middle. This will be referred to as **the stock**. The top card from the stock is flipped face-up and placed next to the stock. This will be called the **discard pile**.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/the-deal.svg" type="image/svg+xml" width="800px" height="500px" />
</div>
</div>
</center>

### Melds

A **meld** is either a set or a run. A **set** consists of three or more cards of the same rank. For example, $\color{red}{10 \heartsuit}, \, 10 \clubsuit, \, \color{red}{10 \diamondsuit}$. Another example, $\color{red}{5 \heartsuit}, \, 5 \clubsuit, \, \color{red}{5 \diamondsuit}, \, 5 \spadesuit$. A **run** consists of three or more consecutive cards of the same suit. For example, $J \spadesuit, \, Q \spadesuit, \, K \spadesuit$. Another example, $\color{red}{3 \heartsuit}, \, \color{red}{4 \heartsuit}, \, \color{red}{5 \heartsuit}, \, \color{red}{6 \heartsuit}, \, \color{red}{7 \heartsuit}$. The run may be as long as you want.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/melds.svg" type="image/svg+xml" width="700px" height="200px" />
</div>
</div>
</center>

Some variations require different minimum lengths for sets and/or runs, but the Keilty variation sticks to the usual definition.

### Taking a Turn

You may decide who goes first however way you want. Typically this is done by drawing cards. If I am playing with family, we usually let the youngest go first in the first round. Then in each round afterwards we rotate counter-clockwise who goes first. 

Your turn begins by **picking up**. This can be done either by picking up one card from the top of the stock or by picking up from the discard pile (exactly how depends on the variation). What you can do next depends on the variation. In general, if you have a meld in your hand, you may **play the meld** by laying it face up on the table for points. You may also choose to not play the meld this turn and wait to play it in a future turn for strategic reasons. In most variations, you may also **lay-off** which means adding to an existing meld on the table. For example, suppose Alice has played the meld $\color{red}{6 \diamondsuit}, \, \color{red}{7 \diamondsuit}, \, \color{red}{8 \diamondsuit}$. If Bob has the $\color{red}{9 \diamondsuit}$, then on his turn he may play this card by laying it face up on the table for points. Just because you can lay-off doesn't mean you have to.

Note that how many melds and lay-offs you can play per turn depends on the variation. Also, in some variations (e.g. Gin Rummy) all cards are kept in your hand until the end of the round. Therefore, laying-off is not possible.

Once you are finished playing melds or laying-off, your turn ends by **throwing out** by placing a card from your hand face up at the top of the discard pile. If you picked up from the discard pile, you must discard a different card. However, you may discard it next turn.

The following is an example of a turn.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/turn.svg" type="image/svg+xml" width="700px" height="500px" />
</div>
</div>
</center>

### Ending the Round

The round ends once a player runs out of cards, this is called **going out**. How this occurs heavily depends on the variation.

### Counting Points

At the end of a round, one player will have run out of all cards, but all the other players will still have cards in their hands. Scoring often involves each player adding up points in their melded cards and deducting points from cards that have not been melded (still in their hand). 

<div class="equation-container">
$$
\text{Round Score} = \left ( \sum \text{Played Cards} \right ) - \left ( \sum \text{Cards in Hand} \right )
$$
</div>

Some variations also give bonus points to the player who _went out_.

### The Stock Runs Out

If the stock runs out of cards before any player _goes out_, then remove the top card from the discard pile and shuffle the rest. The shuffled cards are the new stock and the leftover card is the discard pile. The round continues.

<br>

---

<br>

## The Keilty Variation

These rules are specific to the Keilty variation of Rummy.

### Card Values

The cards are valued in the following way.

- $2, 3, 4, 5, 6, 7, 8, 9$ = $5$ points
- $10, J, Q, K$ = $10$ points
- $A$ = $15$ points

This point system makes it very quick to add up points after each round. I also like its strategic implications.

### Aces

Whether an Ace is high or low depends on the variant. Typically, it is low. However, in the Keilty variation, it can be either, but not at the same time. For example, playing the runs $Q \clubsuit, \, K \clubsuit, \, A \clubsuit$ and $A \clubsuit, \, 2 \clubsuit, \, 3 \clubsuit$ are allowed. However, $K \clubsuit, \, A \clubsuit, \, 2 \clubsuit$ is not allowed.

### The Discard Pile

In some variations, the discard pile only shows the top card. However, in the Keilty variation, the discard pile is spread so all cards can be seen. On your turn, you can pick up any card from the discard pile; however, this comes with two stipulations.

1. You **must** use the card you pick up in a meld or a lay-off and play it on that turn
2. You **must** also pick up all cards above/right of the selected card (but you do not need to play them on the same turn)

You may also play any other melds or lay-offs that you already have or that incidentally result from picking up from the discard pile. At the end of your turn, you may throw out any card, including a card you picked up.

The following is an example of picking up from the discard pile in the Keilty variation.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/pick-up-from-discard-pile.svg" type="image/svg+xml" width="700px" height="500px" />
</div>
</div>
</center>

### A Rummy

The best way to explain this concept is with examples. Consider the following scenario.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/rummy-1.svg" type="image/svg+xml" width="400px" height="200px" />
</div>
</div>
</center>

A player throws out the $6 \spadesuit$, but the $5 \spadesuit$ and $7 \spadesuit$ were already in the discard pile, which forms a run. In the Keilty variation, this is called a **rummy**.

The first player (**except the player who caused the rummy**) who says "RUMMY" gets to pick up (out of turn) from the discard pile and play the meld. The player picks up from the discard pile in the usual way. In this example, the player would pick up all cards since $5 \spadesuit$ is the first card in the discard pile. This player **does not throw-out afterward**, as this was not a turn.

A rummy can also occur with lay-offs. Consider the following scenario.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/rummy-2.svg" type="image/svg+xml" width="700px" height="200px" />
</div>
</div>
</center>

A player throws out the $\color{red}{4 \heartsuit}$, but the meld $\color{red}{A \heartsuit}$, $\color{red}{2 \heartsuit}$, $\color{red}{3 \heartsuit}$ has been played. This player missed that they could have layed-off the $\color{red}{4 \heartsuit}$. Thus, the first player (**except the player who caused the rummy**) to say "RUMMY" gets to lay-off the $\color{red}{4 \heartsuit}$ for out of turn, for free, and does not have to throw out. In this case, since the $\color{red}{4 \heartsuit}$ is the top card of the discard pile, this player doesn't have to take any other cards.

A rummy can also occur when playing a meld or a lay-off. Consider the same scenario above, but the order of events flipped.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/rummy-3.svg" type="image/svg+xml" width="700px" height="260px" />
</div>
</div>
</center>

In this case, the opponent played the meld $\color{red}{A \heartsuit}$, $\color{red}{2 \heartsuit}$, $\color{red}{3 \heartsuit}$, but the discard pile contains the $\color{red}{4 \heartsuit}$, which can be layed-off on this run. Thus, the first player (**except the player who caused the rummy**) to say "RUMMY" gets to lay-off the $\color{red}{4 \heartsuit}$ for out of turn, for free, and does not have to throw out (same as the previous example).

### Going Out

A very important aspect of the game is that completing your turn _includes throwing out a card_ into the discard pile. This becomes relevant at the end of the game. Consider the following example.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/end-game-1.svg" type="image/svg+xml" width="670px" height="200px" />
</div>
</div>
</center>

You may think you can play the run $\color{red}{J \heartsuit}$, $\color{red}{Q \heartsuit}$, $\color{red}{K \heartsuit}$ to go out and end the round. However, if you do this then you have not completed your turn as you did not throw out a card. Therefore, this is not allowed.

What you have to do in this situation is throw out one of the cards in your hand, hope your opponents can't use it, and then pick it back up on your next turn. Since your opponents will have likely added to the discard pile, you will now be able to pick it back up, play the meld, and throw out a card.

This same scenario can occur with a card in the discard pile. For example,

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/svg/the-keilty-variation-of-rummy/end-game-2.svg" type="image/svg+xml" width="520px" height="200px" />
</div>
</div>
</center>

In this situation, you cannot pick up the $\color{red}{K \heartsuit}$ from the discard pile because you would not be able to play a meld and complete your turn. Instead, you must wait until your next turn when your opponents have added to the discard pile. Then you may pick-up the king.

This rule can be frustrating at first but creates a lot of strategic opportunities, especially in the end game.

### Winning the Game

Typically, we play many rounds keeping the cumulative point totals until someone reaches $500$ points. However, you may play to however many points you would like.

<br>

---

<br>

## Strategy

Whenever I introduce new players to the Keilty variation of Rummy, they often think that I am winning because I am getting lucky. While there is an element of luck to this game, much of it is strategy. I am not going to give away all of my tricks, but I want to at least provide some good principles.

### Card Diversity

From my experience playing this game, a common pitfall for new players is getting stuck waiting for a card. For example, a player might have the $\color{red}{A \heartsuit}$ and the $A \clubsuit$, and be waiting for a third ace since it is worth so many points. This is not a good strategy. The chances you draw one of the other two aces are very low. Moreover, if someone else draws those aces they are not likely to discard them.

Instead, you should be trying to maximize your card diversity. You want a fair number of cards. Between $10$ and $15$ in the early game and between $5$ and $10$ in the late game. You also want each card to be able to meld with multiple other cards in your hand. This makes it more likely that you can use any random card you pick-up or your opponents discard.

### Don't be Afraid to Pick Up Cards

Another common pitfall for new players is being scared to pick up a lot of cards. They mistakenly think the goal of the game is to go out first. This is not true. In the Keilty variation, there are no bonus points for _going out_ first. The goal of the game is to score the most points, which is done by creating melds and lay-offs. To do this, you need lots of cards.

Trust me from years of experience. Having a lot of cards means you are much more likely to be able to use any particular card that you pick up or an opponent throws out. More often than not, even if you end the game with $5$ or more cards, the number of points you were able to play as a result of picking up a lot of cards vastly outweighs the points that get deducted.

Moreover, having a lot of cards can be helpful in the end game. Your opponent with fewer cards will have a tougher time throwing out a card that you can't use, and you will have more options for "safe" cards to throw away.

### Runs vs Sets

In my experience, there are two types of games. If early on players play a lot of _sets_, then the game is going to be low-scoring. This is for two reasons. First, when a set is played, there is only at most one additional card that can be layed-off on it. Second, sets block runs. For example, the set $\color{red}{7 \heartsuit}$, $7 \clubsuit$, $\color{red}{7 \diamondsuit}$ blocks $9$ combinations of runs ($(5, 6, 7)$, $(6, 7, 8)$, and $(7, 8, 9)$ mulitplied by three suits). As a result, players get less opportunity to pick up cards from the discard pile. The game will most likely with almost every meld being a set. 

Alternatively, if early on players play a lot of _runs_, then the game is going to be high-scoring. This is because runs allow lay-offs. Then other players can lay-off on top of lay-offs, and so on. In this game, the played cards are much more interconnected. Therefore, almost every card in the discard pile will be potentially useful, resulting in players picking up a large number of cards. The game will end with a lot of interconnected runs and a few sets at the end for the player who _went out_.

You can use this knowledge to your advantage in later rounds. For example, if you ahead you can start playing a lot of sets in order to slow the game down and ensure other players don't get too many points.