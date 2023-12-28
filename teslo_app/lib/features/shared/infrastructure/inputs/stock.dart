import 'package:formz/formz.dart';

// Define input validation errors
enum StockError { empty, negative }

// Extend FormzInput and provide the input type and error type.
class Stock extends FormzInput<int, StockError> {
  // Call super.pure to represent an unmodified form input.
  const Stock.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const Stock.dirty(int value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == StockError.empty) return 'El campo es requerido';
    if (displayError == StockError.negative) return 'El campo no puede ser un valor negativo.';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  StockError? validator(int value) {
    if (value.toString().isEmpty || value.toString().isEmpty) return StockError.empty;
    if (value < 0) return StockError.negative;

    return null;
  }
}
