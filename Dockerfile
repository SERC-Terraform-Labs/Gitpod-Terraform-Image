FROM gitpod/workspace-base

# Install Docker
RUN sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg lsb-release \
    && sudo mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && sudo chmod a+r /etc/apt/keyrings/docker.gpg \
    && sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Terrform CLI
RUN curl "https://releases.hashicorp.com/terraform/1.3.4/terraform_1.3.4_linux_amd64.zip" -o "terraform.zip" \
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
