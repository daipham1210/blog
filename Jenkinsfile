pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'bundle install'
        sh 'bundle exec rake assets:precompile'
        sh 'bundle exec rubocop'
        sh 'bundle exec rake db:migrate'
      }
    }
    stage('Test') {
      steps {
          echo 'Testing..'
      }
    }
    stage('Deploy') {
      steps {
          echo 'Deploying....'
      }
    }
  }
}