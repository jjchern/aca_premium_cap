
<!-- README.md is generated from README.Rmd. Please edit that file -->
About
=====

This repo contains R code for generating the ACA premium caps.

-   Source: [26 U.S. Code § 36B - Refundable credit for coverage under a qualified health plan](https://www.law.cornell.edu/uscode/text/26/36B)
-   Source: [KFF: Explaining Health Care Reform: Questions About Health Insurance Subsidies](http://kff.org/health-reform/issue-brief/explaining-health-care-reform-questions-about-health/)

Havest the Applicable Percentages
=================================

``` r
library(dplyr, warn.conflicts = FALSE)

xml2::read_html("https://www.law.cornell.edu/uscode/text/26/36B") %>% 
  rvest::html_table() %>% 
  .[[1]] %>% 
  pander::pander(split.cells = 25, caption = "Applicable Premium Percentage for Qualified Health Insurance Plans in the Exchange")
```

<table style="width:94%;">
<caption>Applicable Premium Percentage for Qualified Health Insurance Plans in the Exchange</caption>
<colgroup>
<col width="37%" />
<col width="30%" />
<col width="26%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">In the case of household income (expressed as a percent of poverty line) within the following income tier:</th>
<th align="center">The initial premium percentage is—</th>
<th align="center">The final premium percentage is—</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Up to 133%</td>
<td align="center">2.0%</td>
<td align="center">2.0%</td>
</tr>
<tr class="even">
<td align="center">133% up to 150%</td>
<td align="center">3.0%</td>
<td align="center">4.0%</td>
</tr>
<tr class="odd">
<td align="center">150% up to 200%</td>
<td align="center">4.0%</td>
<td align="center">6.3%</td>
</tr>
<tr class="even">
<td align="center">200% up to 250%</td>
<td align="center">6.3%</td>
<td align="center">8.05%</td>
</tr>
<tr class="odd">
<td align="center">250% up to 300%</td>
<td align="center">8.05%</td>
<td align="center">9.5%</td>
</tr>
<tr class="even">
<td align="center">300% up to 400%</td>
<td align="center">9.5%</td>
<td align="center">9.5%.</td>
</tr>
</tbody>
</table>

Data
====

``` r
load("premiumCap2014.rda")
premiumCap2014
#> Source: local data frame [301 x 2]
#> 
#>      fpg   cap
#>    <int> <dbl>
#> 1    100     2
#> 2    101     2
#> 3    102     2
#> 4    103     2
#> 5    104     2
#> 6    105     2
#> 7    106     2
#> 8    107     2
#> 9    108     2
#> 10   109     2
#> ..   ...   ...

library(ggplot2)
ggplot(premiumCap2014, aes(x = fpg, y = cap)) +
  geom_line() +
  labs(x = "Federal Poverty Guidelines (%)",
       y = "Premium Cap (%)",
       title = "Premium Cap, by Income % Poverty in 2014")
```

![](README-premiumCap2014-1.png)
