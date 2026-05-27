# Calculate Unfunded PE Liabilities and Create an Appropriate Schedule

Calculate Unfunded PE Liabilities and Create an Appropriate Schedule

## Usage

``` r
unfunded_liability_schedule(data)
```

## Arguments

- data:

  A data frame containing information about the fund. Column names
  default to fund, commitment, called, recallable.

## Value

A tibble showing current unfunded liabilities and a 5-year deployment
schedule.

## Examples

``` r
df <- data.frame(
  fund = c("Fund A", "Fund B"),
  commitment = c(10000000, 15000000),
  called = c(4000000, 3000000),
  recallable = c(1000000, 500000)
)
unfunded_liability_schedule(df)
#>     fund current_unfunded  Year1   Year2   Year3   Year4   Year5
#> 1 Fund A          7000000 350000 1400000 2450000 1750000 1050000
#> 2 Fund B         12500000 625000 2500000 4375000 3125000 1875000
```
