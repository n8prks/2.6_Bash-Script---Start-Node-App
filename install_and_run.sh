#!/bin/bash

# Function to check if a command is available
check_command() {
  command -v "$1" >/dev/null 2>&1 || { echo >&2 "$1 is not installed. Aborting."; exit 1; }
}

# Function to download and unzip the artifact
download_and_unzip() {
  url=$1
  filename=$(basename "$url")

  echo "Downloading artifact from $url..."
  curl -O "$url"

  echo "Unzipping $filename..."
  tar -xzvf "$filename"
}

# Install NodeJS and NPM
check_command "curl"
check_command "tar"
check_command "node"

echo "Installing NodeJS and NPM..."
curl -sL https://deb.nodesource.com/setup_latest | sudo -E bash -
sudo apt-get install -y nodejs

# Print installed NodeJS and NPM versions
echo "NodeJS version: $(node --version)"
echo "NPM version: $(npm --version)"

# Download and unzip the artifact
download_and_unzip "https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"

# Set environment variables
export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

# Change into the package directory
cd package

# Run NodeJS application in the background
echo "Running npm install..."
npm install

echo "Running node server.js in the background..."
nohup node server.js &

echo "NodeJS application is now running in the background."
echo "You can check the logs in nohup.out."
