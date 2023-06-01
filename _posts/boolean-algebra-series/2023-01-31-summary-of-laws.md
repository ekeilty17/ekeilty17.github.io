---
layout:     post
title:      "Summary of Laws"
categories: blog boolean-algebra
permalink:  ":categories/:title/"
tags:       boolean-algebra, table, laws, theorems
---

## Definitions of Operations

The operations $\neg$, $\vee$, and $\wedge$ are the fundamental operations with which we can define all other operations. Note that $\overline{a}$ is used to represent $\neg a$ in order to make expressions more readable.

&emsp;&emsp;**Material Implication**: $\hspace{3.5cm} (a \Rightarrow b) = (\overline{a} \vee b)$

&emsp;&emsp;**Mirror**: $\hspace{6cm} (a \Leftarrow b) = (b \Rightarrow a)$

&emsp;&emsp;**Antisymmetry / Double Implication**: $\hspace{0.8cm} (a = b) = (a \Rightarrow b) \wedge (a \Leftarrow b)$

&emsp;&emsp;**Exclusion**: $\hspace{5.5cm} (a \neq b) = (\overline{a = b}) = (a = \overline{b}) = (\overline{a} = b)$

<br>

For equality and unequality, we have additional simplifications to get them completely in terms of $\neg$, $\vee$, and $\wedge$.

$$
\begin{align}
    &(a = b) &\quad = \quad& (\overline{a} \vee b) \wedge (a \vee \overline{b}) &\quad = \quad& (a \wedge b) \vee (\overline{a} \wedge \overline{b}) \\
    &(a \neq b) &\quad = \quad& (a \vee b) \wedge (\overline{a} \vee \overline{b}) &\quad = \quad& (\overline{a} \wedge b) \vee (a \wedge \overline{b})
\end{align}
$$

<br>

## Truth Tables

The following defined how boolean values interact with each other via our defined operations. These truth tables can be derived from the axioms. They are not definitions.

|                |        | $\color{green}T$ | $\color{red}F$   |
|----------------|:------:|:----------------:|:----------------:|
| Negation (NOT) | $\neg$ | $\color{red}F$   | $\color{green}T$ |

|                   |               | $\color{green}T\color{green}T$ | $\color{green}T\color{red}F$ | $\color{red}F\color{green}T$ | $\color{red}F\color{red}F$ |
|-------------------|:-------------:|:------------------------------:|:----------------------------:|:----------------------------:|:--------------------------:|
| Conjunction (AND) | $\wedge$      | $\color{green}T$               | $\color{red}F$               | $\color{red}F$               | $\color{red}F$             |
| Disjunction (OR)  | $\vee$        | $\color{green}T$               | $\color{green}T$             | $\color{green}T$             | $\color{red}F$             |
| Implication       | $\Rightarrow$ | $\color{green}T$               | $\color{red}F$               | $\color{green}T$             | $\color{green}T$           |
| Converse          | $\Leftarrow$  | $\color{green}T$               | $\color{green}T$             | $\color{red}F$               | $\color{green}T$           |
| Equality          | $=$           | $\color{green}T$               | $\color{red}F$               | $\color{red}F$               | $\color{green}T$           |
| Unequality (XOR)  | $\neq$        | $\color{red}F$                 | $\color{green}T$             | $\color{green}T$             | $\color{red}F$             |

<br>

## Boolean Variables Interacting with Boolean Value

This is a combination of base, identity, and anti-identity laws. Two of them are axioms, labeled with an asterisk.

