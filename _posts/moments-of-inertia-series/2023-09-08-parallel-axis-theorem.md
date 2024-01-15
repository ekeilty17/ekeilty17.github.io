---
layout:     series
title:      "Parallel Axis Theorem"
date:       2023-09-08
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       7
series:     moments-of-inertia
tags:       moments-of-inertia, parallel-axis
---

Thus far, each of the axes of rotation have been intentially chosen to pass through the object's center of mass. However, what if this is not the case. Then we can use the **parallel axis theorem**.

$$
I_{\text{parallel axis}} = I_{\text{center of mass}} + Md^2
$$

where $d$ is the shortest distance from the object's center of mass to the new axis 

<br>

## Example: Thin Rod About Exterior Diameter

We know that a thin rod about its central diameter is $I = \frac{1}{12}ML^2$. Now, if the axis is on its exterior diameter, we can calculate the moment of inertia without using any more integrals

$$
I = I_{\text{center of mass}} + Md^2 = \frac{1}{12}ML^2 + M(L/2)^2 = \frac{1}{3}ML^2
$$