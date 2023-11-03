import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sidebar_page/sidebar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text('home'),)),
    );
  }
}
