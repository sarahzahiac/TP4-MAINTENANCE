
FROM maven:3.9.11-eclipse-temurin-21 AS build

WORKDIR /build

ENV JAVA_HOME=/opt/java/openjdk-21
ENV PATH="${JAVA_HOME}/bin:${PATH}"

COPY src/api/pom.xml .
RUN ["mvn", "dependency:resolve", "-U"]

COPY /src/api/src ./src
RUN ["mvn", "clean", "package", "-DskipTests"]

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
EXPOSE 8080

COPY --from=build /build/target/*.jar /app/*.jar
ENTRYPOINT ["java", "-jar", "/app/*.jar"]
