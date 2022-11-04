Example Blog-Backend

# Build und Start im Dev-Mode
Starting  Project in Dev-mode inluding Quarkus Dev-Services for a MariaDB and a Redpanda as Kafka-Broker (and keycloak from hftm-cloud-lab)  

    ./mvnw quarkus:dev

## Swagger-UI Zugriff
http://localhost:8080/q/swagger-ui

## Access Token from hftm-Lab-Keycloak with httpie

User Alice:

    http -v --form --auth backend-service:OtCiMqpmzkPUVwsN51ZXieXxZ9KmGerj POST https://d-cap-keyclaok.kindbay-711f60b2.westeurope.azurecontainerapps.io/realms/blog/protocol/openid-connect/token username=alice password=alice grant_type=password


## httpie Example-Access
    
    http :8080/entries

httpie-Session for reusing the access-token:  

    http --session=auth-user :8080/entries Authorization:"Bearer ACCESS-TOKEN"
    http --session=auth-user :8080/entries
    http --session=auth-user :8080/entries title="Neuer Titel" content=Inhalt

# Create Container-Image

## JVM Container-Image

        ./mvnw package -Dquarkus.container-image.build=true

## Native Container-Image  

    ./mvnw package -Pnative -Dquarkus.container-image.name=blog-backend-native -Dquarkus.native.container-build=true  -Dquarkus.container-image.build=true

