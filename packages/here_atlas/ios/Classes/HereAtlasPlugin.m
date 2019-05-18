#import "HereAtlasPlugin.h"
#import <here_atlas/here_atlas-Swift.h>

@implementation HereAtlasPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHereAtlasPlugin registerWithRegistrar:registrar];
}
@end
