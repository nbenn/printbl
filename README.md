
<!-- README.md is generated from README.Rmd. Please edit that file -->
printbl
=======

Pretty printing for any 2D datastructure in R that provides an implementation of the following generic methods

-   `base::head()`/`base::tail()`
-   `base::nrow()`

and optionally

-   `base::rownames()`
-   `printbl::obj_desc()`

Installation
------------

You can install the released version of printbl from [github](https://github.com/nbenn/printbl) with:

``` r
devoolt::install_github("nbenn/printbl")
```

Example
-------

For example a `data.frame` which has row names:

``` r
print_table(mtcars)
#> # A data.frame [32 × 11] 7.039 KiB
#>                   mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear
#>                 <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> Mazda RX4        21       6 160     110  3.9   2.62  16.5     0     1     4
#> Mazda RX4 Wag    21       6 160     110  3.9   2.88  17.0     0     1     4
#> Datsun 710       22.8     4 108      93  3.85  2.32  18.6     1     1     4
#> Hornet 4 Drive   21.4     6 258     110  3.08  3.22  19.4     1     0     3
#> Hornet Sportab…  18.7     8 360     175  3.15  3.44  17.0     0     0     3
#> …                                  
#> Lotus Europa     30.4     4  95.1   113  3.77  1.51  16.9     1     1     5
#> Ford Pantera L   15.8     8 351     264  4.22  3.17  14.5     0     1     5
#> Ferrari Dino     19.7     6 145     175  3.62  2.77  15.5     0     1     5
#> Maserati Bora    15       8 301     335  3.54  3.57  14.6     0     1     5
#> Volvo 142E       21.4     4 121     109  4.11  2.78  18.6     1     1     4
#> # carb <dbl>
```
