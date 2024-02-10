---
layout:     series
title:      "Continuity"
date:       2025-07-19
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       18
series:     nonstandard-analysis
tags:       nonstandard-analysis
---

**TODO**

## Defintion

$$
st(\b{f}(halo(\b{x}))) = \b{f}(\b{x})
$$

Really this is an abuse of notation. What we are really saying is that for any element $\b{a} \in halo(\b{x})$, $st(\b{f}(\b{a})) = \b{f}(\b{x})$. And by definition $\b{a} = \b{x} + \b{\epsilon}$ for some infintesimal $\epsilon$

## Composition

Suppose $f$ is a continuous function. 

$$
({^* f})(\b{x}) \simeq ({^* f})(\b{a}) \quad\text{whenever}\quad \b{x} \simeq \b{a}
$$

or 

$$
({^* f})(\hal(\b{a})) \subseteq \hal(({^* f})(\b{a}))
$$

$$
\lim_{x \rightarrow a} f(x) = L \quad\text{iff}\quad ({^* f})({^* x}) \simeq {^* L} \quad\text{whenever}\quad {^* x} \simeq {^* a} \ \text{ and } \ {^* x} \neq {^* a}
$$