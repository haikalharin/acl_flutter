import 'package:formz/formz.dart';

import '../../common/regex_constants.dart';

enum HandphoneValidationError { empty }

class HandphoneValidator extends FormzInput<String, HandphoneValidationError> {
  const HandphoneValidator.pure() : super.pure('');

  const HandphoneValidator.dirty([String value = '']) : super.dirty(value);

  @override
  HandphoneValidationError? validator(String value) {
    return RegExp(RegexConstants.validPhoneWithoutZeroFirstRegex).hasMatch(value)
        ? null
        : HandphoneValidationError.empty;
  }
}
