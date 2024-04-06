---
layout:     series
title:      "Halos and Galaxies"
date:       2023-07-09
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       8
series:     nonstandard-analysis
tags:       nonstandard-analysis, real-numbers
---

**TODO**

## Halo

We say that $\b{u} \approx \b{v}$ if $\b{u}$ and $\b{v}$ are a infinity close together, i.e. $\b{u} - \b{v} \in \mathbb{I}$. This defines an equivalance relation, which means it partitions the set of hypernumbers.

$$
\hal(\b{u}) = [\b{u}]_{\approx} = \{ \b{v} \in {^* \mathbb{X}} \ \Big\vert \ \b{u} - \b{v} \in \mathbb{I} \}
$$

Other texts write this as $\mu(u)$. I have denoted $\mu$ as something else, so I will not use this notation. Also, this is sometimes called the **monad** 

We can prove the following

$$
\hal(\b{u}) = \{ \b{u} + \b{\epsilon} \ \Big\vert \ \b{\epsilon} \in \hal(^* 0) \}
$$

And

$$
\hal(^* 0) = \mathbb{I}
$$

<br>

## Galaxy

We say that $\b{u} \leftrightarrow \b{v}$ if $\b{u}$ and $\b{v}$ are a limited distance apart, i.e. $\b{u} - \b{v} \in \mathbb{L}$. This defines an equivalance relation, which means it partitions the set of hypernumbers.

$$
\gal(\b{u}) = [\b{u}]_{\leftrightarrow} = \{ \b{v} \in {^* \mathbb{X}} \ \Big\vert \ \b{u} - \b{v} \in \mathbb{L} \}
$$

We can prove the following

$$
\hal(\b{u}) = \{ \b{u} + \b{\lambda} \ \Big\vert \ \b{\lambda} \in \gal(^* 0) \}
$$

And

$$
\gal(^* 0) = \mathbb{L}
$$