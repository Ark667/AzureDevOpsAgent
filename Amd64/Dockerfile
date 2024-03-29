FROM ubuntu:22.04

# Install default modules
RUN apt update
RUN apt upgrade -y
RUN apt install -y \
        curl \
        git \
        jq \
        libicu70 \
        wget \
        locales \
        mailutils \
        unzip

# Install .net SDKs
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-sdk-6.0
RUN apt-get install -y dotnet-sdk-7.0

# Install Docker 
RUN apt-get install -y docker.io

# Install Powershell
RUN apt-get update
RUN wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y powershell

# Install Terraform
RUN wget -q https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
RUN unzip terraform_1.0.0_linux_amd64.zip
RUN mv terraform /usr/local/bin/
RUN rm terraform_1.0.0_linux_amd64.zip

# Install Java
RUN apt-get install -y default-jre

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip
RUN rm aws -r
RUN export PATH=/usr/local/bin:$PATH

ENV TARGETARCH=linux-amd64
WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN useradd agent
RUN chown agent ./
USER agent

ENTRYPOINT ./start.sh
