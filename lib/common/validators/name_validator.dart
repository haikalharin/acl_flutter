import 'package:formz/formz.dart';

import '../regex_constants.dart';

enum NameValidationError { empty }

class NameValidator extends FormzInput<String, NameValidationError> {
  const NameValidator.pure() : super.pure('');
  const NameValidator.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    return RegExp(RegexConstants.validatorNameRegex).hasMatch(value)
        ? null
        : NameValidationError.empty;
  }
}
