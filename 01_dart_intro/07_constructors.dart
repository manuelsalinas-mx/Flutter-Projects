void main() {
  
  final Map<String, dynamic>rawJson = {
    'power': 'Money',
    'name': 'Tony stark',
    'isAlive': true
  };
  
  final ironman = Hero.fromJson ( rawJson );
  
  /*
  final ironman = Hero(
    name: 'Tony Stark',
    power: 'Money',
    isAlive: false
  );
  */
  
  
  print( ironman.toString() );
}

class Hero {
  String name; 
  String power;
  bool isAlive;
  
  Hero({
    required this.name, 
    required this.power,
    required this.isAlive
  });
  
  Hero.fromJson( Map<String, dynamic> json )
    : name = json['name'] ?? 'No name',
  power = json['power'] ?? 'No power',
  isAlive = json['isAlive'] ?? false ;
  
  
  @override
  String toString() {
    return '$name, $power, isAlive: ${ isAlive ? 'yes' : 'no' }';
  }
}