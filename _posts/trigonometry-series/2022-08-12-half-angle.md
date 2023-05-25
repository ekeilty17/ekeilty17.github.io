---
layout:     series
title:      "Half Angle Identities"
date:       2022-08-12
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       11
series:     trigonometry
tags:       trigonometry, half-angle
---

These are just rearrangements of the power reduction identities. I rarely have seem much use for them.

## Cosine

$$
\cos^2 (\theta / 2) = \frac{1}{2}(1 + \cos(\theta)) \quad\implies\quad \cos (\theta/2) = \pm \sqrt{\frac{1 + \cos \theta}{2}}
$$

It is positive if $\theta/2$ is in quadrant I or IV and negative if $\theta/2$ is in quadrant II or III.

<br>

## Sine

$$
\sin^2 (\theta / 2) = \frac{1}{2}(1 - \cos(\theta)) \quad\implies\quad \sin (\theta/2) = \pm \sqrt{\frac{1 - \cos \theta}{2}}
$$

It is positive if $\theta/2$ is in quadrant I or II and negative if $\theta/2$ is in quadrant III or IV.

<br>

## Tangent

$$
\tan^2 (\theta/2) = \frac{1 - \cos \theta}{1 + \cos \theta} \quad\implies\quad \tan (\theta/2) = \pm \sqrt{ \frac{1 - \cos \theta}{1 + \cos \theta} }
$$

It is positive if $\theta/2$ is in quadrant I or III and negative if $\theta/2$ is in quadrant II or IV.

<br>

There are actually three more variations of this half angle identity. Here is the first.

$$
\begin{align}
    \tan (\theta/2) 
    &= \pm \sqrt{ \frac{1 - \cos \theta}{1 + \cos \theta} } \\[10pt]
    &= \pm \sqrt{ \frac{1 - \cos \theta}{1 + \cos \theta} \cdot \frac{1 + \cos \theta}{1 + \cos \theta} } \\[10pt]
    &= \pm \sqrt{ \frac{1 - \cos^2 \theta}{(1 + \cos \theta)^2} } \\[10pt]
    &= \pm \sqrt{ \frac{\sin^2 \theta}{(1 + \cos \theta)^2} } \\[10pt]
    &= \pm \frac{\sin \theta}{1 + \cos \theta}
\end{align}
$$

Here is the second.

$$
\begin{align}
    \tan (\theta/2) 
    &= \pm \frac{\sin \theta}{1 + \cos \theta} \\[10pt]
    &= \pm \frac{\sin \theta}{1 + \cos \theta} \cdot \frac{1 - \cos \theta}{1 - \cos \theta} \\[10pt]
    &= \pm \frac{\sin \theta \cdot (1 - \cos \theta)}{1 - \cos^2 \theta} \\[10pt]
    &= \pm \frac{\sin \theta \cdot (1 - \cos \theta)}{\sin^2 \theta} \\[10pt]
    &= \pm \frac{1 - \cos \theta}{\sin \theta}
\end{align}
$$

Here is the final identity.

$$
\begin{align}
    \tan (\theta/2) 
    &= \pm \frac{1 - \cos \theta}{\sin \theta} \\[10pt]
    &= \pm \left ( \frac{1}{\sin \theta} - \frac{\cos \theta}{\sin \theta} \right ) \\[10pt]
    &= \pm (\csc \theta - \cot \theta)
\end{align}
$$

## Secant, Cosecant, and Cotangent

There are no half angle formulas for these functions other than just taking the reciprocal of the above identities.