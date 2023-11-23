void main() {
  
  final mySquare = Square( side: -10);
  //mySquare.side = 5;
  
  //print('area:  ${ mySquare.calculateArea() }');
  print('area:  ${ mySquare.area }');
}

class Square {
  // properties
  double _side; // side * side
  
  // Constructor
  Square({ required double side })
    : assert(side >= 0, 'Side is negative'),
  _side = side;
  
  // Getyers & Setters
  double get area {
    return _side * _side;
  }
  
  set side( double value) {
    print('setting new value $value');
    if ( value < 0 ) throw 'Value must be >= 0';
    
    _side = value;
  }
  
  // Functions
  double calculateArea() => _side * _side;
}