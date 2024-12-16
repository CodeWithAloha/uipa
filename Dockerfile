LABEL maintainer="Suchandra Thapa <suchandra.spam+docker@gmail.com>"

FROM ghcr.io/astral-sh/uv:0.5.8-python3.13-alpine as local-base
# use alpine 3.20 with python 3.13 / uv 0.58

RUN apk update && \
    apk add --no-cache rust cargo qpdf qpdf-dev poppler poppler-dev g++ gdal geos alpine-sdk \
            imagemagick imagemagick-dev pango nodejs npm yarn cairo-dev \
           pango pango-dev giflib giflib-dev libjpeg-turbo libjpeg-turbo-dev bash


FROM local-base
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    UV_COMPILE_BYTECODE=1


COPY pyproject.toml /srv/django/pyproject.toml


#ENV PYTHONPATH="${PYTHONPATH}:/srv/django"

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin/:$PATH"


COPY . /srv/django
WORKDIR /srv/django
RUN  uv sync --frozen

RUN yarn install && yarn build

COPY run-backend.sh /srv/django

ENTRYPOINT  ["/srv/django/run-backend.sh"]
#ENTRYPOINT  ["/bin/sleep", "3600"]
