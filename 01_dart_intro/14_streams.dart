void main() {
  
  emitNumbers().listen( (value) {
    print('Desde periodic $value');
  });
}

Stream<int> emitNumbers() {
   return Stream.periodic( const Duration(seconds: 1), (value) {
     //print('dede periodic $value');
    return value;
  }).take(5);
}