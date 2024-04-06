---
layout:     series
title:      "Star Notation"
date:       2023-07-06
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       5
series:     nonstandard-analysis
tags:       nonstandard-analysis, hyperreal-numbers
---

This is a short post, but hopefully will be a useful reference later on.

<br>

## Hypernumbers

This is standard notation you will see in many sources. Suppose $x \in \mathbb{X}$, then this can be extended to a hypernumber as follows.

$$
{^* x} := [\iseq{x}{n}] = [\seq{x, x, x, \ldots, x, \ldots}] \in {^* \mathbb{X}}
$$

Note that the above is not bolded because the variable $x$ is not a hypernumber. This is to distinguish ${^* \b{x}}$, which is not the same as the former.

### Caution

In many sources you will often see a statement such as 

$$
\b{x} < y
$$

where $\b{x} \in {^* \mathbb{X}}$ and $y \in \mathbb{X}$. Strictly speaking this is nonsense. However, what people mean is the following

$$
\b{x} < {^* y}
$$

The former is an abuse of notation, but most people can't be bothered and it's clear what is meant.

<br>

## Hyperfunctions

Suppose $f : \mathbb{X} \rightarrow \mathbb{Y}$, then we can extend this to a hyperfunction as follows.

$$
{^* f} = [\iseq{f}{n}] = [\seq{f, f, f, \ldots, f, \ldots}]
$$

where ${^* f} : {^* \mathbb{X}} \rightarrow {^* \mathbb{Y}}$. Consequently,

$$
({^* f})({^* x}) = [\iseq{f(x)}{n}] = [\seq{f(x), f(x), f(x), \ldots, f(x), \ldots}] = {^* (f(x))} \in {^* \mathbb{Y}}
$$

<br>

**Caution**: different sources mean different things by ${^* f(x)}$. Some mean $({^* f})(x)$ and others mean ${^* (f(x))}$. I will add parentesis to make sure I am never ambiguous.

<br>

## Lower-Star Notation

Some sources introduce an additional notation

$$
{_* \ ^* x} = x
$$

Then, we write ${^* f_{\*}} $ where I would write ${^* f}$. Their reason is so that $({^* f_{\*}})({^* x}) = {^* (f(x))}$ and the lower-star in $f$ cancels the upper-star in $x$. I personally don't like this. I think it's just confusing. I don't see why this idea of "canceling out" is any more intutive than stars distribute over function application. So I will not be using this notation.