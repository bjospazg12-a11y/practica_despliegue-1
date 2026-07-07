pipeline {
    agent any

    tools {
        nodejs "Node22" 
        dockerTool 'Dockertool' 
    }

    stages {
        stage('Construir Imagen Docker') {
            steps {
                script {
                    // 1. Buscamos dónde guardó Jenkins tu 'Dockertool'
                    def dockerHome = tool 'Dockertool'
                    
                    // 2. Activamos la herramienta inyectándola en el entorno de este bloque
                    withEnv(["PATH+DOCKER=${dockerHome}"]) {
                        
                        sh 'docker build -t hola-mundo-node:latest .'
                        
                    }
                }
            }
        }

        stage('Ejecutar Contenedor Node.js') {
            steps {
                script {
                    def dockerHome = tool 'Dockertool'
                    
                    // Repetimos el bloque withEnv para que esta etapa también reconozca el comando 'docker'
                    withEnv(["PATH+DOCKER=${dockerHome}"]) {
                        sh '''
                            # Detener y eliminar cualquier contenedor previo
                            docker stop hola-mundo-node || true
                            docker rm hola-mundo-node || true

                            # Ejecutar el contenedor de la aplicación
                            docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                        '''
                    }
                }
            }
        }
    }
}