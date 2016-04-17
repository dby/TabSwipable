//
//  ViewController1.m
//  demo
//
//  Created by sys on 16/4/4.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    [label setText:@"ViewController1"];
    label.textAlignment = NSTextAlignmentCenter;
    [label setFont:[UIFont systemFontOfSize:25]];
    
    [self.view addSubview:label];
    [self.view setBackgroundColor:[UIColor redColor]];
}

@end
