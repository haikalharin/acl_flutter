import 'package:formz/formz.dart';

enum AasiNoValidationError { empty }

class AasiNoValidator extends FormzInput<String, AasiNoValidationError> {
  const AasiNoValidator.pure() : super.pure('');

  const AasiNoValidator.dirty([String value = '']) : super.dirty(value);

  @override
  AasiNoValidationError? validator(String value) {
    return value.length == 16 || value == '' ? null : AasiNoValidationError.empty;
  }

  final String invalidAasiNo = "no lisensi harus 16 digit";
}
