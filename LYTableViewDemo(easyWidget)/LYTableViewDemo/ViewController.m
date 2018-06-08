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
    
}

#pragma mark - Creat View
- (void)creatTableView{
    _tableViewInfo = [[LYTableViewInfo alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:[_tableViewInfo getTableView]];
    
    //cell数据
    LYTableViewCellInfo *noactionCell = [LYTableViewCellInfo normalCellForTitle:@"无点击事件" rightValue:@"没有"];
    LYTableViewCellInfo *actionCell = [LYTableViewCellInfo normalCellForSel:@selector(actionCellClick) target:self title:@"有点击事件" rightValue:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    //section数据
    LYTableViewSectionInfo *sectionInfo = [LYTableViewSectionInfo sectionInfoDefaut];
    
    //添加
    [sectionInfo addCell:noactionCell];
    [sectionInfo addCell:actionCell];
    [_tableViewInfo addSection:sectionInfo];
    
    //刷新
    [[_tableViewInfo getTableView] reloadData];
}

#pragma mark - Event
- (void)actionCellClick{
    NSLog(@"点击了actionCell");
}




@end
