//
//  HomePageViewController.m
//  qiongyou--mirror
//
//  Created by watchman on 2017/4/8.
//  Copyright © 2017年 Hervey. All rights reserved.
//

#import "HomePageViewController.h"
#import "indexInfoModel.h"
#import "SildeModel.h"
#import "LastestVisitModel.h"
#import "HomePageHeadView.h"
#import "VisitHistoryView.h"
//#import "LastestVisitModel.h"
@interface HomePageViewController ()
@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *visitArr;
@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.top = -20;
    [self.tableView setContentInset:contentInset];

    [indexInfoModel globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            self.dataArr = posts;
            NSArray *model = self.dataArr[0];
            HomePageHeadView *headView = [[HomePageHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 250) data:model];
            self.tableView.tableHeaderView = headView;
        }
        [self.tableView reloadData];
    }];

    [LastestVisitModel city_id:66 globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            VisitHistoryView *historyView = [[VisitHistoryView alloc]initWithFrame:CGRectMake(10, 260, kScreenW-20, 245) data:posts];
            [self.tableView addSubview:historyView];
        }
        [self.tableView reloadData];
    }];
}


#pragma mark -tableViewDelegate tableViewDataSource
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 200;
//}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
