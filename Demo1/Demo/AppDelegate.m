//
//  AppDelegate.m
//  demo
//
//  Created by sys on 16/4/4.
//  Copyright © 2016年 sys. All rights reserved.
//

#import "AppDelegate.h"

#import "SwipableViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

@interface AppDelegate ()
{
    ViewController1 *v1;
    ViewController2 *v2;
    ViewController3 *v3;
    ViewController4 *v4;
}

@property (nonatomic, strong) UINavigationController *naviController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    v1 = [[ViewController1 alloc] init];
    v2 = [[ViewController2 alloc] init];
    v3 = [[ViewController3 alloc] init];
    v4 = [[ViewController4 alloc] init];
        
    SwipableViewController *viewController = [[SwipableViewController alloc] initWithTitle:@"just for test"
                                      andSubTitles:@[@"test1", @"test2", @"test3", @"test4"]
                                    andControllers:@[v1, v2, v3, v4]];
    
    _naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = _naviController;
    [self.window addSubview:_naviController.view];
    
    [_naviController.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
