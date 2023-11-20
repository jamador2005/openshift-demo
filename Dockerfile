FROM registry.access.redhat.com/ubi8-minimal:8.6 AS buildapp
RUN yum install -y nc && \
    yum clean all

