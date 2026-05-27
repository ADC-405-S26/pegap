#' Score Vintage Year Diversification
#'
#' @param fund_names A character vector of fund names
#' @param vintage_years A numeric vector of vintage years
#' @param committed_capital A numeric vector of committed capital amounts (must be positive)
#'
#' @return A named list containing vintage_weights, HHI, effective_vintages,
#'   diversification_score (0-100), and a concentration flag
#' @export
#'
#' @examples
#' vintage_diversification_score(
#'   c("Fund A", "Fund B", "Fund C"),
#'   c(2018, 2019, 2018),
#'   c(10000000, 15000000, 5000000)
#' )
vintage_diversification_score <- function(fund_names, vintage_years, committed_capital) {

  checkmate::assert_character(fund_names)
  checkmate::assert_numeric(vintage_years)
  checkmate::assert_numeric(committed_capital, lower = 0)

  #calculate weights directly (split capital by vintage)
  vintage_totals <- tapply(committed_capital, vintage_years, sum)
  vintage_weights <- vintage_totals / sum(committed_capital)

  hhi <- sum(vintage_weights^2)
  n_vintages <- length(vintage_weights)

  #what if only 1 vintage
  score <- if (n_vintages > 1) round((1 - hhi) / (1 - 1 / n_vintages) * 100, 1)
            else 0.0

  list(
    vintage_weights = round(sort(vintage_weights, decreasing = TRUE), 3),
    HHI = round(hhi, 3),
    effective_vintages = round(1 / hhi, 1),
    diversification_score = score,
    flag = if (hhi > 0.25) "WARNING: High vintage concentration" else "OK"
  )
}
