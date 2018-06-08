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

///默认section（没有header、footer）
+ (LYTableViewSectionInfo *)sectionInfoDefaut;

///添加cell
- (void)addCell:(LYTableViewCellInfo *)cell;

///获取cell
- (LYTableViewCellInfo *)getCellAt:(NSInteger)index;

///获取cell数量
- (NSInteger)getCellCount;

@end


