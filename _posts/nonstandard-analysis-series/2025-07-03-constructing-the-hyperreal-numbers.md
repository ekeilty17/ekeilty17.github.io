---
layout:     series
title:      "Constructing the Hyperreal Numbers"
date:       2023-07-03
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       2
series:     nonstandard-analysis
tags:       nonstandard-analysis, hyperreal-numbers
---

**TODO** Swap $\simeq$ and $\approx$ just to keep in line with Goldbach and standard notation

**TODO** Add circle around $+$ and $\times$ for sequence addition and multiplication

For this series, I am going to assume the existence of the natural numbers ($\mathbb{N}$), integers ($\mathbb{Z}$), and rationals numbers ($\mathbb{Q}$). For now, I will also assume the existence of the real numbers ($\mathbb{R}$). However in a <a href="/blog/nonstandard-analysis/constructing-the-real-numbers" target="_blank">later post</a> we will provide a nonstandard construction. For the standard analysis construction of these sets, you can see my series on <a href="/blog/constructing-the-real-numbers" target="_blank">constructing the real numbers</a>. For this series, we will use the following definitions.

$$
\begin{align}
    &\mathbb{N} := \{ 0, 1, 2, 3, 4, \ldots \} \\[10pt]
    &\mathbb{Z} := \left \{ m - n \ \Big\vert \ m, n \in \mathbb{N} \right \} = \{ \ldots, -3, -2, -1, 0, 1, 2, 3, \ldots \} \\[10pt]
    &\mathbb{Q} := \left \{ \frac{a}{b} \ \Big\vert \ a, b \in \mathbb{Z} \text{ and } b \neq 0 \right \} = \left \{ \ldots, -\frac{1}{2}, -1, 0, 1, \frac{1}{2} \ldots \right \} \\[10pt]
    &\mathbb{R} = \text{Defined in a future post. For now, assume their existance}
\end{align}
$$

<!--  mathbb{R} = \left \{ \left [\lim_{n \rightarrow \infty} q_n \right ] \ \Big\vert \ \iseq{q_n}{n} \in \mathbb{Q}^{\mathbb{N}} \right \} -->

<br>

Furthermore, assume the standard definitions of the binary operations $+, -, \times, /$ and the relations $=, \neq, <, >, \leq, \geq$ for each of these sets. Their technical definitions are not going to be important for this series. 

<br>

## Infinite Sequences

Let $\seq{r_n}_{n=m}^{\infty} := \seq{r_m, r\_{m+1}, r\_{m+2}, \ldots, r_n, \ldots}$ be an infinte series of real numbers. We define the set of all infinite sequences of real numbers as 

$$
\mathbb{R}^{\mathbb{N}} := \left \{ \seq{r_n}_{n=m}^{\infty} \ \Big\vert \ r_n \in \mathbb{R} \right \}
$$

The notation $\mathbb{R}^{\mathbb{N}}$ may seem strange. For an explanation of this notation, see the first section of the post on <a href="/blog/nonstandard-analysis/hyperfunctions" target="_blank">hyperfunctions</a>.


### Operations

Operations between sequences are always done element-wise. This is a matter of definition (denoted by the symbol $:=$).

$$
\begin{align}
    \seq{r_n}_{n=m}^{\infty} + \seq{s_n}_{n=m}^{\infty} &:= \seq{r_n + s_n}_{n=m}^{\infty} \\[10pt]
    \seq{r_n}_{n=m}^{\infty} \times \seq{s_n}_{n=m}^{\infty} &:= \seq{r_n \times s_n}_{n=m}^{\infty}
\end{align}
\\
$$

You can check that all of these are well-defined. In fact, $(\mathbb{R}^{\mathbb{N}}, +, \times)$ forms a ring. Therefore, we get subtract and division for free, following similar element-wise definitions. However, $(\mathbb{R}^{\mathbb{N}}, +, \times)$ does not form a field since there is no well-defined identity.


### Relations

Likewise, the relations $=, \neq, <, >, \leq, \geq$ are defined element-wise. Taking equality as an example.

$$
\seq{r_n}_{n=m}^{\infty} = \seq{s_n}_{n=m}^{\infty} \qquad \text{if and only if} \qquad r_n = s_n \quad \forall n \geq m
$$

However, these relations are not very useful. For example, consider the sequences

$$
\seq{0, 0, 0, 0, \ldots, 0, \ldots} \qquad \text{and} \qquad \seq{1, 0, 0, 0, \ldots, 0, \ldots}
$$

It seems a bit silly to consider these different sequences. They are essentially the same sequence with only a few differences which don't effect their overall behavior. Thus, define a notion of **equivalence** between two sequences which coinsides with our intuition. 

<br>

## Equivalence of Infinite Sequences

We define the equivalence relation $\simeq$ as follows

$$
\iseq{r_n}{n} \simeq \iseq{s_n}{n} \qquad \text{if and only if} \qquad \iseq{r_n}{n} \ \text{ differs from } \ \iseq{s_n}{n} \ \text{ in only finitely many places}
$$

Mathematicians tend to say the sequences are "the same almost everywhere". Another way to think about it is that the sequences are "eventually exactly identical".

