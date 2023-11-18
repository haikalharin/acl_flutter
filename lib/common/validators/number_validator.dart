import 'package:formz/formz.dart';

import '../../common/regex_constants.dart';

enum NumberValidationError { empty }

class NumberValidator extends FormzInput<String, NumberValidationError> {
  const NumberValidator.pure() : super.pure('');
  const NumberValidator.dirty([String value = '']) : super.dirty(value);

  @override
  NumberValidationError? validator(String value) {
    return RegExp(RegexConstants.numericRegex).hasMatch(value)
        ? null
        : NumberValidationError.empty;
  }
}
