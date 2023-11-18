import 'package:formz/formz.dart';

import '../../common/regex_constants.dart';

enum NumberNoMandatoryValidationError { empty }

class NumberNoMandatoryValidator extends FormzInput<String, NumberNoMandatoryValidationError> {
  const NumberNoMandatoryValidator.pure() : super.pure('');
  const NumberNoMandatoryValidator.dirty([String value = '']) : super.dirty(value);

  @override
  NumberNoMandatoryValidationError? validator(String value) {
    if (value == "" ||  RegExp(RegexConstants.numericRegex).hasMatch(value)){
      return null;
    }else{
      return NumberNoMandatoryValidationError.empty;
    }
//    return RegExp(RegexConstants.numericRegex).hasMatch(value)
//        ? null
//        : NumberNoMandatoryValidationError.empty;
  }
}

