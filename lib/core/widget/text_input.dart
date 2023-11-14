import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.maxLine,
    this.controller,
    this.icon,
    this.focusNode,
    this.obscureText,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    required this.hint,
  }) : super(key: key);

  final String? initialValue;
  final String hint;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final Icon? icon;
  final TextEditingController? controller;
  final AutovalidateMode autoValidateMode;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: TextInputAction.next,
      autovalidateMode: autoValidateMode,
      cursorColor: Colors.grey,
      initialValue: initialValue,
      maxLines: obscureText!= false || obscureText!= null?1:maxLine,
      obscureText: obscureText?? false,
      decoration: InputDecoration(hintText: hint, prefixIcon: icon),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
