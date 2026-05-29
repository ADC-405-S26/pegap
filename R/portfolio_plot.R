#' Plot PE Portfolio Information
#'
#' @param data A data frame containing fund information. Column names default
#'   to fund, vintage_year, commitment, called, and recallable.
#'
#' @return A ggplot2 scatter plot showing unfunded commitment by vintage year,
#'   with point size scaled to commitment and colour indicating deployment progress.
#' @export
#'
#' @importFrom ggplot2
#'
#' @examples
#' df <- data.frame(
#'   fund = c("Fund A", "Fund B", "Fund C"),
#'   vintage_year = c(2019, 2020, 2021),
#'   commitment = c(20000000, 25000000, 15000000),
#'   called = c(16000000, 14000000, 6000000),
#'   recallable = c(1000000, 500000, 0)
#' )
#' portfolio_plot(df)
portfolio_plot <- function(data) {
  vintage_year <- NULL
  unfunded <- NULL
  commitment <- NULL
  deployment <- NULL
  #i was getting a note saying no visible binding for the vars.
  #the above fixed it by defaulting them to null.
  #logic was that if I give it no value r will know that I want them even though
  #they're not technically doing anything.


  checkmate::assert_data_frame(data)

  data$unfunded   <- data$commitment - data$called + data$recallable
  data$pct_called <- data$called / data$commitment
  data$deployment <- ifelse(data$pct_called > 0.75, "High (>75%)",
                            ifelse(data$pct_called >= 0.40, "Mid (40-75%)", "Low (<40%)"))

  ggplot2::ggplot(data, ggplot2::aes(x = vintage_year, y = unfunded,
                                     size = commitment, colour = deployment)) +
    ggplot2::geom_point() +
    ggplot2::scale_colour_manual(values = c(
      "High (>75%)" = "darkgreen",
      "Mid (40-75%)" = "orange",
      "Low (<40%)" = "red"))+
    ggplot2::labs(x = "Vintage Year", y = "Unfunded ($)",
                  colour = "Deployment", size = "Commitment ($)") +
    ggplot2::theme_classic()
}
