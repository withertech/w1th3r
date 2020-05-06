//
//  ViewController.m
//  time_waste
//
//  Created by Jake James on 2/22/20.
//  Copyright © 2020 Jake James. All rights reserved.
//

#import "MainViewController.h"
#import "exploit.h"
static const DDLogLevel ddLogLevel = DDLogLevelAll;
@implementation MainViewController
Boolean completed = false;
- (void)viewDidLoad {
    [super viewDidLoad];
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    UITextViewLogger *textViewLogger = [UITextViewLogger new];
    textViewLogger.autoScrollsToBottom = YES;
    [DDLog addLogger:textViewLogger];
    textViewLogger.textView = self.textView;
}
- (IBAction)Jailbreak:(UIButton *)sender {
    if (!completed) {
        get_tfp0();
        completed = true;
    } else {
        [self.textView setText:@""];
        DDLogError(@"[-] Exploitation has already finished. reboot and try again");
    }
}

@end
