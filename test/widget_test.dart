// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:acl_flutter/common/secure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:acl_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final test = decrypty('h9LYdr5HIOk8R7wPuehuSed/0JGVFrguyqALgLTnGAp3nC5T2t0kysUyFPPEXX84c/+hLz6U1xGrmYAYSMjACQ==');
print(test);
    // Verify that our counter has incremented.
    // expect('', encrypter);
    // expect(find.text('1'), findsOneWidget);
  });

  testWidgets('encrypt', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final test = encrypt('password123');
    print(test);
    // Verify that our counter has incremented.
    // expect('', encrypter);
    // expect(find.text('1'), findsOneWidget);
  });

  testWidgets('convertString', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final test = encrypt('password123');
    print(test);
    // Verify that our counter has incremented.
    // expect('', encrypter);
    // expect(find.text('1'), findsOneWidget);
  });

}
