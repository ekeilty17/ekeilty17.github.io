---
layout:     series
title:      "Binary Operations on Subset of Hyperreal Numbers"
date:       2025-07-08
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       7
series:     nonstandard-analysis
tags:       nonstandard-analysis, hyperreal-numbers, binary-operations
---

In the previous post, we showed that any hyperset can be partitioned into infinitesimal ($\mathbb{I}$), appreciable ($\mathbb{A}$), and unlimited numbers ($\mathbb{U}$). Now, we would like to know what happens when these numbers interact with each other. In this post, we will analyze the usual binary operations: $$\{ +, -, \times, /\}$$. This means, for each operation we have $9$ cases.

As much as possible, I want to keep these proofs general so that they can apply to each of the hypersets ${^* \mathbb{N}}$, ${^* \mathbb{Z}}$, ${^* \mathbb{Q}}$, and ${^* \mathbb{R}}$. In fact, I believe these arguments should work for hypercomplex numbers as well (${^* \mathbb{C}}$). The set ${^* \mathbb{X}}$ will be used to denote any of the aforementioned hypersets. 

Finally, I will be using the following notation.

$$
\mathbb{Y}^+ = \{ y \in \mathbb{Y} \ \Big\vert \ y > 0 \} \qquad\qquad \mathbb{Y}^- = \{ y \in \mathbb{Y} \ \Big\vert \ y < 0 \}
$$

<br>


## Summarized Results

In each binary operation, the left operand is the leftmost column and right operand is the top row.

<div class="custom-table-container">

<table class="table-top-row-thick-line table-left-col-thick-line">
<thead>
<tr>
    <th style="text-align:center">$\times$</th>
    <th style="text-align:center">$\mathbb{I}$</th>
    <th style="text-align:center">$\mathbb{A}$</th>
    <th style="text-align:center">$\mathbb{U}$</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$^* \mathbb{X}$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$^* \mathbb{X}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
</tr>
</tbody>
</table>

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<table class="table-top-row-thick-line table-left-col-thick-line">
<thead>
<tr>
    <th style="text-align:center">$/$</th>
    <th style="text-align:center">$\mathbb{I}$</th>
    <th style="text-align:center">$\mathbb{A}$</th>
    <th style="text-align:center">$\mathbb{U}$</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$^* \mathbb{X}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$^* \mathbb{X}$</td>
</tr>
</tbody>
</table>

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<table class="table-top-row-thick-line table-left-col-thick-line">
<thead>
<tr>
    <th style="text-align:center">$\pm$</th>
    <th style="text-align:center">$\mathbb{I}$</th>
    <th style="text-align:center">$\mathbb{A}$</th>
    <th style="text-align:center">$\mathbb{U}$</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{A}$</td>
    <td style="text-align:center">$\mathbb{L}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$\mathbb{U}$</td>
    <td style="text-align:center">$^* \mathbb{X}$</td>
</tr>
</tbody>
</table>

</div>

The last table is not really useful practically. In proofs it is often good practice to assume variables are always positive in value and to explicitly write negative signs when necessary. Thus, we can arrive at more practical results by only considering positive hypernumbers.

<div class="custom-table-container">

<table class="table-top-row-thick-line table-left-col-thick-line">
<thead>
<tr>
    <th style="text-align:center">$+$</th>
    <th style="text-align:center">$\mathbb{I}^+$</th>
    <th style="text-align:center">$\mathbb{A}^+$</th>
    <th style="text-align:center">$\mathbb{U}^+$</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:center">$\mathbb{I}^+$</td>
    <td style="text-align:center">$\mathbb{I}^+$</td>
    <td style="text-align:center">$\mathbb{A}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{A}^+$</td>
    <td style="text-align:center">$\mathbb{A}^+$</td>
    <td style="text-align:center">$\mathbb{A}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{U}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
</tr>
</tbody>
</table>

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

<table class="table-top-row-thick-line table-left-col-thick-line">
<thead>
<tr>
    <th style="text-align:center">$-$</th>
    <th style="text-align:center">$\mathbb{I}^+$</th>
    <th style="text-align:center">$\mathbb{A}^+$</th>
    <th style="text-align:center">$\mathbb{U}^+$</th>
