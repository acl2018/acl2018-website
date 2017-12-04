---
layout: page
title: Workshops
top_index: 1
top: true
redirect_from: /2017/12/04/workshops
---

The following workshops will take place on July 19 and 20.  Workshops are one day long, except where noted.

{% for ws in site.data.workshops %}
* [{{ ws.Title }}]({{ ws.WorkshopURL }}) {% if ws.Title == "BioNLP 2018" %}(Two days){% endif %}{% endfor %}
