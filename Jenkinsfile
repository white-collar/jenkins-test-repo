//@Library('jenkins-shared-library')   it's only for shared library


library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
    [
        $class: 'GitSSMSource',
        remote: 'https://github.com/white-collar/jenkins-shared-library.git',
        credentialsId: 'b417c2dc-cfc3-4e58-9a8e-687a803eb1f5'
    ]
)

def gv


pipeline {
    agent any 


    tools{
        maven 'my-maven'
    }

    stages {

        stage('init') {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }


        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                    echo "Executing pipeline for branch $BRANCH_NAME"
                }
            }
        }


        stage('build and push') {

            when {
                expression {
                    BRANCH_NAME == 'java-app-and-test'
                }
            }


            steps {
                script {
                    echo "Building the application...."
                    buildImage 'jeston/demo-app:jma-1.7.9998'
                    dockerLogin()
                    dockerPush 'jeston/demo-app:jma-1.7.9997'
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