# Score Vintage Year Diversification

Score Vintage Year Diversification

## Usage

``` r
vintage_diversification_score(fund_names, vintage_years, committed_capital)
```

## Arguments

- fund_names:

  A character vector of fund names

- vintage_years:

  An integer vector of vintage years

- committed_capital:

  A numeric vector of committed capital amounts (must be positive)

## Value

A named list containing vintage_weights, HHI, effective_vintages,
diversification_score (0-100), and a concentration flag

## Examples

``` r
vintage_diversification_score(
  c("Fund A", "Fund B", "Fund C"),
  c(2018L, 2019L, 2018L),
  c(10e6, 15e6, 5e6)
)
#> $vintage_weights
#> 2018 2019 
#>  0.5  0.5 
#> 
#> $HHI
#> [1] 0.5
#> 
#> $effective_vintages
#> [1] 2
#> 
#> $diversification_score
#> [1] 100
#> 
#> $flag
#> [1] "WARNING: High vintage concentration"
#> 
```
