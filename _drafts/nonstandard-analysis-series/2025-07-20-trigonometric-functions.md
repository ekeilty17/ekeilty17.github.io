---
layout:     series
title:      "Trigonometric Functions"
date:       2025-07-20
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       19
series:     nonstandard-analysis
tags:       nonstandard-analysis
---

**TODO**

These are all the hyperfunction extension of $\sin$ and $\cos$ which means we use the notation $({^* \sin})$ and $({^* \cos})$.

**TODO** replace the bold with the star notation

## Small Angle Approximation

$$
\abs{\b{\sin}(\b{\epsilon})} \leq \abs{\b{\epsilon}} < \abs{^* x}
$$

Thus, $\b{\sin}(\b{\epsilon}) \in \mathbb{I}$.

Now I need to show that 

$$
\b{\cos}(\b{\epsilon}) \in halo({^* 1}) \implies \b{\cos}(\b{\epsilon}) = {^* 1} + \b{\delta}
$$

This then gives all the other results for all the other trig functions

Obviously $\b{\sin}$ and $\b{\cos}$ of unlimited numbers are undefined

<br>

## Continuity

$$
\b{\sin}(halo(\b{x})) = \b{\sin}(\b{x} + \b{\epsilon}) = \b{\sin}(\b{x}) \b{\cos}(\b{\epsilon}) + \b{\cos}(\b{x}) \b{\sin}(\b{\epsilon}) = \b{\sin}(\b{x}) \cdot ({^* 1} + \b{\delta}) + \b{\cos}(\b{x}) \cdot \b{\epsilon}
$$

Thus, 

$$
sh(\b{\sin}(halo(\b{x}))) = \b{\sin}(\b{x})
$$