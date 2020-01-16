
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mofgc413

<!-- badges: start -->

<!-- badges: end -->

The goal of mofgc413 is to translate hscode to Chinese or English name.

## Installation

You can install the released version of mofgc413 from
[Github](https://github.com/) with:

``` r
remotes::install_github("chinhungtseng/mofgc413")
```

## Example

  - This is a basic example which shows you how to solve a common
    problem:

<!-- end list -->

``` r
library(mofgc413)
```

  - Search HS Code name by 2-11 digits HS Code:

<!-- end list -->

``` r
search_hscode("0101290000")
#>       hscode    hscode_name.C                         hscode_name.E
#> 1         01   第１章　活動物                Chapter 1 live animals
#> 2       0101 馬、驢、騾及駃騠 Live horses, asses, mules and hinnies
#> 7     010129             其他                                 Other
#> 8   01012900           其他馬                     Other live horses
#> 9 0101290000           其他馬                     Other live horses
```

  - Convert a hscode character vector:

<!-- end list -->

``` r
parse_hscode(c("02", "0301", "040620", "05051000", "0106130000"))
#> [1] "第２章　肉及食用雜碎" "活魚"                 "磨碎或粉狀之各類乾酪"
#> [4] "填充用之羽毛及羽絨"   "駱駝及其他駱駝科動物"

parse_hscode(c("0101210000", "0105112000", "0105141000", "0106130000"), locale = "English")
#> [1] "Live horses, pure-bred breeding animals"                                        
#> [2] "Live fowls, other than pure-bred breeding animals, weighing not more than 185 g"
#> [3] "Live geese,  pure-bred breeding animals, weighing not more than 185 g"          
#> [4] "Live camels and other camelids (Camelidae)"
```
