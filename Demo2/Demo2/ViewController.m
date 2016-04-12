//
//  ViewController.m
//  Demo2
//
//  Created by sys on 16/4/7.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "ViewController.h"

#import "SwipableViewController.h"

#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

#import "Tab1ViewController.h"
#import "Tab2ViewController.h"
#import "Tab3ViewController.h"
#import "Tab4ViewController.h"


@interface ViewController ()
{
    ViewController1 *v1;
    ViewController2 *v2;
    ViewController3 *v3;
    ViewController4 *v4;
    
    Tab1ViewController *tv1;
    Tab2ViewController *tv2;
    Tab3ViewController *tv3;
    Tab4ViewController *tv4;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    v1 = [[ViewController1 alloc] init];
    v2 = [[ViewController2 alloc] init];
    v3 = [[ViewController3 alloc] init];
    v4 = [[ViewController4 alloc] init];
    
    tv1 = [[Tab1ViewController alloc] init];
    tv2 = [[Tab2ViewController alloc] init];
    tv3 = [[Tab3ViewController alloc] init];
    tv4 = [[Tab4ViewController alloc] init];
    
    SwipableViewController *svc = [[SwipableViewController alloc] initWithTitle:@"just for test"
                                                                   andSubTitles:@[
                                                                                  @"V1",
                                                                                  @"V2",
                                                                                  @"V3",
                                                                                  @"V4"
                                                                                  ]
                                                                 andControllers:@[
                                                                                  v1,
                                                                                  v2,
                                                                                  v3,
                                                                                  v4,
                                                                                  ]
                                                                    underTabbar:YES];
    // tabbar 是否半透明
    self.tabBar.translucent = NO;
    self.viewControllers = @[
                             tv1,
                             [self addNavigationItemForViewController:svc],
                             tv2,
                             tv3,
                             ];
    
    NSArray *titles = @[@"tv1", @"tv2", @"tv3",@"tv4"];
    NSArray *images = @[@"", @"", @"", @""];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
        [item setImage:[UIImage imageNamed:images[idx]]];
        [item setSelectedImage:[UIImage imageNamed:[images[idx] stringByAppendingString:@"-selected"]]];
    }];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
}

#pragma mark --

- (UINavigationController *)addNavigationItemForViewController:(UIViewController *)viewController
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    /*
     viewController.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"]
     style:UIBarButtonItemStylePlain
     target:self
     action:@selector(onClickMenuButton)];
     
     viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
     target:self
     action:@selector(pushSearchViewController)];
     
     */
    
    return navigationController;
}

@end
