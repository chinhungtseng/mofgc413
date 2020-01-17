
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
search_hscode("0101")
#> # A tibble: 14 x 3
#>    hscode     hscode_name.C    hscode_name.E                          
#>    <chr>      <chr>            <chr>                                  
#>  1 0101       馬、驢、騾及駃騠 Live horses, asses, mules and hinnies  
#>  2 01012      ─馬︰            -Horses :                              
#>  3 010121     純種繁殖用       Pure-bred breeding animals             
#>  4 01012100   馬，純種繁殖用   Live horses, pure-bred breeding animals
#>  5 0101210000 馬，純種繁殖用   Live horses, pure-bred breeding animals
#>  6 010129     其他             Other                                  
#>  7 01012900   其他馬           Other live horses                      
#>  8 0101290000 其他馬           Other live horses                      
#>  9 010130     驢               Asses                                  
#> 10 01013000   驢               Live asses                             
#> 11 0101300000 驢               Live asses                             
#> 12 010190     其他             Other                                  
#> 13 01019000   騾及駃騠         Live mules and hinnies                 
#> 14 0101900000 騾及駃騠         live mules and hinnies

search_hscode("機械")
#> # A tibble: 364 x 3
#>    hscode   hscode_name.C               hscode_name.E                      
#>    <chr>    <chr>                       <chr>                              
#>  1 40091240 已附配件之硫化橡膠管，供堆土機及類似機械配件用者… Tubes, pipes and hoses, of vulcani…
#>  2 4009124… 已附配件之硫化橡膠管，供堆土機及類似機械配件用者… Tubes, pipes and hoses, of vulcani…
#>  3 40094240 已附配件之硫化橡膠管，供堆土機及類似機械配件用者… Tubes, pipes and hoses, of vulcani…
#>  4 4009424… 已附配件之硫化橡膠管，供堆土機及類似機械配件用者… Tubes, pipes and hoses, of vulcani…
#>  5 401170   供農業或森林車及機械之用者  Of a kind used on agricultural or …
#>  6 40117010 具有「鯡骨」或類似面紋，供農業或森林車及機械之用者… "Having a \"herring-bone\" or simi…
#>  7 4011701… 具有「鯡骨」或類似面紋，供農業或森林車及機械之用者… "Having a \"\"herring-bone\"\" or …
#>  8 40117090 其他新橡膠氣胎，供農業或森林車及機械之用者… Other new pneumatic tyres, of rubb…
#>  9 4011709… 其他新橡膠氣胎，供農業或森林車及機械之用者… Other new pneumatic tyres, of rubb…
#> 10 401180   供建築、礦業或工業操作車及機械之用… Of a kind used on construction, mi…
#> # … with 354 more rows
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
