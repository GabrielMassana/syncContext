//
//  CommentParser.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "CommentParser.h"

#import "Comment+CoreDataProperties.h"
#import "User+CoreDataProperties.h"
#import "CDMCoreDataManager.h"

@implementation CommentParser

- (NSArray *)parseComments:(NSDictionary *)commentsDictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[commentsDictionary count]];
    
    for(NSDictionary *comment in commentsDictionary)
    {
        Comment *newComment = [self parseComment:comment];
        
        if (newComment)
        {
            [array addObject:newComment];
        }
    }
    
    return array;
}

- (Comment *)parseComment:(NSDictionary *)commentDictionary
{
    Comment *newComment = nil;
    
    if (commentDictionary[@"id"])
    {
        NSString *commentId = [NSString stringWithFormat:@"%@", commentDictionary[@"id"]];

        newComment = [Comment fetchCommentWithID:commentId
                            managedObjectContext:[CDMCoreDataManager sharedInstance].backgroundManagedObjectContext];
        
        if (!newComment)
        {
            newComment = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Comment class])
                                                  inManagedObjectContext:[CDMCoreDataManager sharedInstance].backgroundManagedObjectContext];
            
            newComment.commentId = commentId;
        }
        
        newComment.content = commentDictionary[@"content"];
        newComment.count = commentDictionary[@"comment_count"];
        newComment.likes = commentDictionary[@"like_count"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_GB"]];
        
        NSDate *date = [dateFormatter dateFromString:commentDictionary[@"created_at"]];
        
        newComment.createtAt = date;
        
        NSDictionary *userDictionary = commentDictionary[@"user"];
        
        User *user = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([User class])
                                                   inManagedObjectContext:[CDMCoreDataManager sharedInstance].backgroundManagedObjectContext];
        
        user.avatarURL = userDictionary[@"avatar"];
        user.firstName = userDictionary[@"first_name"];
        user.lastName = userDictionary[@"last_name"];
        
        newComment.user = user;        
    }
    
    return newComment;
}

@end
