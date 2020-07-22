pipeline {
	agent any 
	stages {
		stage("SSH to k8s client") {
			steps {
				sshagent(['bootstrap-server']) {
    				sh "scp -o StrictHostKeyChecking=no pods.yaml ec2-user@35.179.54.243:/home/ec2-user/"
    				sh "scp -o StrictHostKeyChecking=no services.yaml ec2-user@35.179.54.243:/home/ec2-user/"
    				sh "scp -o StrictHostKeyChecking=no db-pod-service.yaml ec2-user@35.179.54.243:/home/ec2-user/"
    				sh "ssh ec2-user@35.179.54.243 kubectl apply -f ."
				}
			}
		}
	}
}
