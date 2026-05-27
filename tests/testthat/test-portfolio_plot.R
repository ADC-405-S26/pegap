test_that("returns a ggplot visualisation", {
  df <- data.frame(
    fund = c("Fund A", "Fund B"),
    vintage_year = c(2019, 2020),
    commitment = c(200000, 25000),
    called = c(16000, 14000),
    recallable = c(1000, 500)
  )
  result <- portfolio_plot(df)
  expect_s3_class(result, "ggplot")
})

test_that("deployment column gets created correctly", {
  df <- data.frame(
    fund = c("Fund A"),
    vintage_year = c(2019),
    commitment = c(10e6),
    called = c(9000),
    recallable = c(0)
  )
  result <- portfolio_plot(df)
  expect_s3_class(result, "ggplot")
})

test_that("rejects input if not data frame", {
  expect_error(portfolio_plot("not a data frame"))
})
