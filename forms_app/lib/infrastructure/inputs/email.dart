import 'package:forms_app/config/helpers/email_regexp.dart';
import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, invalidEmailFormat }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.invalidEmailFormat;

    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'Email is required';
    if (displayError == EmailError.invalidEmailFormat) return 'Incorrect email format';

    return null;
  }
}
