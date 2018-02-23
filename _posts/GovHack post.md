---
title: "Patent Data in action: GovHack Australia"
author: "Alica Daly"
date: "4 August 2015"
layout: post
published: true
tags: [free patent databases, free patent data, patents, IP Australia]
---
##Patent Data in action: GovHack
This article highlights some applications of open patent data from GovHack in Australia.

###What is GovHack?
[GovHack](https://www.govhack.org/govhack-2015/ "GovHack 2015") is an annual competition in Australia and New Zealand that brings together geeks, digital creatives, data analysts, story tellers, entrepreneurs and civil society enthusiasts to work together in teams over 46 hours to explore, mash up, ideate and communicate concepts using open Government data. GovHack celebrates technical and creative capacity, opens the door to collaboration with government, and has helped to advance the cause of open data to drive social and economic value.

Now in its 5th Year, GovHack has grown from a small data mashup event in 2009 to a huge international competition that brings over 2200 people across 33 locations in Australian and New Zealand together to innovate, collaborate and apply their creative skills to open government data.

This year, IP Australia was involved for the first time. We asked the GovHackers to develop an easy way for non-experts to access and use the [IP Government Open Data](https://data.gov.au/organization/ip-australia "IP Australia's open data") (or IPGOD) to find out where and what IP exists in Australia.

###What is IPGOD?
[IP Government Open Data](https://data.gov.au/organization/ip-australia "IP Australia's open data"), more fondly known as IPGOD, is the first complete and open national IP register that links IP rights to firm-level information in a simple data format. With its release, over 100 years of records held by IP Australia are now publicly and freely available.

The data is highly detailed, including information on each aspect of the application process from application through to granting of IP rights. We have published a [paper to accompany IPGOD which describes the data](http://www.ipaustralia.gov.au/uploaded-files/reports/IP_Government_Open_Data_Paper_-_Final.pdf "Overview of the Intellectual Property Government Open Data") and illustrates its use, as well as a [technical paper on the firm matching](https://melbourneinstitute.com/downloads/working_paper_series/wp2014n15.pdf "Harmonising and Matching IPR Holders at IP Australia").

##Projects using open patent data

####patentstori.es
[patentstori.es](https://patentstori.es/ "patentstori.es") aims to visualise the patent process, helping ordinary people to explore the patents that lie behind many inventions. Using [IPGOD](https://data.gov.au/dataset/ntellectual-property-government-open-data-2015 "IPGOD") and the [AusPat database](http://pericles.ipaustralia.gov.au/ols/auspat/quickSearch.do "AusPat"), patentstori.es converts masses of patent process data into easily-understood timelines, allowing users to search for patents and see the patent's story.

patentstori.es is built on a Free Software/Open Source stack, including Django, Python, PostgreSQL, MongoDB and nginx running in a CentOS Linux environment. 

- patentstori.es [hackerspace](https://hackerspace.govhack.org/content/patentstories "patentstori.es on Hackerspace")
- patentstori.es [homepage](https://patentstori.es/ "patentstori.es")
- patentstori.es [repository](https://github.com/ajdlinux/GovHack2015 "patentstori.es on GitHub")

####Neuron - connecting like minds
**Neuron Mind-Map** draws on over 12 million examiner citations and 8 million patent applications to create a mind-map of inter-connected intellectual data. During users' exploration through the Neuron Mind-Map, a user can click to branch-out to the Neuron Social Network.

**Neuron Social Network** creates a community of intellectually-curious people interested in discussing subject matter areas in greater detail. Engaging in discussion with others through the integration of subject-matter experts and CSIRO science datasets, as well as information on funding grants currently open for that subject-matter area.

The creators of Neuron have leveraged and combined multiple data sets together to create a more enhanced data store, including from IP Australia and WIPO:

- Intellectual Property Government Open Data (IPGOD)
- WIPO Patent Search
- OECD Patents Citations database
- OECD REGPAT database
- Google Patents database
- CSIRO science datasets
- CSIRO Data Access Portal - Web Services Interface
- Research Data API from Australian National Data Service
- Research Grants API from Australian National Data Service

Neuron is built on a Open Source tools, including Bootstrap, CakePHP, D3.js, MySQL, HTML5, Vanilla and Javascrip.

- Neuron [hackerspace](https://hackerspace.govhack.org/content/neuron-connecting-minds "Neuron on Hackerspace")
- Neuron [repository](https://github.com/andrej-griniuk/Neuron "Neuron on GitHub")

####A patent to the past
This project is designed to provide an indexed and searchable database of the IP Australia Patent datasets. They showcased several of Australia's headline patented inventions from 1904 to the present.

The back-end of the system is written using PHP/MySQL making use of FULLTEXT MySQL indexes as well as general INDEX's. The front-end of the system is built using a lightweight MVC framework which serves HTML pages which loads content through jQueries's AJAX features.

- A patent to the past [hackerspace](https://hackerspace.govhack.org/content/patent-past "A patent to the past on Hackerspace")
- A patent to the past [homepage](http://search.govhack.weiry.io/ "A patent to the past")
- A patent to the past [repository](https://github.com/JWeiry/govhack2015 "A patent to the past on GitHub")

##Round up

Those are some highlights from GovHack and it gives you an idea of some of the amazing things that you can do with patent data.

###See more
- Visit the [Intellectual Property data bounty page](https://hackerspace.govhack.org/prize_entries/bounty-intellectual-property-data-bounty) for more projects using IP data.
- IP data was not the only data on hand and there were lots of great projects from around Australia using all sorts of open data. Visit the [2015 GovHack projects page](https://hackerspace.govhack.org/projects).

Alica Daly is the Head of the [Patent Analytics Hub](http://www.ipaustralia.gov.au/about-us/economics-of-ip/patent-analytics-hub/ "Patent Analytics Hub") at [IP Australia](http://www.ipaustralia.gov.au/ "IP Australia"). The Patent Analytics Hub delivers patent analytics studies and technology assessment reports to external organisations.

Updated: 4 August 2015