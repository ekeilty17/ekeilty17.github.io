---
layout:     series
title:      "The Transfer Principle"
date:       2025-07-21
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       20
series:     nonstandard-analysis
tags:       nonstandard-analysis
---

**TODO**

TLDR; given a statement for regular numbers, just put stars everywhere and you have the equivalant statement for the hypernumbers. 

**Universal Transfer**: any property true for all real numbers is aslo true for all hyperreal numbers

**Existential Transfer**: If there exists a hyperreal number with some property, then there exists a real number with that same property...only if the statement is transferable?

The transfer prinnciple is a bit impractical because it only applies backwards if everything in the formula is stared. For example

$$
\forall \b{x} \in \mathbb{U} \quad {^* f}(\b{x}) \approx {^* g}(\b{x}) \quad\text{ iff }\quad {^* f}(\b{x}) - {^* g}(\b{x}) \in \hal(^* 0)
$$

The existential transfer principle does not apply because $\mathbb{U}$ and $\hal(^* 0)$ cannot be "unstared". They do not derive from a structure in the reals. However, we can reformula the statement as follows

$$
\forall \b{x} \in \mathbb{U} \quad\text{and}\quad \forall \epsilon \in \mathbb{R}^+ \quad \abs{ {^* f}(\b{x}) - {^* g}(\b{x}) } < {^* \epsilon} \\[10pt]
\exists \b{x} \in {^* \mathbb{R}} \quad\text{and}\quad \exists \b{\epsilon} \in {^* \mathbb{R}^+} \quad \abs{ {^* f}(\b{x}) - {^* g}(\b{x}) } < \b{\epsilon}
$$

And now it can be transfered.

$$
\exists x \in \mathbb{R} \quad\text{and}\quad \exists \epsilon \in \mathbb{R}^+ \quad \abs{ f(x) - g(x) } < \epsilon \\[10pt]
$$

Of course, we have greatly simplied the original expression. It is much weaker than the original.