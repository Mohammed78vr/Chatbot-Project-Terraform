#!/bin/bash

sudo apt update
sudo apt install -y gnupg2 wget git

sudo -u azureuser mkdir -p /home/azureuser/miniconda3
sudo -u azureuser wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/azureuser/miniconda3/miniconda.sh
sudo -u azureuser bash /home/azureuser/miniconda3/miniconda.sh -b -u -p /home/azureuser/miniconda3
sudo -u azureuser rm /home/azureuser/miniconda3/miniconda.sh


echo 'export PATH="/home/azureuser/miniconda3/bin:$PATH"' | sudo -u azureuser tee -a /home/azureuser/.bashrc

sudo -u azureuser git clone https://github.com/Mohammed78vr/Chatbot-Project-Terraform.git /home/azureuser/Chatbot-Project-Terraform

sudo -u azureuser tee /home/azureuser/Chatbot-Project-Terraform/.env <<EOF
OPENAI_API_KEY=<YOUR_API_KEY>
DB_NAME=<DATABASE_NAME>
DB_USER=<DATABASE_USERNAME>
DB_PASSWORD=<DATABASE_PASSWORD>
DB_HOST=<DATABASE_HOST>
DB_PORT=5432
AZURE_STORAGE_SAS_URL=<STORAGE_ACCOUNT_SAS>
AZURE_STORAGE_CONTAINER=<STOREAGE_CONTAINER_NAME>
CHROMADB_HOST=<PRIVATE_IP>
CHROMADB_PORT=8000
EOF

sudo -u azureuser /home/azureuser/miniconda3/bin/conda create -n project python=3.11 -y

sudo -u azureuser /home/azureuser/miniconda3/envs/project/bin/pip install -r /home/azureuser/Chatbot-Project-Terraform/requirements.txt

sudo -u azureuser systemctl restart backend
sudo -u azureuser systemctl restart frontend