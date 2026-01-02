---
layout:     page
title:      Billiards
categories: blog
permalink:  /blog/billiards/
---

This is a collection of posts about <a href="https://en.wikipedia.org/wiki/Cue_sports" target="_blank">Billiards</a>; mostly related to mathematics and physics. They can be read in any order.

{% assign sorted_posts = site.posts | where: 'series', 'billiards' | sort: 'date' %}
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
