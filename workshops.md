---
layout: page
title: Workshops
---

The following workshops will take place on July 19 and 20.  Workshops are one day long, except where noted.

{% for ws in site.data.workshops %}
* [{{ ws.Title }}]({{ ws.WorkshopURL }}) {% if ws.Title == "BioNLP 2018" %}(Two day workshop){% endif %}{% endfor %}
