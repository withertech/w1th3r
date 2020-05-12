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
Boolean running = false;

- (void)buttonLabelLoadingIndicator {
//    if (running) {
        NSString *messageText = self.jailbreakIndicator.text;
        int dotCount = (int)((self.jailbreakIndicator.text.length) - [messageText stringByReplacingOccurrencesOfString:@"." withString:@""].length + 1);
        self.jailbreakIndicator.text = @"Jailbreaking";
        NSString *addOn = @".";
        if (dotCount < 4) {
            addOn = [@"" stringByPaddingToLength:dotCount withString:@"." startingAtIndex:0];
        }
        self.jailbreakIndicator.text = [self.jailbreakIndicator.text stringByAppendingString:addOn];
//    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    DDFileLogger *fileLogger = [DDFileLogger new];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    UITextViewLogger *textViewLogger = [UITextViewLogger new];
    textViewLogger.autoScrollsToBottom = YES;
    [DDLog addLogger:textViewLogger];
    textViewLogger.textView = self.textView;
    if (![NSThread isMainThread]) {

        dispatch_async(dispatch_get_main_queue(), ^{
            [NSTimer scheduledTimerWithTimeInterval:0.6
                                             target:self
                                           selector:@selector(buttonLabelLoadingIndicator)
                                           userInfo:nil
                                            repeats:YES];
        });
    }
    else{
        [NSTimer scheduledTimerWithTimeInterval:0.6
                                         target:self
                                       selector:@selector(buttonLabelLoadingIndicator)
                                       userInfo:nil
                                        repeats:YES];
    }
}
- (IBAction)Jailbreak:(UIButton *)sender {
    if (!completed) {
        running = true;
        get_tfp0();
        running = false;
        completed = true;
    } else {
        [self.textView setText:@""];
        DDLogError(@"[-] Exploitation has already finished. reboot and try again");
    }
}

@end
