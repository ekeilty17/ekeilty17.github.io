---
layout:     post
title:      Derivative Proofs
categories: blog
permalink:  /blog/derivative-proofs/
---

[Summary of Derivatives](/blog/derivative-proofs/summary-of-derivatives)

{% assign sorted_posts = site.posts | where: 'series', 'derivative-proofs' | sort: 'part' %}
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