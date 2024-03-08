pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Osi45/portfolio-website.git'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'rsync -avz --delete .cd ~/Desktop/Osi45/* ec2-user@172.31.38.68:/var/www/html' 
                
            }
        }
    }

    post {
        always {
            
        }
    }
}
