FROM r-base:latest

RUN R -e "install.packages('ggplot2', repos='http://cran.us.r-project.org')"

WORKDIR /workspace

COPY . /workspace

CMD ["Rscript", "snowfall_trends.R"]