</tr>
</thead>
<tbody>
<tr>
    <td style="text-align:center">$\mathbb{I}^+$</td>
    <td style="text-align:center">$\mathbb{I}$</td>
    <td style="text-align:center">$\mathbb{A}^-$</td>
    <td style="text-align:center">$\mathbb{U}^-$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{A}^+$</td>
    <td style="text-align:center">$\mathbb{A}^+$</td>
    <td style="text-align:center">$\mathbb{L}$</td>
    <td style="text-align:center">$\mathbb{U}^-$</td>
</tr>
<tr>
    <td style="text-align:center">$\mathbb{U}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
    <td style="text-align:center">$\mathbb{U}^+$</td>
    <td style="text-align:center">$^* \mathbb{X}$</td>
</tr>
</tbody>
</table>

</div>

<br>

## Setup

Recall from the previous post that hypersets can be partitioned into the following.

* **Infinitesimals**: $$\ \, \mathbb{I} = \{ \b{\epsilon} \in {^* \mathbb{X}} \ \ \Big\vert \ \abs{\b{\epsilon}} < \abs{^* x} \ \ \forall x \in \mathbb{X} \backslash \{ 0 \}  \}$$
* **Appreciables**: $$\ \mathbb{A} = \{ \b{\alpha} \in {^* \mathbb{X}} \ \Big\vert \ {^* 0} < \abs{^* x} \leq \abs{\b{\alpha}} \leq \abs{^* y} \ \ \exists x, y \in \mathbb{X}  \}$$
* **Unlimiteds**: $$\quad \mathbb{U} = \{ \b{\omega} \in {^* \mathbb{X}} \ \Big\vert \ \abs{^* x} < \abs{\b{\omega}} \ \ \forall x \in \mathbb{X} \}$$

And also
* **Limiteds**: $$ \qquad \mathbb{L} = \{ \b{\mu} \in {^* \mathbb{X}} \ \Big\vert \ {^* 0} \leq \abs{\b{\mu}} \leq \abs{^* x} \ \ \exists x \in \mathbb{X}  \} $$ 

<br>

