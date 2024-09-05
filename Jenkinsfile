pipeline {

    agent any 

    parameters{
        string(name: 'VERSION', defaultValue: '', description: 'version to dpeloy to prod')
        choice(name: 'VERSION', choices: ['1.1.0', 'dev', 'bla1'], description: "")
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }

    environment {
        NEW_VERSION = "1.3.0"
        SERVER_CREDENTIALS = credentials('server-credentials')
    }

    tools{
        maven 'my-maven'
    }

    stages {
        stage("build") {

            steps {
               echo 'Building the application' 
               echo "Building version ${NEW_VERSION}"  
            }
        }

        stage("test") {
            //  when {
            //     expression {
            //         BRANCH_NAME == 'dev' || BRANCH_NAME == 'master' && CODE_CHANGES == true
            //     }
            //  }


            when {
                expression {
                    params.executeTests
                }
            }
            
            steps {
                echo 'Test the application' 
            }
        }

        stage("deploy") {
            
            steps {
                echo 'Deployment the application' 
                echo "deploying with ${SERVER_CREDENTIALS}"
                sh "${SERVER_CREDENTIALS}"

                withCredentials([
                    usernamePassword(credentails: 'server-credentials', usernameVariable: USER, passwordVariable: PWD)]) 
                    {
                    sh "some script ${USER} ${PWD}"
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
        }

        failure {
            echo "failure"
        }
    }

}