FROM maven as builder
COPY . /
RUN mvn package

FROM tomcat:10
COPY --from=builder /target/*.war /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps
RUN mv helloworld.war ROOT.war
EXPOSE 8080
