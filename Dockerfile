FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/Devops.jar /app/
EXPOSE 8083
CMD [ "java","-jar","Devops.jar" ]