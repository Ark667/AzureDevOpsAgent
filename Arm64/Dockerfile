FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install default modules
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        apt-transport-https \
        apt-utils \
        ca-certificates \
        curl \
        jq \
        lsb-release \
        software-properties-common \
        git \
        iputils-ping \
        libcurl4 \
        libunwind8 \
        netcat \
        libssl1.0 \
        wget \
        libgdiplus \
        locales \
        mailutils \
        unzip

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install .net SDKs
# https://learn.microsoft.com/es-es/dotnet/core/install/linux-ubuntu#troubleshooting
# https://learn.microsoft.com/es-es/dotnet/core/install/linux-scripted-manual#manual-install
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh --channel 7.0

# Install Docker 
RUN apt-get install -y docker.io

# # Install Powershell
# RUN apt-get update
# RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# RUN dpkg -i packages-microsoft-prod.deb
# RUN apt-get update
# RUN apt-get install -y powershell

# Install Terraform
RUN wget -q https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_arm64.zip
RUN unzip terraform_1.0.0_linux_arm64.zip
RUN mv terraform /usr/local/bin/
RUN rm terraform_1.0.0_linux_arm64.zip

# Install SqlPackage
RUN wget -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2143497
RUN unzip sqlpackage.zip -d /tmp/sqlpackage
RUN chmod +x /tmp/sqlpackage/sqlpackage
RUN ln -s /tmp/sqlpackage/sqlpackage /usr/local/bin/sqlpackage

# Install Java
RUN apt-get install default-jre

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip
RUN rm aws -r
RUN export PATH=/usr/local/bin:$PATH

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
ENV TARGETARCH=linux-arm64
WORKDIR /azp

# Copy MS pipeline agent script
COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]