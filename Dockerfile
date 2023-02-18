FROM centos:latest
#RUN yum install -y \
#       java-1.8.0-openjdk \
#       java-1.8.0-openjdk-devel
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y java
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN yum install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
RUN tar -xvzf apache-tomcat-9.0.71.tar.gz
RUN mv apache-tomcat-9.0.71/* /opt/tomcat/
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

