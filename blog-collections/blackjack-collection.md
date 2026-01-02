---
layout:     page
title:      BlackJack
categories: blog
permalink:  /blog/blackjack/
---

This is a collection of posts about the card game<a href="https://en.wikipedia.org/wiki/Blackjack" target="_blank">BlackJack</a>; mostly related to mathematics, probability, and basic strategy. They can be read in any order.

{% assign sorted_posts = site.posts | where: 'series', 'blackjack' | sort: 'date' %}
{% for post in sorted_posts %}
  {% assign draft_status = post.draft | default: false %}
  {% if draft_status == false %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.title }} 
    </a>
  </div>
  {% endif %}
{% endfor %}
