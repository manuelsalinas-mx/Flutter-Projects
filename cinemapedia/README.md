
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

## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

