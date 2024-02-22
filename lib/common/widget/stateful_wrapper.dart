// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

/// Wrapper for stateful functionality to provide onInit calls in stateless widget
class StatefulWrapper extends StatefulWidget {
  const StatefulWrapper({Key? key, this.onInit, this.onDispose, required this.child, this.onAfterBuild}) : super(key: key);
  final Function? onInit;
  final Function(BuildContext context)? onAfterBuild;
  final Function? onDispose;
  final Widget child;

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit?.call();
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.onAfterBuild != null) {
        widget.onAfterBuild!(context);
      }
    });
  }

  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
