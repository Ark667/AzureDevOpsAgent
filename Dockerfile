FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# Install default modules
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        jq \
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
        default-jre

# Install .net SDKs
RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y dotnet-sdk-3.1
RUN apt-get install -y dotnet-sdk-5.0
RUN apt-get install -y dotnet-sdk-6.0

# Install docker 
RUN apt-get install -y docker.io

# Install powershell
RUN apt-get update
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update
RUN apt-get install -y powershell

# Install Terraform
RUN apt-get install -y unzip
RUN wget -q https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
RUN unzip terraform_1.0.0_linux_amd64.zip
RUN mv terraform /usr/local/bin/
RUN rm terraform_1.0.0_linux_amd64.zip

# Install SqlPackage
RUN wget -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2143497 \
    && unzip sqlpackage.zip -d /tmp/sqlpackage \
    && chmod +x /tmp/sqlpackage/sqlpackage
RUN ln -s /tmp/sqlpackage/sqlpackage /usr/local/bin/sqlpackage

# Install Java
RUN apt-get install default-jre

WORKDIR /azp

# Copy MS pipeline agent script
COPY ./start.sh .
RUN chmod +x start.sh && sed -i -e 's/\r$//' start.sh

CMD ["./start.sh"]
