---
layout:     post
title:      "Tikz Tips and Tricks"
date:       2024-02-01
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       tikz
---

For the last few years, I have been using Tikz a lot. While it's an extremely powerful tool, it is not the easiest thing to use. Often seemingly simple things are not intuitive or require very obscure syntax which is not well documented. In this post, I would like to record all of the tips, tricks, and syntax I have used.

<!-- https://t1ng.dk/guide/Drawing-with-TikZ/ -->

## The Basics

- lines with labels
- circles
- points
- angles
- cycle shapes
- fill
- arcs
- labels
- adding coordinates

```
\node at ($(A)!0.5!(B)$) [below] {$L_x$};
```

```
\draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
%\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
%\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
%\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4
```

## 3D Coordinates

```
\tdplotsetmaincoords{70}{110}
\begin{scope}[tdplot_main_coords]
    % Axes
    \draw [thick, ->] (0, 0, 0) -- (5, 0, 0) node[anchor=north east]{$x$};
    \draw [thick, ->] (0, 0, 0) -- (0, 3.5, 0) node[anchor=north west]{$y$};
    \draw [thick, ->] (0, 0, 0) -- (0, 0, 3) node[anchor=south]{$z$};

    % point
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}
    \coordiante (P) at (1, 2, 3);
    \draw [color=orange fill=orange, tdplot_rotated_coords] (P) circle (\pointradius);

    % angle
    \tdplotdefinepoints(0,0,0)(\x,\y,\z)(\x,0,0)
    \tdplotdrawpolytopearc[->]{0.85}{color=paramColor, xshift=-10, yshift=3}{$\alpha_x$}
\end{scope}
```

```
\tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}
\draw [color=myred] (AORstart) -- (AORend);
\draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};
```