$$
\begin{align}
    &a \wedge \color{green}T \quad=\quad a \ \ \ ^*            &\qquad\qquad&    a \wedge \color{red}F \quad=\quad \color{red}F \\
    &a \vee \color{green}T \quad=\quad \color{green}T           &\qquad\qquad&    a \vee \color{red}F \quad=\quad a \ \ \ ^* \\[10pt]
    &a \Rightarrow \color{green}T \quad=\quad \color{green}T    &\qquad\qquad&    a \Rightarrow \color{red}F \quad=\quad \overline{a} \\
    &a \Leftarrow \color{green}T \quad=\quad a                  &\qquad\qquad&    a \Leftarrow \color{red}F \quad=\quad \color{green}T \\[10pt]
    &a = \color{green}T \quad=\quad a                           &\qquad\qquad&    a = \color{red}F \quad=\quad \overline{a} \\
    &a \neq \color{green}T \quad=\quad \overline{a}             &\qquad\qquad&    a \neq \color{red}F \quad=\quad a \\
\end{align}
$$

<br>

## Boolean Variables Interacting with Themselves

This is called double negation

$$
\overline{(\overline{a})} = a
$$

This is a combination of idempotent, reflexive, and anti-reflective laws.

$$
\begin{align}
    &a \wedge a \quad=\quad a
        &\qquad\qquad&      a \Rightarrow a \quad=\quad \color{green}T
        &\qquad\qquad&      a = a \quad=\quad \color{green}T\\
    &a \vee a \quad=\quad a
        &\qquad\qquad&      a \Leftarrow a \quad=\quad \color{green}T
        &\qquad\qquad&      a \neq a \quad=\quad \color{red}F
\end{align}
$$

This is a combination of the law of the excluded middle, the law of non-contradiction, exclusion, and indirect proofs. The ones that are axioms are labeled with an asterisk.

$$
\begin{align}
    &a \wedge \overline{a} \quad=\quad \color{red}F \ \ \ ^*
        &\qquad\qquad&      a \Rightarrow \overline{a} \quad=\quad \overline{a}
        &\qquad\qquad&      a = \overline{a} \quad=\quad \color{red}F\\
    &a \vee \overline{a} \quad=\quad \color{green}T \ \ \ ^*
        &\qquad\qquad&      a \Leftarrow \overline{a} \quad=\quad a
        &\qquad\qquad&      a \neq \overline{a} \quad=\quad \color{green}T
\end{align}
$$

<br>

## Commutativity and Contrapositive

The commonality here is that we are flipping the order of arguments. The ones that are axioms are labeled with an asterisk.

$$
\begin{align}
    &a \wedge b \quad=\quad b \wedge a \ \ \ ^*
        &\qquad\qquad&      a \Rightarrow b \quad=\quad \overline{b} \Rightarrow \overline{a}
        &\qquad\qquad&      a = b \quad=\quad b = a \\
    &a \vee b \quad=\quad b \vee a \ \ \ ^*
        &\qquad\qquad&      a \Leftarrow b \quad=\quad \overline{b} \Leftarrow \overline{a}
        &\qquad\qquad&      a \neq b \quad=\quad b \neq a
\end{align}
$$

<br>

## Associativity

$$
\begin{align}
    &a \wedge (b \wedge c) \quad = \quad (a \wedge b) \wedge c      &\qquad\qquad&      a \vee (b \vee c) \quad = \quad (a \vee b) \vee c \\[10pt]
    &a = (b = c) \quad = \quad (a = b) = c                          &\qquad\qquad&      a \neq (b = c) \quad = \quad (a = b) \neq c \\
    &a \neq (b \neq c) \quad = \quad (a \neq b) \neq c              &\qquad\qquad&      a = (b \neq c) \quad = \quad (a = b) \neq c \\
\end{align}
$$

There is no associativity for $\Rightarrow$ and $\Leftarrow$. The same form of expression actually falls under distributivity.

<br>

## Distributivity / Factoring

The combinations that I left out, I left out for good reasons. Maybe you can figure out why. For example, I never include expressions with $\neq$ since $(a \neq b) = (a = \overline{b})$. The laws labeled with an asterisk are axioms.

