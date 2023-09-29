#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]
	
FROM ubuntu:latest

RUN apt update && apt install -y unzip wget

RUN wget https://releases.hashicorp.com/terraform/latest/terraform_latest_linux_amd64.zip

RUN unzip terraform_latest_linux_amd64.zip && mv terraform /usr/local/bin/

RUN chmod +x /usr/local/bin/terraform

CMD ["terraform", "--version"]

