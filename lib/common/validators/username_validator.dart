import 'package:formz/formz.dart';

enum UserNameValidationError { empty }

class UserNameValidator extends FormzInput<String, UserNameValidationError> {
  const UserNameValidator.pure() : super.pure('');

  const UserNameValidator.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameValidationError? validator(String value) {
    return value.isEmpty == true || value =="" ||value.length > 8 ?  UserNameValidationError.empty:null ;
  }

  final String invalidUserName = "Username tidak boleh kosong atau lebih dari 8 digit";
}
