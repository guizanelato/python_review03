pipeline {
    
    agent {
        
        label "vm-developer"
    }
    
    environment {
        registry = "guizanelato/flask_review3"
        registryCredentials = 'docker_registry'
    }
    
    stages{
      stage('checkout repositorio'){
          steps{
              cleanWs()
              git "https://github.com/guizanelato/python_review03.git"
          }
          
      }
      stage('build da imagem'){
          steps{
              script{
                imagem = docker.build(registry + "$BUILD_NUMBER")   
          
              }  
            }
      }
      
      stage('testes'){
          steps{
              script{
                  imagem.inside("--name pyapp"){
                      sh "python -m unittest tests/teste_rota.py"
                  }
                  
              }
          }
      }
      stage('subir no dockerhub'){
          steps{
             script{ 
                  docker.withRegistry("", registryCredentials){
                      imagem.push()
               }
              }
          }
      }
    }  
      
    
}
