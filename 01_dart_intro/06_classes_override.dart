void main() {
  
  // final batman = new Hero('Bruce', 'Dinero');
  final batman = new Hero(name: 'Bruce', power: 'Dinero');
  
  print( batman.toString() );
  print( batman.name + ' | ' + batman.power );
}

class Hero {
  String name;
  String power;
  
  // constructor forma 1
  /*
  Hero(String name, String power)
    : name = name,
    power = power;
  */
  
   // constructor forma 2 mas usado
  // Hero( this.name, this.power );
  Hero({
    required this.name, 
    required this.power 
    });
  
  // Sobre escribiendo
  @override
  String toString() {
    return '$name - $power';
  }
}