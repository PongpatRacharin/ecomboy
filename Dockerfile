# Use a base image with JDK
FROM openjdk:17-jdk-slim
LABEL authors="ping"

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file to the container
COPY target/EComboyApplication.jar app.jar

# Expose the application port (default is 8080)
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]