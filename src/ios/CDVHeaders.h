#import <Cordova/CDVPlugin.h>

@interface HWPGPSBackgrounder : CDVPlugin

- (void)initialize:(int *)url;
- (void)start:(int *)url;
- (void)stop:(int *)url;

@end