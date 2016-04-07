//
//  Tab4ViewController.m
//  Demo2
//
//  Created by sys on 16/4/7.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "Tab4ViewController.h"

@interface Tab4ViewController ()

@end

@implementation Tab4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:15]];
    [label setText:@"Tab4"];
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor greenColor]];
}

@end
