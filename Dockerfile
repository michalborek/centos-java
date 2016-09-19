FROM jboss/base-jdk:8
MAINTAINER Michal Borek <michal@greenpath.pl>

USER root
RUN yum update -y && \
yum install -y wget && \
yum clean all

RUN useradd --system --shell /usr/sbin/nologin ms 
USER ms 
CMD /home/ms/microservice.sh
