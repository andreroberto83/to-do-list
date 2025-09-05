# Etapa 1: Build da aplicação
FROM eclipse-temurin:21-jdk AS build

# Define diretório de trabalho dentro do container
WORKDIR /app

# Copia todos os arquivos do projeto para o container
COPY . .

# Garante que o mvnw tenha permissão de execução
RUN chmod +x mvnw

# Build do projeto sem rodar testes
RUN ./mvnw clean package -DskipTests

# Etapa 2: Imagem final para rodar a aplicação
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copia o JAR gerado na etapa de build
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta padrão do Spring Boot
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]