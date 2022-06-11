FROM python:3.9-alpine3.12
ARG REQUIREMENTS

RUN apk add --no-cache --virtual .build-deps \
       postgresql-dev \
       musl-dev \
   && apk add --no-cache \
        postgresql-client \
        libffi-dev \
        bash \
        zlib-dev \
        gcc \
        jpeg-dev \
        gettext \
        linux-headers \
        dbus git \
    && apk add --no-cache  \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        geos-dev \
        gdal-dev proj proj-dev \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir Django==4.0.5 pytz==2022.1 \
       python-dotenv==0.20.0 psycopg2-binary==2.9.3 argon2-cffi==21.3.0 Pillow==9.1.1 redis==4.3.3 celery==5.2.7
    
