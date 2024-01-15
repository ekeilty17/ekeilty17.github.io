---
layout:     page
title:      Moments of Inertia
categories: blog
permalink:  /blog/moments-of-inertia/
---

<!-- [Summary of Moments of Inertia](/blog/moments-of-inertia/summary-of-moments-of-inertia) -->
This series is still being developed

Eventually, I am going to draw really nice diagrams for each object. Unfortunately, I haven't the time at the moment.

{% assign sorted_posts = site.posts | where: 'series', 'moments-of-inertia' | sort: 'part' %}
{% for post in sorted_posts %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
        <!-- I'll play around with this later
        <time datetime="{{ post.date | date_to_xmlschema }}" class="post-link-date">{{ post.date | date_to_string }}</time>
        -->
    </a>
  </div>
{% endfor %}