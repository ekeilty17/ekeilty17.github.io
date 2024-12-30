---
layout:     series
title:      "Polygon"
date:       2024-11-13
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       12
series:     moments-of-inertia
tags:       moments-of-inertia
---

## Irregular Polygon

Any irregular polygon can be decomposed into each line segments.

$$
I_{zz} 
= \tfrac{1}{3} M \left ( \frac{\sum_{k=0}^{n-1} \abs{\b{P}_{k+1} - \b{P}_{k}} \left ( \abs{\b{P}_{k}}^2 + \abs{\b{P}_{k+1}}^2 + \b{P}_{k} \cdot \b{P}_{k+1} \right )}{\sum_{k=0}^{n-1} \abs{\b{P}_{k+1} - \b{P}_{k}}} \right )
$$

If we use the <span class="tooltip">law of cosines
    <span class="tooltiptext"> 
        $$
        \abs{\b{P} - \b{P}_{k}}^2 = \abs{\b{P}_{k}}^2 + \abs{\b{P}_{k+1}}^2 - 2(\b{P}_{k} \cdot \b{P}_{k+1}) \\[10pt]
        \b{P}_{k} \cdot \b{P}_{k+1} = \tfrac{1}{2} \left ( \abs{\b{P}_{k}}^2 + \abs{\b{P}_{k+1}}^2 - \abs{\b{P}_{k+1} - \b{P}_{k}}^2 \right )
        $$
    </span>
</span>, then we can get rid of that dot product.

$$
I_{zz} 
= \tfrac{1}{6} M \left ( \frac{\sum_{k=0}^{n-1} \abs{\b{P}_{k+1} - \b{P}_{k}} \left ( 3\abs{\b{P}_{k}}^2 + 3\abs{\b{P}_{k+1}}^2 - \abs{\b{P}_{k+1} - \b{P}_{k}}^2 \right )}{\sum_{k=0}^{n-1} \abs{\b{P}_{k+1} - \b{P}_{k}}} \right )
$$

While it is general, it's not very satifsying. Unfortunately, I don't think there is any better formula. 

<br>

## Regular Polygon

### Moment of Inertia About Central Axis

We know that 

$$
\abs{\b{P}_{k+1} - \b{P}_{k}} = S
$$

and

$$
\abs{\b{P}_{k}} = R = \tfrac{1}{2}S \csc (\theta_n) = \tfrac{1}{2}S \csc ( \tfrac{\pi}{n} )
$$

<br>

$$
\begin{align}
    I_{zz} 
    &= \tfrac{1}{6} M \left ( \frac{\sum_{k=0}^{n-1} S \left ( 3R^2 + 3R^2 - S^2 \right )}{\sum_{k=0}^{n-1} S } \right ) \\[10pt]
    &= \tfrac{1}{6} M \left ( 6R^2 - S^2 \right ) \\[10pt]
    &= \tfrac{1}{6} M \left ( \tfrac{3}{2}S^2 \csc^2 ( \tfrac{\pi}{n} ) - S^2 \right ) \\[10pt]
    &= \tfrac{1}{12} M S^2 \left ( 3 \csc^2 ( \tfrac{\pi}{n} ) - 2 \right ) \\[10pt]
\end{align}
$$

<br>

### Moment of Inertia About Central Diameter

