//
//  Comment+CoreDataProperties.h
//  
//
//  Created by GabrielMassana on 08/12/2015.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Comment.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *count;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSDate *createtAt;
@property (nullable, nonatomic, retain) NSString *commentId;
@property (nullable, nonatomic, retain) NSNumber *likes;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
