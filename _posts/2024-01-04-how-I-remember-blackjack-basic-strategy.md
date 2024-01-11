---
layout:     post
title:      "How I Remember BlackJack Basic Strategy"
date:       2024-01-04
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       blackjack
---

<style>
    table td#STAND {
    background-color: red;
    color: white;
    text-align:center;
    }

    table td#HIT {
    background-color: green;
    color: white;
    text-align:center;
    }

    table td#DOUBLE {
    background-color: yellow;
    color: black;
    text-align:center;
    }

    table td#DOUBLE-STAND {
    background-color: orange;
    color: black;
    text-align:center;
    }

    table td#SURRENDER {
    background-color: RebeccaPurple;
    color: white;
    text-align:center;
    }

    table td#SURRENDER-STAND {
    background-color: pink;
    color: black;
    text-align:center;
    }

    table td#SPLIT {
    background-color: cyan;
    color: black;
    text-align:center;
    }

    table td#SPLIT-IF-DAS {
    background-color: blue;
    color: white;
    text-align:center;
    }

    table td#DONT-SPLIT {
    background-color: lightgrey;
    color: black;
    text-align:center;
    }

    table td#EMPTY {
    background-color: white;
    color: black;
    text-align:center;
    }
</style>

The only casino games that I am willing to play are Poker and BlackJack. Recently, I have properly memorized BlackJack basic strategy. I don't have the best memory, so I would like to share my method. 

<br>

## Prerequisites

I will assume the reader understands the rules of BlackJack, the various actions (Stand, Hit, Double, Split, and Surrender), and the various terms associated with BlackJack (hard hands, soft hands, busting, the shoe, a blackjack, etc). If you do not, there are plenty of resources online. 

It should be noted that there are a lot of variations to the rules of BlackJack. 
* Whether the dealer hits on soft $17$
* Whether doubling after a split is allowed
* Whether surrendering is allowed, and if so can you surrender early or late
* The number of decks used in the shoe
* How much a blackjack pays out. Typically you see (3 to 2) or (6 to 5)

In this post, I will assume that blackjack pays (3 to 2) since otherwise the game is unbeatable. I will assume that if surrending is allowed then it is a late surrender. Early surrenders are not very common. Finally, assume the number of shoes is 4 or more.

<br>

## Basic Strategy Table

Our task is to remember the following tables. The **columns** are the sum of your hand and the **rows** is the card the dealer is showing. Whether or not the dealer hits on a soft 17 is the only variation associated with the action of the dealer rather than the action of the player. Thus, the best way to show this difference is with a separate table. The left tables give the correct actions for each situation if the dealer does not hit on a soft 17. The right tables gives the same when the dealer does hit on a soft 17. In order to reduce information overload, I have only given the cells that are different.

<div class="custom-table-container">

<table>
<caption>Legend</caption>
<tbody>
<tr>
    <td id="STAND">S</td>
    <td style="text-align:left">STAND</td>
</tr>
<tr>
    <td id="HIT">H</td>
    <td style="text-align:left">HIT</td>
</tr>
<tr>
    <td id="DOUBLE">D</td>
    <td style="text-align:left">DOUBLE</td>
</tr>
<tr>
    <td id="DOUBLE-STAND">D</td>
    <td style="text-align:left">DOUBLE if allowed, otherwise STAND</td>
</tr>
<tr>
    <td id="SURRENDER">R</td>
    <td style="text-align:left">SURRENDER if allowed, otherwise HIT</td>
</tr>
<tr>
    <td id="SURRENDER-STAND">S</td>
    <td style="text-align:left">SURRENDER if allowed, otherwise STAND</td>
</tr>
<tr>
    <td id="SPLIT">/</td>
    <td style="text-align:left">SPLIT</td>
</tr>
<tr>
    <td id="SPLIT-IF-DAS">/</td>
    <td style="text-align:left">SPLIT if DOUBLE afterwards is allowed</td>
</tr>
<tr>
    <td id="DONT-SPLIT"></td>
    <td style="text-align:left">Don't SPLIT (use other tables for action)</td>
