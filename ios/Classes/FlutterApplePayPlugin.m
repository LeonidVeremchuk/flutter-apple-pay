#import "FlutterApplePayPlugin.h"
#import <flutter_apple_pay/flutter_apple_pay-Swift.h>

@implementation FlutterApplePayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterApplePayPlugin registerWithRegistrar:registrar];
}
@end
