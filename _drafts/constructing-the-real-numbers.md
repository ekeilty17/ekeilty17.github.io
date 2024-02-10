---
layout:     post
title:      Constructing the Real Numbers
categories: blog
permalink:  /blog/constructing-the-real-numbers/
---

This series is still being developed

{% assign sorted_posts = site.posts | where: 'series', 'constructing-the-real-numbers' | sort: 'part' %}
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