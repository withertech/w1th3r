//
//  ViewController.m
//  time_waste
//
//  Created by Jake James on 2/22/20.
//  Copyright © 2020 Jake James. All rights reserved.
//

#import "ViewController.h"
#import "exploit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)Jailbreak:(UIButton *)sender {
    get_tfp0();
}

@end
