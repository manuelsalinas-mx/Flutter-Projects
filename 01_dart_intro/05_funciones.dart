void main() {
  print(greetEveryone());
  print('Suma: ${ addTwoNumbers(10, 10) }'); 
  print('Suma Opcional: ${ addTwoNumbersOptional(10) }'); 
  print( greetPerson( name: 'Man'));
   print( greetPerson( name: 'Manu', message: 'Hey!'));
}

// Funcion estilo normal
/*
String greetEveryone() {
  return 'Hello Everyone!';
}

int addTwoNumbers(int a, int b) {
  return a + b;
}

int addTwoNumbersOptional(int a,[ int b = 0]) {
  return a + b;
}

// al poner entre llaves se vuelven opcionales, para evitar solo se agrega 'required'
String greetPerson({ required String name, String message = 'Hola'}) {
  return '$message, $name';
}
*/


// Funcion estilo de flecha
String greetEveryone() => 'Hello Everyone!';
int addTwoNumbers(int a, int b) => a + b;
int addTwoNumbersOptional(int a,[ int b = 0]) => a + b;
String greetPerson({ required String name, String message = 'Hola'}) => '$message, $name';




