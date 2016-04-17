//
//  ViewController2.m
//  demo
//
//  Created by sys on 16/4/4.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    [label setText:@"ViewController2"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:25]];
    
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

@end
