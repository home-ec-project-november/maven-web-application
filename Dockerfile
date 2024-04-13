FROM cosmomill/alpine-tomcat-jre8
COPY target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
