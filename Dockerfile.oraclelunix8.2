# ------------------------------------------------------------------------------
# Dockerfile to build Oracle Linux container
# images based on Oracle Linux 8.2
# ------------------------------------------------------------------------------
FROM oraclelinux:8.2


RUN dnf install -y httpd
RUN dnf install -y sudo
RUN dnf install -y which
RUN dnf install -y perl


#RUN mkdir -p /var/www/cgi-bin
WORKDIR /var/www/cgi-bin
COPY counter.pl counter.pl
COPY counter.txt counter.txt
RUN chown apache:apache counter.pl counter.txt

#RUN mkdir -p /var/www/html
WORKDIR /var/www/html
COPY AndialySokone.jpg AndialySokone.jpg
COPY index.html index.html
RUN chown apache:apache index.html AndialySokone.jpg

LABEL maintainer="asokone@thecloudedu.com" \
version="1.0.1"

EXPOSE 80

ENTRYPOINT /usr/sbin/httpd -D FOREGROUND

