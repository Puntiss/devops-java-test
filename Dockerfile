FROM openjdk:14-slim
WORKDIR /app
EXPOSE 8080
COPY target/devops-java-test-0.0.1-SNAPSHOT.jar devops-automation.jar
CMD ["java","-jar","/devops-automation.jar"]