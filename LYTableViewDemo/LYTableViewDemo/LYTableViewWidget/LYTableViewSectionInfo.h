//
//  LYTableViewSectionInfo.h
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewUserInfo.h"

@class LYTableViewCellInfo;

@interface LYTableViewSectionInfo : LYTableViewUserInfo

///sectionHeader高度
@property(nonatomic, assign) CGFloat fHeaderHeight;
///sectionFooter高度
@property(nonatomic, assign) CGFloat fFooterHeight;

///默认section（没有header、footer）
+ (LYTableViewSectionInfo *)sectionInfoDefaut;

///带header的section
+ (LYTableViewSectionInfo *)sectionInfoHeader:(NSString *)title;

///带header的section
+ (LYTableViewSectionInfo *)sectionInfoHeaderWithView:(UIView *)headerView;

///带footer的section
+ (LYTableViewSectionInfo *)sectionInfoFooter:(NSString *)title;

///带footer的section
+ (LYTableViewSectionInfo *)sectionInfoFooterWithView:(UIView *)footerView;

///带header和footer的section
+ (LYTableViewSectionInfo *)sectionInfoHeader:(NSString *)headerTitle Footer:(NSString *)footerTitle;

///添加cell
- (void)addCell:(LYTableViewCellInfo *)cell;

///替换cell
- (void)replaceCell:(LYTableViewCellInfo *)cell atIndex:(NSInteger)index;

///插入cell
- (void)insertCell:(LYTableViewCellInfo *)cell atIndex:(NSInteger)index;

///删除cell
- (void)removeCellAt:(NSInteger)index;

///获取cell
- (LYTableViewCellInfo *)getCellAt:(NSInteger)index;

///获取cell数量
- (NSInteger)getCellCount;

@end


