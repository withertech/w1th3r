//
//  AppDelegate.m
//  time_waste
//
//  Created by Jake James on 2/22/20.
//  Copyright © 2020 Jake James. All rights reserved.
//

#import "AppDelegate.h"
#import "exploit.h"
#import "UITextViewLogger.h"
#import "ViewController.h"
static const DDLogLevel ddLogLevel = DDLogLevelAll;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    UITextViewLogger *textViewLogger = [UITextViewLogger new];
    textViewLogger.autoScrollsToBottom = YES;
    [DDLog addLogger:textViewLogger];
    ViewController *viewController = [ViewController alloc];
    textViewLogger.textView = viewController.textView;
    return YES;
}

@end
