---
layout:     post
title:      "Summary of Trigonometric Identities"
categories: blog trigonometry
permalink:  ":categories/:title/"
tags:       trigonometry, table
---

## The Unit Circle and Common Angles

<center>
{% tikz unit-circle %}

    \foreach \x in {0,30,...,360} {
        % lines from center to point
        \draw[gray] (0cm,0cm) -- (\x:5cm);
    }

    \foreach \x in {45, 135, 225, 315} {
        % lines from center to point
        \draw[gray] (0cm,0cm) -- (\x:5cm);
    }

    % draw the coordinates
    \draw[->, very thick] (-5.5cm,0cm) -- (5.5cm,0cm) node[right,fill=white] {$x$};
    \draw[->, very thick] (0cm,-5.5cm) -- (0cm,5.5cm) node[above,fill=white] {$y$};

    \foreach \x in {0,30,...,360} {
        % dots at each point
        \filldraw[black] (\x:5cm) circle(2pt);
        % draw each angle in degrees
        \draw (\x:3cm) node[fill=white] {$\x^\circ$};
    }

    \foreach \x in {45, 135, 225, 315} {
        % dots at each point
        \filldraw[black] (\x:5cm) circle(2pt);
        % draw each angle in degrees
        \draw (\x:3cm) node[fill=white] {$\x^\circ$};
    }

    % draw the unit circle
    \draw[thick] (0cm,0cm) circle(5cm);

    % draw each angle in radians
    \foreach \x/\xtext in {
        30/\frac{\pi}{6},
        45/\frac{\pi}{4},
        60/\frac{\pi}{3},
        90/\frac{\pi}{2},
        120/\frac{2\pi}{3},
        135/\frac{3\pi}{4},
        150/\frac{5\pi}{6},
        180/\pi,
        210/\frac{7\pi}{6},
        225/\frac{5\pi}{4},
        240/\frac{4\pi}{3},
        270/\frac{3\pi}{2},
        300/\frac{5\pi}{3},
        315/\frac{7\pi}{4},
        330/\frac{11\pi}{6},
        360/2\pi}
            \draw (\x:4.25cm) node[fill=white] {$\xtext$};

    \foreach \x/\xtext/\y in {
        % the coordinates for the first quadrant
        30/\frac{\sqrt{3}}{2}/\frac{1}{2},
        45/\frac{\sqrt{2}}{2}/\frac{\sqrt{2}}{2},
        60/\frac{1}{2}/\frac{\sqrt{3}}{2},
        % the coordinates for the second quadrant
        150/-\frac{\sqrt{3}}{2}/\frac{1}{2},
        135/-\frac{\sqrt{2}}{2}/\frac{\sqrt{2}}{2},
        120/-\frac{1}{2}/\frac{\sqrt{3}}{2},
        % the coordinates for the third quadrant
        210/-\frac{\sqrt{3}}{2}/-\frac{1}{2},
        225/-\frac{\sqrt{2}}{2}/-\frac{\sqrt{2}}{2},
        240/-\frac{1}{2}/-\frac{\sqrt{3}}{2},
        % the coordinates for the fourth quadrant
        330/\frac{\sqrt{3}}{2}/-\frac{1}{2},
        315/\frac{\sqrt{2}}{2}/-\frac{\sqrt{2}}{2},
        300/\frac{1}{2}/-\frac{\sqrt{3}}{2}}
            \draw (\x:6.25cm) node[fill=white] {$\left(\xtext,\y\right)$};

    % draw the horizontal and vertical coordinates
    % the placement is better this way
    \draw (-6.25cm,0cm) node[above=1pt] {$(-1,0)$}
            (6.25cm,0cm)  node[above=1pt] {$(1,0)$}
            (0cm,-6.25cm) node[fill=white] {$(0,-1)$}
            (0cm,6.25cm)  node[fill=white] {$(0,1)$};

{% endtikz %}
</center>

<br>

