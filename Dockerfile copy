
# This is a Dockerfile for the ubi8/openjdk-17-runtime:1.18 image.


## START target image ubi8/openjdk-17-runtime:1.18
## \
FROM registry.access.redhat.com/ubi8/ubi-minimal


USER root

###### START module 'jboss.container.user:1.0'
###### \
# Copy 'jboss.container.user' module content
COPY modules/jboss.container.user /tmp/scripts/jboss.container.user
# Switch to 'root' user for package management for 'jboss.container.user' module defined packages
USER root
# Install packages defined in the 'jboss.container.user' module
RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y shadow-utils \
    && microdnf clean all \
    && rpm -q shadow-utils
# Set 'jboss.container.user' module defined environment variables
ENV \
    GECOS="JBoss user" \
    HOME="/home/jboss" \
    UID="185" \
    USER="jboss"
# Custom scripts from 'jboss.container.user' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.user/configure.sh" ]
###### /
###### END module 'jboss.container.user:1.0'

###### START module 'jboss.container.openjdk.jre:17'
###### \
# Copy 'jboss.container.openjdk.jre' module content
COPY modules/jboss.container.openjdk.jre /tmp/scripts/jboss.container.openjdk.jre
# Switch to 'root' user for package management for 'jboss.container.openjdk.jre' module defined packages
USER root
# Install packages defined in the 'jboss.container.openjdk.jre' module
RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y java-17-openjdk-headless \
    && microdnf clean all \
    && rpm -q java-17-openjdk-headless
# Set 'jboss.container.openjdk.jre' module defined environment variables
ENV \
    JAVA_HOME="/usr/lib/jvm/jre" \
    JAVA_VENDOR="openjdk" \
    JAVA_VERSION="17" \
    JBOSS_CONTAINER_OPENJDK_JRE_MODULE="/opt/jboss/container/openjdk/jre"
# Set 'jboss.container.openjdk.jre' module defined labels
LABEL \
    org.jboss.product="openjdk" \
    org.jboss.product.openjdk.version="17" \
    org.jboss.product.version="17"
# Custom scripts from 'jboss.container.openjdk.jre' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.openjdk.jre/configure.sh" ]
###### /
###### END module 'jboss.container.openjdk.jre:17'

###### START module 'jboss.container.java.jvm.api:1.0'
###### \
###### /
###### END module 'jboss.container.java.jvm.api:1.0'

###### START module 'jboss.container.proxy.api:2.0'
###### \
###### /
###### END module 'jboss.container.proxy.api:2.0'

###### START module 'jboss.container.java.proxy.bash:2.0'
###### \
# Copy 'jboss.container.java.proxy.bash' module content
COPY modules/jboss.container.java.proxy.bash /tmp/scripts/jboss.container.java.proxy.bash
# Set 'jboss.container.java.proxy.bash' module defined environment variables
ENV \
    JBOSS_CONTAINER_JAVA_PROXY_MODULE="/opt/jboss/container/java/proxy"
# Custom scripts from 'jboss.container.java.proxy.bash' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.proxy.bash/configure.sh" ]
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.proxy.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.java.proxy.bash:2.0'

###### START module 'jboss.container.java.jvm.bash:1.0'
###### \
# Copy 'jboss.container.java.jvm.bash' module content
COPY modules/jboss.container.java.jvm.bash /tmp/scripts/jboss.container.java.jvm.bash
# Set 'jboss.container.java.jvm.bash' module defined environment variables
ENV \
    JBOSS_CONTAINER_JAVA_JVM_MODULE="/opt/jboss/container/java/jvm"
# Custom scripts from 'jboss.container.java.jvm.bash' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.jvm.bash/configure.sh" ]
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.jvm.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.java.jvm.bash:1.0'

###### START module 'jboss.container.util.logging.bash:1.0'
###### \
# Copy 'jboss.container.util.logging.bash' module content
COPY modules/jboss.container.util.logging.bash /tmp/scripts/jboss.container.util.logging.bash
# Set 'jboss.container.util.logging.bash' module defined environment variables
ENV \
    JBOSS_CONTAINER_UTIL_LOGGING_MODULE="/opt/jboss/container/util/logging/"
# Custom scripts from 'jboss.container.util.logging.bash' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.util.logging.bash/configure.sh" ]
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.util.logging.bash/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.util.logging.bash:1.0'

###### START module 'jboss.container.java.run:1.0'
###### \
# Copy 'jboss.container.java.run' module content
COPY modules/jboss.container.java.run /tmp/scripts/jboss.container.java.run
# Set 'jboss.container.java.run' module defined environment variables
ENV \
    JAVA_DATA_DIR="/deployments/data" \
    JBOSS_CONTAINER_JAVA_RUN_MODULE="/opt/jboss/container/java/run"
# Custom scripts from 'jboss.container.java.run' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.run/configure.sh" ]
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.java.run/backward_compatibility.sh" ]
###### /
###### END module 'jboss.container.java.run:1.0'

###### START module 'jboss.container.java.jre.run:1.0'
###### \
###### /
###### END module 'jboss.container.java.jre.run:1.0'

###### START module 'jboss.container.util.pkg-update:1.0'
###### \
# Copy 'jboss.container.util.pkg-update' module content
COPY modules/jboss.container.util.pkg-update /tmp/scripts/jboss.container.util.pkg-update
# Custom scripts from 'jboss.container.util.pkg-update' module
USER root
RUN [ "sh", "-x", "/tmp/scripts/jboss.container.util.pkg-update/execute.sh" ]
###### /
###### END module 'jboss.container.util.pkg-update:1.0'

###### START image 'ubi8/openjdk-17-runtime:1.18'
###### \
# Set 'ubi8/openjdk-17-runtime' image defined environment variables
ENV \
    JBOSS_IMAGE_NAME="ubi8/openjdk-17-runtime" \
    JBOSS_IMAGE_VERSION="1.18" \
    LANG="C.utf8"
# Set 'ubi8/openjdk-17-runtime' image defined labels
LABEL \
    com.redhat.component="openjdk-17-runtime-ubi8-container" \
    com.redhat.license_terms="https://www.redhat.com/en/about/red-hat-end-user-license-agreements#UBI" \
    description="Image for Red Hat OpenShift providing OpenJDK 17 runtime" \
    io.cekit.version="4.9.1" \
    io.k8s.description="Platform for running plain Java applications (fat-jar and flat classpath)" \
    io.k8s.display-name="Java Applications" \
    io.openshift.tags="java" \
    maintainer="Red Hat OpenJDK <openjdk@redhat.com>" \
    name="ubi8/openjdk-17-runtime" \
    org.opencontainers.image.documentation="https://jboss-container-images.github.io/openjdk/" \
    summary="Image for Red Hat OpenShift providing OpenJDK 17 runtime" \
    usage="https://jboss-container-images.github.io/openjdk/" \
    version="1.18"
# Exposed ports in 'ubi8/openjdk-17-runtime' image
EXPOSE 8080 8443
###### /
###### END image 'ubi8/openjdk-17-runtime:1.18'



# Switch to 'root' user and remove artifacts and modules
USER root
RUN [ ! -d /tmp/scripts ] || rm -rf /tmp/scripts
RUN [ ! -d /tmp/artifacts ] || rm -rf /tmp/artifacts
# Clear package manager metadata
RUN microdnf clean all && [ ! -d /var/cache/yum ] || rm -rf /var/cache/yum

# Define the user
USER 185
# Define the working directory
WORKDIR /home/jboss
# Define run cmd
CMD ["/opt/jboss/container/java/run/run-java.sh"]
## /
## END target image