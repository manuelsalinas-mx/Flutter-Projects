void main() {
  
  final String pokemon = 'Ditto';
  final int hp = 100;
  final bool isAlive = true;
  final List<String> abilities = ['impostor'];
  final sprites = <String>['ditto/front.png', 'ditto/back.png'];
  
  // dynamic por default es == null
  dynamic errorMessage = 'Hola';
  errorMessage = false;
  errorMessage = 21;
  errorMessage = [1,2,3,4,5];
  errorMessage = {1,2,3,4,5};
  
  print(
  """
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $errorMessage
  """
  );
}
