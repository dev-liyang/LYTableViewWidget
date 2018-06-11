//
//  LYTableViewInfo.h
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTableView.h"
#import "LYTableViewSectionInfo.h"
#import "LYTableViewCellInfo.h"
#import "LYTableViewCell.h"

@interface LYTableViewInfo : NSObject

///实例化
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

///添加section
- (void)addSection:(LYTableViewSectionInfo *)sectionInfo;

///插入section
- (void)insertSection:(LYTableViewSectionInfo *)sectionInfo atIndex:(NSInteger)index;

///插入cell
- (void)insertCell:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath;

///替换section
- (void)replaceSection:(LYTableViewSectionInfo *)sectionInfo atIndex:(NSInteger)index;

///替换cell
- (void)replaceCell:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath;

///删除section
- (void)removeSectionAt:(NSInteger)section;

///删除cell
- (void)removeCellAt:(NSIndexPath *)indexPath;

///移除所有section
- (void)clearAllSection;

///获取section
- (LYTableViewSectionInfo *)getSectionAt:(NSInteger)section;

///获取cell
- (LYTableViewCellInfo *)getCellAtSection:(NSInteger)section row:(NSInteger)row;

///获取section数量
- (NSInteger)getSectionCount;

///获取tableView
- (LYTableView *)getTableView;

@end


