# Use the official Tomcat 10.1 image with JDK 17
FROM tomcat:10.1-jdk17

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory for Maven build
WORKDIR /app

# Copy the Maven project (pom.xml and src)
COPY . .

# Build the application
RUN mvn clean install

# Remove default ROOT application and copy the WAR file to the Tomcat webapps directory
RUN rm -rf /usr/local/tomcat/webapps/ROOT && \
    cp target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080
