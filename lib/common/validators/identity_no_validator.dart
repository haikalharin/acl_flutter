import 'package:formz/formz.dart';

enum IdentityNoValidationError { empty }

class IdentityNoValidator extends FormzInput<String, IdentityNoValidationError> {
  const IdentityNoValidator.pure() : super.pure('');

  const IdentityNoValidator.dirty([String value = '']) : super.dirty(value);

  @override
  IdentityNoValidationError? validator(String value) {
    return value.length >= 16 ? null : IdentityNoValidationError.empty;
  }

  final String invalidIdentityNo = "IdentityNo harus 16 digit";
}
