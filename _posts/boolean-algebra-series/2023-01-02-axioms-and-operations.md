---
layout:     series
title:      "Axioms and Operations"
date:       2023-01-02
categories: blog boolean-algebra
permalink:  ":categories/:title/"
part:       1
series:     boolean-algebra
tags:       boolean algebra, axioms, definitions, complement, identity, commutativity, distributivity
---

## Boolean Expressions

The purpose of Boolean algebra is to define the rules for manipulating Boolean expressions. Thus, we must define what a Boolean expression is. We first do this syntactically. Let $\neg$ be a unary operation (takes one variable as an argument). Let $\vee$ and $\wedge$ be binary operations (take two variables as arguments). Let $a$ be a boolean variable and $A, B$ be boolean expressions. Then all of the following are boolean expressions.

1. $\color{green}T$ 
2. $\color{red}F$
3. $a$
4. $\neg A$
5. $A \wedge B$
6. $A \vee B$

<br>

## The Minimal Set of Axioms

Now, there are a couple of ways you can define the axioms of Boolean algebra. One way is to define the behavior of $\color{green}T$ and $\color{red}F$ via <a href="https://en.wikipedia.org/wiki/Truth_table" target="_blank">truth tables</a>. Then, using a completion argument with truth tables you can start creating laws. I, instead, want to start with some axioms and obtain the definitions of the Boolean operators and their truth tables as a consequence. 

Below are the axioms, and I claim this is a minimal set. Removing any would mean some laws could not be proved. Another way to look at it, removing any would result in gaps in the truth tables.

**Complement/Annihilation**
  * $a \wedge (\neg a) = \color{red}F \qquad$ (Noncontradiction)
  * $a \vee (\neg a) = \color{green}T \qquad$ (Excluded Middle)

**Identity**
  * $\color{green}T \wedge a = a$
  * $\color{red}F \vee a = a$

**Commutativity**
  * $a \wedge b = b \wedge a$
  * $a \vee b = b \vee a$

**Distributivity/Factoring**
  * $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$
  * $a \vee (b \wedge c) = (a \vee b) \wedge (a \vee c)$


For those well-versed in abstract algebra, these axioms may look awfully similar to those of a <a href="http://people.reed.edu/~mayer/math112.html/html1/node16.html" target="_blank">field</a>.

<br>

## Fundamental Operations

The above axioms define the behavior of the operations $\neg$, $\wedge$, and $\vee$. Given these axioms, the result of all possible combinations of inputs to these operations are fixed. We show their truth tables below.

|                |        | $\color{green}T$ | $\color{red}F$   |
|----------------|:------:|:----------------:|:----------------:|
| Negation (NOT) | $\neg$ | $\color{red}F$   | $\color{green}T$ |

|                   |          | $\color{green}T\color{green}T$ | $\color{green}T\color{red}F$ | $\color{red}F\color{green}T$ | $\color{red}F\color{red}F$ |
|-------------------|:--------:|:------------------------------:|:----------------------------:|:----------------------------:|:--------------------------:|
| Conjunction (AND) | $\wedge$ | $\color{green}T$               | $\color{red}F$               | $\color{red}F$               | $\color{red}F$             |
| Disjunction (OR)  | $\vee$   | $\color{green}T$               | $\color{green}T$             | $\color{green}T$             | $\color{red}F$             |

These truth tables can be derived from the axioms and some laws we prove in the [next post](/blog/boolean-algebra/miscellaneous-simple-relations). The negation truth table is a consequence of identity and annihilation laws. Commutativity and distributivity are required to fully define the conjunction and disjunction truth tables.

Note, going forward, instead of writing $\neg a$ I will write $\overline{a}$ to condense expressions.

<br>

## Useful Operations

Now, we can define some other useful operations. These are simply syntactic sugar and can all be expressed in terms of conjunction, disjunction, and negation. Thus, we get "laws" that are true by definition. Since these laws are so fundamental, they are used very often (especially material implication). Thus, it's important to highlight them.

&emsp;&emsp;**Material Implication**: $\hspace{3.5cm} (a \Rightarrow b) = (\overline{a} \vee b)$

&emsp;&emsp;**Mirror**: $\hspace{6cm} (a \Leftarrow b) = (b \Rightarrow a)$

&emsp;&emsp;**Antisymmetry / Double Implication**: $\hspace{0.8cm} (a = b) = (a \Rightarrow b) \wedge (a \Leftarrow b)$

&emsp;&emsp;**Exclusion**: $\hspace{5.5cm} (a \neq b) = (\overline{a = b})$

We can express these operations via truth table.

