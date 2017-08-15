FROM ubuntu:16.04

MAINTAINER Detre Dominus <dfd@bluetel.co.uk>
MAINTAINER Bluetel Solutions <developers@bluetel.co.uk>

LABEL name="CDP b1"
LABEL description="CDP Ubuntu 16.04 build 1"

# Dependencies
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -qy \
      cron \
      apache2 \
      php7.0 \
      libapache2-mod-php \
      && \
    apt-get install -qy \
      php7.0-ldap \
      php7.0-gd \
      php7.0-xml \
      php7.0-zip \
      php7.0-readline \
      php7.0-xsl \
      php7.0-curl \
      php7.0-mysqlnd \
      php7.0-mcrypt \
      php7.0-tidy \
      php7.0-mbstring \
      && \
    apt-get install -qy \
      default-jre \
      sudo \
      vim \
      python-pip \
      xmldiff \
      texlive-latex-base \
      texlive-math-extra \
      dvipng \
      git \
      wget \
      curl \
      composer \
      subversion \
      && \
    apt-get clean

RUN a2enmod rewrite && \
    a2enmod headers && \
    a2dissite 000-default && \
    service apache2 restart

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chown root:users /usr/local/bin/wp && \
    chmod 750 /usr/local/bin/wp

RUN curl -O http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz && \
    mkdir kindlegen && \
    tar -xzf kindlegen_linux_2.6_i386_v2_9.tar.gz -C kindlegen && \
    mv kindlegen/kindlegen /usr/local/bin/kindlegen && \
    rm -rf kindlegen && \
    chown root:users /usr/local/bin/kindlegen && \
    chmod 755 /usr/local/bin/kindlegen
