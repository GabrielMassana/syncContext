//
//  CommentParser.h
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "Parser.h"

@interface CommentParser : Parser

- (NSArray *)parseComments:(NSDictionary *)flingDictionary;

@end
