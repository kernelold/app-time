FROM openjdk:8-jdk-alpine as builder 
RUN apk add gradle curl &&  cd / && \
  curl -L https://api.github.com/repos/kernelold/app-time/tarball > app-time.tar.gz && \
  tar xvf app-time.tar.gz && mv kernelold-app-time-* app-time && cd app-time && \
  gradle build 


FROM openjdk:8-jdk-alpine  
COPY --from=builder /app-time/build/libs/app-time-latest.jar /app-time-latest.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app-time-latest.jar"]
