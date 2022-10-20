#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
//- (BOOL)application:(UIApplication *)application
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//  [GMSServices provideAPIKey:@"YOUR KEY HERE"];
//  [GeneratedPluginRegistrant registerWithRegistry:self];
//  return [super application:application didFinishLaunchingWithOptions:launchOptions];
//}
@end
