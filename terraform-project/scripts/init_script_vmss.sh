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
OPENAI_API_KEY=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
DB_NAME=chatbotdb
DB_USER=azureadmin
DB_PASSWORD=Weclouddata1
DB_HOST=dataserver.postgres.database.azure.com
DB_PORT=5432
AZURE_STORAGE_SAS_URL=https://stg601.blob.core.windows.net/?sv=2024-11-04&ss=b&srt=sco&sp=rwdlaciytfx&se=2025-04-08T16:49:11Z&st=2025-04-08T08:49:11Z&spr=https&sig=nb5wQMVZ9lTorxzl%2BtufJd8pG6kXeGSDUEnQkvS7Xhs%3D
AZURE_STORAGE_CONTAINER=chat-history
CHROMADB_HOST=10.0.2.4
CHROMADB_PORT=8000
EOF

sudo -u azureuser /home/azureuser/miniconda3/bin/conda create -n project python=3.11 -y

sudo -u azureuser /home/azureuser/miniconda3/envs/project/bin/pip install -r /home/azureuser/Chatbot-Project-Terraform/requirements.txt

sudo -u azureuser systemctl restart backend
sudo -u azureuser systemctl restart frontend