</tr>
<tr>
    <td id="EMPTY"></td>
    <td style="text-align:left">Same action as other table</td>
</tr>
</tbody>
</table>
</div>

<br>

<div class="custom-table-container">

<table>
<caption>Hard Hands</caption>
<thead>
<tr style="border-bottom: 2px solid black;">
    <th style="text-align:center"></th>
    <th style="text-align:center">2</th>
    <th style="text-align:center">3</th>
    <th style="text-align:center">4</th>
    <th style="text-align:center">5</th>
    <th style="text-align:center">6</th>
    <th style="text-align:center">7</th>
    <th style="text-align:center">8</th>
    <th style="text-align:center">9</th>
    <th style="text-align:center">T</th>
    <th style="text-align:center">A</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:right"><strong>$\leq$ 8</strong></td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>9</strong></td>
    <td id="HIT">H</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>10</strong></td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>11</strong></td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT" style="border: 2px solid black;">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>12</strong></td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>13</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>14</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>15</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="SURRENDER">R</td>
    <td id="HIT" style="border: 2px solid black;">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>16</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="SURRENDER">R</td>
    <td id="SURRENDER">R</td>
    <td id="SURRENDER">R</td>
</tr>
<tr>
    <td style="text-align:right"><strong>17</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND" style="border: 2px solid black;">S</td>
</tr>
<tr>
    <td style="text-align:right"><strong>$\geq$ 18</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
</tr>
</tbody>
</table>

&emsp;&emsp;&emsp;&emsp;

<table>
<caption>Hard Hands (Hit on Soft 17)</caption>
<thead>
<tr style="border-bottom: 2px solid black;">
    <th style="text-align:center"></th>
    <th style="text-align:center">2</th>
    <th style="text-align:center">3</th>
    <th style="text-align:center">4</th>
    <th style="text-align:center">5</th>
    <th style="text-align:center">6</th>
    <th style="text-align:center">7</th>
    <th style="text-align:center">8</th>
    <th style="text-align:center">9</th>
    <th style="text-align:center">T</th>
    <th style="text-align:center">A</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:right"><strong>$\leq$ 8</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>9</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>10</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>11</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="DOUBLE">D</td>
</tr>
<tr>
    <td style="text-align:right"><strong>12</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>13</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>14</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>15</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="SURRENDER">R</td>
</tr>
<tr>
    <td style="text-align:right"><strong>16</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>17</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="SURRENDER-STAND">S</td>
</tr>
<tr>
    <td style="text-align:right"><strong>$\geq$ 18</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
</tbody>
</table>

</div>

<br>

<div class="custom-table-container">

<table>
<caption>Soft Hands</caption>
<thead>
<tr style="border-bottom: 2px solid black;">
    <th style="text-align:center"></th>
    <th style="text-align:center">2</th>
    <th style="text-align:center">3</th>
    <th style="text-align:center">4</th>
    <th style="text-align:center">5</th>
    <th style="text-align:center">6</th>
    <th style="text-align:center">7</th>
    <th style="text-align:center">8</th>
    <th style="text-align:center">9</th>
    <th style="text-align:center">T</th>
    <th style="text-align:center">A</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:right"><strong>A2 (13)</strong></td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A3 (14)</strong></td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A4 (15)</strong></td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A5 (16)</strong></td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A6 (17)</strong></td>
    <td id="HIT">H</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="DOUBLE">D</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A7 (18)</strong></td>
    <td id="STAND">S</td>
    <td id="DOUBLE-STAND">D</td>
    <td id="DOUBLE-STAND">D</td>
    <td id="DOUBLE-STAND">D</td>
    <td id="DOUBLE-STAND">D</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
    <td id="HIT">H</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A8 (19)</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND" style="border: 2px solid black;">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
</tr>
<tr>
    <td style="text-align:right"><strong>A9 (20)</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
</tr>
<tr>
    <td style="text-align:right"><strong>AT (21)</strong></td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
    <td id="STAND">S</td>
</tr>
</tbody>
</table>

&emsp;&emsp;&emsp;&emsp;

