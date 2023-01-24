pipeline {
    agent none
    stages {
        stage('Dotnet Build & Test') {
            agent { label: 'dotnet'}
            steps {
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
        stage('Javascript Build & Test') {
            agent node:17-bullseye
            steps {
                sh 'cd ./DotnetTemplate.Web && npm install'
                sh 'cd ./DotnetTemplate.Web && npm run build'
                sh 'cd ./DotnetTemplate.Web && npm t'
                sh 'cd ./DotnetTemplate.Web && npm run lint'
            }
        }
    }
}
