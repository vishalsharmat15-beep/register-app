pipeline {
  agent { label 'Jenkins-Agent' }
  tools {
    jdk 'Java21'
    maven 'Maven3'
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
    
  }
}
