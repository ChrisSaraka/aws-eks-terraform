pipeline {
	agent any 
	stages {
		stage("SSH to k8s client") {
			steps {
				sshagent(['bootstrap-server']) {
    				sh "scp -o StrictHostKeyChecking=no pods.yaml ec2-user@3.10.112.100:/home/ec2-user/"
    				sh "scp -o StrictHostKeyChecking=no services.yaml ec2-user@3.10.112.100:/home/ec2-user/"
    				sh "ssh ec2-user@3.10.112.100 kubectl apply -f ."
				}
			}
		}
	}
}