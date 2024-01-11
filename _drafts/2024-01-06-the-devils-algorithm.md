---
layout:     post
title:      "The Devil's Algorithm"
date:       2024-01-06
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       rubiks-cubes
---

## Introduction

The Devil's Algorithm refers to a theoretical algorithm on a 3x3 Rubik's cube which (from any of the $43,252,003,274,489,856,000$ scrambled state) one could execute and arrive at a solved cube. In this post, I am going to analyze the various interpretations and solutions to this problem.

The content of this post is probably best fit for a video, but alas I will do my best via the medium of a blog post. For your own sake, I have to recommend the following prerequisites
- own a <a href="https://speedcubeshop.com/search?type=product&q=3x3" target="_blank">3x3 Rubik's cube</a>
- know <a href="https://jperm.net/3x3/moves" target="_blank">Rubik's cube move notation</a> (or at least be able to execute it on a Rubik's cube given a cheat sheet)
- know the <a href="https://jperm.net/algs/pll" target="_blank">PLL algorithms</a> (this one is less important but would be helpful)

I will try my best to make this post accessible to those who do not have these prerequisites.

<br>

## What is an Algorithm?

