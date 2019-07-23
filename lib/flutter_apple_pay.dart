import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class FlutterApplePay {
  static const MethodChannel _channel =
      const MethodChannel('flutter_apple_pay');

  static Future<dynamic> getStripeToken({
    @required String countryCode,
    @required String currencyCode,
    @required List<PaymentNetwork> paymentNetworks,
    @required String merchantIdentifier,
    @required String merchantName,
    bool isPending = false,
    @required List<PaymentItem> paymentItems,
    @required String stripePublishedKey,
  }) async {
    assert(countryCode != null);
    assert(currencyCode != null);
    assert(paymentItems != null);
    assert(merchantIdentifier != null);
    assert(merchantName != null);
    assert(paymentItems != null);
    assert(stripePublishedKey != null);

    final Map<String, Object> args = <String, dynamic>{
      'paymentNetworks':
          paymentNetworks.map((item) => item.toString().split('.')[1]).toList(),
      'countryCode': countryCode,
      'stripePublishedKey': stripePublishedKey,
      'currencyCode': currencyCode,
      'paymentItems':
          paymentItems.map((PaymentItem item) => item._toMap()).toList(),
      'merchantIdentifier': merchantIdentifier,
      'merchantName' : merchantName,
      'isPending' : isPending
    };
    if (Platform.isIOS) {
      final dynamic stripeToken = await _channel.invokeMethod('getStripeToken', args);
      return stripeToken;
    } else {
      throw Exception("Not supported operation system");
    }
  }

  static Future<void> closeApplePaySheet({@required bool isSuccess}) async {
    if (Platform.isIOS) {
      if(isSuccess) {
        await _channel.invokeMethod('closeApplePaySheetWithSuccess');
      }
      else {
        await _channel.invokeMethod('closeApplePaySheetWithError');
      }
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
