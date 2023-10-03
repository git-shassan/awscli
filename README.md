# awscli

A simple pod to run AWS CLI . Note that AWSCLI docker container is offered on dockerhub, but to make use of that in K8S environment, you wil need to define an SA locally as well as on IAM. I was looking for a much simpler solution, where I can use an existing IAM user's credentials, hence this pod.

A prebuilt docker image is available at public repo: quay.io/sfhassan/myawscli

The run as a pod: 
```
oc run awscli --image=quay.io/sfhassan/myawscli -- /bin/sh -c "sleep 1000"
oc exec -it awscli -- /bin/bash
[root@awscli /]# aws configure
AWS Access Key ID [None]: ******
AWS Secret Access Key [None]: *****
Default region name [None]: 
Default output format [None]: 
[root@awscli /]# 
[root@awscli /]# aws --endpoint-url <s3 url for private S3> s3 ls
2023-09-29 22:48:51 mgmt1-acm
2023-09-29 17:23:57 mgmt2-acm
[root@awscli /]#
```
