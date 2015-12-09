//
//  ResultsAdapter.m
//  syncContext
//
//  Created by GabrielMassana on 09/12/2015.
//  Copyright © 2015 GabrielMassana. All rights reserved.
//

#import "ResultsAdapter.h"

#import "CDMTableViewFetchedResultsController.h"
#import "CommentTableViewCell.h"
#import "CDMCoreDataManager.h"
#import "Comment.h"

@interface ResultsAdapter () <UITableViewDataSource, UITableViewDelegate, CDMTableViewFetchedResultsControllerDelegate, CommentTableViewCellDelegate>

@property (nonatomic, strong) CDMTableViewFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong, readonly) NSFetchRequest *fetchRequest;

@property (nonatomic, strong, readonly) NSArray *sortDescriptorsForFetchRequest;

@property (nonatomic, strong, readonly) NSPredicate *predicateForFetchRequest;

@end

@implementation ResultsAdapter

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

#pragma mark - TableView

- (void)setTableView:(UITableView *)tableView
{
    if (!_tableView)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(tableView))];
        _tableView = tableView;
        [self didChangeValueForKey:NSStringFromSelector(@selector(tableView))];
        
        _tableView.rowHeight = 258.0f;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[CommentTableViewCell class]
           forCellReuseIdentifier:[CommentTableViewCell reuseIdentifier]];
    }
}

#pragma mark - FetchResultsController

- (CDMTableViewFetchedResultsController *)fetchedResultsController
{
    if (!_fetchedResultsController)
    {
        _fetchedResultsController = [[CDMTableViewFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest
                                                                                  managedObjectContext:[CDMCoreDataManager sharedInstance].managedObjectContext
                                                                                    sectionNameKeyPath:nil
                                                                                             cacheName:nil];
        
        _fetchedResultsController.tableView = self.tableView;
        _fetchedResultsController.frcDelegate = self;
        
        [_fetchedResultsController performFetch:nil];
    }
    
    return _fetchedResultsController;
}

- (NSFetchRequest *)fetchRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = [NSEntityDescription entityForName:NSStringFromClass([Comment class])
                                      inManagedObjectContext:[CDMCoreDataManager sharedInstance].managedObjectContext];
    
    fetchRequest.sortDescriptors = self.sortDescriptorsForFetchRequest;
    
    return fetchRequest;
}

- (NSArray *)sortDescriptorsForFetchRequest
{
    NSSortDescriptor *indexSort = [NSSortDescriptor sortDescriptorWithKey:@"commentId"
                                                                ascending:YES];
    
    return @[indexSort];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Comment *comment = self.fetchedResultsController.fetchedObjects[indexPath.row];
    
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[CommentTableViewCell reuseIdentifier]
                                                                    forIndexPath:indexPath];
    
    cell.delegate = self;
    
    [cell updateCellWithComment:comment];
    
    [cell layoutByApplyingConstraints];
    
    
    if (indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

#pragma mark - CDMTableViewFetchedResultsControllerDelegate

- (void)didUpdateContent
{
    NSLog(@"didUpdateContent");
}

- (void)willUpdateCellAtIndexPath:(NSIndexPath *)indexPath
{
    Comment *comment = self.fetchedResultsController.fetchedObjects[indexPath.row];
    CommentTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
   
    [cell updateCellWithComment:comment];
}

@end
