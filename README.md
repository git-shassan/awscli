# awscli

A simple pod to run AWS CLI . Note that AWSCLI docker container is offered on dockerhub, but to make use of that in K8S environment, you wil need to define an SA locally as well as on IAM. I was looking for a much simpler solution, where I can use an existing IAM user's credentials, hence this pod.

The dockerfile is as shown here:
```
FROM ubi8/ubi:8.3
LABEL description="custom container to run AWS CLI commands" 
MAINTAINER Syed Hassan <shassan@redhat.com>
RUN yum install -y unzip && yum install -y wget
RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" 
RUN unzip awscli-exe-linux-x86_64.zip
RUN ./aws/install 
RUN mkdir ./.aws/
```