| **Degrees**   | **Radians**   |   | **cos**               | **sin**               | **tan**               |   | **sec**               | **csc**               | **cot**               |
|:-------------:|:-------------:|:-:|:---------------------:|:---------------------:|:---------------------:|:-:|:---------------------:|:---------------------:|:---------------------:|
|               |               |   |                       |                       |                       |   |                       |                       |                       |
| $0^{\circ}$   | $0$           |   | $1$                   | $0$                   | $0$                   |   | $1$                   | _undefined_           | _undefined_           |
| $30^{\circ}$  | $\pi/6$       |   | $\frac{\sqrt{3}}{2}$  | $\frac{1}{2}$         | $\frac{1}{\sqrt{3}}$  |   | $\frac{2}{\sqrt{3}}$  | $2$                   | $\sqrt{3}$            |
| $45^{\circ}$  | $\pi/4$       |   | $\frac{\sqrt{2}}{2}$  | $\frac{\sqrt{2}}{2}$  | $1$                   |   | $\sqrt{2}$            | $\sqrt{2}$            | $1$                   |
| $30^{\circ}$  | $\pi/3$       |   | $\frac{1}{2}$         | $\frac{\sqrt{3}}{2}$  | $\sqrt{3}$            |   | $2$                   | $\frac{2}{\sqrt{3}}$  | $\frac{1}{\sqrt{3}}$  |
|               |               |   |                       |                       |                       |   |                       |                       |                       |
| $90^{\circ}$  | $\pi/2$       |   | $0$                   | $1$                   | _undefined_           |   | _undefined_           | $1$                   | $0$                   |
| $120^{\circ}$ | $2\pi/3$      |   | $-\frac{1}{2}$        | $\frac{\sqrt{3}}{2}$  | $-\sqrt{3}$           |   | $-2$                  | $\frac{2}{\sqrt{3}}$  | $-\frac{1}{\sqrt{3}}$ |
| $135^{\circ}$ | $3\pi/4$      |   | $-\frac{\sqrt{2}}{2}$ | $\frac{\sqrt{2}}{2}$  | $-1$                  |   | $-\sqrt{2}$           | $\sqrt{2}$            | $-1$                  |
| $150^{\circ}$ | $5\pi/6$      |   | $-\frac{\sqrt{3}}{2}$ | $\frac{1}{2}$         | $-\frac{1}{\sqrt{3}}$ |   | $-\frac{2}{\sqrt{3}}$ | $2$                   | $-\sqrt{3}$           |
|               |               |   |                       |                       |                       |   |                       |                       |                       |
| $180^{\circ}$ | $\pi$         |   | $-1$                  | $0$                   | $0$                   |   | $-1$                  | _undefined_           | _undefined_           |
| $210^{\circ}$ | $7\pi/6$      |   | $-\frac{\sqrt{3}}{2}$ | $-\frac{1}{2}$        | $\frac{1}{\sqrt{3}}$  |   | $-\frac{2}{\sqrt{3}}$ | $-2$                  | $\sqrt{3}$            |
| $225^{\circ}$ | $5\pi/4$      |   | $-\frac{\sqrt{2}}{2}$ | $-\frac{\sqrt{2}}{2}$ | $1$                   |   | $-\sqrt{2}$           | $-\sqrt{2}$           | $1$                   |
| $240^{\circ}$ | $4\pi/3$      |   | $-\frac{1}{2}$        | $-\frac{\sqrt{3}}{2}$ | $\sqrt{3}$            |   | $-2$                  | $-\frac{2}{\sqrt{3}}$ | $\frac{1}{\sqrt{3}}$  |
|               |               |   |                       |                       |                       |   |                       |                       |                       |
| $270^{\circ}$ | $3\pi/2$      |   | $0$                   | $-1$                  | _undefined_           |   | _undefined_           | $-1$                  | $0$                   |
| $120^{\circ}$ | $2\pi/3$      |   | $\frac{1}{2}$         | $-\frac{\sqrt{3}}{2}$ | $-\sqrt{3}$           |   | $-2$                  | $\frac{2}{\sqrt{3}}$  | $-\frac{1}{\sqrt{3}}$ |
| $135^{\circ}$ | $3\pi/4$      |   | $\frac{\sqrt{2}}{2}$  | $-\frac{\sqrt{2}}{2}$ | $-1$                  |   | $-\sqrt{2}$           | $\sqrt{2}$            | $-1$                  |
| $150^{\circ}$ | $5\pi/6$      |   | $\frac{\sqrt{3}}{2}$  | $-\frac{1}{2}$        | $-\frac{1}{\sqrt{3}}$ |   | $-\frac{2}{\sqrt{3}}$ | $2$                   | $-\sqrt{3}$           |

