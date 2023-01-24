pipeline {
    agent any
    // triggers { gitlab(hooks: true) }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/dan-holmes/DevOps-Course-Workshop-Module-07-Learners.git', branch: 'main'
            }
        }
        stage('Build C#') {
            steps {
                sh 'dotnet build'
            }
        }
        stage('Install Javascript Dependencies') {
            steps {
                sh 'cd ./DotnetTemplate.Web && npm install'
            }
        }
        stage('Build Javascript') {
            steps {
                sh 'cd ./DotnetTemplate.Web && npm run build'
            }
        }
        stage('Dotnet tests') {
            steps {
                sh 'dotnet test'
            }
        }
        stage('Typescript tests') {
            steps {
                sh 'cd ./DotnetTemplate.Web && npm t'
            }
        }
        stage('Lint') {
            steps {
                sh 'cd ./DotnetTemplate.Web && npm run lint'
            }
        }
    }
    post {
        success {
            slackSend color: 'good', message: 'Successfully ran pipeline'
        }
        failure {
            slackSend color: 'danger', message: 'Failed to run pipeline'
        }
    }
}
