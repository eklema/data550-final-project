report.html: code/05_render_report.R report.Rmd \
  descriptive_analysis regression_analysis
	Rscript code/05_render_report.R


output/clean_data.rds: code/01_clean_data.R raw_data/birthsamp.RData
	Rscript code/01_clean_data.R
	
output/table_one.rds: code/02_table_one.R output/clean_data.rds
	Rscript code/02_table_one.R

output/bar_plot.png: code/03_bar_plot.R output/clean_data.rds
	Rscript code/03_bar_plot.R && rm -f Rplots.pdf
	
output/regression_table.rds: code/04_regression.R output/clean_data.rds
	Rscript code/04_regression.R
	
	
.PHONY: descriptive_analysis
descriptive_analysis: output/table_one.rds output/bar_plot.png

.PHONY: regression_analysis
regression_analysis: output/regression_table.rds

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html
	
