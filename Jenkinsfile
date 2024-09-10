pipeline {

    agent any 

    tools{
        maven 'my-maven'
    }

    stages {

        stage("init") {
            steps {
                script {
                    echo "Init the build ...."
                    gv = load "script.groovy"
                }
            }
        }


        stage("build jar") {

            steps {
                script{
                    echo "building the application ..."
                    sh 'mvn package'
                }
            }   
        }


       stage("build image") {

            steps {
                script{
                    echo "building the docker image ..."
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'docker build -t jeston/demo-app:jma-1.7.7 .'
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh 'docker push jeston/demo-app:jma-1.7.7' 
                    }
                }
            }   
        }


    }

    post {
        always {
            echo "always"        
        }

        success {
            echo "success"
            echo "printing VERSION " + params.VERSION
        }

        failure {
            echo "failure"
        }
    }

}