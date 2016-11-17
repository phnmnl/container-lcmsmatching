FROM ubuntu:14.04

MAINTAINER Pierrick Roger (pierrick.roger@gmail.com)

ENV TOOL_VERSION=3.1.1
ENV CONTAINER_VERSION=1.0

LABEL version="${CONTAINER_VERSION}"
LABEL tool_version="${TOOL_VERSION}"

# Setup package repos
#RUN echo "deb http://mirrors.ebi.ac.uk/CRAN/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN echo "deb http://cran.univ-paris1.fr/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

# Update and upgrade system
RUN apt-get update
RUN apt-get -y upgrade

# Install R and other needed packages
RUN apt-get -y install r-base libcurl4-openssl-dev libxml2-dev git
RUN R -e "install.packages(c('getopt', 'stringr', 'plyr', 'XML', 'RJSONIO', 'RUnit'), lib='/usr/lib/R/library', dependencies = TRUE, repos='http://mirrors.ebi.ac.uk/CRAN')"

# Install tool
WORKDIR /files
RUN git clone -b release-${TOOL_VERSION} --recursive https://github.com/workflow4metabolomics/lcmsmatching

# Make tool accessible through PATH (for PhenoMeNal project)
ENV PATH=$PATH:/files/lcmsmatching/r-msdb:/files/lcmsmatching/r-msdb/test

# Clean up
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Define Entry point script
ENTRYPOINT ["/files/lcmsmatching/r-msdb/search-mz"]
