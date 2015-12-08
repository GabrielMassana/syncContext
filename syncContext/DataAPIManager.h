//
//  DataAPIManager.h
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreOperation/CoreOperation.h>

@interface DataAPIManager : NSObject

+ (void)retrieveDataFromServerWithSuccess:(COMOperationOnSuccess)success
                                  failure:(COMOperationOnFailure)failure;

@end
