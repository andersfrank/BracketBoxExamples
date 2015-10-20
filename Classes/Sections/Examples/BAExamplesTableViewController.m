//
//  ExamplesTableViewController.m
//  BracketApp
//
//  Created by Anders Frank on 18/10/15.
//  Copyright © 2015 Anders Frank. All rights reserved.
//

#import "BAExamplesTableViewController.h"
#import "BAMuncheryViewController.h"
#import "BANewsFeedTableViewController.h"

@interface BAExamplesTableViewController ()

@property (nonatomic) NSArray *viewControllers;

@end

@implementation BAExamplesTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Examples";
        self.viewControllers = @[[BAMuncheryViewController new],
                                 [BANewsFeedTableViewController new]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    UIViewController *vc = self.viewControllers[indexPath.row];
    cell.textLabel.text = vc.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = self.viewControllers[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
