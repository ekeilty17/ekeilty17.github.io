---
layout:     series
title:      "Lines - Special Cases"
date:       2023-09-28
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       50
series:     moments-of-inertia
tags:       moments-of-inertia
---

$$
\begin{align}
    I_{xx} 
    &= \tfrac{1}{3} M \left ( \frac{\sum_{k=0}^{n-1} S \left ( y_{k}^2 + y_{k+1}^2 + y_{k} y_{k+1} \right )}{\sum_{k=0}^{n-1} S } \right ) \\[10pt]
    &= \tfrac{1}{3n} M \sum_{k=0}^{n-1} \left ( y_{k}^2 + y_{k+1}^2 + y_{k} y_{k+1} \right ) \\[10pt]
    &= \tfrac{1}{3n} M \sum_{k=0}^{n-1} \left ( R^2 \sin^2 \left ( \tfrac{2 \pi k}{n} \right ) + R^2 \sin^2 \left ( \tfrac{2 \pi (k+1)}{n} \right ) + R \sin \left ( \tfrac{2 \pi k}{n} \right ) \cdot R \sin \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( \cos^2 \left ( \tfrac{2 \pi k}{n} \right ) + \cos^2 \left ( \tfrac{2 \pi (k+1)}{n} \right ) + \cos \left ( \tfrac{2 \pi k}{n} \right ) \cos \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( 2 \cos^2 \left ( \tfrac{2 \pi k}{n} \right ) + \cos \left ( \tfrac{2 \pi k}{n} \right ) \cos \left ( \tfrac{2 \pi (k+1)}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \sum_{k=0}^{n-1} \left ( \left [ 1 + \cos \left ( \tfrac{4 \pi k}{n} \right ) \right ] + \tfrac{1}{2} \left [ \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) + \cos \left ( \tfrac{2\pi}{n} \right )  \right ] \right ) \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left [ \left ( \sum_{k=0}^{n-1} 1 \right ) + \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{4 \pi k}{n} \right ) \right ) + \tfrac{1}{2} \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{2 \pi (2k+1)}{n} \right ) \right ) + \tfrac{1}{2} \left ( \sum_{k=0}^{n-1} \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \right ] \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left [ \left ( n \right ) + \left ( 0 \right ) + \tfrac{1}{2} \left ( 0 \right ) + \tfrac{1}{2} \left ( n \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \right ] \\[10pt]
    &= \tfrac{1}{3n} M R^2 \left ( n + \tfrac{1}{2} n \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 2 + \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 1 + 1 + \cos \left ( \tfrac{2\pi}{n} \right ) \right ) \\[10pt]
    &= \tfrac{1}{6} M R^2 \left ( 1 + 2\cos^2 \left ( \tfrac{\pi}{n} \right ) \right ) \\[10pt]
\end{align}
$$