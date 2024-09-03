---
layout:     page
title:      BlackJack
categories: blog
permalink:  /blog/blackjack/
draft:      true 
---

This series is still being developed.

{% assign sorted_posts = site.posts | where: 'series', 'blackjack' | sort: 'part' %}
{% for post in sorted_posts %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.part }}) {{ post.title }} 
    </a>
  </div>
{% endfor %}
