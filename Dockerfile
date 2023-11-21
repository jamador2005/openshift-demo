FROM registry.access.redhat.com/ubi8/ubi-minimal
USER root
#RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y shadow-utils \
#    && microdnf clean all \
#    && rpm -q shadow-utils

RUN microdnf install nc
RUN microdnf install curl

ADD /target/openshift-demo-0.0.1-SNAPSHOT.jar openshift-demo-0.0.1-SNAPSHOT.jar 

USER root
EXPOSE 8080

USER root
RUN mkdir /app

USER root
ENTRYPOINT [ "java","-jar","openshift-demo-0.0.1-SNAPSHOT.jar" ]


