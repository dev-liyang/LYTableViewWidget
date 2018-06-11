//
//  ExampleViewController.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "ExampleViewController.h"
#import "LYTableViewInfo.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController
{
    LYTableViewInfo *_tableViewInfo;
    LYTableViewCellInfo *_noChangeActionSwitchCellInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"示例";
    
    [self creatTableView];
    
    ///更新TableView
    [self reloadTableView];
    
    ///更新某个cell
    [self reloadCell];
}

#pragma mark - Creat View
- (void)creatTableView{
    
    _tableViewInfo = [[LYTableViewInfo alloc] initWithFrame:CGRectMake(0, kTopHeight, kMainScreenWidth, kMainScreenHeight - kTopHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:[_tableViewInfo getTableView]];
    
    //添加 TableHeaderView
    [[_tableViewInfo getTableView] setTableHeaderView:[self creatHeadView]];
}

- (UIView *)creatHeadView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 110)];
    
    UIImage *img = [UIImage imageNamed:@"LoginBackground_73x64_"];
    UIImageView *imageV = [[UIImageView alloc] initWithImage:img];
    imageV.center = CGPointMake(kMainScreenWidth * 0.5, img.size.height * 0.5 + 20);
    [headView addSubview:imageV];
    
    UILabel *versionLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame)+10, kMainScreenWidth, 20)];
    versionLab.textAlignment = NSTextAlignmentCenter;
    versionLab.font = [UIFont systemFontOfSize:20];
    versionLab.text = @"微信 WeChat 666";
    [headView addSubview:versionLab];
    
    return headView;
}


#pragma mark - Reload Data
- (void)reloadTableView{
    
    //按情况调用，清除所有section
    [_tableViewInfo clearAllSection];
    
    //添加section
    [self addFunctionSection];
    [self addHeaderSection];
    [self addHeaderViewSection];
    [self addLogoutSection];
    
    //刷新tableView
    [[_tableViewInfo getTableView] reloadData];
}

///更新某个cell
- (void)reloadCell{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LYTableViewCellInfo *cell = [LYTableViewCellInfo centerCellForSel:@selector(logoutClick) target:self title:@"更新某个cell"];
        NSIndexPath *indexP = [NSIndexPath indexPathForRow:0 inSection:3];
        [_tableViewInfo replaceCell:cell indexPath:indexP];
        [[_tableViewInfo getTableView] reloadRowsAtIndexPaths:@[indexP] withRowAnimation:(UITableViewRowAnimationNone)];
    });
}

- (void)addFunctionSection{
    //无点击效果
    LYTableViewCellInfo *example1 = [LYTableViewCellInfo normalCellForTitle:@"无点击事件" rightValue:@"rightValue可选"];
    
    //----------------(参数一：LYTableViewCellInfo  参数二：NSIndexPath) -------------- //
    // -------------------- SEL 可选参数 ----------------- //
    //SEL带两个参数
    LYTableViewCellInfo *example2 = [LYTableViewCellInfo normalCellForSel:@selector(twoParasClick:indexPath:) target:self title:@"SEL带两个参数" rightValue:@"可选" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    //SEL带一个参数
    LYTableViewCellInfo *example3 = [LYTableViewCellInfo normalCellForSel:@selector(oneParasClick:) target:self title:@"SEL带一个参数" rightValue:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    //SEL不带参数
    LYTableViewCellInfo *example4 = [LYTableViewCellInfo normalCellForSel:@selector(noParasClick) target:self title:@"SEL不带参数" rightValue:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    // -------------------- Switch  ----------------- //
    //不添加开关事件，switch的值可根据cellInfo的kvc获取(key为on)
    LYTableViewCellInfo *example5 = [LYTableViewCellInfo switchCellForTitle:@"没有开关change事件" on:NO];
    _noChangeActionSwitchCellInfo = example5;
    
    //添加开关事件
    LYTableViewCellInfo *example6 = [LYTableViewCellInfo switchCellForSel:@selector(switchValueChange:indexPath:) target:self title:@"有开关change事件" on:YES];
    
    LYTableViewSectionInfo *generalSection = [LYTableViewSectionInfo sectionInfoDefaut];
    [generalSection addCell:example1];
    [generalSection addCell:example2];
    [generalSection addCell:example3];
    [generalSection addCell:example4];
    [generalSection addCell:example5];
    [generalSection addCell:example6];
    
    [_tableViewInfo addSection:generalSection];
}

- (void)addHeaderSection{
    
    LYTableViewCellInfo *cell = [LYTableViewCellInfo normalCellForSel:nil target:nil title:@"快速添加header示例" rightValue:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewSectionInfo *section = [LYTableViewSectionInfo sectionInfoHeader:@"这里是header"];
    [section addCell:cell];
    
    [_tableViewInfo addSection:section];
}
- (void)addHeaderViewSection{
    
    LYTableViewCellInfo *cell = [LYTableViewCellInfo normalCellForSel:nil target:nil title:@"快速添加headerView示例" rightValue:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 100)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *headerLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, kMainScreenWidth, 40)];
    headerLab.text = @"模拟自定义headerView";
    headerLab.textColor = [UIColor redColor];
    [headerView addSubview:headerLab];
    
    LYTableViewSectionInfo *section = [LYTableViewSectionInfo sectionInfoHeaderWithView:headerView];
    [section addCell:cell];
    
    [_tableViewInfo addSection:section];
}

- (void)addLogoutSection{
    LYTableViewCellInfo *logoutCell = [LYTableViewCellInfo centerCellForSel:@selector(logoutClick) target:self title:@"退出登录"];
    
    LYTableViewSectionInfo *logoutSection = [LYTableViewSectionInfo sectionInfoDefaut];
    [logoutSection addCell:logoutCell];
    
    [_tableViewInfo addSection:logoutSection];
}

#pragma mark - Event
- (void)twoParasClick:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    NSLog(@"两个参数-点击了第%ld组-第%ld行-%@", indexPath.section, indexPath.row, [cellInfo getUserInfoValueForKey:@"title"]);
}
- (void)oneParasClick:(LYTableViewCellInfo *)cellInfo{
    NSLog(@"一个参数-点击了:%@", [cellInfo getUserInfoValueForKey:@"title"]);
}
- (void)noParasClick{
    NSLog(@"没有参数-");
}

- (void)switchValueChange:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    NSNumber *currentSwitchIsOn = [cellInfo getUserInfoValueForKey:@"on"];
    NSLog(@"有开关change事件的开关-是否打开%d", currentSwitchIsOn.boolValue);
    
    NSNumber *noChangeActionSwitchIsOn = [_noChangeActionSwitchCellInfo getUserInfoValueForKey:@"on"];
    NSLog(@"没有开关change事件的开关-是否打开%d", noChangeActionSwitchIsOn.boolValue);
}

- (void)logoutClick{
    NSLog(@"退出登录");
    
    NSNumber *noChangeActionSwitchIsOn = [_noChangeActionSwitchCellInfo getUserInfoValueForKey:@"on"];
    NSLog(@"任何地方都可以获取到-没有开关change事件的开关-是否打开%d", noChangeActionSwitchIsOn.boolValue);
}

@end


