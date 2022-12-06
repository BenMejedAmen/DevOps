FROM openjdk:8-jdk-alpine
EXPOSE 8083
ADD ./target/Devops.jar test-docker.jar
ENTRYPOINT ["java","-jar","/test-docker.jar"]