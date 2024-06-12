FROM ubuntu:22.04

# Evitar preguntas al configurar paquetes
ENV DEBIAN_FRONTEND=noninteractive

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
# https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual#scripted-install
# https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh --channel 6.0 --install-dir /usr/share/dotnet
RUN ./dotnet-install.sh --channel 7.0 --install-dir /usr/share/dotnet
RUN ./dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet
ENV DOTNET_ROOT=/usr/share/dotnet
ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

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
RUN apt-get install -y openjdk-17-jre
RUN java -version

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip
RUN rm aws -r
RUN export PATH=$PATH:/usr/local/bin

WORKDIR /azp/

ENV AGENT_ALLOW_RUNASROOT="true"
ENV TARGETARCH=linux-x64
COPY ../start.sh ./start.sh
RUN chmod +x ./start.sh

ENTRYPOINT ./start.sh
