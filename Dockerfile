# syntax=docker/dockerfile:1
# ============================================================================
# discovery-server — imagen Docker. Registro y descubrimiento de APIs con
# Eureka (Parte II). Build multi-etapa.
#
# El contexto de build es la RAÍZ del proyecto (ver docker-compose.yml):
#   docker build -f discovery-server/Dockerfile -t discovery-server .
# ============================================================================
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /workspace

COPY discovery-server/pom.xml discovery-server/pom.xml
COPY discovery-server/src discovery-server/src
RUN mvn -q -B -f discovery-server/pom.xml -DskipTests package

# ---------- Etapa de ejecución ----------
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=build /workspace/discovery-server/target/*.jar app.jar
EXPOSE 8761
HEALTHCHECK --interval=10s --timeout=5s --start-period=45s --retries=12 \
  CMD bash -c 'exec 3<>/dev/tcp/127.0.0.1/8761'
ENTRYPOINT ["java","-jar","/app/app.jar"]
