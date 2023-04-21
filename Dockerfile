###FROM centos:latest
#MAINTAINER patilyogita5563@gmail.com
#RUN yum install httpd -y
#ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
#WORKDIR /var/www/html/
#RUN yum install -y httpd \
#RUN unzip photogenic.zip
#RUN cp -rvf photogenic/* .
#RUN rm -rf photogenic photogenic.zip
#CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#EXPOSE 80
FROM java:8-alpine

MAINTAINER *********@.com

####installing supervisor
RUN apt-get -y update && apt-get install -y supervisor

####downloading & unpacking Spark 1.6.1 [prebuilt for Hadoop 2.7+ and scala 2.10]
RUN wget http://apache.mirrors.lucidnetworks.net/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz 9
&& tar -xzf spark-2.1.0-bin-hadoop2.7.tgz
&& mv spark-2.1.0-bin-hadoop2.7 /opt/spark

#####adding conf files [to be used by supervisord for running spark master/slave]
COPY master.conf /opt/conf/master.conf
COPY slave.conf /opt/conf/slave.conf

#######exposing port 8080 for spark master UI
EXPOSE 8080

#default command: running an interactive spark shell in the local mode
#CMD ["/opt/spark/bin/spark-shell", “–master”, “local[*]”]

