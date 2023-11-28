import 'package:flutter/material.dart';

import '../../utils/acl_color.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.maxLine,
    this.controller,
    this.icon,
    this.label,
    this.title,
    this.enabled,
    this.focusNode,
    this.obscureText,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hint, this.isMandatory = true,
  }) : super(key: key);

  final String? initialValue;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final Icon? icon;
  final Widget? label;
  final Widget? title;
  final bool? enabled;
  final TextEditingController? controller;
  final AutovalidateMode autoValidateMode;
  final FocusNode? focusNode;
  final bool? obscureText;
  final bool isMandatory;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        controller: controller,
        enabled: enabled ?? true,
        textInputAction: TextInputAction.next,
        autovalidateMode: autoValidateMode,
        cursorColor: Colors.grey,
        initialValue: initialValue,
        maxLines: obscureText != false || obscureText != null ? 1 : maxLine,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            hintText: hint,
            label: Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    label ?? Container(),
                    isMandatory?Container(
                        margin: const EdgeInsets.only(left: 5, bottom: 5),
                        child: const Text(
                          '*',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: AclColors.redAccent,
                          ),
                        )):Container(),
                  ],
                ),
              ],
            ),
            prefixIcon: icon),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
