//
//  RootNavigationController.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "RootNavigationController.h"

#import "CommentsViewController.h"

@interface RootNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, strong, readonly) UIViewController *rootViewController;

@end

@implementation RootNavigationController

#pragma mark - Init

- (instancetype)init
{
    self = [super initWithRootViewController:self.rootViewController];
    
    if (self)
    {
        self.delegate = self;
    }
    
    return self;
}

#pragma mark - ViewControllers

- (UIViewController *)rootViewController
{
    UIViewController *rootViewController = [[CommentsViewController alloc] init];
    
    return rootViewController;
}

@end
