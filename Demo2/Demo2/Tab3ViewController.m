//
//  Tab3ViewController.m
//  Demo2
//
//  Created by sys on 16/4/7.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "Tab3ViewController.h"

@interface Tab3ViewController ()

@end

@implementation Tab3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any add1itional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    [label setText:@"Tab3"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor greenColor]];
}

@end
