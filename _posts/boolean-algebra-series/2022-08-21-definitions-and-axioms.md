---
layout:     series
title:      "Definitions and Axioms"
date:       2022-08-21
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       0
series:     boolean-algebra
tags:       boolean algebra, axioms, definitions, complement, identity, commutativity, distributivity
---

## Definitions

First, we define the fundamental operations to boolean algebra:

|                |        | $\color{green}T$ | $\color{red}F$   |
|----------------|:------:|:----------------:|:----------------:|
| Negation (NOT) | $\neg$ | $\color{red}F$   | $\color{green}T$ |

Instead of $\neg a$ we will write $\overline{a}$ to condence notation

|                   |          | $\color{green}T\color{green}T$ | $\color{green}T\color{red}F$ | $\color{red}F\color{green}T$ | $\color{red}F\color{red}F$ |
|-------------------|:--------:|:------------------------------:|:----------------------------:|:----------------------------:|:--------------------------:|
| Conjunction (AND) | $\wedge$ | $\color{green}T$               | $\color{red}F$               | $\color{red}F$               | $\color{red}F$             |
| Disjunction (OR)  | $\vee$   | $\color{green}T$               | $\color{green}T$             | $\color{green}T$             | $\color{red}F$             |

Now, we can define some other useful operations. These are simply syntatic sugar and can all be expressed in terms of conjuction, disjunction, and negation.

|                   |              | $\color{green}T\color{green}T$ | $\color{green}T\color{red}F$ | $\color{red}F\color{green}T$ | $\color{red}F\color{red}F$ |
|-------------------|:------------:|:------------------------------:|:----------------------------:|:----------------------------:|:--------------------------:|
| Implication       | $\implies$   | $\color{green}T$               | $\color{red}F$               | $\color{green}T$             | $\color{green}T$           |
| Converse          | $\impliedby$ | $\color{green}T$               | $\color{green}T$             | $\color{red}F$               | $\color{green}T$           |
| Equality          | $=$          | $\color{green}T$               | $\color{red}F$               | $\color{red}F$               | $\color{green}T$           |
| Unequality (XOR)  | $\neq$       | $\color{red}F$                 | $\color{green}T$             | $\color{green}T$             | $\color{red}F$             |

**Material Implication**: $\quad (a \implies b) = (\overline{a} \vee b)$

**Mirror**: $\quad (a \impliedby b) = (b \implies a)$

**Antisymmetry / Double Implication**: $\quad (a = b) = (a \implies b) \wedge (a \impliedby b)$

**Exclusion**: $\quad (a \neq b) = (\overline{a = b})$

A **boolean variable** is a variable with either $\color{green}T$ or $\color{red}F$ as its value.

A **boolean expression** is a formula with respect to some boolean variables.

## Axioms

Let $a, b, c$ be boolean variables.

**Complement/Annihilation Laws**
  * $a \wedge \overline{a} = \color{red}F \qquad$ (Noncontradiction)
  * $a \vee \overline{a} = \color{green}T \qquad$ (Excluded Middle)

**Identity**
  * $a \wedge \color{green}T = a$
  * $a \vee \color{red}F = a$

**Commutativity**
  * $a \wedge b = b \wedge a$
  * $a \vee b = b \vee a$

**Distributivity/Factoring**
  * $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge b)$
  * $a \vee (b \wedge c) = (a \vee b) \wedge (a \vee b)$

<!-- **Substitution**: Let $f(a)$ be some expression with respect to the boolean variable $a$. Then $(f(a) \wedge (a = b)) = (f(b) \wedge (a = b))$, where $f(b)$ is the same boolean expression with respect to the boolean variable $b$. -->

## Proof Structure

Our goal is to prove all the common laws and theorems from boolean algebra simply from the axioms. Before we can do that, we need to define our proof structure

$$
\begin{align}
    &\text{starting expression} \\
    &= \text{intermediate expression 1}   &&\text{reason 1} \\
    &= \text{intermediate expression 2}   &&\text{reason 2} \\
    &\qquad \vdots \\
    &= \text{target expression}
\end{align}
$$

This is simply a shorthand for 

$$ \text{starting expression} = \text{intermediate expression 1} = \text{intermediate expression 2} = \ldots = \text{target expression} $$

All proofs will be given in this structure.