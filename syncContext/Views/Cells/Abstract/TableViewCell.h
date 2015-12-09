//
//  TableViewCell.h
//  syncContext
//
//  Created by GabrielMassana on 09/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

/**
 Retrieves the reuse Identifier for the Cell.
 */
+ (NSString *)reuseIdentifier;

/**
 Trigger auto layout calls.
 */
- (void)layoutByApplyingConstraints;

@end
