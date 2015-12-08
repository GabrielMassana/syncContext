//
//  DataAPIManager.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "DataAPIManager.h"

#import "DataOperation.h"

static NSString *const kHOTNetworkDataOperationQueueTypeIdentifier = @"kHOTNetworkDataOperationQueueTypeIdentifier";

@implementation DataAPIManager

+ (void)retrieveDataFromServerWithSuccess:(COMOperationOnSuccess)success
                                  failure:(COMOperationOnFailure)failure
{
    DataOperation *operation= [[DataOperation alloc] init];
    operation.operationQueueIdentifier = kHOTNetworkDataOperationQueueTypeIdentifier;
    
    operation.onSuccess = ^(id result)
    {
//        NSLog(@"json %lu", (unsigned long)[(NSDictionary *)result count]);
//        NSLog(@"isMainThread %d", [NSThread currentThread].isMainThread);
        
        success(result);
    };
    
    operation.onFailure = ^(NSError *error)
    {
        failure(error);
    };
    
    [[COMOperationQueueManager sharedInstance] addOperation:operation];
}

@end
