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

    stage("Build Docker Image") {
      steps {
        script {
            docker_image = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
          }
        }
      }

    stage("Trivy Scan") {
      steps {
        sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image ${IMAGE_NAME}:${IMAGE_TAG} --no-progress  --scanners vuln --exit-code 1 --severity HIGH,CRITICAL --format table'
        }
      }

    stage("Push Docker Image") {
      steps {
        script {
            docker.withRegistry('', 'DocketHub') {
                docker_image.push("${IMAGE_TAG}")
                docker_image.push("latest")
            }
          }
        }
      }

    stage("Cleanup Docker Images") {
      steps {
        script {
            sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
            sh "docker rmi ${IMAGE_NAME}:latest"
            }
          }
        }

    stage("Trigger Deployment Job") {
      steps {
        script {
          sh "curl -v -k \
          --user clouduser:$JENKINS_API_TOKEN \
          -X POST \
          -H 'Content-Type: application/x-www-form-urlencoded' \
          --data 'IMAGE_TAG=$IMAGE_TAG' \
          'http://10.0.0.141:8080/job/GitOps-Register-App%20CD/buildWithParameters?token=gitops-token'"  
        }
      }
    }

  }
}
