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

  A numeric vector of vintage years of equal array length to fund_names

- committed_capital:

  A numeric vector of USD values of equal array length to fund_names

## Value

A list containing vintage_weights, HHI, effective_vintages, and
diversification_score (0-100)

## Examples

``` r
vintage_diversification_score(
  c("Fund A", "Fund B", "Fund C"),
  c(2018, 2019, 2018),
  c(10000000, 15000000, 5000000)
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
