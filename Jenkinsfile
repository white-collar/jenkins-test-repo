//@Library('jenkins-shared-library')   it's only for shared library


library identifier: 'jenkins-shared-library@main', retriever: modernSCM(
    [
        $class: 'GitSCMSource',
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


        stage('increment version') {
            steps {
                script {
                    echo 'incrementing app version....'
                    sh "mvn clean package"
                    // sh 'mvn build-helper: parse-version versions: set \
                    // -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.newIncrementalversion} \
                    // versions:commit'
                    def matcher = readFile("pom.xml") =~ '<version>(.+)</version>'
                    def version = matcher[0][1] 
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
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


        stage('commit version update') {
            steps {
                script {
                    withCredentials([usernamePassword (credentialsId: 'gitlab-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'git config user.email "jenkins@example.com"'
                        sh 'git config user.name "jenkins"'
                        
                        
                        sh 'git status'
                        sh 'git branch'
                        sh 'git config --list'
                        
                        
                        sh "get remote set-url origin https://${USER}:${PASS}@github.com/white-collar/jenkins-test-repo.git"
                        sh 'git add .'
                        sh 'git commit -m "ci:version bump"'
                        sh 'git push origin main HEAD:jenkins-jobs'
                    }
                }
            }
        }
    }
}