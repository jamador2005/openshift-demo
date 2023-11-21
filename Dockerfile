FROM registry.access.redhat.com/ubi8/ubi-minimal
RUN apt-get update
EXPOSE 8080
RUN mkdir /app
COPY OpenshiftDemoApplication.jar /app
ENTRYPOINT [ "java","-jar","/app/OpenshiftDemoApplication.jar" ]


