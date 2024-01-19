import 'package:flutter/material.dart';

import '../../utils/acl_color.dart';

class ButtonWidgetCustom extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function() function;
  final Color? backgroudColor;
  final Color? textColor;
  final Color? borderColor;

  const ButtonWidgetCustom({
    super.key,
    required this.text,
    this.icon,
    required this.function,
    this.backgroudColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: backgroudColor ?? AclColors.blueButton,
          border: Border.all(
              color: borderColor ?? backgroudColor ?? AclColors.blueButton),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: textColor ?? Colors.white),
            ),
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