$$
\begin{align}
    I_{yy} 
    &= \tfrac{1}{3} M \left ( \frac{\sum_{k=0}^{n-1} S \left ( x_{k}^2 + x_{k+1}^2 + x_{k} x_{k+1} \right )}{\sum_{k=0}^{n-1} S } \right ) \\[10pt]
    &= \tfrac{1}{3n} M \sum_{k=0}^{n-1} \left ( x_{k}^2 + x_{k+1}^2 + x_{k} x_{k+1} \right ) \\[10pt]
    &= \tfrac{1}{3n} M \sum_{k=0}^{n-1} \left ( R^2 \cos^2 \left ( \tfrac{2 \pi k}{n} \right ) + R^2 \cos^2 \left ( \tfrac{2 \pi (k+1)}{n} \right ) + R \cos \left ( \tfrac{2 \pi k}{n} \right ) \cdot R \cos \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( \cos^2 \left ( \tfrac{2 \pi k}{n} \right ) + \cos^2 \left ( \tfrac{2 \pi (k+1)}{n} \right ) + \cos \left ( \tfrac{2 \pi k}{n} \right ) \cos \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( 2 \cos^2 \left ( \tfrac{2 \pi k}{n} \right ) + \cos \left ( \tfrac{2 \pi k}{n} \right ) \cos \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( \left [ 1 + \cos \left ( \tfrac{4 \pi k}{n} \right ) \right ] + \tfrac{1}{2} \left [ \cos \left ( \tfrac{2\pi}{n} \right ) + \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) \right ] \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left [ \left ( \sum_{k=0}^{n-1} 1 \right ) + \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{4 \pi k}{n} \right ) \right ) + \tfrac{1}{2} \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{2\pi}{n} \right ) \right ) + \tfrac{1}{2} \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) \right ) \right ] \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left [ \left ( n \right ) + \left ( 0 \right ) + \tfrac{1}{2} \left ( n \cos \left ( \tfrac{2\pi}{n} \right ) \right ) + \tfrac{1}{2} \left ( 0 \right ) \right ] \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left ( n + \tfrac{1}{2} n \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 2 + \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 1 + 1 + \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 1 + 2\cos^2 \left ( \tfrac{\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 3 - 2\sin^2 \left ( \tfrac{\pi}{n} \right ) \right )
\end{align}
$$

Part 2

$$
\begin{align}
    I_{xx} 
    &= \tfrac{1}{3} M \left ( \frac{\sum_{k=0}^{n-1} S \left ( y_{k}^2 + y_{k+1}^2 + y_{k} y_{k+1} \right )}{\sum_{k=0}^{n-1} S } \right ) \\[10pt]
    &= \tfrac{1}{3n} M \sum_{k=0}^{n-1} \left ( y_{k}^2 + y_{k+1}^2 + y_{k} y_{k+1} \right ) \\[10pt]
    &= \tfrac{1}{3n} M \sum_{k=0}^{n-1} \left ( R^2 \sin^2 \left ( \tfrac{2 \pi k}{n} \right ) + R^2 \sin^2 \left ( \tfrac{2 \pi (k+1)}{n} \right ) + R \sin \left ( \tfrac{2 \pi k}{n} \right ) \cdot R \sin \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( \sin^2 \left ( \tfrac{2 \pi k}{n} \right ) + \sin^2 \left ( \tfrac{2 \pi (k+1)}{n} \right ) + \sin \left ( \tfrac{2 \pi k}{n} \right ) \sin \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( 2 \sin^2 \left ( \tfrac{2 \pi k}{n} \right ) + \sin \left ( \tfrac{2 \pi k}{n} \right ) \sin \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( \left [ 1 - \cos \left ( \tfrac{4 \pi k}{n} \right ) \right ] + \tfrac{1}{2} \left [ \cos \left ( \tfrac{2\pi}{n} \right ) - \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) \right ] \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left [ \left ( \sum_{k=0}^{n-1} 1 \right ) - \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{4 \pi k}{n} \right ) \right ) + \tfrac{1}{2} \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{2\pi}{n} \right ) \right ) - \tfrac{1}{2} \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) \right ) \right ] \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left [ \left ( n \right ) - \left ( 0 \right ) + \tfrac{1}{2} \left ( n \cos \left ( \tfrac{2\pi}{n} \right ) \right ) - \tfrac{1}{2} \left ( 0 \right ) \right ] \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left ( n + \tfrac{1}{2} n \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 2 + \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 1 + 1 + \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 1 + 2\cos^2 \left ( \tfrac{\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 3 - 2\sin^2 \left ( \tfrac{\pi}{n} \right ) \right )
\end{align}
$$

A few things to justify. First, we'll do the easy one. Why is it true that

$$
\sum_{k=0}^{n-1} \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) = 0
$$

If you think about it, we are summing up the $x$-value of each vertex of the polygon exactly once. Since we are assuming that its centroid is at the origin, by definition this must be $0$. 

Now, the slightly trickier one. Why is it true that 

$$
\sum_{k=0}^{n-1} \cos \left ( \tfrac{4 \pi k}{n} \right ) = 0
$$

This result is highly related to group theory. What's amazing about this is that there are $2$ reasons that are completely different from each other.We need to split this up into $2$ cases, when $n$ is even and when $n$ is odd. If $n$ is even, then essentially what happens is we get caught in a cycle of only the even-valued vertices. So we essentially are only considering a regular $\tfrac{n}{2}$-gon. And its centroid is still at the origin.

Now if $n$ is odd, then by definition it is co-prime with $2$ (meaning it does not share any factors). Therefore, it is impossible for it to get caught in a cycle like the even case. Therefore, we must hit every vertex exactly once (just in a different order). Therefore the sum is equivalent to the first sum, and therefore it must still be $0$.

This is a result of cyclic subgroup theory. 

<br>

### Inertia Tensor

Combining the above results gives the full inertia tensor. There are a bunch of possible ways you could express it, so I'm just going to list what I think are the most reasonable.

$$
\begin{align}
    \m{I} 
    &= \tfrac{1}{6} M R^2 \left ( 1 + 2\cos^2 \left ( \tfrac{\pi}{n} \right ) \right )
    \begin{bmatrix}
        1 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 2
    \end{bmatrix}
    \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 3 - 2\sin^2 \left ( \tfrac{\pi}{n} \right ) \right )
    \begin{bmatrix}
        1 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 2
    \end{bmatrix}
    \\[10pt]
    &= \tfrac{1}{24} M S^2 \left ( 3 \csc^2 \left ( \tfrac{\pi}{n} \right ) - 2 \right )
    \begin{bmatrix}
        1 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 2
    \end{bmatrix}
    \\[10pt]
    &= \left ( \tfrac{1}{2} M R^2 - \tfrac{1}{12} M S^2 \right )
    \begin{bmatrix}
        1 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 2
    \end{bmatrix}
