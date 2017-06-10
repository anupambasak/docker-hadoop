FROM openjdk

LABEL maintainer "Anupam Basak <anupam.basak@gmail.com>"

ENV HADOOP_VERSION=2.7.3

VOLUME /data

ADD download-hadoop.sh /usr/local/bin/download-hadoop.sh

RUN chmod +x /usr/local/bin/download-hadoop.sh

RUN /usr/local/bin/download-hadoop.sh