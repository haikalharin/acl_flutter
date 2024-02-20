import 'package:flutter/material.dart';
import 'package:flutter_helper/source/utility/colors/color_palette.dart';
import 'package:flutter_helper/source/utility/device_info/device.dart';
import 'package:flutter_helper/source/utility/text/uifont.dart';

import '../../utils/acl_color.dart';

enum AdaptiveTextFormFieldType { boxShowingHint, titleWithoutBox }

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
    // this.label,
    this.labelText,
    this.title,
    this.enabled,
    this.readOnly = false,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hint,
    this.isMandatory = true,
    this.textCapitalization,
    this.textFieldType = AdaptiveTextFormFieldType.titleWithoutBox,
    this.desktopFactor = 1.0,
    this.tabletFactor = 1.0,
    this.mobileFactor = 1.0,
    this.smallMobileFactor = 1.0,
    this.titleColor = ColorPalette.blue,
    this.titleFontSystem = UIFontSystem.bold,
  }) : super(key: key);

  final String? initialValue;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final int? maxLength;
  final Icon? icon;
  // final Widget? label;
  final String? labelText;
  final Widget? title;
  final bool? enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final AutovalidateMode autoValidateMode;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool isMandatory;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final AdaptiveTextFormFieldType textFieldType;
  final double desktopFactor;
  final double tabletFactor;
  final double mobileFactor;
  final double smallMobileFactor;
  final Color titleColor;
  final UIFontSystem titleFontSystem;


  @override
  State<TextInput> createState() => _TextInputState(initialValue);
}

class _TextInputState extends State<TextInput> {
  bool showPassword = false;
  String? initialValue;
  TextEditingController? controller = TextEditingController(text: "");

  _TextInputState(this.initialValue);

  @override
  void initState() {
    if (widget.controller != null) {
      controller = widget.controller;
      widget.onChanged!(widget.controller?.value.text ?? '');
    } else if (widget.initialValue != null) {
      controller?.text = widget.initialValue ?? '';
      widget.onChanged!(widget.initialValue ?? '');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      title: widget.title,
      subtitle: TextFormField(
        readOnly: widget.readOnly,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: controller,
        enabled: widget.enabled ?? true,
        textInputAction: TextInputAction.next,
        autovalidateMode: widget.autoValidateMode,
        cursorColor: Colors.grey,
        maxLines: widget.obscureText != false ? 1 : widget.maxLine,
        obscureText: widget.obscureText && !showPassword,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.characters,
        decoration: _getDecoration(screenWidth),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }

  /// Decoration Settings
  InputDecoration _getDecoration(double screenWidth) {
    if (widget.textFieldType == AdaptiveTextFormFieldType.boxShowingHint) {
      return _getBoxDecoration();
    }

    return _getTitleDecoration();
  }

  InputDecoration _getBoxDecoration() {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorPalette.white),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorPalette.white),
      ),
      fillColor: Colors.grey.shade200,
      filled: true,
      hintText: widget.hint,
      hintStyle: TextStyle(color: Colors.grey[500]),
      prefixIcon: widget.icon,
      suffixIcon: widget.obscureText ? _getObscureSuffixIcon() : null,
      counterStyle: const TextStyle(height: double.minPositive),
      counterText: '',
    );
  }

  /// Inspire Default Title Value Decoration
  InputDecoration _getTitleDecoration() {
    var scaleFactor = Device.getScaleFactor(context, widget.desktopFactor,
        widget.tabletFactor, widget.mobileFactor, widget.smallMobileFactor);

    return InputDecoration(
      labelText: widget.isMandatory ? '${widget.labelText}*' : widget.labelText,
      labelStyle: TextStyle(
        fontSize:  12.0 * scaleFactor,
        fontWeight: UIFont.getFontWeightFrom(widget.titleFontSystem),
        color: widget.titleColor,
      ),
      prefixIcon: widget.icon,
      suffixIcon: widget.obscureText ? _getObscureSuffixIcon() : null,
      counterStyle: const TextStyle(height: double.minPositive),
      counterText: '',
    );
  }

  /// Trailing Icons
  IconButton _getObscureSuffixIcon() {
    double iconSize = MediaQuery.of(context).size.width >= 600 ? 24.0 : 18.0;
    return IconButton(
      icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off,
          size: iconSize),
      onPressed: () {
        setState(() {
          showPassword = !showPassword;
        });
      },
    );
  }
}
