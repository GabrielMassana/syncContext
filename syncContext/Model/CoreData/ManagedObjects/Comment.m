//
//  Comment.m
//  
//
//  Created by GabrielMassana on 08/12/2015.
//
//

#import "Comment.h"

@implementation Comment

+ (instancetype)fetchCommentWithID:(NSString *)commentID
            managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Comment *comment = nil;

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"commentId MATCHES %@", commentID];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Comment class])];
    [request setPredicate:predicate];

    NSArray *entries =  [managedObjectContext executeFetchRequest:request
                                                             error:nil];
    
    if ([entries count] > 0)
    {
        comment = [entries objectAtIndex:0];
    }
    
    return comment;
}

@end
