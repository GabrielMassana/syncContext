//
//  DataOperation.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "DataOperation.h"

#import "CNMSession.h"
#import "CNMRequest.h"
#import "CNMURLSessionDataTask.h"
#import "CommentParser.h"
#import "CDMCoreDataManager.h"

@implementation DataOperation

#pragma mark - Identifier

@synthesize identifier = _identifier;

- (NSString *)identifier
{
    if (!_identifier)
    {
        _identifier = [NSString stringWithFormat:@"DataOperation"];
    }
    
    return _identifier;
}

#pragma mark - Start

- (void)start
{
    [super start];
    
    CNMRequest *request = [[CNMRequest alloc] init];
    request.URL = [NSURL URLWithString:@"https://unii-interview.herokuapp.com/api/v1/posts"];
    
    CNMURLSessionDataTask *task = [[CNMSession defaultSession] dataTaskFromRequest:request];
    
    task.onCompletion = ^void(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (!error)
        {
            // Parse the raw JSON data.
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options: NSJSONReadingMutableContainers
                                                                   error: nil];
            
//            NSLog(@"json = %ld",[json[@"posts"][@"data"] count]);
//            NSLog(@"isMainThread %d", [NSThread currentThread].isMainThread);
            
            
            [[CDMCoreDataManager sharedInstance].backgroundManagedObjectContext performBlockAndWait:^
            {
                //Parse data here
                CommentParser *parser = [CommentParser parser];
                
                NSArray *comments = [parser parseComments:json[@"posts"][@"data"]];
                NSLog(@"comments count = %ld",[comments count]);
                NSLog(@"comments lastObject = %@",[comments lastObject]);
                
                [[CDMCoreDataManager sharedInstance].backgroundManagedObjectContext save:nil];
            }];

            [self didSucceedWithResult:nil];

        }
        else
        {
            [self didFailWithError:error];
        }
    };
    
    
    [task resume];
}




#pragma mark - Cancel

- (void)cancel
{
    [super cancel];
    
    [self didSucceedWithResult:nil];
}

@end
