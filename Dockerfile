# Usar uma imagem do JDK 17
FROM eclipse-temurin:17-jdk

# Definir o diretório de trabalho dentro do container
WORKDIR /ac2_ca

# Copiar o arquivo .jar gerado para o diretório do container
COPY target/ac2_ca-0.0.1-SNAPSHOT.jar /ac2_ca/ac2_ca-0.0.1-SNAPSHOT.jar

# Verificar se o arquivo foi copiado corretamente (opcional, para debug)
RUN ls -l /ac2_ca

# Expõe a porta 8585
EXPOSE 8585

# Comando para executar a aplicação com Java 17
CMD ["java", "-XX:+UseContainerSupport", "-Xmx512m", "-Dserver.port=8585", "-jar", "/ac2_ca/ac2_ca-0.0.1-SNAPSHOT.jar"]