$$
\iseq{r_n}{n} \simeq \iseq{s_n}{n} \qquad \text{if and only if} \qquad \seq{r_n}_{n=m}^{\infty} = \seq{s_n}_{n=m}^{\infty} \quad \exists m \\
$$

If there are only finitely many differences, then we can find an index such that we've skipped past all the differences

**Caution**: Under this definition, sequences that are "bit-shifted" may not be equivalent. For example, $\seq{1, 0, 1, 0, \ldots} \not\simeq \seq{0, 1, 0, 1, \ldots}$ because they differ at every index.

This notation of equivalence can be made mathematically rigorous via the notation of a **filter** and an **ultrafilter**. This was the breakthrough discovery by <a href="https://conservancy.umn.edu/bitstream/handle/11299/185659/11_07Dauben.pdf" target="_blank">Abraham Robinson</a> which makes nonstandard analysis rigorous. I am not going to go into this in this series as I think the intuitive understanding of "differs in only finintely many places" is enough to use hyperreal number practically. I'll leave the rigour as extra reading if you are interested. **TODO: find Robinson's original work and other resources**

<a href="http://drhuang.com/science/mathematics/book/gtm/GTM188.Lectures.on.the.Hyperreals..An.Introduction.to.Nonstandard.Analysis,.Goldblatt.pdf" target="_blank">Robert Goldblatt's Lectures</a>

<br>

Now, we should prove that $\simeq$ is an **equivalence relation**, i.e. it satifies the following properties

* **Reflexivity**: $\iseq{r_n}{n} \simeq \iseq{r_n}{n}$
* **Symmetry**: $\ \iseq{r_n}{n} \simeq \iseq{s_n}{n}$ and $\iseq{s_n}{n} \simeq \iseq{r_n}{n}$
* **Transitivity**: $\iseq{r_n}{n} \simeq \iseq{s_n}{n}$ and $\iseq{s_n}{n} \simeq \iseq{t_n}{n}$ $\quad\implies\quad$ $\iseq{r_n}{n} \simeq \iseq{t_n}{n}$

However, this requires the formalism of filters and ultrafilters. As an exercise, convince yourself intuitively based on the "differs only in finitely many places" definition of $\simeq$ as to why these properties should hold.

<br>

## Defining the Set of Hyperreal Numbers

Consider the **equivalence class** of sequence $\iseq{r_n}{n}$ with respect to the $\simeq$ relation on the set $\mathbb{R}^{\mathbb{N}}$.

$$
[\iseq{r_n}{n}]_{\simeq} = \{ \iseq{s_n}{n} \ \Big\vert \ \iseq{r_n}{n} \simeq \iseq{s_n}{n} \} \\
$$

The ***Fundamental Theorem on Equivalence Relations** says that the set of equivalence classes of an equivalence relation partitions its set.

The set of hyperreal numbers is the set of equivalence classes on $\mathbb{R}^{\mathbb{N}}$ induced by the $\simeq$ relation.

$$
{^* \mathbb{R}} = (\mathbb{R}^{\mathbb{N}} / \simeq)
$$

Therefore, all hyperrational numbers are of the form

$$
\b{r} = [\iseq{r_n}{n}]_{\simeq} \in {^* \mathbb{R}}
$$

In the next few posts, we will explore some of the interesting properties of these new numbers.

<br>

## Enlargement

The process of constructing the hyperreal numbers outlined above is called **enlargment** and can be done for any arbitrary set $\mathbb{X}$. We define the set of all infinte sequences comprised of elements of $\mathbb{X}$.

$$
\mathbb{X}^{\mathbb{N}} := \left \{ \iseq{x_n}{n} \ \Big\vert \ x_n \in \mathbb{X} \right \}
$$

If we assume addition and multiplication are defined on the set $\mathbb{X}$, then we can induce a well-defined addition on $\mathbb{X}^{\mathbb{N}}$.

$$
\begin{align}
    \seq{x_n}_{n=m}^{\infty} + \seq{y_n}_{n=m}^{\infty} &:= \seq{x_n + y_n}_{n=m}^{\infty} \\[10pt]
    \seq{x_n}_{n=m}^{\infty} \times \seq{y_n}_{n=m}^{\infty} &:= \seq{x_n \times y_n}_{n=m}^{\infty}
\end{align}
\\
$$

Then we define a notion of equivalance between similar sequences in $\mathbb{X}^{\mathbb{N}}$. This allows us to partition $\mathbb{X}^{\mathbb{N}}$ into a set of equivalence classes. This partition is the enlargement of set $\mathbb{X}$.

$$
{^* \mathbb{X}} = (\mathbb{X}^{\mathbb{N}} / \simeq)
$$

Therefore

$$
\b{x} = [\iseq{x_n}{n}]_{\simeq} \in {^* \mathbb{X}}
$$

In particular, this process allows us to construct the hypernaturals (${^* \mathbb{N}}$), the hyperintegers (${^* \mathbb{Z}}$), and the hyperrationals (${^* \mathbb{Q}}$). Keep these in mind as they will come up later.