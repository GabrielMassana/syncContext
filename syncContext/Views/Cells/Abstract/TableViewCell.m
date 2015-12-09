//
//  TableViewCell.m
//  syncContext
//
//  Created by GabrielMassana on 09/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

#pragma mark - Identifier

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

#pragma mark - Layout

- (void)layoutByApplyingConstraints
{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
