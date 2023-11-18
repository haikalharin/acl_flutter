import 'package:formz/formz.dart';

import '../../common/regex_constants.dart';

enum UserNameValidationError { empty }

class UserNameValidator extends FormzInput<String, UserNameValidationError> {
  const UserNameValidator.pure() : super.pure('');
  const UserNameValidator.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameValidationError? validator(String value) {
    return RegExp(RegexConstants.validatorUserNameRegex).hasMatch(value)
        ? null
        : UserNameValidationError.empty;
  }
}
