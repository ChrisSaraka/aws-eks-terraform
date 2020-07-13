pipeline {
	agent any 
	stages {
		stage("Docker build") {
			steps{
				sh "docker build -t csarakasidis/devops-machine-learning-repo:v1"

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
	}
}