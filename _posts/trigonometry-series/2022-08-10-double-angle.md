---
layout:     series
title:      "Double Angle Identities"
date:       2022-08-10
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       9
series:     trigonometry
tags:       trigonometry, double-angle
---

These identities are just a special case of the sum identities. However, they are used so often that they warrant their own post.

## Cosine

$$
\begin{align}
    \cos(2\theta) 
    &= \cos(\theta + \theta) \\[10pt]
    &= \cos(\theta)\cos(\theta) - \sin(\theta)\sin(\theta) \\[10pt]
    &= \cos^2 \theta - \sin^2 \theta
\end{align}
$$

There are a few other forms of this identity using the Pythagorean identity

$$
\begin{align}
    \cos(2\theta) 
    &= \cos^2 \theta - \sin^2 \theta \\[10pt]
    &= (1 - \sin^2 \theta) - \sin^2 \theta \\[10pt]
    &= 1 - 2\sin^2 \theta
\end{align}
$$

Similarly

$$
\begin{align}
    \cos(2\theta) 
    &= \cos^2 \theta - \sin^2 \theta \\[10pt]
    &= \cos^2 \theta - (1 - \cos^2 \theta) \\[10pt]
    &= 2\cos^2 \theta - 1
\end{align}
$$

## Sine 

$$
\begin{align}
    \sin(2\theta) 
    &= \sin(\theta + \theta) \\[10pt]
    &= \sin(\theta)\cos(\theta) - \cos(\theta)\sin(\theta) \\[10pt]
    &= 2 \sin \theta \cos \theta
\end{align}
$$

## Tangent

$$
\begin{align}
    \tan(2\theta) 
    &= \tan(\theta + \theta) \\[10pt]
    &= \frac{\tan(\theta) + \tan(\theta)}{1 - \tan(\theta)\tan(\theta)} \\[10pt]
    &= \frac{2\tan \theta}{1 - \tan^2 \theta}
\end{align}
$$

And we could also take this one more step to get 

$$
\tan(2 \theta) = \frac{2}{\cot \theta - \tan \theta}
$$

## Secant

We have the standard looking double angle formula for secant.

$$
\begin{align}
    \sec(2 \theta)
    &= \sec(\theta + \theta) \\[10pt]
    &= \frac{\sec(\theta)\sec(\theta)\csc(\theta)\csc(\theta)}{\csc(\theta)\csc(\theta) - \sec(\theta)\sec(\theta)} \\[10pt]
    &= \frac{\sec^2 \theta \csc^2 \theta}{\csc^2 \theta - \sec^2 \theta}
\end{align}
$$

Although, this is quite messy. So more often you will see this form.

$$
\begin{align}
    \sec(2 \theta) 
    &= \frac{1}{\cos(2 \theta)} \\[10pt]
    &= \frac{1}{\cos^2 \theta - \sin^2 \theta} \\[10pt]
    &= \frac{\cos^2 \theta + \sin^2 \theta}{\cos^2 \theta - \sin^2 \theta} \\[10pt]
    &= \frac{1 + \tan^2 \theta}{1 - \tan^2 \theta}
\end{align}
$$

This is an identity that is sometimes used when evaluating integrals. It's also used to parameterize hyperbolic curves.

## Cosecant

We have the standard-looking double angle formula for cosecant.

$$
\csc(2 \theta) = \frac{1}{\sin(2 \theta)} = \frac{1}{2 \sin \theta \cos \theta} = \frac{1}{2}\sec \theta \csc \theta
$$

But we also have this one.

$$
\begin{align}
    \csc(2 \theta) 
    &= \frac{1}{\sin(2 \theta)} \\[10pt]
    &= \frac{1}{2 \sin \theta \cos \theta} \\[10pt]
    &= \frac{1}{2} \frac{\sin^2 \theta + \cos^2 \theta}{\sin \theta \cos \theta} \\[10pt]
    &= \frac{1}{2} \left ( \frac{\sin \theta}{\cos \theta} + \frac{\cos \theta}{\sin \theta} \right ) \\[10pt]
    &= \frac{1}{2} \left ( \tan \theta + \cot \theta \right ) \\[10pt]
\end{align}
$$

## Cotangent

$$
\begin{align}
    \cot(2 \theta)
    &= \cot(\theta + \theta) \\[10pt]
    &= \frac{\cot(\theta) \cot(\theta) - 1}{\cot(\theta) + \cot(\theta)} \\[10pt]
    &= \frac{\cot^2 \theta - 1}{2\cot \theta}
\end{align}
$$

And we could also take this one more step to get 

$$
\cot(2 \theta) = \frac{1}{2} (\cot \theta - \tan \theta)
$$