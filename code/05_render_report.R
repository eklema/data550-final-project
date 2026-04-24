here::i_am(
  path = "code/05_render_report.R"
)

library(rmarkdown)

render(
  "report.Rmd",
  output_file = 'report/report.html'
)