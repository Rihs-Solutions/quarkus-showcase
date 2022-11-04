Example Text-Validator-Service.  

# Build und Start im Dev-Mode
Starting  Project in Dev-mode inluding Quarkus Dev-Services for Redpanda as Kafka-Broker  

    ./mvnw quarkus:dev
  

# Create Container-Image

## JVM Container-Image

        ./mvnw package -Dquarkus.container-image.build=true

## Native Container-Image  

    ./mvnw package -Pnative -Dquarkus.container-image.name=text-validator-native -Dquarkus.native.container-build=true  -Dquarkus.container-image.build=true