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
///插入section
- (void)insertSection:(LYTableViewSectionInfo *)sectionInfo atIndex:(NSInteger)index{
    [_arrSections insertObject:sectionInfo atIndex:index];
}
///插入cell
- (void)insertCell:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    LYTableViewSectionInfo *section = _arrSections[indexPath.section];
    [section insertCell:cellInfo atIndex:indexPath.row];
}

#pragma mark - 替换
///替换section
- (void)replaceSection:(LYTableViewSectionInfo *)sectionInfo atIndex:(NSInteger)index{
    [_arrSections replaceObjectAtIndex:index withObject:sectionInfo];
}
///替换cell
- (void)replaceCell:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    LYTableViewSectionInfo *section = _arrSections[indexPath.section];
    [section replaceCell:cellInfo atIndex:indexPath.row];
}
#pragma mark - 删除
///删除section
- (void)removeSectionAt:(NSInteger)section{
    [_arrSections removeObjectAtIndex:section];
}

///删除cell
- (void)removeCellAt:(NSIndexPath *)indexPath{
    
    LYTableViewSectionInfo *section = _arrSections[indexPath.section];
    [section removeCellAt:indexPath.row];
}

///移除所有section
- (void)clearAllSection{
    [_arrSections removeAllObjects];
}

#pragma mark - 获取
///获取section
- (LYTableViewSectionInfo *)getSectionAt:(NSInteger)section{
    if (section >= _arrSections.count) return nil;
    
    return _arrSections[section];
}
///获取cell
- (LYTableViewCellInfo *)getCellAtSection:(NSInteger)section row:(NSInteger)row{
    if (section >= _arrSections.count) return nil;
    
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    LYTableViewCellInfo *cellInfo = [sectionInfo getCellAt:row];
    return cellInfo;
}
///获取组数量
- (NSInteger)getSectionCount{
    return _arrSections.count;
}
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    return sectionInfo.fHeaderHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    return sectionInfo.fFooterHeight;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    return [sectionInfo getUserInfoValueForKey:@"headerTitle"];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    return [sectionInfo getUserInfoValueForKey:@"footerTitle"];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    UIView *view = [sectionInfo getUserInfoValueForKey:@"header"];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    LYTableViewSectionInfo *sectionInfo = _arrSections[section];
    UIView *view = [sectionInfo getUserInfoValueForKey:@"footer"];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LYTableViewSectionInfo *sectionInfo = _arrSections[indexPath.section];
    LYTableViewCellInfo *cellInfo = [sectionInfo getCellAt:indexPath.row];
    
    NSString *iden = [NSString stringWithFormat:@"LYTableViewInfo_%zd_%zd", indexPath.section, indexPath.row];
    
    LYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (!cell) {
        cell = [[LYTableViewCell alloc] initWithStyle:cellInfo.cellStyle reuseIdentifier:iden];
        
        if ([cellInfo.makeTarget respondsToSelector:cellInfo.makeSel]) {
            [cellInfo.makeTarget performSelector:cellInfo.makeSel withObject:cell withObject:cellInfo];
        }
    }
    
    cell.accessoryType = cellInfo.accessoryType;
    cell.selectionStyle = cellInfo.selectionStyle;
    cell.textLabel.text = [cellInfo getUserInfoValueForKey:@"title"];//通过LYTableViewCellInfo 父类方法kvc获取到
    cell.detailTextLabel.text = [cellInfo getUserInfoValueForKey:@"rightValue"];//通过LYTableViewCellInfo 父类方法kvc获取到
    NSString *imageName = [cellInfo getUserInfoValueForKey:@"imageName"];//通过LYTableViewCellInfo 父类方法kvc获取到
    if (imageName.length) {
        cell.imageView.image = [UIImage imageNamed:imageName];
    }
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

