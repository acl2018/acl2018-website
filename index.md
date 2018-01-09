---
layout: page
title: About
top_index: 50
top: true
---

The 56th Annual Meeting of the Association for Computational Linguistics will be held in [Melbourne, Australia](https://www.melbourne.org/?utm_source=Microsite&utm_campaign=Computational%20Linguistics) at
the [Melbourne Convention and Exhibition Centre](http://mcec.com.au/) from July 15th to 20th, 2018.


### Latest News 


<ul>
  {% for post in site.posts %}
    <li>
      {{ post.date | date: "%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.snippet }}</a>
    </li>
  {% endfor %}
</ul>

<p class="feed-link-img"><a href="{{ site.github_url }}/feed.xml" title="Atom feed"><img src="images/rss.svg" alt="Atom Feed"></a></p>

### Key Dates

<table class='conf-dates'>
{% for kd in site.key_dates %}
  <tr><td class='conf-date-label'>{{ kd.date }}</td> <td>{{ kd.event }}</td></tr>
{% endfor %}
</table>


### Committee

**General Chair:** [Claire Cardie](http://www.cs.cornell.edu/home/cardie/)

[Full Organising Committee List]({{ site.github.url }}/committee#organising-committee)

[Full Area Chair List]({{ site.github.url }}/committee#area-chairs)



