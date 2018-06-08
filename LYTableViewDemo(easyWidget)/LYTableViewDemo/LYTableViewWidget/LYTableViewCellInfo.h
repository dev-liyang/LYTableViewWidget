//
//  LYTableViewCellInfo.h
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewUserInfo.h"

@class LYTableViewCell;

@interface LYTableViewCellInfo : LYTableViewUserInfo

@property(nonatomic, assign) UITableViewCellAccessoryType accessoryType;
@property(nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
@property(nonatomic, assign) UITableViewCellStyle cellStyle;

@property(nonatomic, assign) SEL actionSel;

@property(nonatomic, weak) id actionTarget;

@property(nonatomic, assign) CGFloat fCellHeight;

///无点击事件cell
+ (LYTableViewCellInfo *)normalCellForTitle:(NSString *)title rightValue:(NSString *)rightValue;

///有事件、无图片cell
+ (LYTableViewCellInfo *)normalCellForSel:(SEL)selector target:(id)target title:(NSString *)title rightValue:(NSString *)rightValue accessoryType:(UITableViewCellAccessoryType)accessoryType;


@end