<br>

## Complementary, Supplementary, and Opposite Angles

$$
\begin{align}
    &\cos(\pi/2 - \theta) = -\cos(\theta)    &\qquad&   \sin(\pi/2 - \theta) = \sin(\theta)  &\qquad&    \tan(\pi/2 - \theta) = \cot(\theta) \\[10pt]
    &\cos(\pi - \theta) = \sin(\theta)    &\qquad&   \sin(\pi - \theta) = \cos(\theta)  &\qquad&    \tan(\pi - \theta) = -\tan(\theta) \\[10pt]
    &\cos(- \theta) = \cos(\theta)    &\qquad&   \sin(- \theta) = -\sin(\theta)  &\qquad&    \tan(- \theta) = -\tan(\theta)
\end{align}
$$

<br>

$$
\begin{align}
    &\sec(\pi/2 - \theta) = -\sec(\theta)    &\qquad&   \csc(\pi/2 - \theta) = \csc(\theta)  &\qquad&    \cot(\pi/2 - \theta) = \tan(\theta) \\[10pt]
    &\sec(\pi - \theta) = \csc(\theta)    &\qquad&   \csc(\pi - \theta) = \sec(\theta)  &\qquad&    \cot(\pi - \theta) = -\cot(\theta) \\[10pt]
    &\sec(- \theta) = \sec(\theta)    &\qquad&   \csc(- \theta) = -\csc(\theta)  &\qquad&    \cot(- \theta) = -\cot(\theta)
\end{align}
$$

<br>

## Pythagorean Identities

$$
\sin^2 \theta + \cos^2 \theta = 1 \qquad
\tan^2 \theta + 1 = \sec^2 \theta \qquad
1 + \cot^2 \theta = \csc^2 \theta
$$

<br>

## Sum and Difference Identities

$$
\begin{align}
    &\cos(\alpha \pm \beta) = \cos(\alpha)\cos(\beta) \mp \sin(\alpha)\sin(\beta) 
    &\qquad\qquad& \sec(\alpha \pm \beta) = \frac{\sec(\alpha)\sec(\beta)\csc(\alpha)\csc(\beta)}{\csc(\alpha)\csc(\beta) \mp \sec(\alpha)\sec(\beta)} \\[15pt]
    &\sin(\alpha \pm \beta) = \sin(\alpha)\cos(\beta) \pm \cos(\alpha)\sin(\beta)
    &\qquad\qquad& \csc(\alpha \pm \beta) = \frac{\sec(\alpha)\sec(\beta)\csc(\alpha)\csc(\beta)}{\sec(\alpha)\csc(\beta) \pm \csc(\alpha)\sec(\beta)} \\[15pt]
    &\tan(\alpha \pm \beta) = \frac{\tan(\alpha) \pm \tan(\beta)}{1 \mp \tan(\alpha)\tan(\beta)}
    &\qquad\qquad& \cot(\alpha \pm \beta) = \frac{\cot(\alpha) \cot(\beta) \mp 1}{\cot(\beta) \pm \cot(\alpha)}
\end{align}
$$

<br>

## Double Angle Identities

