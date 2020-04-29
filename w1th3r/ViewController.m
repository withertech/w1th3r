//
//  ViewController.m
//  time_waste
//
//  Created by Jake James on 2/22/20.
//  Copyright © 2020 Jake James. All rights reserved.
//

#import "ViewController.h"
#import "exploit.h"
#import "FdHijacker.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *loggingView;
@property (strong, nonatomic) FdHijacker *stdoutHijacker;
@property (strong, nonatomic) FdHijacker *stderrHijacker;
@property (strong, nonatomic) NSMutableString *contents;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Add a border around the text view.
    self.loggingView.layer.borderWidth = 1.0f;
    self.loggingView.layer.borderColor = [UIColor blackColor].CGColor;

    // Hijack standard out.
    self.stdoutHijacker = [FdHijacker hijackerWithFd: fileno(stdout)];
    setbuf (stdout, NULL);
    self.stdoutHijacker.delegate = self;
    [self.stdoutHijacker startHijacking];
    [self.stdoutHijacker startReplicating];

    // Hijack standard error
    self.stderrHijacker = [FdHijacker hijackerWithFd: fileno(stderr)];
    setbuf (stderr, NULL);
    self.stderrHijacker.delegate = self;
    [self.stderrHijacker startHijacking];
    [self.stderrHijacker startReplicating];

    self.contents = [NSMutableString string];

    NSLog (@"All Kids Love Log");
}
- (void) scrollToEnd {
    NSRange range = NSMakeRange (self.contents.length, 0);
    [self.loggingView scrollRangeToVisible: range];
} // scrollToEnd


- (void) hijacker: (FdHijacker *) hijacker  gotText: (NSString *) text {
    if (hijacker == self.stdoutHijacker) [self.contents appendString: @"stdout: "];
    if (hijacker == self.stderrHijacker) [self.contents appendString: @"stderr: "];

    [self.contents appendString: text];
    self.loggingView.text = self.contents;
    [self scrollToEnd];
}
- (IBAction)Jailbreak:(UIButton *)sender {
    get_tfp0();
}

@end
