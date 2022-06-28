FROM maven:3.8.6-openjdk-11 as builder
COPY src /home/app/src
COPY pom.xml /home/app
RUN export MAVEN_OPTS="-Xms1024m  -Xmx1024m -XX:MaxPermSize=512m"
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:11-jre-slim-buster 
COPY --from=builder /home/app/target/spring-petclinic-2.7.0.jar /home/app/target 
CMD ["java","-jar","/home/app/target/spring-petclinic-2.7.0.jar"]