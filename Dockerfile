FROM maven:3.6.0-jdk-11-slim AS build

COPY src /home/app/src
COPY pom.xml /home/app

RUN mvn -f /home/app/pom.xml clean package 

FROM bellsoft/liberica-openjdk-alpine:11

EXPOSE 8080

COPY --from=build /home/app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]