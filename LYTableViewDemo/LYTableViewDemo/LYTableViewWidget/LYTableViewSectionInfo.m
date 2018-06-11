//
//  LYTableViewSectionInfo.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewSectionInfo.h"
#import "LYTableViewCellInfo.h"

@implementation LYTableViewSectionInfo
{
    NSMutableArray *_arrCells;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrCells = [[NSMutableArray alloc] init];
        
        ///默认值，可自行修改
        _fHeaderHeight = 20;
        _fFooterHeight = 0.01;
    }
    return self;
}

+ (LYTableViewSectionInfo *)sectionInfoDefaut{
    LYTableViewSectionInfo *info = [LYTableViewSectionInfo new];
    return info;
}
///带header的section
+ (LYTableViewSectionInfo *)sectionInfoHeader:(NSString *)title{
    LYTableViewSectionInfo *info = [self sectionInfoDefaut];
    [info addUserInfoValue:title forKey:@"headerTitle"];
    info.fHeaderHeight = -1.0;
    return info;
}
+ (LYTableViewSectionInfo *)sectionInfoHeaderWithView:(UIView *)headerView{
    LYTableViewSectionInfo *info = [self sectionInfoDefaut];
    [info addUserInfoValue:headerView forKey:@"header"];
    info.fHeaderHeight = headerView.frame.size.height;
    return info;
}
///带footer的section
+ (LYTableViewSectionInfo *)sectionInfoFooter:(NSString *)title{
    LYTableViewSectionInfo *info = [self sectionInfoDefaut];
    [info addUserInfoValue:title forKey:@"footerTitle"];
    info.fFooterHeight = -1.0;
    return info;
}
+ (LYTableViewSectionInfo *)sectionInfoFooterWithView:(UIView *)footerView{
    LYTableViewSectionInfo *info = [self sectionInfoDefaut];
    [info addUserInfoValue:footerView forKey:@"footer"];
    info.fFooterHeight = footerView.frame.size.height;
    return info;
}
///带header和footer的section
+ (LYTableViewSectionInfo *)sectionInfoHeader:(NSString *)headerTitle Footer:(NSString *)footerTitle{
    LYTableViewSectionInfo *info = [self sectionInfoDefaut];
    [info addUserInfoValue:headerTitle forKey:@"headerTitle"];
    [info addUserInfoValue:footerTitle forKey:@"footerTitle"];
    info.fHeaderHeight = -1.0;
    info.fFooterHeight = -1.0;
    return info;
}

///添加cell
- (void)addCell:(LYTableViewCellInfo *)cell{
    [_arrCells addObject:cell];
}

///替换cell
- (void)replaceCell:(LYTableViewCellInfo *)cell atIndex:(NSInteger)index{
    [_arrCells replaceObjectAtIndex:index withObject:cell];
}

///插入cell
- (void)insertCell:(LYTableViewCellInfo *)cell atIndex:(NSInteger)index{
    [_arrCells insertObject:cell atIndex:index];
}

///删除cell
- (void)removeCellAt:(NSInteger)index{
    [_arrCells removeObjectAtIndex:index];
}

///获取cell
- (LYTableViewCellInfo *)getCellAt:(NSInteger)index{
    if(index >= _arrCells.count) return nil;
    
    return _arrCells[index];
}

///获取cell数量
- (NSInteger)getCellCount{
    return _arrCells.count;
}

@end

