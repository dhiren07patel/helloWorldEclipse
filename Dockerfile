FROM eclipse-temurin:17-jdk-alpine AS MAVEN_BUILD 

# copy the pom and src code to the container 
COPY ./pom.xml /
COPY ./src /

# package our application code 
RUN mvn clean package 	

# the second stage of our build will use open jdk 17 on alpine 
FROM eclipse-temurin:17-jdk-alpine

# copy only the artifacts we need from the first stage and discard the rest 
# COPY --from=MAVEN_BUILD /docker-multi-stage-build-demo/target/demo-0.0.1-SNAPSHOT.jar /demo.jar 
COPY --from=MAVEN_BUILD /target/spring-boot-docker.jar /spring-boot-docker.jar

# set the startup command to execute the jar 
CMD ["java", "-jar", "/spring-boot-docker.jar"] 

#ENV PORT=8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]


#FROM ubuntu:latest

#RUN apt-get update \
#	&& apt-get install -y unzip wget \
#	&& wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip \
#	&& unzip terraform_1.5.7_linux_amd64.zip \
#	&& mv terraform /usr/local/bin/ \
#	&& chmod +x /usr/local/bin/terraform \
#	&& terraform --version



# Update the package lists and install essential tools
#RUN apt-get update \
#    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \ https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
#     && apt-get update \
#    && apt-get install -y terraform \
#    && echo "terraform -install-autocomplete" > /usr/local/bin/install-autocomplete \ 
#    && chmod +x /usr/local/bin/install-autocomplete
