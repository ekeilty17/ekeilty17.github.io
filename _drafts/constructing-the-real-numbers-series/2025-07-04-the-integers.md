---
layout:     series
title:      "The Integers"
date:       2025-07-04
categories: blog constructing-the-real-numbers
permalink:  ":categories/:title/"
part:       3
series:     constructing-the-real-numbers
tags:       integers
---

**TODO**

## Too Long Didn't Read

The intuitive (but unrigorous) way to define the integers is the following

$$
\mathbb{Z} = (- \mathbb{N}) \cup \mathbb{N} = \{ \ldots, \ -3, \ -2, \ -1, \ 0, \ 1, \ 2, \ 3, \ \ldots \}
$$

where $(- \mathbb{N})$ is the negated natural numbers using the notion of negation that we were taught in school.

However, if we want to rigorously define what "$-3$" means, then we have to do a bit more work.

<br>

## Subtraction of Natural Numbers

In the previous post, we defined the addition operation. However, it might be nice to have a dual operation that "undoes" the addition. This operation is called _subtraction_. Similar to how we recursively defined the addition operation, we do likewise for the subtraction of natural numbers.

$$
\begin{align}
    &\textbf{Rule } 1. &\qquad& n - 0 = n \\
    &\textbf{Rule } 2. &\qquad& s(n) - s(m) = s(n - s(m)) = n - m
\end{align}
$$

In some cases, this definition works great. For example

$$
\begin{align}
    5 - 2 
    &= s(5) - s(1) &\qquad&\text{definition of the natural numbers } 5 \text{ and } 2 \\
    &= 4 - 1 &\qquad&\text{Rule } 2. \\
    &= s(3) - s(0) &\qquad&\text{definition of the natural numbers } 4 \text{ and } 1 \\
    &= 3 - 0 &\qquad&\text{Rule } 2. \\
    &= 3 &\qquad&\text{Rule } 1.
\end{align}
$$

The issue arises when the right number is larger than the left number. If we run the same procedure on $2 - 5$, then we will end with the expression $0 - 3$, which we do not know how to evaluate. I claim that this expression cannot equal a natural number. Suppose by way of contradiction that we declared $0 - 3 = n$ where $n$ is any natural number. Then 

$$
s(s(s(n))) = n+3 = s(s(s(0 - 3))) = s(s(s(0))) - 3 = 3 - 3 = 0
$$

Thus, we have shown that there exists a natural number whose successor is $0$, which our axioms say cannot exist. Obviously, the same argument can be applied to $0 - m$ for any non-zero natural number $m$.


From here, we have two options. 1) we can leave the expression $0 - 3$ undefined. This is perfectly fine, and in fact what humanity chose to do for thousands of years. Or 2) we can define a new type of number that can be assigned to these types of expressions. Obviously, I choose the latter.

<br>

## Addition

Suppose we define $n - m$ as a new type of number. If $n \geq m$, then this is equivalent to the corresponding natural number. We now need to investigate its properties when $n < m$. 

We assume the axioms of addition apply to these new numbers. In particular

$$
\begin{align}
    &\textbf{Axiom } 1. &\qquad& s(n - m) + s(j - k) \implies (n - m) = (j - k) \\
    &\textbf{Axiom } 2. &\qquad& (n - m) + (0 - 0) = (n - m) \\
    &\textbf{Axiom } 3. &\qquad& (n - m) + s(j - k) = s( (n - m) + (j - k) ) \\
    &\textbf{Axiom } 4. &\qquad& (n - m) * (0 - 0) = (0 - 0) \\
    &\textbf{Axiom } 5. &\qquad& (n - m) * s(j - k) = ((n - m)*(j - k)) + (n - m)
\end{align}
$$

Now we are going to prove $(n - m) + (j - k) = (n+j) - (m+k)$. We fix $n - m$ and do induction on $k$ 

$$
(n - m) + (0 - 0) =  n - m = (n + 0) - (m + 0)
$$

$$
\begin{align}
    s((n - m) + (0 - s(k))) 
    &= (n - m) + s((0 - s(k))) \\
    &= (n - m) + (0 - k) \\
    &= (n + 0) - (m + k) \\
    &= n - (m + k) \\
    &= s(n - s(m + k)) \\
    &= s(n - (m + s(k)))
\end{align}
$$

Therefore, 

$$
s((n - m) + (0 - s(k))) = s(n - (m + s(k))) \implies (n - m) + (0 - s(k)) = n - (m + s(k))
$$

Now we prove the entire result by fixing a particular $k$ and doing induction on $j$

$$
(n - m) + (0 - k) =  n - (m + k) = (n + 0) - (m + k)
$$

$$
\begin{align}
    (n - m) + (s(j) - k)  
    &= (n - m) + s(j - k) \\
    &= s((n - m) + (j - k)) \\
    &= s((n + j) - (m + k)) \\
    &= s(n + j) - (m + k) \\
    &= (n + s(j)) - (m + k)
\end{align}
$$


## Multiplication

To make the equations more readable, I will use the convention that $ab = a * b$. Now I want to prove that $(n - m) * (j - k) = (nj + mk) - (nk + mj)$. We first use induction on $k$.

$$
(n - m) * (0 - 0) = (0 - 0) = (n*0 + m*0) - (n*0 + m*0)
$$

