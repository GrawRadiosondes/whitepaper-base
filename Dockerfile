FROM debian:stable-slim@sha256:fbfb4059d2127120aa05b6e6064523d2102552f0cf0026ddf0701c12f1f8f3e0

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
