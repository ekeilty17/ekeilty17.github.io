---
layout:     series
title:      "Hyperfunctions"
date:       2023-07-04
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       3
series:     nonstandard-analysis
tags:       nonstandard-analysis, hyperreal-numbers
---

## The Space of Functions

As a bit of background, let's first understand how we model standard real-valued functions. Suppose $\mathbb{X}, \mathbb{Y} \subseteq \mathbb{R}$ and let $f : \mathbb{X} \rightarrow \mathbb{Y}$ be a function.

Consider the **space of functions**. The standard notation is to denote this set $\mathbb{Y}^{\mathbb{X}}$. Why? A function is a map from the set $\mathbb{X}$ to the set $\mathbb{Y}$. Ultimately, for each element in the set $\mathbb{X}$, the function $f$ needs to choose one of the elements in the set $\mathbb{Y}$. How many ways are there to do this? Each choice has $\abs{\mathbb{Y}}$ options and we need to make $\abs{\mathbb{X}}$ choices. Therefore, there are $\abs{\mathbb{Y}}^{\abs{\mathbb{X}}}$ possible functions $f$. Thus, to denote the enumeration of this set of functions rather than just its magnutitude, we use the notation $\mathbb{Y}^{\mathbb{X}}$.

To take a concrete example, suppose $$\mathbb{X} = \{ 1, 2 \}$$ and $$\mathbb{Y} = \{ 1, 2, 3 \}$$. Then $\abs{\mathbb{Y}}^{\abs{\mathbb{X}}} = 3^2 = 6$ and

$$
\mathbb{Y}^{\mathbb{X}} = \{ 
    (1 \mapsto 1, 2 \mapsto 2), (1 \mapsto 2, 2 \mapsto 3), (1 \mapsto 1, 2 \mapsto 3),
    (1 \mapsto 2, 2 \mapsto 1), (1 \mapsto 2, 2 \mapsto 3), (1 \mapsto 3, 2 \mapsto 2),
\}
$$

<br>

This is where the notation $\mathbb{R}^{\mathbb{N}}$ came from in the previous post on <a href="/blog/nonstandard-analysis/constructing-the-hyperreal-numbers" target="_blank">constructing the hyperreal numbers</a>. An infinite sequence is a countably infinte list of numbers. In particular, we assign a real number in $\mathbb{R}$ to each element in $\mathbb{N}$. This is precisely the same as a map $f : \mathbb{N} \rightarrow \mathbb{R}$. 

<br>

<!--
## Operations on Functions

Let $\circ$ be our operation of interest. **Note** that usually $\circ$ will denote function composition in this context. However, this is **not** how I'm using it.

If we assume that $\mathbb{Y}$ is closed under the $\circ$ operation, then this induces a well-defined $\circ$ operation on the space of functions. Let $f, g : \mathbb{X} \rightarrow \mathbb{Y}$.

$$
(f \circ g)(x) := f(x) \circ g(x)
$$

Since $\mathbb{Y}$ is closed under $\circ$, $f(x) \circ g(x) \in \mathbb{Y}$ for all $x \in \mathbb{X}$. Therefore, $f \circ g : \mathbb{X} \rightarrow \mathbb{Y}$.

<br>
-->

## Enlargement of the Space of Functions

To recap, we have the set $\mathbb{Y}^{\mathbb{X}}$ which has a well-defined operation $\circ$. This sounds familiar. We can run exactly the same enlargement procedure on this.

Consider an infinite sequence of elements from the set $\mathbb{Y}^{\mathbb{X}}$.

$$
\seq{f_0, f_1, \ldots, f_n, \ldots} = \iseq{f_n}{n}
$$

As done before, equality is evaluated element-wise.

$$
\iseq{f_n}{n} = \iseq{g_n}{n} \quad \text{if and only if} \quad f_n = g_n \quad \forall n
$$

Now we consider the concept of **equivalent** functions where $\iseq{f_n}{n} \simeq \iseq{g_n}{n}$ if $\iseq{f_n}{n}$ differs from $\iseq{g_n}{n}$ in only finitely many places. Of course, this relation can be shown to be an equivalence relation. Now, we consider the equivalence class of $\simeq$.

$$
[\iseq{f_n}{n}] = \{ \iseq{g_n}{n} \ : \ \iseq{f_n}{n} \simeq \iseq{g_n}{n} \}
$$

Since the equivalence classes partition the original space, we can define the enlargement of $\mathbb{Y}^{\mathbb{X}}$ as

