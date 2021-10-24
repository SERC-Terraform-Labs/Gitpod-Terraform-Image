FROM gitpod/workspace-base

# Install Docker
RUN sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Docker-Compose
RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose

# Install Terrform CLI
RUN curl "https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip" -o "terraform.zip" \
    && unzip terraform.zip \
    && sudo mv ./terraform /usr/local/bin/ \
    && rm terraform.zip

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm awscliv2.zip \
    && rm -rf ./aws

# TODO:? install LocalStack?

# Install Azure CLI
RUN sudo apt-get update && sudo apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg \
    && curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list \
    && sudo apt-get update \
    && sudo apt-get install azure-cli -y \
    && sudo rm -rf /var/lib/apt/lists/*
