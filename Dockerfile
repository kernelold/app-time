FROM openjdk:8-jdk-alpine as builder 
VOLUME /tmp
RUN apk add gradle curl &&  cd / && \
  curl -L https://api.github.com/repos/kernelold/app-time/tarball > hello.tar.gz && \
  tar xvf hello.tar.gz && mv kernelold-app-time-* hello && cd hello && \
  gradle build 


FROM openjdk:8-jdk-alpine  
COPY --from=builder /hello/build/libs/app-time-latest.jar /app-time-latest.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app-time-latest.jar"]
