#import "BlipClientPlugin.h"
#if __has_include(<blip_client/blip_client-Swift.h>)
#import <blip_client/blip_client-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "blip_client-Swift.h"
#endif

@implementation BlipClientPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBlipClientPlugin registerWithRegistrar:registrar];
}
@end
