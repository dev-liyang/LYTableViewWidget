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
    }
    return self;
}

+ (LYTableViewSectionInfo *)sectionInfoDefaut{
    LYTableViewSectionInfo *info = [LYTableViewSectionInfo new];
    return info;
}
///添加cell
- (void)addCell:(LYTableViewCellInfo *)cell{
    [_arrCells addObject:cell];
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
