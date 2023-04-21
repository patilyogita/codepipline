FROM centos
MAINTAINER patilyogita5563@gmail.com
#RUN yum install httpd -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN yum install -y httpd 
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
#FROM ubuntu:14.04

#MAINTAINER William E. <william@localhost>

#RUN touch ~/file.txt

