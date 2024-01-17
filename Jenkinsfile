node{
    
    def mavenHome = tool name: "Maven3.9.6"
    stage('CheckOutCode')
    {
        git branch: 'development', credentialsId: '881adacc-acbb-4463-b9e1-da64f1b5f9c7', url: 'https://github.com/home-ec-project-november/maven-web-application.git'
    }
    stage('Build')
    {
        sh "${mavenHome}/bin/mvn clean package"
    }
    stage('SonarQubeReport')
    {
        sh "${mavenHome}/bin/mvn clean sonar:sonar"
    }
    stage('UploadArtifactsIntoNexus')
    {
        sh "${mavenHome}/bin/mvn clean deploy"
    }
    stage('DeployAppIntoTomcatServer')
    {   
        sshagent(['a4a81040-a1d1-422a-a1fc-28ec9192f0e4']) {
        sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.71.109.95:/opt/tomcat/webapps"
        }
    }  
    /*
    stage('SendEmailNotification')
    {
        emailext body: 'Build is over !', subject: 'Build over!', to: 'k.ravshan1972@gmail.com'
    }
    */
}
