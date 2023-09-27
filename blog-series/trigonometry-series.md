---
layout:     post
title:      Trigonometry
categories: blog
permalink:  /blog/trigonometry/
---

[Summary of Trigonometric Identities](/blog/trigonometry/summary-of-trig-identities)

{% assign sorted_posts = site.posts | where: 'series', 'trigonometry' | sort: 'part' %}
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