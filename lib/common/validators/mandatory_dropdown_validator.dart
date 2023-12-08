
import 'package:formz/formz.dart';

enum DropdownValidationError { empty }

class DropdownFieldValidator extends FormzInput<int, DropdownValidationError> {
  const DropdownFieldValidator.pure() : super.pure(0);
  const DropdownFieldValidator.dirty([int value = 0]) : super.dirty(value);

  @override
  DropdownValidationError? validator(int? value) {
    if(value == null||value == 0){
      return DropdownValidationError.empty;
    } else {
      return null;
    }

  }
}
