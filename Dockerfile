# ::::::::::::::::::::::
# Dockerfile.02
# ::::::::::::::::::::::
FROM python:2.7-alpine

RUN mkdir /app
WORKDIR /app

COPY index.html index.html
COPY AndialySokone.jpg AndialySokone.jpg
COPY application.py application.py

CMD curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
CMD yum install -y python
CMD yum update -y python

CMD yum install -y pip

COPY . .
LABEL maintainer="Andialy Sokone<asokone@thecloudedu.com>" \
version="1.0"

CMD python -m SimpleHTTPServer 5000
