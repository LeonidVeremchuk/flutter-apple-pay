import 'dart:async';

import 'package:flutter/services.dart';

class FlutterApplePay {
  static const MethodChannel _channel =
      const MethodChannel('flutter_apple_pay');

  static Future<String> makePayment(Map args) async {
    final String version = await _channel.invokeMethod('');
    return version;
  }
}
