FROM maven:3-jdk-8 as maven
ENV LANG=C.UTF-8 LANGUAGE=C LC_ALL=C.UTF-8 TERM=linux

WORKDIR /usr/src/app
# Get maven project pom and src
COPY pom.xml .
COPY src .

RUN mvn -B -e -C -T 1C org.apache.maven.plugins:maven-dependency-plugin:3.0.2:go-offline
COPY . .
RUN mvn -B -e -o -T 1C verify

#Get jetty and copy over war file from previous build
FROM jetty:jre8-alpine
COPY --from=maven /usr/src/app/target/*.war /var/lib/jetty/webapps/ROOT.war
