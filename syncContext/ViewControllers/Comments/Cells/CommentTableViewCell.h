//
//  CommentTableViewCell.h
//  syncContext
//
//  Created by GabrielMassana on 09/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "TableViewCell.h"

@class Comment;

@protocol CommentTableViewCellDelegate <NSObject>

@end

@interface CommentTableViewCell : TableViewCell

@property (nonatomic, weak) id<CommentTableViewCellDelegate> delegate;

- (void)updateCellWithComment:(Comment *)comment;

@end
