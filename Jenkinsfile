pipeline {
    agent any
     
    stages {
        
      stage('checkout') {
           steps {
             
                git branch: 'develop', url: 'test.git'
             
          }
        }
        
        
        
          stage('Ansible Init') {
            steps {
                script {
                
               def aNHome = tool name: 'Ansible'
               def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                env.PATH = "${aNHome}:${env.PATH}"
                 sh 'ansible --version'
                    
            }
            }
        }
  
        
        stage('Ansible Deploy') {
             
            steps {
                 
                  sh ' cp -rf config ~/.ssh/'
                  sh 'aws s3 sync s3://terraform-tes-development .'
                  sh ' terraform output >>test.txt'
                  sh './generate_ssh-config.sh dev'
                  sh 'ansible-playbook main.yml -i environments/dev/inventory/hosts --extra-vars env=dev'
               
           
            }
        }
      
    }
}    
    