$$
\begin{align}
    (n - m) * (0 - s(k))  
    &= ((n - m)*(0 - s(k))) + (n - m)
\end{align}
$$


Now we prove the main result by induction on $j$.

$$
(n - m) * (0 - k) = m*k - n*k = (n*0 + m*k) - (n*k + m*0)
$$

$$
\begin{align}
    (n - m) * (s(j) - k)  
    &= (n - m) * s(j - k) \\ 
    &= ((n - m)*(j - k)) + (n - m) \\
    &= ((nj + mk) - (nk + mj)) + (n - m) \\ 
    &= (nj + mk + n) - (nk + mj + m) \\
    &= (n * s(j) + mk) - (nk + m * s(j))
\end{align}
$$


## Negation

$$
(0 - 0) - (n - m) = (m - n)
$$

We fix $n$ and do induction on $m$.

$$
(0 - 0) - (n - 0) = (0 - 0) - n = 0 - n
$$

$$
\begin{align}
    (0 - 0) - (n - s(m)) 
    &= s(0 - 0) - s(n - s(m)) \\
    &= s(0 - 0) - (n - m) \\
    &= s(0 - 0) + (m - n) \\
    &= (0 - 0) + s(m - n) \\
    &= s(m - n) \\
    &= s(m) - n
\end{align}
$$


Now, we can define subtraction

$$
(n - m) - (j - k) = (n - m) + (- (j - k))
$$

We can actually prove these rather than assert them as definitions. For addition, show that $(n-m) + (0-k) = n - (m + k)$ using induction on $k$. Then show $(n-m) + (j-k) = (n+j) - (m-k)$ using induction on $j$.

I think you can do the same for multiplication. I haven't thought that one out, but I would be surprised if you couldn't. 

For $-a$, I think we instead want to show that $0 - (n - m)$ = $m - n$. Again, I think you can do this by induction. You might have to split it into cases, $n < m$, $n = m$, and $n > m$.

## The Formal Construction of the Integers

**TODO** Move this to the very end. Above just give the intuition

Consider any tuple $(n, m) \in \mathbb{N}^2$. You should imagine that $(n, m)$ means $n - m$. We have not yet formally defined subtraction, so we cannot yet say this. However, this should guide your intuition for the definitions that are given. You have to prove the reflective, commutative, and transitive properties.

Let's define a notion of equivalence between two tuples. 

$$
(n, m) \equiv (j, k) \quad\iff\quad n + k = j + m
$$

Note that $(n, m) \neq (j, k)$ as they are two different elements of the set $\mathbb{N}^2$. However, given our interpretation of what the tuples represent, they are equivalent. I will leave it to you that this is a true equivalence relation.

Now, we define the equivalence classes with respect to this operation.

$$
[(n, m)] = \{ (j, k) \ : \ (n, m) \equiv (j, k) \quad \text{for } (j, k) \in \mathbb{N}^2 \}
$$

These equivalence classes partition the space $\mathbb{N}^2$. Now, formally the **integers** are defined as the set of all equivalence classes under the predicate $\equiv$.

$$
\mathbb{Z} = (\mathbb{N}^2 / \equiv) = \{ [(n, m)] : (n, m) \in \mathbb{N}^2 \}
$$

Now, $a \in \mathbb{Z}$ is an equivalence class from which we can choose any representative $(n, m) \in a$.


<br>

## Addition and Multiplication of Integers

Let $a = [(n, m)]$ and $b = [(j, k)]$ be any integers. We define addition as

$$
a + b = [(n, m)] + [(j, k)] = [(n+j, \ m+k)]
$$

We define multiplication as 

$$
a * b = [(n, m)] * [(j, k)] = [(n*j + m*k, \ n*k + m*j)]
$$

Finally, we define **negation** as 

$$
-a = -[(n,m)] = [(m, n)]
$$

I'll leave it to you to check that all of these operations are well-defined.

<br>

## Definition of Subtraction

Now, we define subtraction as

$$
a - b = a + (-b)
$$

## Notes

In the natural numbers, we have the addition operation. It would be nice to have an operation that "undoes" addition. This is the familiar operation of **subtraction**. For example, since $3 + 2 = 5$, then $5 - 2 = 3$. The issue with this operation is that it becomes undefined with the left-hand side is smaller than the right-hand side. For example, what is $2 - 5$? It implies we need something that comes before $0$, but no such object exists in the natural numbers. This motivates the _extension_ of the natural numbers into the integers.

I'm going to be pretty technical in my construction. However, it is exactly the intuition that I described above.

So basically an integer is any number of the form $n - m$ where $n, m \in \mathbb{N}$. and a binary operation $-$. Then we define equality under this operation. $n - m = r - s$ if an only if $n + s = r + m$. Now, we can define a set of equivalence classes

$$
\mathbb{Z} = (\mathbb{N}^2 / \equiv) = \{ [a] : a \equiv n - m \text{ for } n, m \in \mathbb{N} \}
$$

**TODO** I need better symbols than $r$ and $s$ probably

The upshot is that, give any integer $a \in \mathbb{Z}$ there exists $n, m \in \mathbb{N}$ such that $a = n - m$.

Somewhere in here, we need to define that $n - m = n + (-m)$ where $(-m)$ refers to the additive inverse of the natural number $m$. So somewhere I have to define the concept of an additive inverse without being recursive.