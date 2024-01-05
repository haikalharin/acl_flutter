import 'package:flutter/material.dart';

import '../../utils/acl_color.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.maxLine,
    this.maxLength,
    this.controller,
    this.icon,
    this.label,
    this.title,
    this.enabled,
    this.focusNode,
    this.obscureText,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hint,
    this.isMandatory = true,
    this.textCapitalization,
  }) : super(key: key);

  final String? initialValue;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final int? maxLength;
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
  final TextCapitalization? textCapitalization;

  @override
  State<TextInput> createState() => _TextInputState(initialValue);
}

class _TextInputState extends State<TextInput> {
  String? initialValue;
  TextEditingController? controller = TextEditingController(text: "");

  _TextInputState(this.initialValue);

  @override
  void initState() {
    if (widget.initialValue != null) {
      controller?.text = widget.initialValue ?? '';
      widget.onChanged!(widget.initialValue ?? '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.title,
      subtitle: TextFormField(
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller ?? controller,
        enabled: widget.enabled ?? true,
        textInputAction: TextInputAction.next,
        autovalidateMode: widget.autoValidateMode,
        cursorColor: Colors.grey,
        maxLines: widget.obscureText != false || widget.obscureText != null
            ? 1
            : widget.maxLine,
        obscureText: widget.obscureText ?? false,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.characters,
        decoration: InputDecoration(
            hintText: widget.hint,
            // counter: const Offstage(),
            label: Wrap(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.label ?? Container(),
                    widget.isMandatory
                        ? Container(
                            margin: const EdgeInsets.only(left: 5, bottom: 5),
                            child: const Text(
                              '*',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: AclColors.redAccent,
                              ),
                            ))
                        : Container(),
                  ],
                ),
              ],
            ),
            prefixIcon: widget.icon),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
