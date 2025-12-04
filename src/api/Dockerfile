FROM maven:3.9.6-eclipse-temurin-17 AS build
#une image avec Maven + Java 17 pour compiler.
WORKDIR /app
COPY . .

#On met tout ton projet dans /app.
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
#Image très légère pour exécuter Java.
COPY --from=build /app/target/*.jar app.jar
#le JAR compilé dans l’image finale.
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
