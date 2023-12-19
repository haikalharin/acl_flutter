import 'package:formz/formz.dart';

enum ZipcodeValidationError { empty }

class ZipcodeValidator extends FormzInput<String, ZipcodeValidationError> {
  const ZipcodeValidator.pure() : super.pure('');

  const ZipcodeValidator.dirty([String value = '']) : super.dirty(value);

  @override
  ZipcodeValidationError? validator(String value) {
    return value.length <= 5 ? null : ZipcodeValidationError.empty;
  }

  final String invalidZipcode = "value tidak boleh lebih dari 5 digit";
}