$$
\begin{align}
    &a \wedge (b \wedge c) \quad = \quad (a \wedge b) \wedge (a \wedge c)       &\qquad\qquad&      a \vee (b \vee c) \quad = \quad (a \vee b) \vee (a \vee c) \\
    &a \wedge (b \vee c) \quad = \quad (a \wedge b) \vee (a \wedge c) \ \ \ ^*  &\qquad\qquad&      a \vee (b \wedge c) \quad = \quad (a \vee b) \wedge (a \vee c) \ \ \ ^* \\
    &a \wedge (b \Rightarrow c) \quad = \quad \text{not useful}                 &\qquad\qquad&      a \vee (b \Rightarrow c) \quad = \quad (a \vee b) \Rightarrow (a \vee c) \\
    &a \wedge (b = c) \quad = \quad \text{not useful}                           &\qquad\qquad&      a \vee (b = c) \quad = \quad (a \vee b) = (a \vee c) \\[10pt]

    &a \Rightarrow (b \wedge c) \quad = \quad (a \Rightarrow b) \wedge (a \Rightarrow c)                &\qquad\qquad&      a \Leftarrow (b \wedge c) \quad = \quad (a \Leftarrow b) \vee (a \Leftarrow c)\\
    &a \Rightarrow (b \vee c) \quad = \quad (a \Rightarrow b) \vee (a \Rightarrow c)                    &\qquad\qquad&      a \Leftarrow (b \vee c) \quad = \quad (a \Leftarrow b) \wedge (a \Leftarrow c)\\
    &a \Rightarrow (b \Rightarrow c) \quad = \quad (a \Rightarrow b) \Rightarrow (a \Rightarrow c)      &\qquad\qquad&      a \Leftarrow (b \Rightarrow c) \quad = \quad \text{not useful}\\
    &a \Rightarrow (b = c) \quad = \quad (a \Rightarrow b) = (a \Rightarrow c)                          &\qquad\qquad&      a \Leftarrow (b = c) \quad = \quad \text{not useful}\\

\end{align}
$$

If I write "not useful", it means that the left-hand side doesn't simplify to a nice form that matches the pattern of distributivity. Also, there are no good laws of the form $a = (b \circ c)$ where $\circ$ is any boolean operation. Thus, they were omitted.

<br>

## Absorption and Simplification

We can think of these are special cases of distributivity. They occur so frequently that they are given their own names.

$$
\begin{align}
    &a \wedge (a \vee b) \quad=\quad a                      &\qquad\qquad&      a \wedge (\overline{a} \vee b) \quad=\quad a \wedge b \\
    &a \vee (a \wedge b) \quad=\quad a                      &\qquad\qquad&      a \vee (\overline{a} \wedge b) \quad=\quad a \vee b
\end{align}
$$

<br>

## De Morgan's Law / Duality

This is like a form of distributivity, but it's used so often that it's given its own name and section

$$
\overline{(a \wedge b)} = \overline{a} \vee \overline{b} \qquad\qquad \overline{(a \vee b)} = \overline{a} \wedge \overline{b}
$$

<br>

## Generalization and Specialization

Again, these are very simple, but they are very useful in proofs.

$$
(a \wedge b) \Rightarrow a \qquad\qquad a \Rightarrow (a \vee b)
$$

<br>

## Transitivity

$$
\begin{align}
    &(a \wedge b) \wedge (b \wedge c) \quad \Rightarrow \quad (a \wedge c)                      &\qquad\qquad&      (a \vee b) \wedge (b \vee c) \quad \Rightarrow \quad \text{see below} \\
    &(a \Rightarrow b) \wedge (b \Rightarrow c) \quad \Rightarrow \quad (a \Rightarrow c)       &\qquad\qquad&      (a \Leftarrow b) \wedge (b \Leftarrow c) \quad \Rightarrow \quad (a \Leftarrow c) \\[10pt]
    &(a \Rightarrow b) \wedge (b = c) \quad \Rightarrow \quad (a \Rightarrow c)                 &\qquad\qquad&  (a = b) \wedge (b \Rightarrow c) \quad \Rightarrow \quad (a \Rightarrow c) \\
    &(a = b) \wedge (b = c) \quad \Rightarrow \quad (a = c)                                     &\qquad\qquad&  (a \neq b) \wedge (b \neq c) \quad \Rightarrow \quad (a = c)
