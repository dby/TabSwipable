//
//  ViewController3.m
//  demo
//
//  Created by sys on 16/4/4.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    [label setText:@"ViewController3"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:25]];
    
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor yellowColor]];
}

@end
