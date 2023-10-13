
# Use an official Maven runtime as a parent image
FROM maven:3.8.2-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project's POM file and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the rest of the application code to the container
COPY src ./src

# Build the application
RUN mvn package

# Use a smaller base image for the runtime
FROM openjdk:17-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build container
COPY --from=build /app/target/spring-boot-docker.jar .

# Specify the command to run your application
CMD ["java", "-jar", "spring-boot-docker.jar"]

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
