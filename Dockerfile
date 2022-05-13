########################################################################################################################

FROM amazoncorretto:17-alpine

########################################################################################################################

LABEL maintainer="Jérôme ODIER <odier.jerome@lpsc.in2p3.fr>"

LABEL description="AMI Server"

########################################################################################################################

ENV JAVA_MS="2G"
ENV JAVA_MX="4G"
ENV JAVA_SS="20m"

ENV HTTP_TIMEOUT="20000"
ENV HTTP_MAX_THREADS="200"
ENV HTTP_PACKET_SIZE="8192"

ENV AJP_ADDRESS="0.0.0.0"
ENV AJP_SECRET="changeit"

ENV AJP_TIMEOUT="20000"
ENV AJP_MAX_THREADS="200"
ENV AJP_PACKET_SIZE="8192"

ENV JVM_ROUTE="changeit"

ENV BASE_URL=""

ENV ADMIN_USER=""
ENV ADMIN_PASS=""
ENV ADMIN_EMAIL=""

ENV ENCRYPTION_KEY=""
ENV AUTHORIZED_IPS=""

ENV ROUTER_CATALOG=""
ENV ROUTER_SCHEMA="@NULL"
ENV ROUTER_URL=""
ENV ROUTER_USER=""
ENV ROUTER_PASS=""

ENV TIME_ZONE="UTC"

ENV CLASS_PATH="/AMI/cmd/"

########################################################################################################################

RUN ["mkdir", "/AMI/"]
RUN ["mkdir", "/tomcat/"]

########################################################################################################################

RUN wget -qO- https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz | tar xz -C /tomcat/ --strip-components 1

########################################################################################################################

RUN ["mkdir", "/AMI/app/"]
RUN ["mkdir", "/AMI/bin/"]
RUN ["mkdir", "/AMI/cmd/"]
RUN ["mkdir", "/AMI/conf/"]
RUN ["mkdir", "/AMI/font/"]
RUN ["mkdir", "/AMI/temp/"]
RUN ["mkdir", "/AMI/work/"]

########################################################################################################################

RUN ["chmod", "777", "/AMI/temp/", "/AMI/work/"]

########################################################################################################################

RUN ["wget", "-O", "/AMI/app/AMI.war", "https://ami.in2p3.fr/download/AMICoreWeb-1.0.0.war"]

########################################################################################################################

RUN ["mv", "/tomcat/bin/catalina.sh", "/AMI/bin/"]
RUN ["mv", "/tomcat/bin/bootstrap.jar", "/AMI/bin/"]
RUN ["mv", "/tomcat/bin/setclasspath.sh", "/AMI/bin/"]
RUN ["mv", "/tomcat/bin/tomcat-juli.jar", "/AMI/bin/"]

RUN ["mv", "/tomcat/conf/catalina.policy", "/AMI/conf/"]
RUN ["mv", "/tomcat/conf/catalina.properties", "/AMI/conf/"]
RUN ["mv", "/tomcat/conf/context.xml", "/AMI/conf/"]
RUN ["mv", "/tomcat/conf/web.xml", "/AMI/conf/"]

RUN ["mv", "/tomcat/lib/", "/AMI/lib/"]

RUN ["mv", "/tomcat/LICENSE", "/AMI/"]

RUN ["rm", "-fr", "/tomcat/"]

########################################################################################################################

COPY bin/setenv.sh /AMI/bin/
COPY conf/AMI.xml /AMI/conf/
COPY conf/server.xml /AMI/conf/
COPY conf/logging.properties /AMI/conf/
COPY font/Serif.ttf /AMI/font/

########################################################################################################################

EXPOSE 8080
EXPOSE 8009

########################################################################################################################

VOLUME /AMI/cmd/

########################################################################################################################

WORKDIR /AMI/

########################################################################################################################

ENTRYPOINT ["/AMI/bin/catalina.sh", "run"]

########################################################################################################################
