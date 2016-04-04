//
//  ViewController.m
//  demo
//
//  Created by sys on 16/4/4.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface ViewController ()
{
    ViewController1 *v1;
    ViewController2 *v2;
    ViewController3 *v3;
    ViewController4 *v4;
}

@end

@implementation ViewController

#pragma mark - life cycle
-(instancetype)init {
    
    NSLog(@"%s", __func__);
    self = [super init];
    if (self) {
        v1 = [[ViewController1 alloc] init];
        v2 = [[ViewController2 alloc] init];
        v3 = [[ViewController3 alloc] init];
        v4 = [[ViewController4 alloc] init];
        
        self = [self initWithTitle:@"just for test"
                      andSubTitles:@[@"test1", @"test2", @"test3", @"test4"]
                    andControllers:@[v1, v2, v3, v4]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initComponent];
}

#pragma mark - init
- (void)initComponent {
    
    //[self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

@end
