FROM openjdk:11
ADD https://api.github.com/repos/frcalderon/spring-config-server/git/refs/heads/main version.json
RUN mkdir -p /app
WORKDIR /app
RUN git clone -b main https://github.com/frcalderon/spring-config-server.git .
RUN chmod +x mvnw
RUN ./mvnw clean install -DskipTests
EXPOSE 8888
CMD ["java", "-jar", "target/config-server-0.0.1-SNAPSHOT.jar"]