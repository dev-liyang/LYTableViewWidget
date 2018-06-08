//
//  LYTableViewCellInfo.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewCellInfo.h"
#import "LYTableViewCell.h"

@implementation LYTableViewCellInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.cellStyle = UITableViewCellStyleValue1;
    }
    return self;
}

#pragma mark - init
+ (LYTableViewCellInfo *)normalCellForTitle:(NSString *)title rightValue:(NSString *)rightValue{
    
    LYTableViewCellInfo *info = [LYTableViewCellInfo new];
    info.selectionStyle = UITableViewCellSelectionStyleNone;
    info.fCellHeight = 44.0;
    [info addUserInfoValue:title forKey:@"title"];
    [info addUserInfoValue:rightValue forKey:@"rightValue"];
    
    return info;
}

+ (LYTableViewCellInfo *)normalCellForSel:(SEL)selector target:(id)target title:(NSString *)title rightValue:(NSString *)rightValue accessoryType:(UITableViewCellAccessoryType)accessoryType{
    
    LYTableViewCellInfo *info = [self normalCellForTitle:title rightValue:rightValue];
    info.actionTarget = target;
    info.actionSel = selector;
    info.accessoryType = accessoryType;
    info.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    return info;
}

@end
