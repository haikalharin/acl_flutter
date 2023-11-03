import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:acl_flutter/core/widget/button_widget.dart';

import '../../core/dialog/retry_dialog.dart';
import '../../core/router/routes.dart';
import '../../core/widget/button_widget.dart';


class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height/3,
        decoration:  const BoxDecoration(
            // border: Border.all(
            //   color: Colors.grey, // You can choose the color you want
            //   width: 1.0,          // Adjust the width of the border as needed
            // ),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidgetCustom(
              text: "Agen",
              function: () {
                Navigator.of(context).pushNamed(
                  Routes.loginPage,
                );
              },
            ),
            SizedBox(height: 10,),
            ButtonWidgetCustom(
              text: "Calon Agen",
              function: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => RetryDialog(
                        title: 'Belum tersedia',
                        onRetryPressed: () => [
                          Navigator.pop(context)
                        ]));
              },
            ),
             SizedBox(height: 10,),
            ButtonWidgetCustom(
              text: "ADT Team",
              function: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => RetryDialog(
                        title: 'Belum tersedia',
                        onRetryPressed: () => [
                          Navigator.pop(context)
                        ]));
              },
            ),

          ],
        ),
      )),
    );
  }
}
