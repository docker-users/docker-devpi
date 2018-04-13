FROM python:3.6.5-alpine3.7

ARG pypi_mirror
ENV PYPI_MIRROR=${pypi_mirror:-https://mirrors.ustc.edu.cn/pypi/web/simple}
ENV DEVPI_SERVERDIR=/data/devpi/

RUN mkdir /data/ \
    && mkdir /data/devpi/ \
    && apk add --no-cache --virtual .build-deps \
                                    gcc musl-dev libffi-dev\
    && pip install -U devpi-web \
    && devpi-server --init \
    && apk del .build-deps 

EXPOSE 3141
WORKDIR /data/devpi/
CMD ["devpi-server", "--host", "0.0.0.0", "--port", "3141"]