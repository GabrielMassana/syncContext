//
//  CommentTableViewCell.m
//  syncContext
//
//  Created by GabrielMassana on 09/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self)
    {

    }
    
    return self;
}

#pragma mark - Getters

#pragma mark - Constraints

- (void)updateConstraints
{
    [super updateConstraints];
    
    /*---------------------*/
    
}

#pragma mark - ButtonActions


#pragma mark - Update

- (void)updateCellWithComment:(Comment *)comment
{
    
}

@end
