import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

enum TanggalValidationError { empty }

class TanggalValidator extends FormzInput<String, TanggalValidationError> {
  const TanggalValidator.pure() : super.pure('');

  const TanggalValidator.dirty([String value = '']) : super.dirty(value);

  @override
  TanggalValidationError? validator(String value) {
    String tglValue = value.replaceAll("-", "").substring(0, 8);
    String dateNow =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).replaceAll("-", "");
    int tglValueFix = int.parse(tglValue);
    int dateNowFix = int.parse(dateNow);
    return tglValueFix < dateNowFix ? null : TanggalValidationError.empty;
  }

  final String invalidTanggal = "Silahkan periksa tanggal kembali";
}
