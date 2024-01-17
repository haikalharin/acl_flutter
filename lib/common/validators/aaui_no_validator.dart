import 'package:formz/formz.dart';

enum AauiNoValidationError { empty }

class AauiNoValidator extends FormzInput<String, AauiNoValidationError> {
  const AauiNoValidator.pure() : super.pure('');

  const AauiNoValidator.dirty([String value = '']) : super.dirty(value);

  @override
  AauiNoValidationError? validator(String value) {
    return value.length == 28 || value == '' ? null : AauiNoValidationError.empty;
  }

  final String invalidAauiNo = "no lisensi harus 28 digit";
}
