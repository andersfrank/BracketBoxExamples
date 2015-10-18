//
//  AppDelegate.m
//  BracketApp
//
//  Created by Anders Frank on 18/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "AppDelegate.h"
#import "BAExamplesTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[BAExamplesTableViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
