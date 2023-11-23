void main() async {
  
  print('Inicio del programa');
  
  
// Usando Future
  /*
  httpGet('https://www.google.com').then( (value) {
    print( value );
    
  }).catchError( (error) {
    print('Error: $error');
    
  });
  */
  
  // Usando async-await
  try {
     final value = await httpGet('https://www.google.com');
     print(value);
    
  } catch (error) {
    print('Error: $error');
    
  }
 
  
  print('Fin del programa');
}

// Usando Future
/*
Future<String> httpGet( String url) {
 
  return Future.delayed( const Duration(seconds: 1), () {
    
    throw 'Error en la peticion http';
    //return 'Respuesta de la peticion http';
  });
}
*/

// Usando async-await
Future<String> httpGet( String url) async {
 
  await Future.delayed( const Duration(seconds: 1));
  
  throw 'Error en la peticion';
    
  //return 'Tenemos un valor de la peticion';
}