#!/bin/bash

sudo apt update
sudo apt install -y gnupg2 wget

sudo -u adminuser mkdir -p /home/adminuser/miniconda3
sudo -u adminuser wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /home/adminuser/miniconda3/miniconda.sh
sudo -u adminuser bash /home/adminuser/miniconda3/miniconda.sh -b -u -p /home/adminuser/miniconda3
sudo -u adminuser rm /home/adminuser/miniconda3/miniconda.sh

echo 'export PATH="/home/adminuser/miniconda3/bin:$PATH"' | sudo -u adminuser tee -a /home/adminuser/.bashrc


sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
sudo apt update
sudo apt install -y postgresql-16 postgresql-contrib-16 postgresql-client-16


sudo systemctl start postgresql
sudo systemctl enable postgresql