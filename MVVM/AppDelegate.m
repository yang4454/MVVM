//
//  AppDelegate.m
//  MVVM
//
//  Created by Jeff on 2020/10/16.
//  Copyright © 2020 Jeff. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init] ];
    self.window.rootViewController = navi;
    
    [self.window makeKeyAndVisible];
    return YES;
}




@end
