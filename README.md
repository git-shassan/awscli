# awscli

A simple pod to run AWS CLI . Note that AWSCLI docker container is offered on dockerhub, but to make use of that in K8S environment, you wil need to define an SA locally as well as on IAM. I was looking for a much simpler solution, where I can use an existing IAM user's credentials, hence this pod.

A prebuilt docker image is available at public repo: quay.io/sfhassan/myawscli

## Running as a k8s pod:

The run as a pod: 
```
oc run awscli --image=quay.io/sfhassan/myawscli --image-pull-policy="Always" -- /bin/sh -c "sleep infinity"
```
## Usage:
If you have built the container yourself, and provided it with the config & credentials file, then you can simply use it from command line, as shown here: 
```
 oc exec -it awscli -- aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************inio shared-credentials-file    
secret_key     ****************dhat shared-credentials-file    
    region                us-east-1      config-file    ~/.aws/config
```

But, if the config and credential files were not passed at the time of container creation, then it will need to be configured before running any command 
```
oc exec -it awscli -- /bin/bash
[root@awscli /]# aws configure
AWS Access Key ID [None]: ******
AWS Secret Access Key [None]: *****
Default region name [None]: 
Default output format [None]: 
[root@awscli /]#
```
Finally, to run command against AWS, use the CLI as usual. However, to run the commands against a local implementionation, use the "--endpoint-url" option as shown here: 
```
[root@awscli /]# aws --endpoint-url <s3 url for private S3> s3 ls
2023-09-29 22:48:51 mgmt1-acm
2023-09-29 17:23:57 mgmt2-acm
[root@awscli /]#
```
