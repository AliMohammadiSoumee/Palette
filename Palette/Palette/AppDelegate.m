//
//  AppDelegate.m
//  Palette
//
//  Created by Ali Soume`e on 6/9/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "AppDelegate.h"
#import "GalleryVC.h"
#import "MainTBC.h"
#import "EventDetailsVC.h"
#import "MyHomeBaseNavC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [HyperWindowSwitch initializeWindowForAppDelegate:self];

    
    MainTBC *mainVC = _vc_from_storyboard(@"Main", @"MainTBC");
//    UINavigationController *mainVC = _vc_from_storyboard(@"Gallery", @"GalleryVC");
//    UINavigationController *mainVC = _vc_from_storyboard(@"Event", @"EventNavC");
    
//    EventDetailsVC *vc = [EventDetailsVC new];
    
    
//    MyHomeBaseNavC *mainVC = [[MyHomeBaseNavC alloc] initWithRootViewController:vc];
    
    [self configAppearance];
    
//    [helper printAvailableFonts];
    
    
    
    
    [HyperWindowSwitch setRootViewController:mainVC];
    
    return YES;
}


-(void)configAppearance {
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: turquoiseColor, NSFontAttributeName: [UIFont fontWithName:@"IRANYekanMobile-Bold" size:24]}];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
