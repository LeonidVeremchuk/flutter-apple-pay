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
  }

  Future<void> makePayment() async {
    dynamic platformVersion;
    PaymentItem paymentItems = PaymentItem(label: 'Label', amount: 51.0);

    try {
      platformVersion = await FlutterApplePay.makePayment(
        countryCode: "UA",
        currencyCode: "USD",
        paymentNetworks: ['visa'],
        merchantIdentifier: "merchant.stripeApplePayTest",
        paymentItems: [paymentItems],
      );
      print(platformVersion);
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
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text('Waiting for Apple Pay modal.'),
                RaisedButton(
                  child: Text('Call payment'),
                  onPressed: () => makePayment(),
                )
            ],
          )
        ),
      ),
    );
  }
}
