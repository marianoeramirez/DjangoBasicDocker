FROM python:3.8-alpine3.12
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
    && pip3 install --no-cache-dir Django==2.2.14 pytz==2020.1 \
       python-dotenv==0.14.0 psycopg2-binary==2.8.4 argon2-cffi==20.1.0 Pillow==7.2.0 redis==3.5.3 celery==4.4.6
    
