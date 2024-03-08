pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from Git...'
                git branch: 'main', url: 'https://github.com/Osi45/portfolio-website.git'
                echo 'Code checkout completed.'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying code to remote server...'
                sh 'cd ~/Desktop/Osi45/ && rsync -avz --delete . ec2-user@172.31.38.68:/var/www/html'
                echo 'Deployment completed.'
            }
        }
    }
}
