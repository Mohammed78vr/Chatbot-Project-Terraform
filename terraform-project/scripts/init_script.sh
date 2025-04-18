#!/bin/bash

sudo apt update
sudo apt install -y gnupg2 wget

sudo -u azureuser mkdir -p /home/azureuser/miniconda3
sudo -u azureuser wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/azureuser/miniconda3/miniconda.sh
sudo -u azureuser bash /home/azureuser/miniconda3/miniconda.sh -b -u -p /home/azureuser/miniconda3
sudo -u azureuser rm /home/azureuser/miniconda3/miniconda.sh

echo 'export PATH="/home/azureuser/miniconda3/bin:$PATH"' | sudo -u azureuser tee -a /home/azureuser/.bashrc