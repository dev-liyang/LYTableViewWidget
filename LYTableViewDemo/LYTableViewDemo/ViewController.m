//
//  ViewController.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "ViewController.h"
#import "LYTableViewInfo.h"

@interface ViewController ()

@end

@implementation ViewController
{
    LYTableViewInfo *_tableViewInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";
    
    [self creatTableView];
    
    [self reloadTableView];
}

#pragma mark - Creat View
- (void)creatTableView{
    _tableViewInfo = [[LYTableViewInfo alloc] initWithFrame:CGRectMake(0, kTopHeight, kMainScreenWidth, kMainScreenHeight - kTopHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:[_tableViewInfo getTableView]];
}

- (void)makeProfileCell:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    
    NSDictionary *userInfo = cellInfo.userInfo;
    
    UIImageView *headImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headImg"]];
    headImageV.frame = CGRectMake(10, 10, 68, 68);
    [cell.contentView addSubview:headImageV];
    
    UILabel *nicknameLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageV.frame) + 10, CGRectGetMinY(headImageV.frame)+10, 120, 17)];
    nicknameLab.text = userInfo[@"nickname"];
    nicknameLab.textColor = [UIColor blackColor];
    [cell.contentView addSubview:nicknameLab];
    
    UILabel *wxidLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageV.frame) + 10, CGRectGetMaxY(headImageV.frame)-15-10, 150, 15)];
    wxidLab.text = [NSString stringWithFormat:@"微信号:%@",userInfo[@"wxid"]];
    wxidLab.textColor = [UIColor blackColor];
    wxidLab.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:wxidLab];
    
    UIImageView *qrcodeImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qrcodeImg"]];
    qrcodeImageV.frame = CGRectMake(0, 0, 20, 20);
    qrcodeImageV.center = CGPointMake(kMainScreenWidth - 10 - 30, 88*0.5);
    [cell.contentView addSubview:qrcodeImageV];
}

#pragma mark - Reload Data
- (void)reloadTableView{
    
    LYTableViewCellInfo *normalCell = [LYTableViewCellInfo normalCellForTitle:@"normalCell" rightValue:@""];
    
    LYTableViewCellInfo *actionCell = [LYTableViewCellInfo normalCellForSel:@selector(actionCellClick) target:self title:@"actionCell" rightValue:@"none" imageName:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewCellInfo *centerCell = [LYTableViewCellInfo centerCellForSel:@selector(centerCellClick) target:self title:@"centerCell"];
    
    LYTableViewCellInfo *switchCell = [LYTableViewCellInfo switchCellForSel:@selector(switchCellClick:indexPath:) target:self title:@"switchCell" on:YES];
    
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(makeProfileCell:cellInfo:) makeTarget:self actionSel:@selector(showProfileView:indexPath:) actionTarget:self height:88 userInfo:@{@"nickname" : @"暖阳", @"wxid":@"yang123456"} accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    LYTableViewSectionInfo *sectionInfo = [LYTableViewSectionInfo sectionInfoDefaut];
    [sectionInfo addCell:normalCell];
    [sectionInfo addCell:actionCell];
    [sectionInfo addCell:centerCell];
    [sectionInfo addCell:switchCell];
    [sectionInfo addCell:profileCell];
    
    [_tableViewInfo addSection:sectionInfo];
    
    //刷新tableView
    [[_tableViewInfo getTableView] reloadData];
}

#pragma mark - Event
- (void)actionCellClick{
    NSLog(@"点击了actionCellClick");
}
- (void)centerCellClick{
    NSLog(@"点击了centerCellClick");
}
- (void)switchCellClick:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了switchCellClick-");
}
- (void)showProfileView:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了showProfileView-");
}

@end

