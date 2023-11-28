import 'package:acl_flutter/core/widget/text_input.dart';
import 'package:flutter/material.dart';

class DateTimePickerForm extends StatefulWidget {
  const DateTimePickerForm(
      {Key? key,
      required this.selectedDateTime,
      this.dateTime,
      this.label,
      this.validator, this.isMandatory = true})
      : super(key: key);

  final void Function(DateTime date) selectedDateTime;
  final DateTime? dateTime;
  final Widget? label;
  final bool isMandatory;
  final FormFieldValidator<String>? validator;

  @override
  State<DateTimePickerForm> createState() => _DateTimePickerFormState();
}

class _DateTimePickerFormState extends State<DateTimePickerForm> {
  var dateString = TextEditingController(text: "");
  late DateTime date;

  @override
  void initState() {
    if (widget.dateTime == null) {
      date = DateTime.now();
    } else {
      date = widget.dateTime!;
      dateString.value = TextEditingValue(
          text:
              "${widget.dateTime!.day} / ${widget.dateTime!.month} / ${widget.dateTime!.year}");
    }
    super.initState();
  } //Get date from date picker

  Future<DateTime?> pickDate() async {
    return await showDatePicker(
        builder: (_, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      surface: Colors.amber,
                      primary: const Color(0xFFF4511E),
                    ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.selected)
                            ? const Color(0xFFF4511E)
                            : Colors.black87),
                  ),
                ),
              ),
              child: child!);
        },
        context: context,
        initialDate: date,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year + 1));
  }

  //Set the date that is taken from the user by date picker
  void setDate(DateTime? newDate) {
    if (newDate == null) return;

    date = DateTime(
        newDate.year, newDate.month, newDate.day, date.hour, date.minute);

    widget.selectedDateTime(date);
  }

  //Get time from date picker
  Future<TimeOfDay?> pickTime() async {
    return await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: date.hour, minute: date.minute));
  }

  //Set the time that is taken from the user by time picker
  void setTime(TimeOfDay? newTime) {
    if (newTime == null) return;
    date =
        DateTime(date.year, date.month, date.day, newTime.hour, newTime.minute);
    widget.selectedDateTime(date);
  }

  @override
  Widget build(BuildContext context) {
    final hours = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    return InkWell(
      onTap: () async {
        DateTime? newDate = await pickDate();
        setDate(newDate);
        setState(() {
          dateString.text = "${date.day} / ${date.month} / ${date.year}";
          dateString.value = TextEditingValue(
              text: "${date.day} / ${date.month} / ${date.year}");
        });
      },
      child: TextInput(
        controller: dateString,
        icon: const Icon(Icons.date_range_rounded),
        enabled: false,
        isMandatory: widget.isMandatory,
        label: widget.label,
        validator:widget.validator,
      ),
    );
  }
}
