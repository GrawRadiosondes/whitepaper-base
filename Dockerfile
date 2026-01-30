FROM debian:stable-slim

# apt update/upgrade & apt-utils
RUN apt update && apt upgrade -y
RUN apt install -y apt-utils

# timezone needed for texlive
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt install -y tzdata

# install tex & other deps
RUN apt install -y \
    biber \
    inkscape \
    python3-pygments \
    texlive-bibtex-extra \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-science \
    texlive-xetex

# clear apt cache
RUN apt clean && rm -rf /var/lib/apt/lists/*
