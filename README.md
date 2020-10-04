# Jenkins and Robotframework

This repo is for demo purposes and to have a reference setup for learning and playing around with Jenkins and Robotframework.

This reference can also be used if you have your own installation of Jenkins with robotframework installed on a node, but for ease of use some steps to have a working installation running in docker is included, together with a Dockerfile.

## Build and start your own docker container with Jenkins
>If you already have a working Jenkins please skip to the  section [Configure Jenkins for Robotframework](#configure-jenkins-for-robotframework).

Build your container including robotframework:

`docker build -t demo-jenkins:latest .`

Spin up your jenkins installation:

`docker run --rm -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home demo-jenkins:latest`

## Get Jenkins up and running
Now connect to your jenkins by putting the next link into your browser:
http://localhost:8080

Follow the steps following the execution of the first command to the screen "Jenkins is ready!" from this Tutorial: [Quick tutorial of Jenkins](https://medium.com/@gustavo.guss/quick-tutorial-of-jenkins-b99d5f5889f2)

## Configure Jenkins for Robotframework
Getting started with Robotframework on Jenkins:

### Install the RF plugin
1. Manage Jenkins -> Manage Plugins
2. Search for Robotframework
3. Install

### Using a Freestyle project
1. New Item
2. Freestyle project
3. Source Code Management -> Git
    1. Fill in the details for your repo
4. Build -> Add Build Step -> Execute Shell
    1. Fill in the command to run robotframework: 
    `robot -d results -i intake rf-tests`
5. Post-Build Actions -> Publish Robot Framework test results
    1. Fill in the folder where the results go
    2. Fill in the thresholds
6. Save and run your Job

### Using a pipeline
1. New Item
2. Pipeline
3. Pipeline -> Definition -> Pipeline script from SCM
    1. SCM -> Git and fill in the details
    2. Script path -> set path to Jenkinsfile
4. Define the stages and steps in your Jenkinsfile (see example included Jenkinsfile)
6. Save and run your Job

## Reports
To show reports you need to run the following script in the Script Console (Open via: Manage Jenkins -> Script Console)

```System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")```

## Resources
Using Jenkins in Docker:
https://medium.com/@gustavo.guss/quick-tutorial-of-jenkins-b99d5f5889f2

Setting up a Freestyle project for RF-tests
https://medium.com/faun/setting-up-your-jenkins-machine-to-execute-robot-framework-automation-tests-a98b3e599119
