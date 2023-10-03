FROM ubi8/ubi:8.3
LABEL description="custom container to run AWS CLI commands" 
MAINTAINER Syed Hassan <shassan@redhat.com>
RUN yum install -y unzip && yum install -y wget
RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" 
RUN unzip awscli-exe-linux-x86_64.zip
RUN ./aws/install 
RUN mkdir ./.aws/
