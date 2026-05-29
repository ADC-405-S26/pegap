# Plot PE Portfolio Information

Plot PE Portfolio Information

## Usage

``` r
portfolio_plot(data)
```

## Arguments

- data:

  A data frame containing fund information. Column names default to
  fund, vintage_year, commitment, called, and recallable. All currency
  is in USD.

## Value

A ggplot2 scatter plot showing unfunded commitment by vintage year, with
point size scaled to commitment and colour indicating deployment
progress.

## Examples

``` r
df <- data.frame(
  fund = c("Fund A", "Fund B", "Fund C"),
  vintage_year = c(2019, 2020, 2021),
  commitment = c(20000000, 25000000, 15000000),
  called = c(16000000, 14000000, 6000000),
  recallable = c(1000000, 500000, 0)
)
portfolio_plot(df)
```
