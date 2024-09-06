def gv

pipeline {

    agent any 

    parameters{
        string(name: 'VERSION', defaultValue: '', description: 'version to dpeloy to prod')
        choice(name: 'VERSION_CHOICE', choices: ['1.1.0', 'dev', 'bla1'], description: "this is test versions")
        booleanParam(name: 'executeTests', defaultValue: true, description: 'this is test boolean')
    }

    environment {
        NEW_VERSION = "1.3.0"
        SERVER_CREDENTIALS = credentials('server-credentials')
    }

    tools{
        maven 'my-maven'
    }

    stages {


        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }


        stage("build") {

            script{
                gv.buildApp()
            }
        }

        stage("test") {
            
            when {
                expression {
                    params.executeTests
                }
            }
            
            steps {
                gv.testApp()
            }
        }

        stage("deploy") {
            
            steps {

                gv.deployApp()
                
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