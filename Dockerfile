FROM maven:3.8.6-openjdk-11 as builder
COPY . .
RUN mvn clean install

FROM openjdk:8-jre-alpine 
COPY --from=builder /target/spring-petclinic-1.5.1.jar /home/ 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]