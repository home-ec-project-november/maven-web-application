FROM tomcat:9.0.87-jdk8-corretto-al2
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
