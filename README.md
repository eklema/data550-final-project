# Analysis of Prenatal Care Visit Attendance and Preterm Birth
Eleane Lema

## Introduction
This data analysis project uses birth certificate data to measure the relationship
between prenatal care visit attendance and preterm birth. I completed this
project for a course (DATA 550: Data Science Toolkit) during my MPH program. 

## Repository contents
The file organization for this repository is as follows:

1. `code/`: stores all R scripts
  - `code/01_clean_data.R`: cleans the raw data and prepares it for analysis
  - `code/02_table_one.R`: produces Table 1
  - `code/03_bar_plot.R`: produces a bar plot
  - `code/04_regression.R`: runs a regression model and saves the results as Table 2
  - `code/05_render_report.R`: renders the final report as an html document
2. `output/`: stores all analytic output created from the code scripts
3. `raw_data/`: stores raw data in a .RData file
4. `codebook.xlsx`: includes descriptions for all the variables in the data set
5. `report.Rmd`: outlines the contents of the report
6. `Makefile`: includes rules for compiling the report and its components
7. `renv.lock`: lists all the packages (and the versions) that are used in
the project
8. `renv/`: stores files for activating the project library
9. `.Rprofile`: sources the file for activating the project library
10. `report/`: stores the report (`report.html`) after being compiled in the
container
11. `Dockerfile`: builds the image for compiling the report in a container


## How to synchronize project library with the lockfile
To synchronize your project library with the lockfile, execute `make install`
in a terminal application. You should then receive a message confirming that
your library is synced with the lockfile.


## How to build the Docker image
To build the Docker image for compiling the report, execute
`docker pull eklema/finalproj`. This will download the eklema/finalproj image
directly from Docker Hub and should be instantaneous.

Link to eklema/finalproj image on Docker Hub:
https://hub.docker.com/repository/docker/eklema/finalproj/general

If you would like to build the image locally, you may do so by executing
`docker build -t eklema/finalproj .` However, this process may take a long time
and is not necessary since the image is able to be downloaded directly from
Docker Hub as previously mentioned.


## How to generate the report in a Docker container
To generate the report in a Docker container, execute `make` or
`make report/report.html` in a terminal application.

This target will run a container, using the eklema/finalproj image, with the
`report/` directory on your local computer mounted to the `report/` directory in
the container. Once the container finishes compiling the report (called `report.html`),
it should appear in the `report/` directory on your local computer.

Please note that the container may take a while to run.


## Alternative way to generate the report on a local machine
If you would like to compile the report locally without using a container, you
may do so by executing `make report.html` in a terminal application. This will
save the `report.html` file in the project root directory. Make sure to synchronize
the project library before doing this.

