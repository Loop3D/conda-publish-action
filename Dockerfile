FROM continuumio/miniconda3

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update

LABEL "repository"="https://github.com/Loop3D/conda-publish-action"
LABEL "maintainer"="Yohan de Rose"

RUN conda install -y anaconda-client conda-build conda-verify

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]