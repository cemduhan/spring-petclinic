FROM maven:3.5.0 as build
COPY * *
RUN mvn clean install


FROM openjdk:8-jre-alpine 
COPY /target/spring-petclinic-1.5.1.jar /home/spring-petclinic-1.5.1.jar 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]