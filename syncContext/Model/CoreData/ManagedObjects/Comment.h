//
//  Comment.h
//  
//
//  Created by GabrielMassana on 08/12/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

NS_ASSUME_NONNULL_BEGIN

@interface Comment : NSManagedObject

+ (instancetype)fetchCommentWithID:(NSString *)commentID
              managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Comment+CoreDataProperties.h"
