FROM registry.access.redhat.com/ubi8-minimal:8.6 AS buildapp
RUN printenv&& echo -e "[nodejs]\nname=nodejs\nstream=16\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/nodejs.module
RUN echo ""&&microdnf -y install --noplugins --nodocs  java-1.8.0-openjdk-headless tar gzip maven nodejs

WORKDIR /root

WORKDIR /root/frontend
COPY frontend .
RUN npm install --loglevel error -g @angular/cli@12.2.16 && npm install  --loglevel error --no-audit&&ng build

WORKDIR /root/backend
COPY backend .

#ja
WORKDIR /root/bawbackend
COPY bawbackend .
#ja

RUN mvn clean package

FROM registry.access.redhat.com/ubi8-minimal:8.6 AS deployment
EXPOSE 8080
WORKDIR /opt/tomcat
RUN microdnf -y install --noplugins --nodocs  java-1.8.0-openjdk-headless tar gzip openssh-clients openssh zip unzip nano \
    && curl -s https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz | tar xvz \
    &&mv apache-tomcat-9.0.68/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps/
RUN rm -rf host-manager manager docs examples ROOT
COPY --from=buildapp  /root/frontend/dist/hello-word-bpm /opt/tomcat/webapps/ROOT
COPY --from=buildapp  /root/backend/target/penelope-backend-1.0.1 /opt/tomcat/webapps/penelope-backend
#ja
COPY --from=buildapp  /root/bawbackend/target/baw_penelope-backend-1.0.1 /opt/tomcat/webapps/baw_penelope-backend
#ja
COPY tomcat-conf/*  /opt/tomcat/conf/
#droits selon https://developers.redhat.com/blog/2020/10/26/adapting-docker-and-kubernetes-containers-to-run-on-red-hat-openshift-container-platform?source=sso#deployments
RUN chgrp -R 0 /opt/tomcat \
    && chmod -R g=u /opt/tomcat \
    && chown -R 1001:0 /opt/tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
