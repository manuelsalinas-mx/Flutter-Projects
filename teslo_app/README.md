# Teslo App
### Flutter - Authenticated CRUD App - TesloShop

**Autenticación mediante JWT (Json Web Tokens)**
- Realizar el **POST** **HTTP**
- Obtener las **credenciales** del usuario
- Manejo de **errores** personalizados
- Manejo del estado del **formulario con Riverpod**
- Comunicación entre **providers**

A lo largo del proyecto se trabaja con:

- Cámara
- Tokens de acceso
- **CRUD** (Create Read Update Delete) Rest API Endpoints
- **Riverpod**
- **GoRouter**

Protección de rutas utilizando **Go_Router** + **Riverpod**:

- Proteger rutas
- Redireccionar
- Actualizar instancia del **GoRouter** cuando hay cambios en el estado
- Colocar **listeners** de GoRouter
- Change notifier
- **Preferencias** de usuario
- Almacenar **token** de acceso de forma **permanente**

Pantalla de **Productos** (Home):

- Login con el **boton done** del teclado
- **Masonry** ListView
- Productos
  - **Entidad**
  - **Datasources**
  - **Repositorios**
- Riverpod
  - **Provider**
  - **StateNotifierProvider**

**Creación y mantenimiento** de productos:
- Formularios
- Segmentos de botones
- **Selectores**
- **Posteos**
  - Path
  - Post
- Retroalimentación de **sucesos**
- Manejo de errores
- **Inputs** personalizados

**Cámara, Galeria y Carga de Archivos**
- **Patrón adaptador** sobre el paquete de cámara
- POST Form **Multipart**
- Mostrar imágenes como **archivos**
- Multiples cargas **simultáneas**
- Postman - Pruebas de API
- **Actualizar** **estado** del formulario
  

## Backend
- [Documentación de los endpoints disponibles](http://localhost:3000/api)
- [Teslo Backend - Nest RestServer](https://github.com/manuelsalinas-mx/Flutter-Projects/tree/main/teslo-shop-backend)

# Demo

**Nota:**
Antes de correr la apliacion debes montar y correr las imagenes del backend en [**Docker**](https://www.docker.com/products/docker-desktop/) y debe lucir de esta manera.

<img width="1624" alt="Docker" src="https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/0b0381ba-14c9-4722-84a1-7e8fbbf7fbc4">

--- 

| Screen            | Demo                                                              |
| ----------------- | ------------------------------------------------------------------ |
| **Login Validations** | ![Login error test](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/b81b984c-5b23-496a-af19-8a6b2a5adef8) |
| **Logout** | ![Logout](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/5cffe080-d732-418d-a106-4760f94f22cd) |
| **Products Infinite Scroll** | ![prooducts infinte scroll](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/cd09200f-c7ea-4909-97ba-7d51bc5aa288) |
| **Product Detail** | ![product detail](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/47c309d5-f53d-4181-a032-dd9a668db412) |
| **Product Edit** | ![product edit](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/f63c9b44-5f96-4f75-ad0c-a0cbf306a052) |
| **New Product** | ![new product](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/1552eef5-2953-4831-b26d-46153ad21b6a) |
| **Load images** | ![load images](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/410682fc-f2a3-4cd3-be64-aa9e5eebbe39) |
| **Form Validations** | ![validations form](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/f4efc59f-76e3-498c-9d68-57f52c97ab44) |
