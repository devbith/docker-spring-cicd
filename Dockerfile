# syntax=docker/dockerfile:1

FROM openjdk:16-alpine3.13

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml settings.xml ./
RUN ./mvnw dependency:go-offline -s settings.xml

COPY src ./src


CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=mysql"]


