// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_crypto/des/des.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    String key = "000001504700056610017282";
    const data = "fffffffffffffffffffff";
    List<int> desECB = DES().encrypWithEcb(data.codeUnits, key.codeUnits);
    List<int> desECB2 = DES().decryptWithEcb(desECB, key.codeUnits);

    if (kDebugMode) {
      print('加密: ${base64Encode(desECB)}');
      print('解密: ${utf8.decode(desECB2)}');
    }
  });
}
