// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:flutter_desktop_sample/util/crypto_util.dart';
import 'package:flutter_desktop_sample/util/number_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    List<int> list = CryptoUtil.hex2List('0123456789ABCDEF');
    log(list.toString());
    for (var i in list) {
      log(NumberUtils.to8Bit(i).toString());
      log(NumberUtils.intFromBits(NumberUtils.to8Bit(i)).toString());
    }
  });
}