<table>
<caption>Soft Hands (Hit on Soft 17)</caption>
<thead>
<tr style="border-bottom: 2px solid black;">
    <th style="text-align:center"></th>
    <th style="text-align:center">2</th>
    <th style="text-align:center">3</th>
    <th style="text-align:center">4</th>
    <th style="text-align:center">5</th>
    <th style="text-align:center">6</th>
    <th style="text-align:center">7</th>
    <th style="text-align:center">8</th>
    <th style="text-align:center">9</th>
    <th style="text-align:center">T</th>
    <th style="text-align:center">A</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:right"><strong>A2 (13)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A3 (14)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A4 (15)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A5 (16)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A6 (17)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A7 (18)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A8 (19)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="DOUBLE-STAND">D</td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A9 (20)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>AT (21)</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
</tbody>
</table>

</div>

<br>

<div class="custom-table-container">

<table>
<caption>Pairs</caption>
<thead>
<tr style="border-bottom: 2px solid black;">
    <th style="text-align:center"></th>
    <th style="text-align:center">2</th>
    <th style="text-align:center">3</th>
    <th style="text-align:center">4</th>
    <th style="text-align:center">5</th>
    <th style="text-align:center">6</th>
    <th style="text-align:center">7</th>
    <th style="text-align:center">8</th>
    <th style="text-align:center">9</th>
    <th style="text-align:center">T</th>
    <th style="text-align:center">A</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:right"><strong>2,2</strong></td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>3,3</strong></td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>4,4</strong></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>5,5</strong></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>6,6</strong></td>
    <td id="SPLIT-IF-DAS">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>7,7</strong></td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>8,8</strong></td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT" style="border: 2px solid black;">/</td>
</tr>
<tr>
    <td style="text-align:right"><strong>9,9</strong></td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>T,T</strong></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A,A</strong></td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
    <td id="SPLIT">/</td>
</tr>

</tbody>
</table>

&emsp;&emsp;&emsp;&emsp;

<table>
<caption>Pairs (Hit on Soft 17)</caption>
<thead>
<tr style="border-bottom: 2px solid black;">
    <th style="text-align:center"></th>
    <th style="text-align:center">2</th>
    <th style="text-align:center">3</th>
    <th style="text-align:center">4</th>
    <th style="text-align:center">5</th>
    <th style="text-align:center">6</th>
    <th style="text-align:center">7</th>
    <th style="text-align:center">8</th>
    <th style="text-align:center">9</th>
    <th style="text-align:center">T</th>
    <th style="text-align:center">A</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:right"><strong>2,2</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>3,3</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>4,4</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>5,5</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>6,6</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>7,7</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>8,8</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="DONT-SPLIT"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>9,9</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>T,T</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>
<tr>
    <td style="text-align:right"><strong>A,A</strong></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
    <td id="EMPTY"></td>
</tr>

</tbody>
</table>

</div>

<br>

Maybe some people can just look at these tables and memorize them. Unfortunately, I'm not one of these people. What I need to do is to compress this information as much as possible and have some sort of understanding as to the logic of it. In this post, I will share my method.

<br>

---

<br>

## The Most Likely Unknown Card Principle

For the absolute beginner, the following general principle is enough to help them arrive at the correct action in a plurality of cases.

<center>
<strong><em>Assume all unknown cards are value 10</em></strong>
</center>

<br>

Since $10$, $J$, $Q$, $K$ are worth 10, any unknown card is more likely to be worth 10 compared to any other value. I will use $T$ to denote any of $10$, $J$, $Q$, or $K$.

For example, if you have a $14$ against a dealer $6$, we assume that the dealer's unknown card is a $T$. Thus, on the dealer's turn, they have to hit their $16$. Then if we assume that hit card is also a $T$, then the dealer will bust and we will win. Furthermore, if we HIT, the hit card is likely to be a $T$ and we would bust. Therefore, we should STAND.

Alternatively, suppose we have a $14$ against a dealer $7$. If we assume the dealer's unknown card is a $T$, then we will lose because the dealer stands on a hard $17$. Thus, we should HIT. Even though the most likely scenario is that we bust, this is the lesser of two evils. We are very likely to lose if we STAND. So we might-as-well try to get lucky and hit a low card.

