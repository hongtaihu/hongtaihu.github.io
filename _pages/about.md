---
layout: single
permalink: /
title: "About"
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

{% assign cv = site.data.profile %}

{{ cv.intro }}

My undergraduate research focused on language server fuzzing and defect discovery. I am interested in how we can make compilers and developer tools more reliable.

[Download my CV (PDF)]({{ '/files/hongtai-hu-cv.pdf' | relative_url }})

{% include profile-cv.html %}
