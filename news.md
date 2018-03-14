---
layout: page
title: News Archive
---

<ul>
  {% for post in site.posts %}
    <li>
      {{ post.date | date: "%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.snippet }}</a>
    </li>
  {% endfor %}
</ul>
<p class="feed-link"><a href="{{ site.github_url }}/feed.xml">Atom Feed</a></p>

