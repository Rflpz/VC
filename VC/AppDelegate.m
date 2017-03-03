//
//  AppDelegate.m
//  VC
//
//  Created by Rafael Lopez on 3/2/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "AppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "RLManager.h"
#import "RLTravelsController.h"
#import "RLGalleryController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    _tabController = [[UITabBarController alloc]init];
    _tabController.tabBar.translucent = NO;
    
    RLTravelsController *travelsController = [[RLTravelsController alloc] initWithNibName:@"RLTravelsController" bundle:nil];
    
    RLGalleryController *galleryController = [[RLGalleryController alloc] initWithNibName:@"RLGalleryController" bundle:nil];

    UITabBarItem *tabTravels = [[UITabBarItem alloc]initWithTitle:@"VIAJES" image:nil tag:0];
    [tabTravels setImage: [[[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:@"tr_u"] scaledToSize:CGSizeMake(20,20)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabTravels setSelectedImage: [[[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:@"tr_s"] scaledToSize:CGSizeMake(20,20)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    travelsController.tabBarItem = tabTravels;
    
    UITabBarItem *tabGallery = [[UITabBarItem alloc]initWithTitle:@"GALERIA" image:nil tag:0];
    [tabGallery setImage: [[[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:@"ga_u"] scaledToSize:CGSizeMake(20,20)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabGallery setSelectedImage: [[[RLManager sharedInstance] imageWithImage:[UIImage imageNamed:@"ga_s"] scaledToSize:CGSizeMake(20,20)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    galleryController.tabBarItem = tabGallery;
    
    UINavigationController *navTravels = [[UINavigationController alloc]initWithNibName:@"UINavigationController" bundle:nil];
    UINavigationController *navGallery = [[UINavigationController alloc]initWithNibName:@"UINavigationController" bundle:nil];

    [navTravels pushViewController:travelsController animated:YES];
    [navGallery pushViewController:galleryController animated:YES];

    _tabController.viewControllers = [NSArray arrayWithObjects:navTravels,navGallery,nil];
    
    [[UITabBar appearance] setBarTintColor:[[RLManager sharedInstance] colorFromHexString:@"#FFFFFF"]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Roboto-Bold" size:10.0f], NSFontAttributeName,  [[RLManager sharedInstance] colorFromHexString:@"#808080"], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Roboto-Bold" size:10.0f], NSFontAttributeName,  [[RLManager sharedInstance] colorFromHexString:@"#8e54e9"], NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    
    _window.rootViewController = _tabController;
    [_window setTintColor:[[RLManager sharedInstance] colorFromHexString:@"#512da8"]];
    
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    return YES;
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
