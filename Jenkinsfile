pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building ...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying ...'
            }
        }
        stage('Test') {
            steps {
                sh 'robot -d results -i intake rf-tests'
            }
            post {
                always {            
                    script {
                      step(
                        [
                          $class                    : 'RobotPublisher',
                          outputPath                : 'results',
                          outputFileName            : "*.xml",
                          reportFileName            : "report.html",
                          logFileName               : "log.html",
                          disableArchiveOutput      : false,
                          passThreshold             : 100,
                          unstableThreshold         : 95.0,
                          otherFiles                : "*.png"
                        ]
                      )
                    }  
                }
            }
        }
    }
}