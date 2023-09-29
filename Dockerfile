#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]


FROM ubuntu:latest
 
RUN apt-get update && apt-get install unzip wget -y \
    && wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
	&& gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint \
	&& echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
	&& apt update \
	&& apt-get install terraform
