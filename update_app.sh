#!/bin/bash
set -e

date
echo "Updating Python application on VM..."
USER=$(whoami)
HOME_DIR=$(eval echo ~$USER)
APP_DIR="$HOME_DIR/Chatbot-Project-Terraform"
REPO_URL="https://github.com/Mohammed78vr/Chatbot-Project-Terraform.git"
BRANCH="stage-6.1-tf"
GITHUB_TOKEN=$TOKEN  # Passed securely via protectedSettings

# Update code
if [ -d "$APP_DIR" ]; then
    sudo -u $USER bash -c "cd $APP_DIR && git fetch origin && git reset --hard origin/$BRANCH"
else
    sudo -u $USER  git clone -b "$BRANCH" "https://${GITHUB_TOKEN}@${REPO_URL}" "$APP_DIR"
fi

# Install dependencies
sudo -u $USER  $HOME_DIR/miniconda3/envs/project/bin/pip install --upgrade pip
sudo -u $USER  $HOME_DIR/miniconda3/envs/project/bin/pip install -r "${APP_DIR}/requirements.txt"

# Restart the service
sudo systemctl restart backend
sudo systemctl is-active --quiet backend || echo "Backend failed to start"
sudo systemctl restart frontend
sudo systemctl is-active --quiet frontend || echo "frontend failed to start"

echo "Python application update completed!"