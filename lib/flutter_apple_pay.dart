import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class FlutterApplePay {
  static const MethodChannel _channel =
      const MethodChannel('flutter_apple_pay');

  static Future<dynamic> makePayment({
    @required String countryCode,
    @required String currencyCode,
    @required List<PaymentNetwork> paymentNetworks,
    @required String merchantIdentifier,
    @required List<PaymentItem> paymentItems,
  }) async {
    assert(countryCode != null);
    assert(currencyCode != null);
    assert(paymentItems != null);
    assert(merchantIdentifier != null);
    assert(paymentItems != null);

    final Map<String, Object> args = <String, dynamic>{
      'paymentNetworks':
          paymentNetworks.map((item) => item.toString().split('.')[1]).toList(),
      'countryCode': countryCode,
      'currencyCode': currencyCode,
      'paymentItems':
          paymentItems.map((PaymentItem item) => item._toMap()).toList(),
      'merchantIdentifier': merchantIdentifier
    };
    if (Platform.isIOS) {
      final dynamic version = await _channel.invokeMethod('', args);
      return version;
    } else {
      throw Exception("Not supported operation system");
    }
  }
}

class PaymentItem {
  final String label;
  final double amount;

  PaymentItem({@required this.label, @required this.amount}) {
    assert(this.label != null);
    assert(this.amount != null);
  }

  Map<String, dynamic> _toMap() {
    Map<String, dynamic> map = new Map();
    map["label"] = this.label;
    map["amount"] = this.amount;
    return map;
  }
}

enum PaymentNetwork {
  visa,
  mastercard,
  amex,
  quicPay,
  chinaUnionPay,
  discover,
  interac,
  privateLabel
}
