FROM maven:3.8.6-openjdk-11 as builder
COPY src /home/app/src
COPY pom.xml /home/app
RUN export MAVEN_OPTS="-Xms1024m  -Xmx1024m -XX:MaxPermSize=512m"
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:11-jre-slim-buster 
COPY --from=builder /home/app/target/spring-petclinic-1.5.1.jar /home/ 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]