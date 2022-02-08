ARG INSTALL_PYTHON_VERSION=${INSTALL_PYTHON_VERSION:-3.8.12}
#FROM python:${INSTALL_PYTHON_VERSION}-slim-bullseye AS base
FROM debian:bullseye-slim AS base

MAINTAINER Ryan Kanno <ryankanno@localkinegrinds.com>

ENV PYTHONFAULTHANDLER=1 \
	PYTHONUNBUFFERED=1 \
	PYTHONHASHSEED=random \
	PIP_NO_CACHE_DIR=off \
	PIP_DISABLE_PIP_VERSION_CHECK=on \
	PIP_DEFAULT_TIMEOUT=100

RUN apt-get update && \
	apt-get install -y --no-install-recommends build-essential libqpdf-dev python3-dev wget python3-markdown2 python3-pip python3-psycopg2 python3-lxml libxml2-dev libpq-dev libgdal-dev imagemagick git libpangocairo-1.0-0 libmagic1 && \
	apt-get clean  
#	apt-get clean && \
#    rm -rf /var/lib/apt && \
#    rm -rf /var/lib/dpkg

RUN pip install --upgrade pip

ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal
ENV CXXFLAGS=-I/usr/local/include/libqpdf
ENV LDFLAGS=-L/usr/local/lib

COPY requirements.txt /requirements.txt
#RUN pip install -r requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/app"
