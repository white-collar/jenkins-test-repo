@Library('jenkins-shared-library')
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


        stage('build') {

            when {
                expression {
                    BRANCH_NAME == 'java-app-and-test'
                }
            }


            steps {
                script {
                    echo "Building the application...."
                    buildImage 'jeston/demo-app:jma-1.7.999'
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