In each of these proofs, we are going to assume the following (to shorten the proofs since there are so many).
* $\b{\epsilon}, \b{\delta} \in \mathbb{I}$ are any two infinitesimal hyperrational numbers 
    * Thus, $\abs{\b{\epsilon}} < \abs{^* x'}$ where $x' \in \mathbb{X} \backslash \{ 0 \}$. I may choose any particular value for $x'$.
    * and $\abs{\b{\delta}} < \\abs{^* x''}$ where $x'' \in \mathbb{X} \backslash \{ 0 \}$. I may choose any particular value for $x''$.
* $\b{\alpha}, \b{\beta} \in \mathbb{A}$ are any two appreciable hyperrational numbers
    * ${^* 0} < \abs{^* x_{\b{\alpha}}} \leq \abs{\b{\alpha}} \leq \abs{^* y_{\b{\alpha}}}$ for fixed ration numbers $x_{\b{\alpha}},  y_{\b{\alpha}} \in \mathbb{X}$. I do not get to choose these values.
    * ${^* 0} < \abs{^* x_{\b{\beta}}} \leq \abs{\b{\beta}} \leq \abs{^* y_{\b{\beta}}}$ for fixed ration numbers $x_{\b{\beta}},  y_{\b{\beta}} \in \mathbb{X}$. I do not get to choose these values.
* $\b{\omega}, \b{\Omega} \in \mathbb{U}$ are any two unlimited hyperrational numbers
    * Thus, $\abs{^* x'} < \abs{\b{\omega}}$ where $x' \in \mathbb{X}$. I may choose any particular value for $x'  \in \mathbb{X}$.
    * and $\abs{^* x''} < \abs{\b{\Omega}}$ where $x'' \in \mathbb{X}$. I may choose any particular value for $x'' \in \mathbb{X}$.
* $x \in \mathbb{X}$ is a fixed number

<br>

Since our hyperset of interest ${^* \mathbb{X}}$ is some subset of the real numbers, we will utilize some basic algebraic identities. I will not prove them since there are numerous proofs for the real number statements online, and the extension to hyperreal statements are very straight forward.

the following standard facts from algebra are stated without proofs.

* $\abs{\b{a}} \times \abs{\b{b}} = \abs{\b{a} \times \b{b}}$
* $\abs{ \abs{\b{a}} - \abs{\b{b}} } \leq \\abs{ \b{a} \pm \b{b} } \leq \abs{\b{a}} + \abs{\b{b}} \qquad$ (**triangle inequality**)
* if $\b{a} < \b{b}$ and $\b{a}, \b{b} \neq 0$, then ${^* 1} \ / \ \b{a} > {^* 1} \ / \ \b{b}$
* Addition is monotonically increasing, i.e. if $\b{a} < \b{b}$ and $\b{c} < \b{d}$, then $0 < (\b{a} \times \b{c}) < (\b{b} \times \b{d})$
* Multiplication is monotonically increasing for positive numbers, i.e. if ${^* 0} < \b{a} < \b{b}$ and ${^* 0} < \b{c} < \b{d}$, then ${^* 0} < (\b{a} \times \b{c}) < (\b{b} \times \b{d})$
* $\mathbb{X}$ is closed under addition and multiplication, i.e if $x, y \in \mathbb{X}$ then $x + y, \ x \times y \in \mathbb{X}$
* $\mathbb{X}$ is closed under absolute value, i.e. if $x \in \mathbb{X}$, then $\abs{x} \in \mathbb{X}$


<br>

---

<br>


## Multiplication

### $\b{\epsilon} \times \b{\delta} \in \mathbb{I}$

$$
\abs{\b{\epsilon}} < \abs{^* 1}
\ \text{ and } \
\abs{\b{\delta}} < \abs{^* x}
\quad \implies \quad 
\abs{\b{\epsilon}} \times \abs{\b{\delta}} < \abs{^* 1} \times \abs{^* x} 
\quad \implies \quad 
\abs{ \b{\epsilon} \times \b{\delta } } < \abs{^* x}
\\[10pt]
$$

### $\b{\alpha} \times \b{\epsilon} \in \mathbb{I}$

If $\mathbb{X}$ is a subset of $\mathbb{N}$ or $\mathbb{Z}$, then ${^* 0}$ is the only infinitesimal and the claim is trivial. In supersets of the rationals division is well-defined. Also recall that $x_{\b{\alpha}} \neq 0$.

$$
0 < \abs{\b{\alpha}} \leq \abs{^* x_{\b{\alpha}}} 
\ \text{ and } \
\abs{\b{\epsilon}} < \abs{^* (x / x_{\b{\alpha}}) } = \abs{ {^* x} \ / \ {^* x_{\b{\alpha}}} }
\quad \implies \quad 
\abs{\b{\alpha}} \times \abs{\b{\epsilon}} < \abs{^* x_{\b{\alpha}}} \times \abs{ {^* x} \ / \ {^* x_{\b{\alpha}}} }
\quad \implies \quad 
\abs{ \b{\alpha} \times \b{\epsilon} } < \abs{^* x}
\\[15pt]
$$

### $\b{\omega} \times \b{\epsilon}$ is Indeterminant

Consider the following examples

$$
\begin{align}
    &\left \langle n \right \rangle_{n=0}^{\infty} \times \left \langle \frac{1}{n^2} \right \rangle_{n=0}^{\infty} &=& \left \langle n \times \frac{1}{n^2} \right \rangle_{n=0}^{\infty} &=& \left \langle \frac{1}{n} \right \rangle_{n=0}^{\infty} \in \mathbb{I} \\[10pt]
    &\left \langle n \right \rangle_{n=0}^{\infty} \times \left \langle \frac{1}{n} \right \rangle_{n=0}^{\infty} &=& \left \langle n \times \frac{1}{n} \right \rangle_{n=0}^{\infty} &=& \left \langle 1 \right \rangle_{n=0}^{\infty} \in \mathbb{A} \\[10pt]
    &\left \langle n^2 \right \rangle_{n=0}^{\infty} \times \left \langle \frac{1}{n} \right \rangle_{n=0}^{\infty} &=& \left \langle n^2 \times \frac{1}{n} \right \rangle_{n=0}^{\infty} &=& \left \langle n \right \rangle_{n=0}^{\infty} \in \mathbb{U}
\end{align}
\\[10pt]
$$

### $\b{\alpha} \times \b{\beta} \in \mathbb{A}$

$$
{^* 0} < \abs{^* x_{\b{\alpha}}} \leq \abs{\b{\alpha}} \leq \abs{^* y_{\b{\alpha}}}
\ \text{ and } \ 
{^* 0} < \abs{^* x_{\b{\beta}}} \leq \abs{\b{\beta}} \leq \abs{^* y_{\b{\beta}}}
\quad \implies \quad
{^* 0} \times {^* 0} < \abs{^* x_{\b{\alpha}}} \times \abs{^* x_{\b{\beta}}} \leq \abs{\b{\alpha}} \times \lvert \b{\beta} \rvert \leq \abs{^* y_{\b{\alpha}}} \times \abs{^* y_{\b{\beta}}} \\[10pt]
\quad \implies \quad
{^* 0} < \abs{^* (x_{\b{\alpha}} \times x_{\b{\beta}}) } \leq \abs{ \b{\alpha} \times \b{\beta} } \leq \abs{^* (y_{\b{\alpha}} \times y_{\b{\beta}}) }
\\[10pt]
$$

### $\b{\alpha} \times \b{\omega} \in \mathbb{U}$

$$
{^* 0} < \abs{^* x_{\b{\alpha}}} \leq \abs{\b{\alpha}}
\ \text{ and } \
\abs{ {^* x} \ / \ {^* x_{\b{\alpha}}} } = \abs{^* (x / x_{\b{\alpha}}) } < \abs{\b{\omega}}
\quad \implies \quad 
\abs{^* x_{\b{\alpha}}} \times \abs{ {^* x} \ / \ {^* x_{\b{\alpha}}} } < \abs{\b{\alpha}} \times \abs{\b{\omega}}
\quad \implies \quad 
\abs{^* x} < \abs{ \b{\alpha} \times \b{\omega} }
\\[20pt]
$$

If $\mathbb{X}$ is the integers or natural numbers, then $x / x_{\b{\alpha}}$ may not be defined. However, it is easy to show the following for these sets.

$$
{^* 1} \leq \abs{\b{\alpha}} \qquad \forall \b{\alpha} \in \mathbb{A}
$$

Thus, we can let $x_{\b{\alpha}}$ and $x / x_{\b{\alpha}} = x$.

<br>

### $\b{\omega} \times \b{\Omega} \in \mathbb{U}$

$$
\abs{^* 1} < \abs{\b{\omega}}
\text{ and } 
\abs{^* x} < \abs{\b{\Omega}}
\quad \implies \quad 
\abs{^* 1} \times \abs{^* x} < \abs{\b{\omega}} \times \abs{\b{\Omega}}
\quad \implies \quad 
\abs{^* x} < \abs{\b{\omega} \times \b{\Omega}}
$$

<br>

---

<br>

## Reciprocation

These proofs requires reciprocation to be well-defined. Thus, these arguments do not apply to ${^* \mathbb{N}}$ and ${^* \mathbb{Z}}$.

### ${^* 1} / \b{\epsilon} \in \mathbb{U}$

Note, we have to assume $\b{\epsilon} \neq {^* 0}$. Even in the hyperreals, the expression $1/0$ is left undefined.

If $x = 0$, then clearly $\abs{^* x} < \abs{ {^* 1} / \b{\epsilon} }$ is true by definition. Thus, suppose $x \neq 0$

$$
\abs{\b{\epsilon}} < \abs{^* (1/x)} = \abs{ {^* 1} \ / \ {^* x}}
\quad \implies \quad 
\abs{ {^* 1} / \b{\epsilon} } > \abs{ {^* 1} \ / \ ({^* 1} \ / \ {^* x}) }
\quad \implies \quad 
\abs{^* x} < \abs{ {^* 1} / \b{\epsilon} }
\\[10pt]
$$

### ${^* 1} / \b{\alpha} \in \mathbb{A}$

$$
0 < \abs{^* x_{\b{\alpha}} } \leq \abs{\b{\alpha}} \leq \abs{^* y_{\b{\alpha}} }
\quad \implies \quad 
\abs{ {^* 1} \ / \ ^* x_{\b{\alpha}} } \geq \abs{ {^* 1} / \b{\alpha}} \geq \abs{ {^* 1} \ / \ ^* y_{\b{\alpha}} }
\quad \implies \quad 
0 < \abs{^* (1 / y_{\b{\alpha}}) } \leq \abs{ {^* 1} / \b{\alpha}} \leq \abs{^* (1 / x_{\b{\alpha}}) }
\\[20pt]
$$

### ${^* 1} / \b{\omega} \in \mathbb{I}$

Note that by the definition of infinitesimals, $x \neq 0$

$$
\abs{ {^* 1} \ / \ {^* x}} = \abs{^* (1/x)} < \abs{\b{\omega}}
\quad \implies \quad 
\abs{ {^* 1} \ / \ ({^* 1} \ / \ {^* x}) } > \abs{ {^* 1} / \b{\omega} }
\quad \implies \quad 
\abs{ {^* 1} / \b{\omega} } < \abs{^* x}
$$

<br>

## Division

Division can be decomposed into multiplication and reciprocation

$$
\frac{\b{x}}{\b{y}} = \b{x} \times \frac{^* 1}{\b{y}}
$$

Thus, each division case does not require a proof.

<br>

---

<br>

## Addition

One thing we need to be cogniscent of is that we cannot assume a variable is positive in value. For example, intuitively, we want to say that $\b{\alpha} + \b{\beta}$ must be appreciable. However, it could be the case that $\b{\alpha} = -\b{\beta}$ in which case their sum is $0$ which is an infinitesimal number.

For many of these proofs I will be using a similar style of argument. To save lines, I will assert the following **lemma**. It's a pretty intuitive result, so I will leave the proof to the reader (hint: use the triangle inequality).

$$
\abs{\b{x}} \leq \abs{\b{a}} \leq \abs{\b{b}} \leq \abs{\b{y}}
\quad \implies \quad
\abs{\b{b}} - \abs{\b{a}} \leq \abs{\b{y} + \b{x}}
$$

I'll note when the lemma is used.

<br>

### $\b{\epsilon} + \b{\delta} \in \mathbb{I}$

$$
\abs{\b{\epsilon}} < \abs{^* (x/2)}
\ \text{ and } \
\abs{\b{\delta}} < \abs{^* (x/2)}
\quad \implies \quad 
\abs{ \epsilon + \delta } \leq \abs{\b{\epsilon}} + \abs{\b{\delta}} < \abs{^* (x/2)} + \abs{^* (x/2)} = \abs{^* x}
\\[10pt]
$$

### $\b{\alpha} + \b{\epsilon} \in \mathbb{A}$

In the natural numbers and integers, ${^* 0}$ is the only infinitesimal and thus this result is trivial: $\b{\alpha} + \b{\epsilon} = \b{\alpha}$. Therefore, the proof below applies to supersets of the rational numbers and therefore division is well-defined. Also recall that $x_{\b{\alpha}} \neq 0$.

$$
\abs{\b{\epsilon}} < \abs{^* (x_{\b{\alpha}} / 2)} \leq \abs{^* x_{\b{\alpha}}} \leq \abs{\b{\alpha}}
\quad \implies \quad \text{using lemma} \quad \implies \quad
\abs{^* (x_{\b{\alpha}} / 2)} = \abs{^* x_{\b{\alpha}}} - \abs{^* (x_{\b{\alpha}} / 2)} < \abs{ \b{\alpha} + \b{\epsilon} }
\\[10pt]
$$

$$
\abs{\b{\alpha}} \leq \abs{^* y_{\b{\alpha}}}
\ \text{ and } \
\abs{\b{\epsilon}} < \abs{^* y_{\b{\alpha}}}
\quad \implies \quad
\abs{ \b{\alpha} + \b{\epsilon} } \leq \abs{\b{\alpha}} + \abs{\b{\epsilon}} < \abs{^* y_{\b{\alpha}}} + \abs{^* y_{\b{\alpha}}} = \abs{^* (2 y_{\b{\alpha}})}
$$

<br>

### $\b{\omega} + \b{\epsilon} \in \mathbb{U}$

$$
\abs{\b{\epsilon}} < \abs{^* x} \leq \abs{^* (2x)} < \abs{\b{\omega}}
\quad \implies \quad \text{using lemma} \quad \implies \quad
\abs{^* x} = \abs{^* (2x)} - \abs{^* x} < \abs{ \b{\omega} + \b{\epsilon} }
$$

<br>

### $\b{\alpha} + \b{\beta} \in \mathbb{L}$

$$
\abs{\b{\alpha}} \leq \abs{^* y_{\b{\alpha}} }
\ \text{ and } \
\abs{\b{\beta}} \leq \abs{^* y_{\b{\beta}} }
\quad \implies \quad 
\abs{\b{\alpha} + \b{\beta}} \leq \abs{\b{\alpha}} + \abs{\b{\beta}} \leq \abs{^* y_{\b{\alpha}} } + \abs{^* y_{\b{\beta}} }
\quad \implies \quad 
{^* 0} \leq \abs{\b{\alpha} + \b{\beta}} \leq {^* (\abs{y_{\b{\alpha}}} + \abs{y_{\b{\beta}}})}
\\[10pt]
$$

Consider the following examples

$$
\begin{align}
    &\left \langle 1 \right \rangle_{n=0}^{\infty} + \langle -1 \rangle_{n=0}^{\infty} &=& \left \langle 1 - 1 \right \rangle_{n=0}^{\infty} &=& \left \langle 0 \right \rangle_{n=0}^{\infty} \in \mathbb{I} \\[10pt]
    &\left \langle 1 \right \rangle_{n=0}^{\infty} + \langle 1 \rangle_{n=0}^{\infty} &=& \left \langle 1 + 1 \right \rangle_{n=0}^{\infty} &=& \left \langle 2 \right \rangle_{n=0}^{\infty} \in \mathbb{A}
\end{align}
$$

We can be a bit more nuanced. The indeterminancy arises when the appreciable numbers are different in sign and only differ by an infinitesimal amount. However, if either of those conditions are not true, then $\b{\alpha} + \b{\beta} \in \mathbb{A}$.

$$
$$

### $\b{\alpha} + \b{\omega} \in \mathbb{U}$

$$
\abs{\b{\alpha}} \leq \abs{^* y_{\b{\alpha}}} \leq \abs{^* (2y_{\b{\alpha}})} < \abs{\b{\omega}}
\quad \implies \quad \text{using lemma} \quad \implies \quad
\abs{^* y_{\b{\alpha}}} = \abs{^* (2 y_{\b{\alpha}})} - \abs{^* y_{\b{\alpha}}} < \abs{ \b{\omega} + \b{\alpha} }
\\[10pt]
$$

### $\omega + \Omega$ is Indeterminant

Consider the following examples

$$
\begin{align}
    &\left \langle n \right \rangle_{n=0}^{\infty} + \langle - n \rangle_{n=0}^{\infty} &=& \left \langle n - n \right \rangle_{n=0}^{\infty} &=& \left \langle 0 \right \rangle_{n=0}^{\infty} \in \mathbb{I} \\[10pt]
    &\left \langle n+1 \right \rangle_{n=0}^{\infty} + \langle - n \rangle_{n=0}^{\infty} &=& \left \langle (n+1) - n \right \rangle_{n=0}^{\infty} &=& \left \langle 1 \right \rangle_{n=0}^{\infty} \in \mathbb{A} \\[10pt]
    &\left \langle 2n \right \rangle_{n=0}^{\infty} + \langle - n \rangle_{n=0}^{\infty} &=& \left \langle 2n - n \right \rangle_{n=0}^{\infty} &=& \left \langle n \right \rangle_{n=0}^{\infty} \in \mathbb{U}
\end{align}
$$

<br>

We can be a bit more nuanced here. The indeterminancy arises when the unlimited numbers are different signs. This equates to $\infty - \infty$. However, suppose that either both $\omega, \Omega > 0$ or both $\omega, \Omega < 0$, then $\omega + \Omega \in \mathbb{U}$.

<br>

## Subtraction

Consider the following.

$$
\b{x} - \b{y} = \b{x} + (-\b{y}) := x + \b{z}
$$

Thus, addition and subtraction are exactly the same.

<br>

---

<br>

## Addition and Subtract of Positive Hyperreal Numbers

In the last summary table, we assume that hyper-variables are positive in value. This does not affect multiplication, reciprocation, and division. However, it allows us to be much more specific in addition and subtraction. 

These proofs are much more simple since we get to do away with the absolute values. And this post is already extremely long and tedious. So I will leave these proofs as an exercise.