# Use JDK base image
FROM eclipse-temurin:17-jdk-alpine

# Create a working directory inside the container
WORKDIR /app

# Copy the built JAR into the container
COPY target/*.jar app.jar

# Expose port 8080 (your WebSocket and REST run here)
EXPOSE 8080

# Command to run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