$$
\begin{align}
    &\cos(2\theta) = \cos^2 \theta - \sin^2 \theta \quad = \quad 1 - 2\sin^2 \theta \quad = \quad 2\cos^2 \theta - 1 \\[15pt]
    &\sin(2\theta) = 2 \sin \theta \cos \theta \\[15pt]
    &\tan(2\theta) = \frac{2\tan \theta}{1 - \tan^2 \theta} \quad = \quad \frac{2}{\cot \theta - \tan \theta} \\[15pt]
    &\sec(2 \theta) = \frac{\sec^2 \theta \csc^2 \theta}{\csc^2 \theta - \sec^2 \theta} \quad = \quad \frac{1 + \tan^2 \theta}{1 - \tan^2 \theta} \\[15pt]
    &\csc(2 \theta) = \frac{1}{2}\sec \theta \csc \theta \quad = \quad \frac{1}{2} \left ( \tan \theta + \cot \theta \right ) \\[15pt]
    &\cot(2 \theta) = \frac{\cot^2 \theta - 1}{2\cot \theta} \quad = \quad \frac{1}{2} (\cot \theta - \tan \theta)
\end{align}
$$

<br>

## Power Reduction Identities

$$
\cos^2 \theta = \frac{1}{2}(1 + \cos(2 \theta)) \qquad\qquad
\sin^2 \theta = \frac{1}{2}(1 - \cos(2 \theta)) \qquad\qquad
\tan^2 \theta = \frac{1 - \cos(2 \theta)}{1 + \cos(2 \theta)}
$$

<br>

## Half Angle Identities

$$
\cos (\theta/2) = \pm \sqrt{\frac{1 + \cos \theta}{2}} \qquad\qquad \sin (\theta/2) = \pm \sqrt{\frac{1 - \cos \theta}{2}}
$$

$$
\tan (\theta/2) = \pm \sqrt{ \frac{1 - \cos \theta}{1 + \cos \theta} } \quad=\quad \pm \frac{\sin \theta}{1 + \cos \theta} \quad=\quad \pm \frac{1 - \cos \theta}{\sin \theta}
$$

<br>

## Product-to-Sum Identities

$$
\begin{align}
    &\cos \alpha \cos \beta = \frac{1}{2} (\cos(\alpha - \beta) + \cos(\alpha + \beta)) \qquad\qquad
    &\sin \alpha \cos \beta = \frac{1}{2} (\sin(\alpha + \beta) + \sin(\alpha - \beta)) \\[15pt]
    &\sin \alpha \sin \beta = \frac{1}{2} (\cos(\alpha - \beta) - \cos(\alpha + \beta)) \qquad\qquad
    &\cos \alpha \sin \beta = \frac{1}{2} (\sin(\alpha + \beta) - \sin(\alpha - \beta))
\end{align}
$$

<br>

## Sum-to-Product Identities

$$
\begin{align}
    &\cos \alpha + \cos \beta = 2 \cos \left ( \frac{\alpha + \beta}{2} \right ) \cos \left ( \frac{\alpha - \beta}{2} \right )
    &\qquad
    &\sin \alpha + \sin \beta = 2 \sin \left ( \frac{\alpha + \beta}{2} \right ) \cos \left ( \frac{\alpha - \beta}{2} \right )\\[15pt]
    &\cos \alpha - \cos \beta = 2 \sin \left ( \frac{\alpha + \beta}{2} \right ) \sin \left ( \frac{\alpha - \beta}{2} \right )
    &\qquad
    &\sin \alpha - \sin \beta = 2 \cos \left ( \frac{\alpha + \beta}{2} \right ) \sin \left ( \frac{\alpha - \beta}{2} \right )
\end{align}
$$

<br>

## Euler's Identity

$$
e^{i\theta} = \cos \theta + i \sin \theta
\qquad\qquad
\cos \theta = \frac{1}{2} (e^{i\theta} + e^{-i\theta})
\qquad\qquad
\sin \theta = \frac{1}{2i} (e^{i\theta} - e^{-i\theta})
$$

<br>

## Hyperbolic Trigonometric Functions

$$
\begin{align}
    &\cosh(x) = \cos(ix) 
    &\qquad
    &\sinh(x) = -i\sin(ix) 
    &\qquad
    &\tanh(x) = -i\tan(ix)
\end{align}
$$

<br>

<h3 style="text-align:center; margin-bottom:1em;">
    <a href="/blog/trigonometry/">Trigonometry Series</a>
</h3>