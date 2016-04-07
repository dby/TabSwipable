//
//  Tab2ViewController.m
//  Demo2
//
//  Created by sys on 16/4/7.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "Tab2ViewController.h"

@interface Tab2ViewController ()

@end

@implementation Tab2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    [label setText:@"Tab2"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor greenColor]];
}

@end
