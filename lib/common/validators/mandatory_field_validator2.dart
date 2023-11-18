import 'package:formz/formz.dart';

enum MandatoryValidationError2 { empty }

class MandatoryGenericValidator<T> extends FormzInput<T, MandatoryValidationError2> {
  const MandatoryGenericValidator.pure() : super.pure('' as T);
  const MandatoryGenericValidator.dirty(T obj) : super.dirty(obj);

  @override
  MandatoryValidationError2? validator(T value) {
    return value != null ? null : MandatoryValidationError2.empty;
  }
}
