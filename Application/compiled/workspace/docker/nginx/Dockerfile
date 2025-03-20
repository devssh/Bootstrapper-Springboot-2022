FROM openjdk:18-jdk-slim
ADD . /code
WORKDIR /code
RUN apt-get -y update
RUN apt-get -y install nginx=1.18.*
RUN apt-get -y install curl
RUN sh loadnginxconfig-gnulinux-aarch64.sh; exit 0
CMD sh run_tomcat_prod.sh
