FROM registry.access.redhat.com/ubi8/ubi-minimal
USER root
#RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y shadow-utils \
#    && microdnf clean all \
#    && rpm -q shadow-utils

RUN microdnf install nc
RUN microdnf install curl

ADD spring-boot-starter-parent.jar spring-boot-starter-parent.jar 

USER root
EXPOSE 8080

USER root
RUN mkdir /app

USER root
ENTRYPOINT [ "java","-jar","spring-boot-starter-parent.jar" ]


