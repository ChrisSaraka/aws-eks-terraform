#!/bin/bash

sudo yum update -y

sudo yum install -y git

sudo yum install -y docker

sudo service docker start

sudo usermod -a -G docker ec2-user

sudo usermod -a -G docker jenkins

# docker run --rm -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:2.239

# docker run -it -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:2.239

# docker exec -u 0 -d jenkins /bin/bash -c "apt-get update ; apt-get install -y ansible ; wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip ; unzip terraform_0.12.26_linux_amd64.zip ; mv terraform /usr/local/bin/"

# make sure on Jenkins right terraform version is chosen

sudo systemctl enable docker

sudo apt-get update ; apt-get install -y ansible ; wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip ; unzip terraform_0.12.26_linux_amd64.zip

sudo mv terraform /usr/local/bin/

sudo yum -y install java-1.8.0-openjdk

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum -y install jenkins

sudo systemctl start jenkins

sudo systemctl enable jenkins

sudo chmod 777 /var/run/docker.sock # to allow jenkins execute docker, https://stackoverflow.com/questions/47854463/docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socke


################## INSTALL kubectl UTILITY ON EC2 WITH JENKINS SERVER ##################

# Make sure that you have configured your AWS Credentials on Jenkins correctly:
# Manage Jenkins > Manage Credentials > Stores Scoped to Jenkins > (global) > Add Credentials
# sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
# sudo chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
# vim ~/.kube/config
# curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/aws-iam-authenticator
# chmod +x ./aws-iam-authenticator
# sudo mv aws-iam-authenticator /usr/local/bin
# aws-iam-authenticator version
# kubectl cluster-info
# kubectl version
# vim ~/.aws/credentials



# To install terraform on docker (debian distro)
# wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
# unzip terraform_0.12.26_linux_amd64.zip
# mv terraform /usr/local/bin/

# curl -LO https://git.io/get_helm.sh
# chmod 700 get_helm.sh
# ./get_helm.sh