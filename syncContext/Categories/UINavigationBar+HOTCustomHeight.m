//
//  UINavigationBar+HOTCustomHeight.m
//  Hot
//
//  Created by Gabriel Massana on 15/11/15.
//  Copyright © 2015 Gabriel Massana. All rights reserved.
//

#import "UINavigationBar+HOTCustomHeight.h"

#import "objc/runtime.h"

@implementation UINavigationBar (HOTCustomHeight)

static char *const kHOTHeightKey = "Height";

- (void)hot_setHeight:(CGFloat)height
{
    objc_setAssociatedObject(self,
                             kHOTHeightKey,
                             @(height),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getters

- (NSNumber *)height
{
    return objc_getAssociatedObject(self,
                                    kHOTHeightKey);
}

#pragma mark - System

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize;
    
    if (self.height)
    {
        newSize = CGSizeMake(self.superview.bounds.size.width,
                             [self.height floatValue]);
    }
    else
    {
        newSize = [super sizeThatFits:size];
    }
    
    return newSize;
}

@end
