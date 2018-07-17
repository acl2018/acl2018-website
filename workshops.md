---
layout: page
title: Workshops
---

The following workshops are scheduled alongside ACL.

{% assign dates = '2018-07-19|2018-07-20' | split: '|' %}
{% for date in dates %}
#### {{ date | date: "%A %-d %B" }}
{% assign for_date = site.data.workshops | where: "date", date | sort: "name" %}
{% for ws in for_date %}
* [{{ ws.name }} ({{ ws.abbreviation }})]({{ ws.url }}): {{ ws.location }}{% endfor %}
{% endfor %}

