# -------- Stage 1: Build --------
FROM maven:3.9.5-eclipse-temurin-17 as builder

# Create app directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# -------- Stage 2: Run --------
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the built JAR from stage 1
COPY --from=builder /app/target/*.jar app.jar

# Expose the port used by Spring Boot
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
