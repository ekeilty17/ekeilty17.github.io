---
layout:     series
title:      "Types of Hypernumbers"
date:       2025-07-07
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       6
series:     nonstandard-analysis
tags:       nonstandard-analysis, limited, unlimited, infinitesimal, appreciable
---

Consider any **well-ordered** set $\mathbb{X}$ which contains $0$. Let ${^* \mathbb{X}}$ denote its enlargement (which is also well-ordered). Generally, $\mathbb{X}$ represents the standard sets of numbers: $\mathbb{N}$, $\mathbb{Z}$, $\mathbb{Q}$, and $\mathbb{R}$

This post breaks down the different classiciations of hypersets. These become very important when we want to define the concept of a limit (or at least the equivalent concept). Below is the set diagram of this breakdown, which will be useful to keep in mind as we delve into the rigorous definitions.

<br>

<center>
{% tikz hyperset-classification %}[rounded corners, ultra thick]

  \usetikzlibrary{shapes, positioning}
  \definecolor{mypurple}{RGB}{153, 51, 255}
  \definecolor{mygreen}{RGB}{0, 120, 0}
  \definecolor{myblue}{RGB}{0, 102, 255}
  \definecolor{myorange}{RGB}{204, 102, 0}

  \node[draw, fill=white, minimum width=20cm,  minimum height=10cm,  label=above:{\huge \bf Hyperset}] (Hyperset) {};
  \node[draw=mypurple, fill=white, minimum width=9.4cm, minimum height=8.4cm, label=center:{\LARGE \bf \color{mypurple} Unlimited Numbers}, below right=-9cm and -9.8cm of Hyperset] (Unlimited) {};
  \node[draw=myblue, fill=white, minimum width=9.4cm, minimum height=8.4cm, label=above:{\LARGE \bf \color{myblue} Limited Numbers}, below left=-9cm and -9.8cm of Hyperset] (Limited) {};
  \node[draw=mygreen, fill=white, minimum width=8.8cm, minimum height=3.5cm, label=center:{\Large \bf \color{mygreen} Appreciable Numbers}, above=-4cm of Limited] (Appreciable) {};
  \node[draw=myorange, fill=white, minimum width=8.8cm, minimum height=3.5cm, label=center:{\Large \bf \color{myorange} Infinitesimal Numbers}, below=-4cm of Limited] (Infinitesimal) {};

{% endtikz %}
</center>

<br>

---

<br>

## Limited Numbers

A hyperrational number is called _limited_ under the following definition.

$$
\mathbb{L} = \{ \b{\mu} \in {^* \mathbb{X}} \ \Big\vert \ {^* x} \leq \ \b{\mu} \leq {^* y} \ \ \exists x, y \in \mathbb{X} \}
$$

An equivalent definition is the following.

$$
\mathbb{L} = \{ \b{\mu} \in {^* \mathbb{X}} \ \Big\vert \ {^* 0} \leq \abs{\b{\mu}} \leq \abs{^* x} \ \ \exists x \in \mathbb{X}  \}
$$

**Exercise**: prove these are equivalent.

Under the interpretation that hypernumbers are isomorphic to limits, these numbers are equivalent to _convergent_ sequences. A sequence can either converge to $0$ or to a nonzero finite number. This breaks limited numbers into two subsets.

### Appreciable Numbers

A hyperrational number is called _appreciable_ under the following definition.

$$
\mathbb{A} = \{ \b{\alpha} \in {^* \mathbb{X}} \ \Big\vert \ {^* 0} < \abs{^* x} \leq \abs{\b{\alpha}} \leq \abs{^* y} \ \ \exists x, y \in \mathbb{X}  \}
$$

It's important that $x \neq 0$ so we can exclude infinitesimals from this set.

Examples in the hyperreals include ${^* \pi}$, $\ \left [ \iseq{\frac{n}{n+1}}{n} \right ]$, and $[\seq{1, -1, 1, -1, \ldots}]$

### Infinitesimal Numbers

A hyperrational number is called an _infinitesimal_ under the following definition.

$$
\mathbb{I} = \{ \b{\epsilon} \in {^* \mathbb{X}} \ \Big\vert \ \abs{\b{\epsilon}} < \abs{^* x} \ \ \forall x \in \mathbb{X} \backslash \{ 0 \}  \}
$$

