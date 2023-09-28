#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]


FROM ubuntu:latest

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/hashicorp.list \
  && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

RUN apt-get update && apt-get install -y unzip wget

RUN wget https://releases.hashicorp.com/terraform/latest/terraform_latest_linux_amd64.zip

RUN unzip terraform_latest_linux_amd64.zip \
  && mv terraform /usr/local/bin/

RUN chmod +x /usr/local/bin/terraform

CMD ["terraform", "--version"]