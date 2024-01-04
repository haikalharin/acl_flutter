import 'package:formz/formz.dart';

enum NoMandatoryValidationError { empty }

class NoMandatoryFieldValidator extends FormzInput<String, NoMandatoryValidationError> {
  const NoMandatoryFieldValidator.pure() : super.pure('');
  const NoMandatoryFieldValidator.dirty([String value = '']) : super.dirty(value);

  @override
  NoMandatoryValidationError? validator(String value) {
    if (value == ""){
      return null;
    }
    return null;
  }
}
