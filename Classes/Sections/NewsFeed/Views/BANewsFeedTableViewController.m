//
//  NewsFeedTableViewController.m
//  BracketApp
//
//  Created by Anders Frank on 19/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "BANewsFeedTableViewController.h"
#import "BANewsFeedCell.h"
#import "BAPostCell.h"
#import "BANewsFeedCellModel.h"
#import "BAPostCellModel.h"
#import "NSString+LoremIpsum.h"

@interface BANewsFeedTableViewController ()

@property (nonatomic) NSArray *cellModels;
@property (nonatomic) CGFloat reloadedWidth;

@end

@implementation BANewsFeedTableViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"News Feed";
        
        NSMutableArray *cellModels = [NSMutableArray new];
        [cellModels addObject:[BANewsFeedCellModel new]];
        [cellModels addObjectsFromArray:[self.class generatePostsViewModels:20]];

        self.cellModels = [NSArray arrayWithArray:cellModels];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.827  green:0.839  blue:0.859 alpha:1];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    [@[BAPostCell.class, BANewsFeedCell.class] enumerateObjectsUsingBlock:^(Class cellClass, NSUInteger idx, BOOL *stop) {
        [self.tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }];
}

- (void)viewDidLayoutSubviews {
    CGFloat width = CGRectGetWidth(self.view.bounds);
    if (width != self.reloadedWidth) {
        self.reloadedWidth = width;
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellModel = self.cellModels[indexPath.row];

    if ([cellModel isKindOfClass:[BANewsFeedCellModel class]]) {
        BANewsFeedCell *cell = (BANewsFeedCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BANewsFeedCell.class) forIndexPath:indexPath];
        cell.viewModel = cellModel;
        return cell;
    }
    
    if ([cellModel isKindOfClass:[BAPostCellModel class]]) {
        BAPostCell *cell = (BAPostCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(BAPostCell.class) forIndexPath:indexPath];
        cell.viewModel = cellModel;
        return cell;
    }

    // Quite compiler warnings.
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellModel = self.cellModels[indexPath.row];
    CGFloat tableViewWidth = CGRectGetWidth(tableView.bounds);
    
    if ([cellModel isKindOfClass:[BANewsFeedCellModel class]]) {
        return 58;
    }
    
    if ([cellModel isKindOfClass:[BAPostCellModel class]]) {
       return [BAPostCell heightForViewModel:cellModel cellWidth:tableViewWidth];
    }
    
    // Quite compiler warnings.
    return 0;
}

+ (NSArray *)generatePostsViewModels:(NSUInteger)count {
    NSMutableArray *posts = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        NSString *status = [NSString ba_loremIpsumString:4 + arc4random_uniform(10)];
        NSString *message = [NSString ba_loremIpsumString:10 + arc4random_uniform(40)];
        [posts addObject:[[BAPostCellModel alloc] initWithStatus:status message:message]];
    }
    return [NSArray arrayWithArray:posts];
}

@end
