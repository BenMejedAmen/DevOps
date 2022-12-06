pipeline {


    agent any
    tools {
        	        maven 'M2_HOME'
			jdk 'JAVA_HOME'
}
 

    stages {


        stage ('Git Checkout') {

            steps {

                git 'https://github.com/BenMejedAmen/DevOps.git'
            }
        }

        stage('Maven version'){
            steps{
                echo "Mavin version ...";
                sh "mvn -version"
            }
        }

         stage('Clean Maven install'){
            steps {
                sh 'mvn clean install'
            }

        }

         stage('Compile Project'){
            steps {
                sh 'mvn compile  -DskipTests'
            }
        }

         stage ('Mockito/Junit') {
             steps {
            
            sh "mvn test"
                echo """Bravo! tous les tests sont pris en charge"""
                }
            }

        stage('integration testing'){
                steps {
            sh 'mvn verify -DskipUnitTests'
         
}
}

stage("Sonar") {
            steps {
script{
		withSonarQubeEnv(credentialsId: 'sonar-api-key') {
   
                sh "mvn clean package sonar:sonar"
}
}
            }
        }

stage('Quality Gate Status'){
steps{
script{
waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api-key'
}
}
}
 stage('upload war file to nexus'){
steps{
script{

def readPomVersion = readMavenPom file: 'pom.xml'

def nexusRepo = readPomVersion.version.endswith("SNAPSHOT") ? "Devops-snapshot" : "Devops-release"
nexusArtifactUploader artifacts: [
[
artifactId: 'ExamThourayaS2',
 classifier: '',
 file: 'target/Devops.jar',
 type: 'jar'
]
], 
credentialsId: 'nexus_auth1', 
groupId: 'tn.esprit', 
nexusUrl: '192.168.33.10:8081', 
nexusVersion: 'nexus3', 
protocol: 'http', 
repository: nexusRepo, 
version: '${readPomVersion.version}'
}
}
}




}
}