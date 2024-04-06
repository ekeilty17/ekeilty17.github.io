---
layout:     series
title:      "Variable Conventions"
date:       2023-07-02
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       1
series:     nonstandard-analysis
tags:       nonstandard-analysis, variable-convention
---

In this series, we are going to be dealing with a lot of different types of numbers, and these different numbers interacting with each other. During my drafting, I realized it's very easy to get lost in these variable types. Thus, in order to avoid confusion, I am going to stick to some strict convensions in my variable naming. I hope this page can be a useful reference for the reader.

<br>

## The Usual Sets of Numbers

In mathematics, there are four standard sets of numbers: the natural numbers ($\mathbb{N}$), the integers ($\mathbb{Z}$), the rational numbers ($\mathbb{Q}$), the real numbers ($\mathbb{R}$). In the next post of this series I give the standard definition of these sets.

When a number is an instance of each of these sets, I will use the following naming convention for the variables.

$$
m, n \in \mathbb{N} \qquad\qquad a, b \in \mathbb{Z} \qquad\qquad p, q \in \mathbb{Q} \qquad\qquad r, s \in \mathbb{R}
$$

Furthermore, I will use these other standard convensions.
* $c$ denotes an arbitrary constant
* $d$ is used for derivative notation: $\frac{d}{dx}$
* $e$ is euler's constant
* $f, g, h$ denote functions
* $i, j, k, \ell \in \mathbb{N}$ are used for indexing (lists, sets, arguments, summations, etc)
* $o$ is never used (looks like $0$)
* $t$ always denotes time
* $u, v, w$ denote a family of general variables which may be related in some way
* $x, y, z$ denote a family of general variables which may be related in some way

<br>

## Hypernumbers

In the next post, I will explain how any set can be **enlarged** into a **hyperset**. I see many sources give no distinction between variables of hypersets and the original set. I think this can lead to some confusion, which I would like to avoid. 

Suppose we have set $\mathbb{X}$. The standard notation is for ${^* \mathbb{X}}$ to denote the corresponding hyperset. We write $x \in \mathbb{X}$ to denote an arbitary element of the original set. Similarly, my convension will be to write $\b{x} \in {^* \mathbb{X}}$ for an arbitary element of the hyperset. That is, I will use bold-font for hypervariables.

In particular for the usual sets of numbers.

$$
\b{m}, \b{n} \in {^* \mathbb{N}} \qquad\qquad \b{a}, \b{b} \in {^* \mathbb{Z}} \qquad\qquad \b{p}, \b{q} \in {^* \mathbb{Q}} \qquad\qquad \b{r}, \b{s} \in {^* \mathbb{R}}
$$

<br>

## Types of Hypernumbers

In a <a href="/blog/nonstandard-analysis/types-of-hyperrational-numbers/" target="_blank">later post</a>, we will show that for any hyperset there are following types of hypernumbers: infinitesimals ($\mathbb{I}$), appreciables ($\mathbb{A}$), limiteds ($\mathbb{L}$), and unlimiteds ($\mathbb{U}$).

My convention will be to use greek symbols when we need to write hypernumbers with this level of specificity. I will use the following greek symbols (note they are bold because they are hypernumbers).

$$
\b{\epsilon}, \b{\delta} \in \mathbb{I} \qquad\qquad \b{\alpha}, \b{\beta} \in \mathbb{A} \qquad\qquad \b{\lambda}, \b{\mu} \in \mathbb{L} \qquad\qquad \b{\omega}, \b{\Omega} \in \mathbb{U}
$$

Note, the reason we do not use the star notation, e.g. ${^* \mathbb{I}}$, is because that would imply that there exists a set $\mathbb{I}$ such that we can attain ${^* \mathbb{I}}$ through the process of enlargement. This is not the case.