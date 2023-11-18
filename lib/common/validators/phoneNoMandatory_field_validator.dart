import 'package:formz/formz.dart';

import '../../common/regex_constants.dart';

enum PhoneNoMandatoryValidationError { empty }

class PhoneNoMandatoryValidator extends FormzInput<String, PhoneNoMandatoryValidationError> {
  const PhoneNoMandatoryValidator.pure() : super.pure('');
  const PhoneNoMandatoryValidator.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNoMandatoryValidationError? validator(String value) {
    if (value == "" ||  value.length > 7  && RegExp(RegexConstants.validPhoneBook).hasMatch(value)){
      return null;
    }else{
      return PhoneNoMandatoryValidationError.empty;
    }
  }
}
