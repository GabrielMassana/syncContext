//
//  ViewController.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "ViewController.h"

#import "DataAPIManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [DataAPIManager retrieveDataFromServerWithSuccess:^(id result)
    {
        NSLog(@"result = %@", result);
        NSLog(@"[result count] = %lu", (unsigned long)[result count]);
        
        NSLog(@"result = %@", [result lastObject]);

    }
                                              failure:^(NSError *error)
    {
        NSLog(@"error = %@", error);
    }];
}

@end
