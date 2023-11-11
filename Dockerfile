FROM openjdk:14
EXPOSE 8080
ADD target/devops-java-test-0.0.1-SNAPSHOT.jar devops-automation.jar
ENTRYPOINT ["java","-jar","/devops-automation.jar"]