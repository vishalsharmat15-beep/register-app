pipeline {
  agent { label 'Jenkins-Agent' }
  tools {
    jdk 'Java21'
    maven 'Maven3'
  }
  environment {
    APP_NAME = "register-app"
    RELEASE = "1.0.0"
    DOCKER_CREDENTIALS = credentials('DocketHub')
    IMAGE_NAME = "${DOCKER_CREDENTIALS_USR}/${APP_NAME}"
    IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
    
  }
  stages {
    stage ("Clean Workspace"){
      steps {
        cleanWs()
      }
    }
    stage ("Checkout SCM"){
      steps {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/vishalsharmat15-beep/register-app.git'
      }
    }
    stage ("Build Application"){
      steps {
        sh "mvn clean package"
      }
    }
    stage ("Test Application"){
      steps {
        sh "mvn test"
      }
    }
    stage ("SonarQube Analysis"){
      steps {
        script{
          withSonarQubeEnv(credentialsId : 'Jenkins-Sonar-Token'){
            sh "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar"
          }
        }
      }
    }
    
    stage ("SonarQube Quality Check"){
      steps {
        script{
            waitForQualityGate abortPipeline: false, credentialsId : 'Jenkins-Sonar-Token'
        }
      }
    }

    stage ("Build & Push Docker Image"){
      steps {
        script {
          docker.withRegistry('','DocketHub') {
            docker_image = docker.build "${IMAGE_NAME}")
            docker_image.push ("${IMAGE_TAG}")
            docker_image.push ("latest")
          }
        }
      }
    }

    
  }
}
