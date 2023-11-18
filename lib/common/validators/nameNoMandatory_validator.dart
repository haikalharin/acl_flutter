import 'package:formz/formz.dart';

import '../../common/regex_constants.dart';

enum NameValidationError { empty }

class NameNoMandatoryValidator extends FormzInput<String, NameValidationError> {
  const NameNoMandatoryValidator.pure() : super.pure('');
  const NameNoMandatoryValidator.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value == "" ||   RegExp(RegexConstants.validatorNameRegex).hasMatch(value)){
      return null;
    }else{
      return NameValidationError.empty;
    }
  }
}
