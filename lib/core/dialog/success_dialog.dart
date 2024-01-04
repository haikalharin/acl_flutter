import 'package:acl_flutter/core/widget/spinkit_indicator.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key? key,
    required this.title,
    required this.isProgressed,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final bool isProgressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Success"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(height: 15),
          isProgressed ? const SpinKitIndicator(type: SpinKitType.circle) : const SizedBox(),
          const SizedBox(height: 15),
          const SizedBox(
            width: double.infinity,
            child: SizedBox()

          )
        ],
      ),
    );
  }
}
