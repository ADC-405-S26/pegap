#' Calculate Unfunded PE Liabilities and Create an Appropriate Schedule
#'
#' @param data A data frame containing information about the fund. Column names default to fund, commitment, called, recallable.
#'
#' @return A tibble showing current unfunded liabilities and a 5-year deployment schedule.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   fund = c("Fund A", "Fund B"),
#'   commitment = c(10000000, 15000000),
#'   called = c(4000000, 3000000),
#'   recallable = c(1000000, 500000)
#' )
#' unfunded_liability_schedule(df)
unfunded_liability_schedule <- function(data) {

  checkmate::assert_data_frame(data)

  drawdown_curve <- c(0.05, 0.20, 0.35, 0.25, 0.15)

  data$current_unfunded <- data$commitment - data$called + data$recallable

  data$Year1 <- data$current_unfunded*drawdown_curve[1]
  data$Year2 <- data$current_unfunded*drawdown_curve[2]
  data$Year3 <- data$current_unfunded*drawdown_curve[3]
  data$Year4 <- data$current_unfunded*drawdown_curve[4]
  data$Year5 <- data$current_unfunded*drawdown_curve[5]

  keep <- c("fund","current_unfunded","Year1","Year2","Year3","Year4","Year5")
  df <- data[, keep]

  df
}

