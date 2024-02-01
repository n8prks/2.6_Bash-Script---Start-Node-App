Write a bash script with following logic:

    Install NodeJS and NPM and print out which versions were installed
    Download an artifact file from the URL: https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz. Hint: use curl or wget
        Unzip the downloaded file
        Set the following needed environment variables: APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
        Change into the unzipped package directory
        Run the NodeJS application by executing the following commands:  npm install and node server.js 


Make executable:

    chmod +x install_and_run.sh

Execute it:

    ./install_and_run.sh
