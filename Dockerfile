FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/demo-*.jar /usr/app/
WORKDIR /usr/app
# ENTRYPOINT ["java", "-jar", "demo-1.0-SNAPSHOT.jar"]
CMD java -jar demo-*.jar