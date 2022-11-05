FROM maven:3-jdk-8-alpine

WORKDIR /build
COPY . /build
RUN mvn clean install
RUN pwd
RUN ls
ENTRYPOINT ["java", "-jar", "/build/target/my-app-0.0.1-SNAPSHOT.jar"]

