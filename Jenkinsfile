pipeline{

	agent any

	environment {
        DOCKER_USER=credentials('dockerusername')
        DOCKER_PASSWORD=credentials('dockerpassword')
	}

	stages {

		stage('Build') {

			steps {
				sh '''
                cd my-app
                docker build -t rajeevnani9876/onemuthoot .
                dcoker images

                '''
			}
		}

		stage('Login') {

			steps {
				sh '''
                docker login -u DOCKER_USER -p DOCKER_PASSWORD
                '''
			}
		}

		stage('Push') {

			steps {
				sh 'docker push rajeevnani9876/onemuthoot'
			}
		}
	}

	post {
        always {
            emailext body: 'Build notification', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Build Notification'
        }
	}

}
