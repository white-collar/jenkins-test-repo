pipeline {
    agent none 

   stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                    echo "Executing pipeline for branch $BRANCH_NAME"
                }
            }
        }


    stages {
        stage('build') {

            when {
                expression {
                    BRANCH_NAME == 'java-app-and-test'
                }
            }


            steps {
                script {
                    echo "Building the application...."
                }
            }
        }



        stage('deploy') {

            when {
                expression {
                    BRANCH_NAME == 'java-app-and-test'
                }
            }


            steps {
                script {
                    echo "Deploying the application"
                }
            }
            
        }
    }
}