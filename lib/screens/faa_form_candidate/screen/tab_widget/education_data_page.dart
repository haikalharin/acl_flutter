import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/widget/button_widget.dart';
import '../../../../core/widget/text_input.dart';

class EducationDataPage extends StatefulWidget {
  const EducationDataPage({super.key,});

  @override
  State<EducationDataPage> createState() => _EducationDataPageState();
}

class _EducationDataPageState extends State<EducationDataPage> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Card(
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    ButtonWidgetCustom(
                      text: "Tambah",
                      backgroudColor: AclColors.greyDivider,
                      textColor: AclColors.black,
                      function: () {
                        // Navigator.of(context).pushNamed(
                        //   Routes.loginPage,
                        // );
                      },
                    ),
                    const SizedBox(height: 8),
                    ButtonWidgetCustom(
                      text: "lanjut",
                      function: () {
                        // Navigator.of(context).pushNamed(
                        //   Routes.loginPage,
                        // );
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
