#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]
FROM ubuntu:latest

RUN apt-get update -y \
	&& apt-get install unzip wget -y \
	&& wget --progress=dot:mega https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7}_linux_amd64.zip \
	&& unzip terraform_1.5.7_linux_amd64.zip \ 
	&& mv terraform /usr/local/bin/ \
	&& chmod +x /usr/local/bin/terraform \
	&& terraform --version

