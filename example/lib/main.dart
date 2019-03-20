import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apple_pay/flutter_apple_pay.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    makePayment();
  }

  Future<void> makePayment() async {
    String platformVersion;
    try {
      platformVersion = await FlutterApplePay.makePayment(new Map());
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apple Pay Test'),
        ),
        body: Center(
          child: Text('Waiting for Apple Pay modal.'),
        ),
      ),
    );
  }
}
