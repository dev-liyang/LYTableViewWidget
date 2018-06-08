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

@property(nonatomic, assign) SEL makeSel;
@property(nonatomic, weak) id makeTarget;

@property(nonatomic, weak) id ActionTargetForSwitchCell;

@property(nonatomic, assign) CGFloat fCellHeight;
@property(nonatomic, strong) NSIndexPath *indexPath;

///无点击事件cell
+ (LYTableViewCellInfo *)normalCellForTitle:(NSString *)title rightValue:(NSString *)rightValue;

///无事件、有图片cell
+ (LYTableViewCellInfo *)normalCellForTitle:(NSString *)title rightValue:(NSString *)rightValue imageName:(NSString *)imageName;

///有事件、无图片cell
+ (LYTableViewCellInfo *)normalCellForSel:(SEL)selector target:(id)target title:(NSString *)title rightValue:(NSString *)rightValue accessoryType:(UITableViewCellAccessoryType)accessoryType;

///有事件、有图片cell
+ (LYTableViewCellInfo *)normalCellForSel:(SEL)selector target:(id)target title:(NSString *)title rightValue:(NSString *)rightValue imageName:(NSString *)imageName accessoryType:(UITableViewCellAccessoryType)accessoryType;

///title居中的cell
+ (LYTableViewCellInfo *)centerCellForSel:(SEL)selector target:(id)target title:(NSString *)title;

///有开关的cell
+ (LYTableViewCellInfo *)switchCellForTitle:(NSString *)title on:(BOOL)isOn;

///有开关、有开关事件的cell
+ (LYTableViewCellInfo *)switchCellForSel:(SEL)selector target:(id)target title:(NSString *)title on:(BOOL)isOn;

/// 自定义cell
+ (LYTableViewCellInfo *)cellForMakeSel:(SEL)makeSel makeTarget:(id)makeTarget actionSel:(SEL)actionSel actionTarget:(id)actionTarget height:(CGFloat)height userInfo:(NSDictionary *)userInfo accessoryType:(UITableViewCellAccessoryType)accessoryType;


@end


