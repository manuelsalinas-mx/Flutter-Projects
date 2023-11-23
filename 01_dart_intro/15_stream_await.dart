void main() {
  emitirNumero()
    .listen( (value) {
      
      print( 'Stream value: $value' );
    });
    
}

// El asterisco (*) representa que retorna un 'Stream'
Stream emitirNumero() async* {
  
  final valuesToEmit = [1,2,3,4,5];
  
  for( int index in valuesToEmit ) {
    await Future.delayed( const Duration(seconds: 1));
    yield index;
  }
}