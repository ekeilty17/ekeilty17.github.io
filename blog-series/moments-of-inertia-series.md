---
layout:     page
title:      Moments of Inertia
categories: blog
permalink:  /blog/moments-of-inertia/
---

<!-- I don't think there's a point in summarizing this series. Most posts are supposed to be self-contained. The series itself is the summary. -->
<!-- [Summary of Moments of Inertia](/blog/moments-of-inertia/summary-of-moments-of-inertia) -->

There are some posts in this series that remain incomplete. Unfortunately, I just got busy. But 90% of the content is here, and I have spent a ridiculous amount of time on this. At some point you just have to publish a draft. I have noted when content is missing. I promise to come back to this and touch up the last 10% in the future.

<br/>

<!-- If I was doing this in Python or any other real language, there would be much more elegant ways of coding this. For various annoying reasons, Liquid prevents me from doing certain things (e.g. HTML doesn't render inside nested loops). Below is the compromise I've made -->

{% assign sorted_posts = site.posts | where: 'series', 'moments-of-inertia' | sort: 'part' %}

{% assign headings = "none, Theory and Background, Curves, Surfaces, Volumes" | split: ", " %}   <!-- Only modify this -->
{% assign limits = "1, 7, 7, 8, 20" | split: ", " %} <!-- and this -->

<!-- Computes the offsets given the limits -->
{% assign running_sum = 0 %}
{% assign partial_sums = "0, " %}
{% for limit in limits %}
  {% assign running_sum = running_sum | plus: limit | times: 1 %}
  {% assign partial_sums = partial_sums | append: running_sum | append: ", " %}
{% endfor %}

{% assign offsets = partial_sums | split: ", " %}

<!-- You see this could be easily written as a for loop, but the HTML will not render if you do that -->
{% for post in sorted_posts limit: limits[0]%}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
    </a>
  </div>
{% endfor %}

<h2> {{headings[1]}} </h2>
{% for post in sorted_posts offset: offsets[1] limit: limits[1] %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
    </a>
  </div>
{% endfor %}

<h2> {{headings[2]}} </h2>
{% for post in sorted_posts offset: offsets[2] limit: limits[2] %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
    </a>
  </div>
{% endfor %}

<h2> {{headings[3]}} </h2>
{% for post in sorted_posts offset: offsets[3] limit: limits[3] %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
    </a>
  </div>
{% endfor %}

<h2> {{headings[4]}} </h2>
{% for post in sorted_posts offset: offsets[4] %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
    </a>
  </div>
{% endfor %}