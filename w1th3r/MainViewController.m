//
//  ViewController.m
//  time_waste
//
//  Created by Jake James on 2/22/20.
//  Copyright © 2020 Jake James. All rights reserved.
//

#import "MainViewController.h"
#import "exploit.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    UITextViewLogger *textViewLogger = [UITextViewLogger new];
    textViewLogger.autoScrollsToBottom = YES;
    [DDLog addLogger:textViewLogger];
    textViewLogger.textView = self.textView;
}
- (IBAction)Jailbreak:(UIButton *)sender {
    
    get_tfp0();
}

@end
