FROM rocker/tidyverse
MAINTAINER Sebastian Engel-Wolf (sebastian@mail-wolf.de)

## Install packages from CRAN
RUN install2.r --error \ 
    -r 'http://cran.rstudio.com' \
    ggplot2 \
    rlang \
    stringr \
    plotly \
    RColorBrewer \
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN git clone https://github.com/CSSEGISandData/COVID-19.git

ADD ./* $HOME/src/

WORKDIR $HOME/src/

RUN R start_script.R
