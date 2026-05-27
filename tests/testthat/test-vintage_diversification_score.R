test_that("returns a list with correct components", {
  result <- vintage_diversification_score(
    c("Fund A", "Fund B", "Fund C"),
    c(2018L, 2019L, 2018L),
    c(10e6, 15e6, 5e6)
  )
  expect_type(result, "list")
  expect_named(result, c("vintage_weights", "HHI", "effective_vintages",
                         "diversification_score", "flag"))
})

test_that("HHI is 1 when all funds are same vintage", {
  result <- vintage_diversification_score(
    c("Fund A", "Fund B"),
    c(2018L, 2018L),
    c(10e6, 10e6)
  )
  expect_equal(result$HHI, 1)
})

test_that("rejects non-numeric committed capital", {
  expect_error(
    vintage_diversification_score(
      c("Fund A"),
      c(2018L),
      c("ten million")
    )
  )
})
