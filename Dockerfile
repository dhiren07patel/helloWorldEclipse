#FROM openjdk:17
#EXPOSE 8080
#ADD target/spring-boot-docker.jar spring-boot-docker.jar
#ENTRYPOINT [ "java", "-jar", "/spring-boot-docker.jar" ]


#FROM ubuntu:latest

#RUN "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/hashicorp.list \ 
# && apt-get update && apt-get install -y unzip wget \
# && wget https://releases.hashicorp.com/terraform/latest/terraform_latest_linux_amd64.zip \
# && unzip terraform_latest_linux_amd64.zip \
# && mv terraform /usr/local/bin/ \
# && chmod +x /usr/local/bin/terraform

FROM ubuntu:latest

ARG TERRAFORM_VERSION=1.5.7

RUN \
	# Update
	apt-get update -y && \
	# Install dependencies
	apt-get install unzip wget -y

################################
# Install Terraform
################################

# Download terraform for linux
RUN wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN \
	# Unzip
	unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
	# Move to local bin
	mv terraform /usr/local/bin/ && \
	# Make it executable
	chmod +x /usr/local/bin/terraform && \
	# Check that it's installed
	terraform --version

CMD ["terraform", "--version"]