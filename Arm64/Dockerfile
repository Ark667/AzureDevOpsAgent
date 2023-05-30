FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install default modules
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
        apt-transport-https \
        apt-utils \
        ca-certificates \
        curl \
        git \
        iputils-ping \
        jq \
        libcurl4 \
        libgdiplus \
        libssl1.0 \
        libunwind8 \
        locales \
        lsb-release \
        mailutils \
        netcat \
        software-properties-common \
        unzip \
        wget

# Install .Net SDK (arm64)
# https://learn.microsoft.com/es-es/dotnet/core/install/linux-ubuntu#troubleshooting
# https://learn.microsoft.com/es-es/dotnet/core/install/linux-scripted-manual#manual-install
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh --channel 7.0
RUN ln -s ~/.dotnet/dotnet /usr/bin/dotnet
RUN dotnet --version

# Install Docker 
RUN apt-get install -y docker.io
RUN docker --version

# Install Powershell (arm64)
RUN curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.3.4/powershell-7.3.4-linux-arm64.tar.gz
RUN mkdir -p /opt/microsoft/powershell/7
RUN tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
RUN chmod +x /opt/microsoft/powershell/7/pwsh
RUN ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
RUN pwsh -version

# Install Terraform (arm64)
RUN wget -q https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_arm64.zip
RUN unzip terraform_1.0.0_linux_arm64.zip
RUN mv terraform /usr/local/bin/
RUN rm terraform_1.0.0_linux_arm64.zip
RUN terraform --version

# # Install SqlPackage
# RUN wget -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=2143497
# RUN unzip sqlpackage.zip -d /tmp/sqlpackage
# RUN chmod +x /tmp/sqlpackage/sqlpackage
# RUN ln -s /tmp/sqlpackage/sqlpackage /usr/local/bin/sqlpackage

# Install Java
RUN apt-get install -y default-jre
RUN java -version

# Install AWS CLI (arm64)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip
RUN rm aws -r
RUN export PATH=/usr/local/bin:$PATH
RUN aws --version

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
ENV TARGETARCH=linux-arm64
WORKDIR /azp

# Copy MS pipeline agent script
COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]
