import 'package:flutter/material.dart';

class RetryDialog extends StatelessWidget {
  const RetryDialog(
      {Key? key,
      required this.title,
      required this.onCancelPressed,
      this.onRetryPressed})
      : super(key: key);

  final String title;
  final VoidCallback? onRetryPressed;
  final VoidCallback? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.redAccent, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      // title: const Row(
      //   children: [
      //     Icon(Icons.warning, color: Colors.redAccent),
      //     SizedBox(width: 15),
      //     Text("Error")
      //   ],
      // ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // TextButton(
              //   onPressed: onCancelPressed ??
              //       () => Navigator.pop(context),
              //   child: const Text("Cancel"),
              // ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: onCancelPressed,
                child: const Text("cancel"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