\end{align}
$$

<br>

$(a \vee b) \vee (b \vee c) = (a \wedge c) \vee b$, which does not really fit the pattern of transitivity. The best you can do is apply specialization to the left-hand side.

<br>

## Direct Proofs

The reason these get their own section is due to their history. They are some of the oldest logical syllogisms that exist. 


&emsp;&emsp;**Modus Ponens**: $\hspace{3cm}(a \Rightarrow b) \wedge a \quad \Rightarrow \quad b$

&emsp;&emsp;**Modus Tollens**: $\hspace{3cm}(a \Rightarrow b) \wedge \overline{b} \quad \Rightarrow \quad \overline{a}$

&emsp;&emsp;**Disjunctive Syllogism**: $\hspace{1.75cm}(a \vee b) \wedge \overline{a} \quad \Rightarrow \quad b$

<br>

## Monotonicity and Antimonotonicity

$$
\begin{align}
    &(a \Rightarrow b) \quad \Rightarrow \quad (c \wedge a) \Rightarrow (c \wedge b)                     &\qquad\qquad&      (a \Rightarrow b) \quad \Rightarrow \quad (c \vee a) \Rightarrow (c \vee b) \\
    &(a \Rightarrow b) \quad \Rightarrow \quad (c \Rightarrow a) \Rightarrow (c \Rightarrow b)       &\qquad\qquad&      (a \Rightarrow b) \quad \Rightarrow \quad (a \Rightarrow c) \Leftarrow (b \Rightarrow c)
\end{align}
$$

We say that $\wedge$, and $\vee$ are monotonic because the direction of the implication is preserved. $\Rightarrow$ is monotonic in its antecedent. We say that $\Rightarrow$ is anti-monotonic because the implication needed to flip. This is similar to how multiplying by a negative number flips equality signs.

Note that $=$ and $\neq$ are neither monotonic nor antimonotonic. Their expressions of this form don't have a nice simplification.

<br>

## Miscellaneous

Finally, we have all of the laws that I couldn't find a nice classification for.


**Uniqueness of the Complement**

* $(a \vee b) \wedge \overline{(a \wedge b)} \quad = \quad (b = \overline{a})$

**Inclusion**

* $(a \wedge b) = a \quad = \quad (a \Rightarrow b)$

* $(a \vee b) = b \quad = \quad (a \Rightarrow b)$

**Discharge**

* $a \wedge (a \Rightarrow b) \quad = \quad a \wedge b$
* $a \Rightarrow (a \wedge b) \quad = \quad a \Rightarrow b$

**Portation**

* $(a \wedge b) \Rightarrow c \quad = \quad a \Rightarrow (b \Rightarrow c)$

* $(a \wedge b) \Rightarrow c \quad = \quad a \Rightarrow (\overline{b} \vee c)$

**Consensus Theorem**

* $((a \wedge b) \vee (\overline{a} \wedge c)) \vee (b \wedge c) \quad = \quad (a \wedge b) \vee (\overline{a} \wedge c)$

* $((a \vee b) \wedge (\overline{a} \vee c)) \wedge (b \vee c) \quad = \quad (a \vee b) \wedge (\overline{a} \vee c)$


**Resolution**

* $a \wedge c \quad \Rightarrow \quad (a \vee b) \wedge (\overline{b} \vee c) \quad = \quad (a \wedge \overline{b}) \vee (b \wedge c) \quad \Rightarrow \quad a \vee c$

**Conflation**

* $(a \Rightarrow b) \wedge (c \Rightarrow d) \quad \Rightarrow \quad (a \wedge c) \Rightarrow (b \wedge d)$

* $(a \Rightarrow b) \wedge (c \Rightarrow d) \quad \Rightarrow \quad (a \vee c) \Rightarrow (b \vee d)$

<br>

<h3 style="text-align:center; margin-bottom:1em;">
    <a href="/blog/boolean-algebra/">Boolean Algebra Series</a>
</h3>