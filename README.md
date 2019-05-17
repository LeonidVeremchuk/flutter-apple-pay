# flutter_google_pay
[![pub](https://img.shields.io/pub/v/flutter_apple_pay.svg)](https://pub.dev/packages/flutter_apple_pay)

Accept Payments with Apple Pay.

## Usage

```dart
    import 'package:flutter_apple_pay/flutter_apple_pay.dart';
  
  
    Future<void> makePayment() async {
       dynamic platformVersion;
       PaymentItem paymentItems = PaymentItem(label: 'Label', amount: 51.0);
       try {
         platformVersion = await FlutterApplePay.makePayment(
           countryCode: "US",
           currencyCode: "USD",
           paymentNetworks: [PaymentNetwork.visa, PaymentNetwork.mastercard],
           merchantIdentifier: "merchant.stripeApplePayTest",
           paymentItems: [paymentItems],
         );
         print(platformVersion);
       } on PlatformException {
         platformVersion = 'Failed to get platform version.';
       }
     }

```



