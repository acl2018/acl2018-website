---
layout: page
title: About
top: true
---

The 56th Annual Meeting of the Association for Computational Linguistics will be held in [Melbourne, Australia](https://www.melbourne.org/?utm_source=Microsite&utm_campaign=Computational%20Linguistics) at
the [Melbourne Convention and Exhibition Centre](http://mcec.com.au/) from July 15th to 20th, 2018.

### News

* [The call for papers is now available]({{ site.github.url }}/call-for-papers)
* [Please help us recruit the best area chairs, reviewers, and invited speakers]({{ site.github.url }}/news/call-for-nominations)
* [ACL, COLING, EMNLP and NAACL 2018 are seeking tutorial proposals]({{ site.github.url }}/news/joint-call-for-tutorials)

### PC Blog

<ul>
  {% for post in site.posts %}
    <li>
      {{ post.date | date: "%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.snippet }}</a>
    </li>
  {% endfor %}
</ul>


### Key Dates
{% for kd in site.key_dates %}
  * **{{ kd.date }}**: {{ kd.event }}{% endfor %}

_All deadlines are: 11:59pm UTC-12_

### Committee

**General Chair:** [Claire Cardie](http://www.cs.cornell.edu/home/cardie/)

[Full Organising Committee List]({{ site.github.url }}/committee#organising-committee)

[Full Area Chair List]({{ site.github.url }}/committee#area-chairs)



