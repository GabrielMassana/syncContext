//
//  ViewController.m
//  syncContext
//
//  Created by GabrielMassana on 08/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "ViewController.h"

#import <PureLayout/PureLayout.h>

#import "DataAPIManager.h"
#import "ResultsAdapter.h"
#import "CDMCoreDataManager.h"
#import "Comment.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ResultsAdapter *adapter;

@end

@implementation ViewController

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self.view addSubview:self.tableView];
        
        [self updateViewConstraints];
        
        self.adapter.tableView = self.tableView;
    }
    
    return self;
}

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [DataAPIManager retrieveDataFromServerWithSuccess:^(id result)
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Comment class])];
        
        NSArray *entries =  [[CDMCoreDataManager sharedInstance].managedObjectContext executeFetchRequest:request
                                                                                                    error:nil];
        
        NSLog(@"entries = %@", entries);

    }
                                              failure:^(NSError *error)
    {
        NSLog(@"error = %@", error);
    }];
    
    
}

#pragma mark - Subviews

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [UITableView newAutoLayoutView];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.alwaysBounceVertical = YES;
    }
    
    return _tableView;
}

#pragma mark - Adapter

- (ResultsAdapter *)adapter
{
    if (!_adapter)
    {
        _adapter = [[ResultsAdapter alloc] init];
    }
    
    return _adapter;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    /*-----------------*/
    
    [self.tableView autoPinEdgesToSuperviewEdges];
}

@end
