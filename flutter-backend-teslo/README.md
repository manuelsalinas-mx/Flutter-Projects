# Nest - TesloShop Backend


Se tiene por objetivo principal montar un backend real para realizar nuestro trabajo lo más apegado a la realidad.

**Puntualmente veremos:**
- Docker
- Docker compose
- **Imágenes** de docker
- Conectarse a **postgres** usando **TablePlus**
- Probar el backend configurado
- Llenar la **base de datos**
- Leer la documentación del backend
- Generar **JWTs** y probarlos
- Uso de **bearer** **tokens** en los headers de autenticación
- Trabajar las pruebas con Postman


## Development
1. Tener corriendo el servicio de Docker (Docker Desktop o Docker Deamon)
2. Clonar el archivo __.env.template__ y renombrar la copia a __.env__
3. Levantar los servicios con el comando
```
docker compose up -d
```
4. Llenar la base de datos con data temporal:

    http://localhost:3000/api/seed

5. Documentación de los endpoints disponibles:

    http://localhost:3000/api


### Referencia e Instalaciones recomendadas
https://github.com/Klerith/flutter-backend-teslo?tab=readme-ov-file

[Docker Desktop](https://www.docker.com/products/docker-desktop/)


# Extra
Para saber más sobre docker y cómo se construyó esta imagen, cursos de Nest y Docker:

[Cursos sobre Docker](https://fernando-herrera.com/#/search/docker)

[Imagen en DockerHub](https://hub.docker.com/repository/docker/klerith/flutter-backend-teslo-shop/general)
