FROM ubuntu:latest

# apt update/upgrade & apt-utils
RUN apt update && apt upgrade
RUN apt install -y apt-utils

# timezone needed for texlive
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt install -y tzdata

# install tex & other deps
RUN apt install -y biber
RUN apt install -y inkscape
RUN apt install -y python3-pygments
RUN apt install -y texlive-bibtex-extra
RUN apt install -y texlive-latex-extra
RUN apt install -y texlive-latex-recommended
RUN apt install -y texlive-science
RUN apt install -y texlive-xetex

# clear apt cache
RUN apt clean && rm -rf /var/lib/apt/lists/*
