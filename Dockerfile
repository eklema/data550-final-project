#### Setting up project directory files
# Use rocker/tidyverse that already has R and R packages installed
FROM rocker/tidyverse

# Create project directory and subdirectories
RUN mkdir /project
WORKDIR /project
RUN mkdir code
RUN mkdir output
RUN mkdir raw_data

# Copy over project files necessary for producing the report
COPY code code
COPY raw_data raw_data
COPY Makefile .
COPY report.Rmd .

# Copy over renv associated files
COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv


#### Synchronizing project library
# Restore project library using lockfile --> will automatically install renv and other packages
RUN Rscript -e "renv::restore(prompt = FALSE)"


#### Create entry point for report generation
RUN mkdir report

CMD make && mv report.html report


