#' Score Vintage Year Diversification
#'
#' @param fund_names A character vector of fund names
#' @param vintage_years An integer vector of vintage years
#' @param committed_capital A numeric vector of committed capital amounts (must be positive)
#'
#' @return A named list containing vintage_weights, HHI, effective_vintages,
#'   diversification_score (0-100), and a concentration flag
#' @export
#'
#' @examples
#' vintage_diversification_score(
#'   c("Fund A", "Fund B", "Fund C"),
#'   c(2018L, 2019L, 2018L),
#'   c(10e6, 15e6, 5e6)
#' )
vintage_diversification_score <- function(fund_names, vintage_years, committed_capital) {

  checkmate::assert_character(fund_names)
  checkmate::assert_integerish(vintage_years)
  checkmate::assert_numeric(committed_capital, lower = 0)

  df <- data.frame(fund = fund_names,
                   vintage = vintage_years,
                   capital = committed_capital)

  total <- sum(df$capital)
  vintage_weights <- tapply(df$capital, df$vintage, sum) / total
  hhi <- sum(vintage_weights^2)
  eff_vintages <- 1 / hhi
  n_vintages <- length(unique(df$vintage))
  score <- round((1 - hhi) / (1 - 1/n_vintages) * 100, 1)

  list(
    vintage_weights = round(sort(vintage_weights, decreasing = TRUE), 3),
    HHI = round(hhi, 3),
    effective_vintages = round(eff_vintages, 1),
    diversification_score = score,
    flag = ifelse(hhi > 0.25, "WARNING: High vintage concentration", "OK")
  )
}
