void main() async {
  
  print('Inicio del programa');
  
  try {
     final value = await httpGet('https://www.google.com');
     print('Exito: $value');
    
  } on Exception catch(error) {
    print('Tenemos una Exception: $error');
    
  } catch (error) {
    print('Error: $error');
    
  } finally {
    print('Fin de try-catch');
  }
 
  
  print('Fin del programa');
}


Future<String> httpGet( String url) async {
 
  await Future.delayed( const Duration(seconds: 1));
  
  throw Exception('No hay parametros en el Url');
    
  //return 'Tenemos un valor de la peticion';
}