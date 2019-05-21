
## Example
```
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
