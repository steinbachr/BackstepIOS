//
//  AppDelegate.m
//  Backstep
//
//  Created by Robert Steinbach on 3/19/14.
//  Copyright (c) 2014 Backstep. All rights reserved.
//

#import "AppDelegate.h"
#import "PlistOperations.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[PlistOperations deletePlist]; //DEBUGGING!!!
    //see if we've already made a choice of what type of user we want to be.
    if ([self userChosenType]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
        UIViewController *initialVC;
        if ([self userSelectedFinder]) {
            initialVC = [storyboard instantiateViewControllerWithIdentifier:@"finder_first"];
        } else {
            initialVC = [storyboard instantiateViewControllerWithIdentifier:@"lost_item_first"];
        }
        self.window.rootViewController = initialVC;
    }
    
    return YES;
}

// check if the user has made an indication of what type of user they are
- (BOOL)userChosenType
{
    NSDictionary* plist = [PlistOperations openPlist];
    if ([plist objectForKey:@"user_type"]) {
        return YES;
    } else {
        return NO;
    }
}

// check if the user has indicated they are a finder
- (BOOL)userSelectedFinder
{
    NSDictionary* plist = [PlistOperations openPlist];
    NSString* userType = [plist objectForKey:@"user_type"];
    return [userType isEqualToString:@"finder"];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
