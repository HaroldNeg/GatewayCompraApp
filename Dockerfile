FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY target/gateway-server-1.0.0.jar gateway-server.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "gateway-server.jar", "--spring.profiles.active=docker"]