\end{align}
$$

Strangely, even though it would seem parameterizing in terms of the side length $S$ would be the most natural thing, it is the worst looking formula. In a way this make sense. $S$ is actually pretty complicated as it depends on $n$. The parameter $R$ on the other hand is constant with respect to $n$.

Notice that $I_{xx} = I_{yy}$. For even-sided polygons this is obvious, but for odd-sided polygons I find this fact remarkable. Consider the equilateral triangle from the previous post. Looking at it I would not have guessed that they are equal. 

Now, it's pretty simple to prove that

$$
\lim_{n \rightarrow \infty} \cos^2 \left ( \tfrac{\pi}{n} \right ) = 1
\qquad\qquad
\lim_{n \rightarrow \infty} \sin^2 \left ( \tfrac{\pi}{n} \right ) = 0
\qquad\qquad
\lim_{n \rightarrow \infty} S = 0
$$


Therefore

$$
\lim_{n \rightarrow \infty} \m{I} = 
\tfrac{1}{2} M R^2
\begin{bmatrix}
    1 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 2
\end{bmatrix}
$$

In the next post, we are going to prove that this is precisely the moment of inertia of a circle!

The mass can be written as $M = \lambda \cdot n \cdot 2R \sin (\tfrac{\pi}{n})$

$$
\begin{align}
    \lim_{n \rightarrow \infty} M
    &= \lim_{n \rightarrow \infty} \lambda \cdot n \cdot 2R \sin (\tfrac{\pi}{n}) \\[10pt]
    &= \lambda \cdot 2R \lim_{n \rightarrow \infty} n \sin (\tfrac{\pi}{n}) \\[10pt]
    &= \lambda \cdot 2\pi R
\end{align}
$$

We will see in the next post that this is, in fact, the inertia of a circle.
