pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build') {
      steps {
        echo 'Building application...'
        // Adicione aqui os passos para construir a aplicação, se necessário
      }
    }

    stage('Start container') {
      steps {
        bat 'docker-compose -f docker-compose.prod.yml up -d --no-color'
         bat 'docker-compose -f docker-compose.prod.yml ps'
      }
    }

    stage('Run tests against the container') {
      steps {
        sleep time: 30, unit: 'SECONDS'
        bat 'curl http://localhost:8585'
      }
    }

    stage('Cleanup') {
      steps {
        echo 'Cleaning up...'
        bat 'docker-compose -f docker-compose.prod.yml down'
      }
    }
  }

  post {
    always {
      echo 'Pipeline completed'
      bat 'docker-compose -f docker-compose.prod.yml down'
    }
  }
}