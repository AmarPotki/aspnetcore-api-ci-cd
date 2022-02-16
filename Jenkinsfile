pipeline {
  agent any
  stages {
    stage('stage1') {
      steps {
        sh ' echo "This is build number $BUILD_NUMBER of demo $Demo"'
      }
    }

  }
  environment {
    Demo = '1'
  }
}