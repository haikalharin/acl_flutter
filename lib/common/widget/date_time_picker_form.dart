import 'package:acl_flutter/common/widget/text_input.dart';
import 'package:flutter/material.dart';

import '../../utils/acl_color.dart';

class DateTimePickerForm extends StatefulWidget {
  const DateTimePickerForm(
      {Key? key,
      required this.selectedDateTime,
      this.dateTime,
      // this.label,
      this.labelText,
      this.title,
      this.errorText,
      this.validator,
      this.isMandatory = true,
      this.readOnly = false,
      this.controller})
      : super(key: key);

  final void Function(DateTime date) selectedDateTime;
  final DateTime? dateTime;
  // final Widget? label;
  final String? labelText;
  final String? title;
  final String? errorText;
  final bool isMandatory;
  final bool readOnly;
  final TextEditingController? controller;
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
      dateString = widget.controller ?? TextEditingController(text: "");
    } else {
      date = widget.dateTime!;
      dateString.value = TextEditingValue(
          text:
              "${widget.dateTime!.day} / ${widget.dateTime!.month} / ${widget.dateTime!.year}");
      widget.selectedDateTime(date);
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
        if (!widget.readOnly) {
          DateTime? newDate = await pickDate();
          setDate(newDate);
          setState(() {
            if (newDate != null) {
              dateString.text = "${newDate.day} / ${newDate.month} / ${newDate.year}";
              dateString.value = TextEditingValue(
                  text: "${newDate.day} / ${newDate.month} / ${newDate.year}");
            }
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(widget.title ?? '',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: AclColors.greyDarkFontColor,
                      ))),
              widget.isMandatory? Container(
                  margin: const EdgeInsets.only(left: 5, bottom: 5),
                  child: const Text(
                    '*',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AclColors.red,
                    ),
                  )):Container(),
              Container(
                  margin: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    widget.errorText ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AclColors.red,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 5),
          TextInput(
            controller: dateString,
            icon: const Icon(Icons.date_range),
            enabled: false,
            isMandatory: false,
            labelText: widget.labelText,
            validator: widget.validator,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
