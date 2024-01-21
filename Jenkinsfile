node('nodes'){
    
    def mavenHome = tool name: "Maven3.9.6"
    stage('CheckOutCode')
    {
        git branch: 'development', credentialsId: '881adacc-acbb-4463-b9e1-da64f1b5f9c7', url: 'https://github.com/home-ec-project-november/maven-web-application.git'
    }
    stage('Build')
    {
        sh "${mavenHome}/bin/mvn clean package"
    }
    /*stage('SonarQubeReport')
    {
        sh "${mavenHome}/bin/mvn clean sonar:sonar"
    }
    */
    stage('UploadArtifactsIntoNexus')
    {
        sh "${mavenHome}/bin/mvn clean deploy"
    }
    /*
    stage('DeployAppIntoTomcatServer')
    { 
            sshagent(['e04b4102-ecb8-46d3-8fc7-38999b82d70c']) {
        sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@35.157.76.240:/opt/tomcat/webapps"
        }
    }  
    */
    stage('SendEmailNotification')
    {
        emailext body: 'Build is over !', subject: 'Build over!', to: 'k.ravshan1972@gmail.com'
    }
    */
}
