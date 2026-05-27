fund_df <- data.frame(
  fund = c("Fund A", "Fund B", "Fund C", "Fund D", "Fund E"),
  vintage_year = c(2019, 2020, 2019, 2021, 2022),
  commitment   = c(10000, 15000, 8000, 20000, 12000),
  called       = c(9000, 12000, 6000, 10000, 3000),
  recallable   = c(1000, 500, 500, 0, 0)
)

usethis::use_data(code_script, overwrite = TRUE)
