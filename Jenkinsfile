pipeline {
    agent none
    stages {
        stage('Dotnet Build & Test') {
            agent { docker { 
                image 'mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim'
                args '-u root'
             },}
            steps {
                sh 'dotnet build'
                sh 'dotnet test'
            }
        }
        stage('Javascript Build & Test') {
            agent { docker {
                image 'node:16.13.0-buster-slim'
                args '-u root'
            } }
            steps {
                sh 'cd ./DotnetTemplate.Web && npm install'
                sh 'cd ./DotnetTemplate.Web && npm run build'
                sh 'cd ./DotnetTemplate.Web && npm t'
                sh 'cd ./DotnetTemplate.Web && npm run lint'
            }
        }
    }
}
