FROM ubuntu:14.04

MAINTAINER Pierrick Roger (pierrick.roger@gmail.com)

ENV TOOL_VERSION=3.4.0
ENV CONTAINER_VERSION=1.5

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
RUN apt-get -y install r-base libcurl4-openssl-dev libxml2-dev git openjdk-7-jdk ant
RUN R -e "install.packages(c('getopt', 'stringr', 'plyr', 'XML', 'RJSONIO', 'RUnit'), lib='/usr/lib/R/library', dependencies = TRUE, repos='http://cran.univ-paris1.fr/')"

# Install tool
WORKDIR /files
RUN git clone -b release/${TOOL_VERSION} --recursive https://github.com/workflow4metabolomics/lcmsmatching
WORKDIR /files/lcmsmatching
RUN ant
ENV TOOL.PREFIX=
RUN ant w4m.code
RUN cp dist/code/lcmsmatching.xml lcmsmatching_config.xml
RUN cp dist/code/*.py .
WORKDIR /files/lcmsmatching/test
RUN ls /usr/lib/jvm/java-7-openjdk-amd64/lib
RUN ant test.data

# Make tool accessible through PATH (for PhenoMeNal project)
ENV PATH=$PATH:/files/lcmsmatching

# Copy test script
COPY test-lcms /files/lcmsmatching

# Clean up
RUN apt-get clean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
# TODO RUN apt-get remove git ant

# Define Entry point script
ENTRYPOINT ["/files/lcmsmatching/search-mz"]
