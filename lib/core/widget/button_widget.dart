import 'package:flutter/material.dart';

import '../../utils/acl_color.dart';

class ButtonWidgetCustom extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function() function;

   const ButtonWidgetCustom({super.key,
    required this.text, this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: function,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AclColors.blueDark,
          border: Border.all(color: AclColors.blueDark),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
