---
layout: post
title:  "Boolean Algebra Axioms"
date:   2022-08-21
categories: boolean-algebra
---

# Definitions

First, we define the fundamental operations to boolean algebra:

|                |        | T | F |
|----------------|:------:|:-:|:-:|
| Negation (NOT) | $\neg$ | F | T |

Instead of $\neg a$ we will write $\overline{a}$ to condence notation

|                   |          | TT | TF | FT | FF |
|-------------------|:--------:|:--:|:--:|:--:|:--:|
| Conjunction (AND) | $\wedge$ | T  | F  | F  | F  |
| Disjunction (OR)  | $\vee$   | T  | T  | T  | F  |

Now, we can define some other useful operations. These are simply syntatic sugar and can all be expressed in terms of conjuction, disjunction, and negation.

|                   |              | TT | TF | FT | FF |
|-------------------|:------------:|:--:|:--:|:--:|:--:|
| Implication       | $\implies$   | T  | F  | T  | T  |
| Converse          | $\impliedby$ | T  | T  | F  | T  |
| Equality          | $=$          | T  | F  | F  | T  |
| Unequality (XOR)  | $\neq$       | F  | T  | T  | F  |

**Material Implication**: $\quad (a \implies b) = (\overline{a} \vee b)$

**Mirror**: $\quad (a \impliedby b) = (b \implies a)$

**Antisymmetry / Double Implication**: $\quad (a = b) = (a \implies b) \wedge (a \impliedby b)$

**Exclusion**: $\quad (a \neq b) = (\overline{a = b})$


# Axioms

**Complement/Annihilation Laws**
  * $a \wedge \overline{a} = \text{F} \qquad$ (Noncontradiction)
  * $a \vee \overline{a} = \text{T} \qquad$ (Excluded Middle)

**Identity**
  * $a \wedge \text{T} = a$
  * $a \vee \text{F} = a$

**Commutativity**
  * $a \wedge b = b \wedge a$
  * $a \vee b = b \vee a$

**Distributivity/Factoring**
  * $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge b)$
  * $a \vee (b \wedge c) = (a \vee b) \wedge (a \vee b)$
