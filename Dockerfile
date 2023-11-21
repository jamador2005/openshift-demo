FROM registry.access.redhat.com/ubi8/ubi-minimal
USER root
RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y shadow-utils \
        && microdnf clean all \
        && rpm -q shadow-utils
# RUN apt-get update

USER root
EXPOSE 8080

USER root
RUN mkdir /app

USER root
COPY OpenshiftDemoApplication.jar /app

USER root
ENTRYPOINT [ "java","-jar","/app/OpenshiftDemoApplication.jar" ]


