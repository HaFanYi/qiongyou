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
#import "Comment.h"
#import "LastestVisitModel.h"
#import "HomePageHeadView.h"
#import "VisitHistoryView.h"
#import "CommentView.h"
#import "IndexTableViewCell.h"
#import "NowGoView.h"
//#import "LastestVisitModel.h"
@interface HomePageViewController ()
{
    HomePageHeadView *headView;
}
@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *comArr;
@property (nonatomic,strong)NSArray *visitArr;
@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.top = -20;
    [self.tableView setContentInset:contentInset];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getDataWithPage:1];
}

#pragma mark--数据
- (void)getDataWithPage:(NSUInteger)page {
    [indexInfoModel globalTimelinePostsWithPage:page  Block:^(NSArray *posts, NSError *error) {
        if (!error) {
            NSArray *model = posts[0];
            self.comArr = posts[1];
            self.dataArr = posts[2];
            headView = [[HomePageHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 250) data:model];
            self.tableView.tableHeaderView = headView;
        }
        [self.tableView reloadData];
    }];
}

#pragma mark -tableViewDelegate tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3+self.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSUInteger row = 0;
//    if (section <= 2) {
//        row = 1;
//    }else {
//        row = 1;
//    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        [LastestVisitModel city_id:66 globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
                    if (!error) {
                        VisitHistoryView *historyView = [[VisitHistoryView alloc]initWithFrame:CGRectMake(10, 0, kScreenW-20, 245) data:posts];
                        [cell addSubview:historyView];
                    }
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        CommentView *commentView = [[CommentView alloc]initWithFrame:CGRectMake(10, 0, kScreenW-20, 40) data:self.comArr];
        [cell addSubview:commentView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
        return cell;
    }else if (indexPath.section == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        }
        NowGoView *goV = [[NowGoView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
        [cell addSubview:goV];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
        return cell;
    }else {
            IndexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IndexTableViewCell"];
            if (!cell) {
                cell = [[IndexTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"IndexTableViewCell"];
            }
        NSUInteger index = indexPath.section - 3;
        indexInfoModel *model = self.dataArr[index];
        NSArray *arr = [model.cover componentsSeparatedByString:@"?"];
        [cell.coverImageV sd_setImageWithURL:[NSURL URLWithString:arr[0]] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
        cell.tagLabel.text = [NSString stringWithFormat:@"%@",model.column];
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",model.title];
        cell.subjectLabel.text = [NSString stringWithFormat:@"%@",model.subject];
        [cell.iconImageV sd_setImageWithURL:[NSURL URLWithString:model.icon_url] placeholderImage:[UIImage imageNamed:@"LeePlaceholder.png"]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    if (indexPath.section == 0) {
        height = 245;
    }else if(indexPath.section == 1) {
        height = 40;
    }else if (indexPath.section == 2) {
        height = 45;
    }else {
        NSUInteger index = indexPath.section - 3;
        indexInfoModel *model = self.dataArr[index];
       CGFloat height1 = [IndexTableViewCell heightForCellWithText:model.title  font:18.0];
        CGFloat height2 = [IndexTableViewCell heightForCellWithText:model.subject font:13.0];
       CGFloat height3 = 220;
        height = height1+height2+height3;
    }
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = 0;
    if (section == 2) {
        height = 5;
    }else {
        height = 10;
    }
    return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat height = 0;
    if (section == self.dataArr.count+2) {
        height = 50;
    }else {
        height = 1;
    }
    return height;
}
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
