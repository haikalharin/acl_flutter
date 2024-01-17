import 'package:formz/formz.dart';

enum AajiNoValidationError { empty }

class AajiNoValidator extends FormzInput<String, AajiNoValidationError> {
  const AajiNoValidator.pure() : super.pure('');

  const AajiNoValidator.dirty([String value = '']) : super.dirty(value);

  @override
  AajiNoValidationError? validator(String value) {
    return value.length == 10 || value == '' ? null : AajiNoValidationError.empty;
  }

  final String invalidAajiNo = "no lisensi harus 10 digit";
}
