FROM java:8
WORKDIR /app
ADD api-backend-0.0.1-SNAPSHOT.jar api-backend-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","/app/target/api-backend-0.0.1-SNAPSHOT.jar"]

