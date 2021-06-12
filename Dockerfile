FROM centos
MAINTAINER docker-ops
RUN yum -y update
RUN mkdir /opt/tomcat
RUN curl -O https://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz
RUN tar xvzf apache-tomcat-9.0.46.tar.gz
RUN mv apache-tomcat-9.0.46/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
COPY /root/Docker/index.html /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh","run"]
