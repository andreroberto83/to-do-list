# JDK 21
FROM eclipse-temurin:21-jdk

# Diretório dentro do container
WORKDIR /app

# Copia o JAR gerado para dentro do container
COPY target/to-do-list-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta do Spring Boot
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java","-jar","/app/app.jar"]