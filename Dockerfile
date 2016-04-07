FROM centos:centos7
MAINTAINER Michal Borek <michal@greenpath.pl>
ENV JAVA_VERSION 8u77
ENV BUILD_VERSION b03
ENV JAVA_HOME /usr/java/latest
 
RUN yum clean all && \
    yum -y install wget 
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm
RUN yum -y install /tmp/jdk-8-linux-x64.rpm && \
    rm -f /tmp/jdk-8-linux-x64.rpm && \ 
    yum clean all

RUN useradd --system --shell /usr/sbin/nologin --home-dir /nonexistent ms 
USER ms 
CMD [ -f /ms/config ] && . /ms/config ; java $MS_JAVA_OPTS -jar "/ms/${MS_JAR_NAME}"
