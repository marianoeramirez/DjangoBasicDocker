FROM python:3.8-alpine3.11
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
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir Django==2.2.10 pytz==2019.3 \
       python-dotenv==0.11.0 psycopg2-binary==2.8.4 argon2-cffi==19.2.0 Pillow==7.0.0 redis==3.4.1 celery==4.4.0
    
