pipeline {


    agent any
 

    stages {


        stage ('Git Checkout') {

            steps {

                git 'https://github.com/BenMejedAmen/DevOps.git'
            }
        }
        stage ('UNIT Testing') {

            steps {

                sh 'mvm test'
            }
        }
}


}