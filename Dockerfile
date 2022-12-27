FROM openjdk:11
RUN mkdir -p /app
WORKDIR /app
RUN git clone https://github.com/frcalderon/spring-config-server.git .
RUN chmod +x mvnw
RUN ./mvnw clean install
EXPOSE 8888
CMD ["java", "-jar", "config-server-0.0.1-SNAPSHOT.jar"]