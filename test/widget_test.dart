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
    final test = decrypty('avga9M+eeB4Jn8IHpiI4NLvF1lq5wLluxTtW5yi8KRh9JfP2NSxV1B+Z2MX/MgX2MUtPQ9B1FDesh4+s7MEqgA==');
print(test);
    // Verify that our counter has incremented.
    // expect('', encrypter);
    // expect(find.text('1'), findsOneWidget);
  });
}
