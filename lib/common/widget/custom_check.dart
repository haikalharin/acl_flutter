import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

import '../../../data/model/master_data_model/master_data_model.dart';
import '../../../screens/sidebar_page/sidebar_page.dart';

class CustomCheck extends StatefulWidget {
  const CustomCheck(
      {Key? key,
      required this.onChanged,
      required this.lable ,
      this.onClear,
      this.initialItem,
      this.value,
      this.title,
      this.icon,
      this.errorText,
      this.isMandatory = true,
      this.readOnly = false,
      this.isCheck = false})
      : super(key: key);

  final ValueChanged<bool> onChanged;
  final Function? onClear;
  final bool? value;
  final bool? initialItem;
  final Widget? lable;
  final String? title;
  final String? errorText;
  final Icon? icon;
  final bool isMandatory;
  final bool isCheck;
  final bool readOnly;

  @override
  State<CustomCheck> createState() => _CustomCheckState(initialItem);
}

class _CustomCheckState extends State<CustomCheck> {
  bool? initialItem;
  bool isInit = true;

  _CustomCheckState(this.initialItem);
  @override
  void didUpdateWidget(CustomCheck oldWidget) {
   if(isInit){
    if (initialItem != widget.initialItem) {
      widget.onChanged(widget.initialItem??false);
      setState(() {
        initialItem = widget.initialItem;
        isInit =false;
      });
    }
   }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title:  widget.lable,
      value: initialItem,
      onChanged: (newValue) {
       widget.onChanged(newValue??false);
       initialItem = newValue;
       isInit = false;
      },
      controlAffinity: ListTileControlAffinity
          .leading, //  <-- leading Checkbox
    );
  }
}
