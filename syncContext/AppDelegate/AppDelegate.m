//
//  AppDelegate.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "AppDelegate.h"

#import "CDMCoreDataManager.h"
#import <CoreNetworking/CNMSession.h>
#import <CoreOperation/CoreOperation.h>

#import "RootNavigationController.h"

static NSString *const kHOTNetworkDataOperationQueueTypeIdentifier = @"kHOTNetworkDataOperationQueueTypeIdentifier";

@interface AppDelegate () <CDMCoreDataManagerDelegate>

@property (nonatomic, strong) UIViewController *rootViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CDMCoreDataManager sharedInstance].delegate = self;

    /*-------------------*/

    [self registerOperationQueues];

    /*-------------------*/
    
    self.window.backgroundColor = [UIColor clearColor];
    self.window.clipsToBounds = NO;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

#pragma mark - Window

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        
        _window.rootViewController = self.navigationController;
    }
    
    return _window;
}

#pragma mark - Root

- (UINavigationController *)navigationController
{
    if (!_navigationController)
    {
        _navigationController = [[RootNavigationController alloc] init];
        [_navigationController setNavigationBarHidden:YES];
    }
    
    return _navigationController;
}


#pragma mark - OperationQueues

- (void)registerOperationQueues
{
    //Network UI
    
    //Network Background
    NSOperationQueue *networkDataOperationQueue = [[NSOperationQueue alloc] init];
    networkDataOperationQueue.qualityOfService = NSQualityOfServiceBackground;
    networkDataOperationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    
    [[COMOperationQueueManager sharedInstance] registerOperationQueue:networkDataOperationQueue
                                             operationQueueIdentifier:kHOTNetworkDataOperationQueueTypeIdentifier];
    
    //Media Download
    
    //Core Data Update
}

#pragma mark - CDMCoreDataManagerDelegate

- (NSString *)coreDataModelName
{
    return @"Hot";
}

@end