|                   |                 | $\color{green}T\color{green}T$ | $\color{green}T\color{red}F$ | $\color{red}F\color{green}T$ | $\color{red}F\color{red}F$ |
|-------------------|:---------------:|:------------------------------:|:----------------------------:|:----------------------------:|:--------------------------:|
| Implication       | $\Rightarrow$   | $\color{green}T$               | $\color{red}F$               | $\color{green}T$             | $\color{green}T$           |
| Converse          | $\Leftarrow$    | $\color{green}T$               | $\color{green}T$             | $\color{red}F$               | $\color{green}T$           |
| Equality          | $=$             | $\color{green}T$               | $\color{red}F$               | $\color{red}F$               | $\color{green}T$           |
| Unequality (XOR)  | $\neq$          | $\color{red}F$                 | $\color{green}T$             | $\color{green}T$             | $\color{red}F$             |

Again, we will never use these truth tables, but they are helpful to understand what these operations mean. 

<br>

## Useless Operations

There are $4$ different possible unary operations and $16$ different possible binary operations. Above, we have defined $1$ unary operation and $6$ binary operations. Thus, just for completeness, I will define the others. I think it provides an interesting perspective on which operations we decided to give importance to.

|                 |                 | $\color{green}T$  | $\color{red}F$    |
|-----------------|:---------------:|:-----------------:|:-----------------:|
| Maximum         | $\uparrow$      | $\color{green}T$  | $\color{green}T$  |
| Identity        | $\sqcup$        | $\color{green}T$  | $\color{red}F$    |
| Negation        | $\neg$          | $\color{green}F$  | $\color{red}T$    |
| Minimum         | $\downarrow$    | $\color{red}F$    | $\color{red}F$    |


|                     |                         | $\color{green}T\color{green}T$ | $\color{green}T\color{red}F$ | $\color{red}F\color{green}T$ | $\color{red}F\color{red}F$ |
|---------------------|:-----------------------:|:------------------------------:|:----------------------------:|:----------------------------:|:--------------------------:|
| Maximum             | $\Uparrow$              | $\color{green}T$ | $\color{green}T$ | $\color{green}T$ | $\color{green}T$ |
| OR                  | $\vee$                  | $\color{green}T$ | $\color{green}T$ | $\color{green}T$ | $\color{red}F$   |
| Converse            | $\Leftarrow$            | $\color{green}T$ | $\color{green}T$ | $\color{red}F$   | $\color{green}T$ | 
| Left                | $\leftarrow$            | $\color{green}T$ | $\color{green}T$ | $\color{red}F$   | $\color{red}F$   |
| Implication         | $\Rightarrow$           | $\color{green}T$ | $\color{red}F$   | $\color{green}T$ | $\color{green}T$ |
| Right               | $\rightarrow$           | $\color{green}T$ | $\color{red}F$   | $\color{green}T$ | $\color{red}F$   |
| Equality            | $=$                     | $\color{green}T$ | $\color{red}F$   | $\color{red}F$   | $\color{green}T$ | 
| AND                 | $\wedge$                | $\color{green}T$ | $\color{red}F$   | $\color{red}F$   | $\color{red}F$   |
| NAND                | $\cancel{\wedge}$       | $\color{red}F$   | $\color{green}T$ | $\color{green}T$ | $\color{green}T$ |
| Unequality (XOR)    | $\neq$                  | $\color{red}F$   | $\color{green}T$ | $\color{green}T$ | $\color{red}F$   |
| Negated Right       | $\cancel{\rightarrow}$  | $\color{red}F$   | $\color{green}T$ | $\color{red}F$   | $\color{green}T$ | 
| Negated Implication | $\cancel{\Rightarrow}$  | $\color{red}F$   | $\color{green}T$ | $\color{red}F$   | $\color{red}F$   |
| Negated Left        | $\cancel{\leftarrow}$   | $\color{red}F$   | $\color{red}F$   | $\color{green}T$ | $\color{green}T$ |
| Negated Converse    | $\cancel{\Leftarrow}$   | $\color{red}F$   | $\color{red}F$   | $\color{green}T$ | $\color{red}F$   |
| NOR                 | $\cancel{\vee}$         | $\color{red}F$   | $\color{red}F$   | $\color{red}F$   | $\color{green}T$ | 
| Minimum             | $\Downarrow$            | $\color{red}F$   | $\color{red}F$   | $\color{red}F$   | $\color{red}F$   |

<br>

Note that a lot of these symbols I've assigned to the operators are not standard and just my invention. For example, the Identity operator is supposed to represent an empty space, since applying the operator is the same as applying no operator at all.