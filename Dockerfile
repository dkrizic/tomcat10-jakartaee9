FROM maven as builder
COPY . /
RUN mvn package

FROM tomcat:10
COPY --from=builder /target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
