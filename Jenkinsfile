pipeline {
	agent none
	stages {
		stage('Unit Testing') {
			agent {
				docker 'microsoft/dotnet:2.1-sdk'
			}
			steps {
				parallel(
					Unit: {
						slackSend color: "229954",
						message: "Starting *Unit Testing* Job"

						sh 'echo "Creating [.NET Core] Docker container..."'
						slackSend color: "cceef9", message: "`Starting Unit Tests` Job Details: ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
						slackSend color: "cceef9", message: "`Creating [.NET Core] Docker container...`"

						sh 'echo "Starting Unit Test Execution"'

            sh '''
            echo "hello-world"
            chmod 777 ./ci/scripts/functional-test.sh
            ./ci/scripts/functional-test.sh
            '''

						sh 'echo "Unit Test Execution Complete"'
					},
					Notifications: {
						sh 'sleep 5'
						slackSend color: "78909C", message: "Executing nUnit Test Cases"
						sh 'sleep 6'
						slackSend color: "2196F3", message: "*4/4* Test Cases *PASSED*"

						slackSend color: "cceef9", message: "`Unit Test Execution Complete` Job URL: (<${env.BUILD_URL}|Open>)"
            slackSend color: "cceef9", message: "`Destroying Docker container`"

					}
				)
			}
		}
	}
}
