# Start with a base image containing Java runtime
FROM openjdk:11-jre-slim

# Add Maintainer Info
LABEL maintainer="alexander.jaballah@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/my-java-app-1.0-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} my-java-app-1.0-SNAPSHOT-jar-with-dependencies.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","target/my-java-app-1.0-SNAPSHOT-jar-with-dependencies.jar"]
