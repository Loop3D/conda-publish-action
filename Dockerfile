FROM continuumio/miniconda3

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*


LABEL "repository"="https://github.com/fcakyon/conda-publish-action"
LABEL "maintainer"="Fatih C Akyon"

RUN apt-get update
# to fix: import cv2 > ImportError: libGL.so.1: cannot open shared object file: No such file or directory
RUN apt-get install -y libgl1-mesa-dev

# to fix: import cv2 > ImportError: libjasper.so.1: cannot open shared object file: No such file or directory
RUN apt-get install -y libjasper1

RUN conda install -y anaconda-client conda-build conda-verify

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]