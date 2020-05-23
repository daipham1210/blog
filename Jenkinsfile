pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'gem install bundler  --no-ri --no-rdoc'
        sh 'bundle install --jobs=4'
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