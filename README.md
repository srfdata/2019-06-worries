# 2019-06-elections19-p1

## What worries the Swiss?

### Preliminary Remarks

This document describes the pre-processing and exploratory analysis of the data set that is the basis of the article [Die grössten Sorgen der Schweiz – und womit sie zusammenhängen](https://www.srf.ch/news/schweiz/wahlen-2019/wahlen-2019-die-groessten-sorgen-der-schweiz-und-womit-sie-zusammenhaengen) published on srf.ch.

SRF Data attaches importance to the fact that the data pre-processing and analysis can be reproduced and checked. SRF Data believes in the principle of open data, but also open and comprehensible methods. On the other hand, it should be possible for third parties to build on this preparatory work and thus generate further evaluations or applications.  


### R-Script & Daten

The preprocessing and analysis of the data was conducted in the [R project for statistical computing](https://www.r-project.org/). The RMarkdown script used to generate this document and all the resulting data can be downloaded [under this link](http://srfdata.github.io/2019-06-elections19-p1/rscript.zip). Through executing `main.Rmd`, the herein described process can be reproduced and this document can be generated. In the course of this, data from the folder `input` will be processed and results will be written to `output`. 

SRF Data uses Timo Grossenbacher's [rddj-template](https://github.com/grssnbchr/rddj-template) as the basis for its R scripts. If you have problems executing this script, it may help to study the instructions from the [rddj-template](https://github.com/grssnbchr/rddj-template). 


### GitHub

The code for the herein described process can also be freely downloaded from [https://github.com/srfdata/2019-06-elections19-p1](https://github.com/srfdata/2019-06-elections19-p1).


### Lizenz

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons Lizenzvertrag" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">2019-06-elections19-p1</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/srfdata/2019-06-elections19-p1" property="cc:attributionName" rel="cc:attributionURL">SRF Data</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Namensnennung - Attribution ShareAlike 4.0 International License</a>.


### Other projects

Code and data by [SRF Data](https://srf.ch/data) are available on [https://srfdata.github.io](https://srfdata.github.io).


### Disclaimer

The published information has been carefully compiled, but does not claim to be up-to-date, complete or correct. No liability is assumed for damages arising from the use of this script or the information drawn from it. This also applies to contents of third parties which are accessible via this offer.


### Data description of output files 

#### `worries.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year of the survey |
| topic | String | Topic (most important problems for the country) |
| value | Numeric | Share in percent of poeple (Swiss, above 18) that are worried about that topic |
| rank | Numeric | Rank of the topic, was it e.g. the number one worry in that year |

#### `requests_per_fraction_and_topic.csv`

Caution: The topics in `worries` are not the same as in the `requests…` tables. Also: In 2012 the Federal Chancellery introduced numerous new topics to their classification system.

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year (there usually are 4-5 sessions per year) |
| a_author_fraction | String | What fraction submitted the requests |
| total | Numeric | Total number of requests the fraction submitted in that year |
| topic | String | What topic can the request be attributed to (multiple topics per request possible) |
| share | Numeric | Share of that topic in the total of all requests the fraction submitted that year |
| n | Numeric | Number of requests for that topic and fraction in that year |

#### `requests_per_council_and_topic.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year (there usually are 4-5 sessions per year) |
| a_council | String | What council submitted the requests |
| total | Numeric | Total number of requests the council submitted in that year |
| topic | String | What topic can the request be attributed to (multiple topics per request possible) |
| share | Numeric | Share of that topic in the total of all requests the council submitted that year |
| n | Numeric | Number of requests for that topic and council in that year |

#### `party_strengths.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year of the election |
| party | String | Name of the party |
| strength | Numeric | Share in percent of all votes that that party won in that election |
| delta | Numeric | Change of the strength share of that party compared to the last election |

#### `unemployment_rate.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year of measurement |
| rate | Numeric | Proportion of people in Switzerland that were unemployed (average per year) |
| change | Numeric | Change of the rate since 1995 |

#### `asylum_applications.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year of measurement |
| applications | Numeric | Number of new applications for asylum in that year (per 31st of December) |
| change | Numeric | Change of the number of applications since 1995 |

#### `immigration.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year of measurement |
| immigrants | Numeric | Number of non-swiss immigrants that took up residence in Switzerland |
| change | Numeric | Change of the number of immigrants since 1995 |

#### `health_costs.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year of measurement |
| costs | Numeric | Costs of the Swiss health system in millions (CHF) |
| change | Numeric | Change of the number of applications since 1995 |

#### `smd_climate.csv`

| Attribute | Type | Description |
|-------|------|-----------------------------------------------------------------------------|
| year | Numeric | Year searched (1st of Jan until 31st of Dec) |
| articles | Numeric | Number of hits according to smd.ch |
| months | Numeric | Numbers of months searched (mainly relevant for 2019) |
| per_month | Numeric | Number of articles with one of the keywords found |


### Original Source


#### Worries

-> `input/Original_Sorgenbarometer_1988-2018.xlsx`

The research institute gfs.bern and the bank Credit Suisse publish a Worry Barometer each year. [On their website](https://www.credit-suisse.com/microsites/worry-barometer/en.html) they write about the survey: "What are the major concerns of people in Switzerland? How much confidence do they have in decision-makers in the fields of politics, business, and society? For the past 42 years, Credit Suisse has conducted an annual Worry Barometer survey to examine precisely these issues. With the Worry Barometer, Credit Suisse aims to contribute to the public debate on issues of socio-political relevance. [Every summer] the research institute gfs.bern askes [about 2500] voters across Switzerland about their concerns on behalf of Credit Suisse. The statistical sampling error is ±2.0 percentage points."

The survey is conducted the following way: "On these cards you can see some topics that have been discussed and written about a lot recently. Please take a look at all the cards and then put out to me those five of them which you personally consider to be the five most important problems in Switzerland." (orig: «Auf diesen Kärtchen sehen Sie einige Themen, über die in der letzten Zeit viel diskutiert und geschrieben worden ist. Sehen Sie sich bitte alle Kärtchen an und legen Sie mir dann von allen Kärtchen jene fünf heraus, die Sie persönlich als die fünf wichtigsten Probleme der Schweiz ansehen.»)

As they changed their methodology in 1995 and introduced a lot of new topics, **we decided to leave away years before 1995**.

#### Parliamentary procedural requests

-> `input/Analyse_SRG19_P1.RData`
-> `input/modifications_p1.R`

With the help of the team at [Smartvote](https://www.smartvote.ch/) we can also offer (for the first time, as far as we know) all the parliamentary procedural requests (Parlamentarische Vorstösse) from the National Council and the Council of States. The original source of the items of parlamentary business is the Federal Chancellery.

They started the classification of the items in the year 2000. For this reason, we cannot work with requests in the years before 2000.

#### National Council elections

-> `je-d-17.02.02.02.01.01.xlsx`

The **number of seats in the National Council** we download from the Federal Statistical Offices FSO 
[website](https://www.bfs.admin.ch/bfs/de/home/statistiken/kataloge-datenbanken/tabellen.assetdetail.217184.html).

-> `px-x-1702020000_104.csv`

For the **party strenghts** we download a CSV from [Stat-Tab](https://www.pxweb.bfs.admin.ch/pxweb/de/px-x-1702020000_104/px-x-1702020000_104/px-x-1702020000_104.px) where we choose `Switzerland` in the first tab and all the other entries in all the other tabs.

#### Popular Votes

-> `input/popular_votes_1994_2019.csv`

We manually extracted the popular votes from the [list](https://www.bk.admin.ch/ch/d/pore/va/vab_2_2_4_1_gesamt.html) on the Federal Chancellerys website.

#### Unemployment Rate

-> `input/je-d-03.03.02.02.xlsx`

We download the unemployment rate at the [website](https://www.bfs.admin.ch/bfs/de/home/statistiken/kataloge-datenbanken/tabellen.assetdetail.7146832.html) of the Federal Statistical Office FSO.

#### Immigration into Switzerland

-> `input/su-d-01.05.04.02.01.xlsx`

Also the data about immigration we download from the FSO [website](https://www.bfs.admin.ch/bfs/de/home/statistiken/kataloge-datenbanken/tabellen.assetdetail.5886275.html).

#### Applications for Asylum

-> `input/7-20-Bew-Asylgesuche-J-d-…-12.xlsx`

From the [website](https://www.sem.admin.ch/sem/de/home/publiservice/statistik/asylstatistik/uebersichten.html) of the State Secretariat for Migration SEM we download the number of new applications of asylum per year.


#### Costs of the health system

-> `input/je-d-14.05.01.01.xlsx`

For another reference line concerning the cost of the Swiss health system, we work with [this table](https://www.bfs.admin.ch/bfs/de/home/statistiken/gesundheit.assetdetail.6386445.html) by the FSO.

#### Articles concerning climate change

-> `input/smd_climate.csv`

We queried the Swiss Media Database [SMD](http://smd.ch/) with the following search: `erderwärmung OR "globale erwärmung" OR klimawandel OR treibhauseffekt OR klimaschutz OR klimaveränderung OR klimaerwärmung` for each year since 1995 (by manually entering a start and end date of 1st of january and 31st of December each year). Then we manually saved the total number of results into a csv file.
