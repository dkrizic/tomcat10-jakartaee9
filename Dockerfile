FROM maven as builder
RUN mkdir -p /src
COPY src /src
COPY pom.xml /src
WORKDIR /src
RUN mvn package

FROM tomcat:10
COPY --from=builder /src/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
