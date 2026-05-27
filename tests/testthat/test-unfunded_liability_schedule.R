test_that("returns a data frame", {
  df <- data.frame(
    fund = c("Fund A", "Fund B"),
    commitment = c(10000, 15000),
    called = c(4000, 3000),
    recallable = c(1000, 500)
  )
  result <- unfunded_liability_schedule(df)
  expect_s3_class(result, "data.frame")
})

test_that("unfunded is calculated correctly", {
  df <- data.frame(
    fund = c("Fund A"),
    commitment = c(10000),
    called = c(4000),
    recallable = c(1000)
  )
  result <- unfunded_liability_schedule(df)
  expect_equal(result$current_unfunded, 7000)
})

test_that("rejects non data frame input", {
  expect_error(unfunded_liability_schedule("not a data frame"))
})