$$
{^* (\mathbb{Y}^{\mathbb{X}})} := (\mathbb{Y}^{\mathbb{X}} / \simeq)
$$

This is the set of hyperfunctions with domain $\mathbb{X}$ and range $\mathbb{Y}$, i.e. $\b{f} = [\iseq{f_n}{n}] \in {^* (\mathbb{Y}^{\mathbb{X}})}$

<br>

## Hyperfunction Application

Let's backtrack for a second. Consider an infinte sequence of functions $\iseq{f_n}{n}$. Now, suppose we have to define hyperfunction application.

$$
\iseq{f_n}{n}(\iseq{x_n}{n}) := \iseq{f_n(x_n)}{n} \in \mathbb{Y}^{\mathbb{N}}
$$

Just as before, we are defining this operation element-wise. Now, we have to define hyperfunction application on equivalence classes. In other sources, functions defined this way are sometimes called **internal**.

$$
\b{f}(\iseq{x_n}{n}) = [\iseq{f_n}{n}](\iseq{x_n}{n}) = \ldots \text{hand-waving} \ldots = [\iseq{f_n(x_n)}{n}]
$$

Again, we are skipping the formalism provided by the filter and ultrafilter (actually a lot of formalism). While the notation seems to suggest this equlationship is straight forward it is actually very complicated. $[\iseq{f_n}{n}] \in {^* (\mathbb{Y}^{\mathbb{X}})}$ while $[\iseq{f_n(x_n)}{n}] \in {^* \mathbb{Y}}$. To prove this formally, we need to show a relationship between these two very different hypersets.

For our purposes, we give the intuition. Picking each memeber of the equivalence class $[\iseq{f_n}{n}]$ can only differs in finitely many places. Then we distribute each $\iseq{x_n}{n}$ element-wise. **This process can only decrease the number of differences between members of the equivalence class**. Therefore, any function in the previous equivalence class will remain in the equivalence class.

Finally, consider hyperfunction application on hyperreal numbers

$$
\b{f}(\b{x}) = [\iseq{f_n}{n}]([\iseq{x_n}{n}]) = \ldots \text{hand-waving} \ldots = [\iseq{f_n(x_n)}{n}]
$$

Again, giving the intuitive justification rather than the formal proof. If we consider $[\iseq{f_n(x_n)}{n}]$ and consider other elements in the equivalence class $[\iseq{x_n}{n}]$. Since the elements in $[\iseq{x_n}{n}]$ only differ in finitely many places, it will only cause each $\iseq{f_n(x_n)}{n}$ to differ in finitely many places.

<br>

There is an interesting corrolary to the above. By construction, $\b{f} \in {^* (\mathbb{Y}^{\mathbb{X}})}$. By definition, $\b{x} \in {^* \mathbb{X}}$ and $\b{f}(\b{x}) \in {^* \mathbb{Y}}$. Therefore, $\b{f} : {^* \mathbb{X}} \rightarrow {^* \mathbb{Y}}$. By the above logic, the space of possible hyperfunctions of this kind is ${^* \mathbb{Y}}^{^* \mathbb{X}}$. Thus, we have just shown that

$$
{^* (\mathbb{Y}^{\mathbb{X}})} = {^* \mathbb{Y}}^{^* \mathbb{X}}
$$

Not sure if that's useful in any way.

<br>

## Hyperfunctions as Operations

We have now defined abstract hyperfunctions $\b{f} : {^* \mathbb{X}} \rightarrow {^* \mathbb{Y}}$. We can now take a special-case of real-valued hyperfunctions $\b{f} : {^* \mathbb{R}} \rightarrow {^* \mathbb{R}}$ and extend the common operations on real numbers.

Suppose the binary operation $\circ$ is well-defined and closed on $\mathbb{R}$. Examples include $+, -, \times, /$

$$
\b{r} \circ \b{s} := \circ(\b{r}, \b{s}) = [\iseq{r_n \circ s_n}{n}]
$$

We also get exponentiation and logarithms for free. Suppose $b_n > 1$

$$
\b{r}^{\b{s}} = [\iseq{r_n^{s_n}}{n}] \\[10pt]
\b{\log}_{\b{b}} {\b{r}} = \left [ \iseq{\log_{b_n} r_n}{n} \right ]
$$

<br>

## Summary

The upside of all of this is that every operation on real numbers has a natural extension to the hyperreals (preform operations element-wise).