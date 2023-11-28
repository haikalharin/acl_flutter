import 'package:acl_flutter/core/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../core/dialog/retry_dialog.dart';
import '../../core/router/routes.dart';


class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
        // border: Border.all(
        //   color: Colors.grey, // You can choose the color you want
        //   width: 1.0,          // Adjust the width of the border as needed
        // ),
        borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: Image.asset("assets/images/allianz_logo.png" ),
        ), ButtonWidgetCustom(
          text: "Agen",
          function: () {
            Navigator.of(context).pushNamed(
              Routes.loginPage,
            );
          },
        ),
        const SizedBox(height: 10,),
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
         const SizedBox(height: 10,),
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
      ),
    );
  }
}