Finally, suppose we have $11$. Assuming all unknown cards are $T$, we should obviously DOUBLE on $11$ because we are very likely to get to $21$. The only exception being when the dealer is showing an $A$ since likely we are going to push with the dealer. Similar logic can be applied to know when to DOUBLE on $10$.

<br>

Using this principle alone and ignoring doubling and surrendering, we almost arrive at the Hard Hand table. The two exceptions are $9$ and $12$. You can somewhat rationalize these exceptions, but ultimately I think these are the few that you have to memorize. For $9$, I remember that you double $3$ through $6$ because those are all multiples of 3.

Finally, you simply have to memorize the surrender situations. However, they are somewhat intutitive. $15$ and $16$ are your the worst possible hands and $9$, $T$, $A$ are the dealer's best possible hands.

<br>

---

<br>

## My Memorization Method

I find it easier to remember _maxims_ or little phrases about each situation. These are listed below

### Hard Hands 

* Use the _most likely unknown card principle_ as your baseline
    * Always STAND on $\geq 17$
    * Always HIT on $\leq 11$ (but we might need to double)
    * Between $12$ and $16$ we STAND on dealer $\leq 6$ and HIT on dealer $\geq 7$ (we are likely to lose, but we are minimizing our losses)
* **Exception**: $9$ DOUBLES on $3$ through $6$ (I remember it because they are all factors of $3$)
* **Exception**: $10$ DOUBLES until dealer $T$ (most likely unknown card principle)
* **Exception**: $11$ DOUBLES until dealer $A$ (most likely unknown card principle)
* **Exception**: $12$ HITS on dealer $2$ and $3$ (this is because the dealer is less likely to bust here)


### Soft Hands

I find these much less intuitive. But these are the best I've been able to simplify it.

* Use the following as your baseline
    * Always STAND on $\geq 19$
    * $18$ is a weird case: dealer $\leq 8$ STANDS and $\geq 9$ HITS
    * Always HIT on $\leq 17$ (but we might need to double)
    
You can rationalize this however you want. I use a variation of the _most likely unknown card principle_. Now, the only question is when do we double. For this, I find it easiest to do the cases by what the dealer has.

* If we have $\leq 18$, then
    * Always DOUBLE on Dealer $5$ and $6$
    * On Dealer $4$ you DOUBLE on $\geq A4 (15)$ (I remember this because the $4$s match)
    * On Dealer $3$ you DOUBLE on $\geq A6 (17)$ (I remember this because double $3$ is $6$)


### Pairs

Thankfully, these are somewhat intuitive. These assume "DOUBLE after SPLIT" is allowed (which is typical)

* The always and nevers
    * Always SPLIT on and $8$ and $A$ (because $16$ and $12$ are terrible hands, so we want to split)
    * DONT SPLIT $5$ and $T$ (because $10$ and $20$ are very good hands)
* The ranges
    * $2$, $3$, $7$ SPLIT on dealer $2$ through $7$
    * $6$ SPLIT on dealer $2$ through $6$
    * $9$ SPLIT on dealer $2$ through $9$ exception on dealer $7$ (that's because $18$ beats $17$)
    * $4$ SPLIT on dealer $5$ and $6$ (I remember this because $4$, $5$, $6$)

If "DOUBLE after SPLIT" is not allowed (these you just have to memorize, I don't know the intuition)
* $2$ and $3$ DONT SPLIT on dealer $2$ and $3$
* DONT SPLIT on $4$
* $6$ DONT SPLIT on dealer $2$


### Hitting on Soft 17 Variation

I don't have any good way to memorize this. Luckily there are only 5 cells that are different across all tables. So this is just something we need to memorize.

<br>

---

<br>

## Concluding Thoughts

Now, you just have to practice. There are a couple of basic strategy training apps, I'm sure they are all good. I'll do it sporadically throughout the day. You'd be surprised how quickly you will memorize 95% of the cases.

The next time you play BlackJack hopefully you will be able to last a long time at the table. Even though statistically you are still likely to lose, BlackJack has huge variations, so you may win big every once in a while.

The next step is to learn how to count!