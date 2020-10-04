FROM jenkins/jenkins:lts

## Pre-install suggested plugins (but not robotframework plugin for demo purposes)
# COPY plugins.txt /usr/share/jenkins/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

## It should be possible to skip the installwizzard by uncommenting the following line
# RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

## Installing python3 for Robotframework (cannot do 3.6 though, this image only supports 3.5)
USER root
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

## Installing robotframework and restinstance library
RUN pip3 install robotframework
## If you need more libraries you can add the pip commands here:
# RUN pip3 install --upgrade robotframework-datadriver 
# RUN pip3 install --upgrade RESTInstance

USER jenkins

EXPOSE 8080