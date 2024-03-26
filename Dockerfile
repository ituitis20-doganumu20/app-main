# Build Stage
FROM maven:3.8.4 AS build
WORKDIR /app-main
COPY pom.xml .
COPY src ./src
RUN mvn package

# Runtime Stage
FROM openjdk:11.0.12-jre-slim
WORKDIR /app-main
COPY --from=build /app-main/target/app-0.0.1-SNAPSHOT.jar .
EXPOSE 9001
CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.jar"]

