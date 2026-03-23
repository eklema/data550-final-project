# Analysis of Prenatal Care Visit Attendance and Preterm Birth
Eleane Lema

## Introduction
This data analysis project uses birth certificate data to measure the relationship
between prenatal care visit attendance and preterm birth. I completed this
project for a course (DATA 550: Data Science Toolkit) during my MPH program. 

## Repository contents
The file organization for this repository is as follows:

1. **code/**: stores all R scripts
  - code/01_clean_data.R: cleans the raw data and prepares it for analysis
  - code/02_table_one.R: produces Table 1
  - code/03_bar_plot.R: produces a bar plot
  - code/04_regression.R: runs a regression model and saves the results as Table 2
  - code/05_render_report.R: renders the final report as an html document
2. **output/**: stores all analytic output created from the code scripts
3. **raw_data/**: stores raw data in a .RData file
4. **codebook.xlsx**: includes descriptions for all the variables in the data set
5. **report.Rmd**: outlines the contents of the report
6. **Makefile**: includes rules for building the analysis report and its components

## How to generate the analysis report 
The analysis report contains an introduction to the data set and presents
descriptive and regression results for the effect of prenatal care visit attendance
on the risk of preterm birth.

To generate the report, execute **make report.html** or **make** in a terminal
application. You can execute the other rules listed in the Makefile if you'd 
like to generate separate components of the report.
