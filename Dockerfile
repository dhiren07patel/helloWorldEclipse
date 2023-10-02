#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]

FROM ubuntu:latest

# Update the package lists and install essential tools
RUN apt-get update \
    && apt-get install -y unzip wget \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \ https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
       tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update \
    && apt-get install -y terraform \
    && echo "terraform -install-autocomplete" > /usr/local/bin/install-autocomplete && \
       chmod +x /usr/local/bin/install-autocomplete
