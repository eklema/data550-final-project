# Analysis of Prenatal Care Visit Attendance and Preterm Birth
Eleane Lema

## Introduction
This data analysis project uses birth certificate data to measure the relationship
between prenatal care visit attendance and preterm birth. I completed this
project for a course (DATA 550: Data Science Toolkit) during my MPH program. 

## Repository contents
The file organization for this repository is as follows:

1. **/code**: includes all R scripts for cleaning data, creating tables and
figures, and rendering the report
2. **/output**: includes all analytic output created from the code scripts
3. **/raw_data**: includes raw data file (DO NOT EDIT THIS DIRECTLY)
4. **codebook.xlsx**: descriptions for all the variables in the data set
5. **report.Rmd** and **report.html**: R Markdown file for knitting the analysis
report as an html document
6. **Makefile**: includes rules for building the analysis report and its components

## How to generate the analysis report 
The analysis report contains an introduction to the data set and presents
descriptive and regression results for the effect of prenatal care visit attendance
on the risk of preterm birth.

To generate the report, execute **make report.html** or **make** in your terminal.
You can execute the other rules listed in the Makefile if you'd like to
generate separate components of the report.
