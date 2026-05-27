test_that("returns a list with correct components", {
  result <- vintage_diversification_score(
    c("Fund A", "Fund B", "Fund C"),
    c(2018, 2019, 2018),
    c(10000000, 15000000, 5000000)
  )
  expect_type(result, "list")
  expect_named(result, c("vintage_weights", "HHI", "effective_vintages",
                         "diversification_score", "flag"))
})

test_that("HHI is 1 when all funds are same vintage", {
  result <- vintage_diversification_score(
    c("Fund A", "Fund B"),
    c(2018, 2018),
    c(10000000, 10000000)
  )
  expect_equal(result$HHI, 1)
})

test_that("rejects non-numeric committed capital", {
  expect_error(
    vintage_diversification_score(
      c("Fund A"),
      c(2018),
      c("ten million")
    )
  )
})
