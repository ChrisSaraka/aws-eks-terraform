pipeline {
	agent any 
	stages {
		stage("Docker build") {
			steps{
				sh "docker build . -t csarakasidis/devops-machine-learning-repo:v1"

			}
		}
		stage("Docker Hub login") {
			steps {
				withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
    				sh "docker login -u csarakasidis -p ${dockerHubPwd}"
    				sh "docker push csarakasidis/devops-machine-learning-repo:v1"
    			}
			}
		}
		stage("SSH to k8s client") {
			steps {
				sshagent(['bootstrap-server']) {
    				sh "scp -o StrictHostKeyCheckins=no flask-keras-app.yml ec2-user@18.132.93.227:/home/ec2-user/"
    				sh "ssh ec2-user@18.132.93.227 kubectl apply -f flask-keras-app.yml"
				}
			}
		}
	}
}