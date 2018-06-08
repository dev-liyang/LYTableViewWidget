//
//  LYTableViewInfo.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewInfo.h"

@interface LYTableViewInfo ()<UITableViewDelegate, UITableViewDataSource>
@end

@implementation LYTableViewInfo
{
    LYTableView *_tableView;
    NSMutableArray *_arrSections;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        
        _tableView = [[LYTableView alloc] initWithFrame:frame style:style];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _arrSections = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - 添加
///添加section
- (void)addSection:(LYTableViewSectionInfo *)sectionInfo{
    [_arrSections addObject:sectionInfo];
}

#pragma mark - 获取
- (LYTableView *)getTableView{
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrSections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    return [sectionInfo getCellCount];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYTableViewSectionInfo *sectionInfo = _arrSections[indexPath.section];
    LYTableViewCellInfo *cellInfo = [sectionInfo getCellAt:indexPath.row];
    return cellInfo.fCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LYTableViewSectionInfo *sectionInfo = _arrSections[indexPath.section];
    LYTableViewCellInfo *cellInfo = [sectionInfo getCellAt:indexPath.row];
    
    NSString *iden = [NSString stringWithFormat:@"LYTableViewInfo_%zd_%zd", indexPath.section, indexPath.row];
    
    LYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (!cell) {
        cell = [[LYTableViewCell alloc] initWithStyle:cellInfo.cellStyle reuseIdentifier:iden];
    }
    
    cell.accessoryType = cellInfo.accessoryType;
    cell.selectionStyle = cellInfo.selectionStyle;
    cell.textLabel.text = [cellInfo getUserInfoValueForKey:@"title"];//通过LYTableViewCellInfo 父类方法kvc获取到
    cell.detailTextLabel.text = [cellInfo getUserInfoValueForKey:@"rightValue"];//通过LYTableViewCellInfo 父类方法kvc获取到
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LYTableViewSectionInfo *sectionInfo = _arrSections[indexPath.section];
    LYTableViewCellInfo *cellInfo = [sectionInfo getCellAt:indexPath.row];
    
    id target = cellInfo.actionTarget;
    SEL selector = cellInfo.actionSel;
    
    if (cellInfo.selectionStyle) {
        if ([target respondsToSelector:selector]) {
            [target performSelector:selector withObject:cellInfo withObject:indexPath];//创建cellInfo时，target传递并实现了SEL事件，这里就会发送这个消息，从而实现cell的点击事件
        }
    }
}


@end
