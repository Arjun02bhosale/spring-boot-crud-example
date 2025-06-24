## =========================
## Stage 1: Build the project
## =========================
#FROM maven:3.9.6-eclipse-temurin-21 AS build
#
## Set working directory inside container
#WORKDIR /app
#
## Copy Maven POM file and download dependencies (cache optimization)
#COPY pom.xml .
#RUN mvn dependency:go-offline
#
## Copy project source code
#COPY src ./src
#
## Add --add-opens to avoid Lombok + JDK 21 module error
#RUN mvn clean package -DskipTests -Dmaven.compiler.args="--add-opens=java.compiler/com.sun.tools.javac.processing=ALL-UNNAMED"
#
## ==========================
## Stage 2: Create final image
## ==========================
#FROM eclipse-temurin:21-jre-alpine
#
## Set working directory inside container
#WORKDIR /app
#
## Copy packaged JAR from builder stage
#COPY --from=build /app/target/*.jar app.jar
#
## Optional: Environment variables (can override when running container)
#ENV JAVA_OPTS=""
#
## Expose application port
#EXPOSE 8080
#
## Health check to monitor /health endpoint
#HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
#  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1
#
## Run the application
#ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
#
#



# =========================
# Stage 1: Build the project
# =========================
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copy POM file and download dependencies for cache optimization
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Avoid Lombok + JDK 21 issues
RUN mvn clean package -DskipTests -Dmaven.compiler.args="--add-opens=java.compiler/com.sun.tools.javac.processing=ALL-UNNAMED"

# ==========================
# Stage 2: Create final image
# ==========================
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy built jar from builder stage
COPY --from=build /app/target/*.jar app.jar

# Load environment variables from Docker or docker-compose
ENV JAVA_OPTS=""

# Expose app port
EXPOSE 8080

# Health check for /health endpoint
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

# Run the application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
