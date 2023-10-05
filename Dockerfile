FROM ubi8/ubi:8.3
LABEL description="custom container to run AWS CLI commands" 
MAINTAINER Syed Hassan <shassan@redhat.com>
RUN yum install -y unzip && yum install -y wget && wget "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" && unzip awscli-exe-linux-x86_64.zip && ./aws/install
RUN rm -rf ./aws && rm -rf awscli-exe-linux-x86_64.zip && mkdir /root/.aws/
COPY ./config /root/.aws/
COPY ./credentials /root/.aws/