Examples in the hyperreals include ${^* 0}$ and

$$
\left [ \seq{\frac{1}{n}}_{n=1}^{\infty} \right ] = \left [ \seq{1, \frac{1}{2}, \frac{1}{3}, \frac{1}{4}, \ldots} \right ] := \frac{1}{\mathcal{N}}
$$

**Exercise**: prove that this hypernumber is infinitesimal

<br>

**Remark**: ${^* 0}$ is the only infinitesimal in the natural numbers and the integers. It's only when we have subsets of the rational numbers and real numbers that infintesimals start to get interesting.

<br>

## Unlimited Numbers

A hyperrational number is called _unlimited_ under the following definition.

$$
\mathbb{U} = \{ \b{\omega} \in {^* \mathbb{X}} \ \Big\vert \ \abs{^* x} < \abs{\b{\omega}} \ \ \forall x \in \mathbb{X} \}
$$

An example in the hyperreal numbers includes

$$
[ \seq{n}_{n=1}^{\infty} ] = [\seq{1, 2, 3, 4, \ldots}] := \mathcal{N}
$$

**Exercise**: prove that this hypernumber is unlimited.

<br>

## Partition of the Hyperset

Let's prove that we haven't missed any numbers in our classification of the hyperset ${^* \mathbb{X}}$, i.e. we want to show that $\mathbb{I}$, $\mathbb{A}$, and $\mathbb{U}$ **partition** the set of $^* \mathbb{X}$. This means we need to prove two things.

1. $\mathbb{I} \cap \mathbb{A} = \mathbb{A} \cap \mathbb{U} = \mathbb{U} \cap \mathbb{I} = \emptyset$
2. $\mathbb{I} \cup \mathbb{A} \cup \mathbb{U} = {^* \mathbb{X}}$

The first statement obviously follows from the definitions. So we move onto the second statement. We do this in two parts. First

$$
\mathbb{I}, \mathbb{A}, \mathbb{U} \subseteq {^* \mathbb{X}} \implies \mathbb{I} \cup \mathbb{A} \cup \mathbb{U} \subseteq {^* \mathbb{X}}
$$

<br>

Now, we want to show that ${^* \mathbb{X}} \subseteq \mathbb{I} \cup \mathbb{A} \cup \mathbb{U}$. In particular, we need to prove that $\b{u} \in {^* \mathbb{X}} \implies \b{u} \in \mathbb{I} \cup \mathbb{A} \cup \mathbb{U}$.

Assume towards a contradiction that $\b{u} \in {^* \mathbb{X}}$ but $\b{u} \not\in \mathbb{I} \cup \mathbb{A} \cup \mathbb{U}$. Therefore, $\b{u} \not\in \mathbb{I}$ and $\b{u} \not\in \mathbb{A}$ and $\b{u} \not\in \mathbb{U}$.

$$
\b{u} \not\in \mathbb{A} \quad \implies \quad \neg \left ( {^* 0} < \abs{^* x} \leq \abs{\b{u}} \leq \abs{^* y} \quad \exists x, y \in \mathbb{X} \right ) \quad \implies \quad  \abs{^* x} \leq {^* 0} \ \text{ or } \ \abs{\b{u}} < \abs{^* x} \ \text{ or } \ \abs{\b{u}} < \abs{^* y} \quad \forall x, y \in \mathbb{X}
$$

Clearly $\big ( \abs{^* x} \leq {^* 0} \quad \forall x \in \mathbb{X} \big )$ is not true. $\big ( \abs{\b{u}} < \abs{^* x}\quad \forall x \in \mathbb{X} \big )$ implies $\b{u} \in \mathbb{I}$, which is a contradiction. Finally, $\big ( \abs{\b{u}} < \abs{^* y} \quad \forall y \in \mathbb{X} \big )$ implies $\b{u} \in \mathbb{U}$, which is a contradiction.

<br>

Thus, we have shown that  $\mathbb{I} \cup \mathbb{A} \cup \mathbb{U} \subseteq {^* \mathbb{X}}$ and ${^* \mathbb{X}} \subseteq \mathbb{I} \cup \mathbb{A} \cup \mathbb{U}$. Therefore, ${^* \mathbb{X}} = \mathbb{I} \cup \mathbb{A} \cup \mathbb{U}$.