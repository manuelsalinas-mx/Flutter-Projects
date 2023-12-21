
# Cinemapedia

La idea es que comencemos a crear código **reutilizable**, **estructurado** y **con la posibilidad de expandirlo** desde el inicio, de esta manera será más simple poder añadir nuevas funcionalidades **a futuro.**

Puntualmente:

- **Datasources**
  - _Implementaciones_
  - _Abastracciones_
- **Repositorios**
  - _Implementaciones_
  - _Abstracciones_
- **Modelos**
- **Entidades**
- **Riverpod**
  - _Provider_
  - _StateNotifierProvider_
  - _Notifiers_
- **Mappers**
- **Búsquedas y trabajar con el SearchDelegate.**
  - _SearchDelegate_
  - _Datasources_
  - _Repositorios_
  - _Búsquedas contra TheMovieDB_
  - _Debouncer_
  - _Streams_
  - _Builders_
  - _DRY (Don't repeat your code)_
  - _Providers_
- **Navegación entre tabs**
- **Preservar estado**
- **Go_Router**
  - _Redirect_
  -  _ShellRoute_
  - _SubShellRoutes_
- **Base de Datos** ([Isar Database](https://isar.dev/))
  - Realizar queries
  - Almacenar en base de datos
  - Leer, insertar y borrar
  - FutureProvider de Riverpod


Todo el objetivo es poder establecer los cimientos ordenados de nuestra arquitectura para reforzarlos y verlos en la práctica.  Construcción de un motor de búsqueda completo y robusto para que nuestros usuarios puedan buscar sus películas ahí y preservar búsquedas anteriores 

### Home Screen

El home screen va a realizar 4 consultas a **TheMovieDB** para obtener:
1. Películas populares
2. Películas en cines
3. Películas mejor calificadas
4. Películas que próximamente estarán en cines
   

Para lograr esto se aprendio un poco sobre **scroll horizontal infinito**, **slivers** y demás.

## DEV
1. Copiar el **.env.template** y renombrarlo a **.env**
2. Cambiar las variables de entorno (TheMovieDB)
3. Cambios en la entidad **movie (_con isar_)**, hay que ejecutar el siguiente comando
```
flutter pub run build_runner build
```


## Demos

| Screen            | Demo                                                              |
| ----------------- | ------------------------------------------------------------------ |
| **Inicio** | ![Home](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/03b344f1-ca31-4264-8ec2-bb63d8f0058b) |
| **Busqueda** | ![search](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/f4f4c0d2-6f0d-42fd-a842-c2f6d908b19e) |
| **Detalle Pelicula** | ![Movie Detail](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/8d457271-849f-455c-8a92-e67bd66550ca) |
| **Populares** | ![Populares](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/533dc6e0-8b7c-41da-bb49-b930e4cae35e) |
| **Favoritos - Agregar** | ![Favoritos-add](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/e8f2dbd3-8546-4b1f-8ccf-a58109335952) |
| **Favoritos - Remover** | ![Favoritos-remove](https://github.com/manuelsalinas-mx/Flutter-Projects/assets/110424672/91d6ec46-91e0-4b8b-927b-c28af9a2f135) |

