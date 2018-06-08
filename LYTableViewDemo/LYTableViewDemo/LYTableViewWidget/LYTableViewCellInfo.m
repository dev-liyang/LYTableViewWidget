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
+ (LYTableViewCellInfo *)normalCellForTitle:(NSString *)title rightValue:(NSString *)rightValue imageName:(NSString *)imageName{
    
    LYTableViewCellInfo *info = [self normalCellForTitle:title rightValue:rightValue];
    [info addUserInfoValue:imageName forKey:@"imageName"];
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
+ (LYTableViewCellInfo *)normalCellForSel:(SEL)selector target:(id)target title:(NSString *)title rightValue:(NSString *)rightValue imageName:(NSString *)imageName accessoryType:(UITableViewCellAccessoryType)accessoryType{
    
    LYTableViewCellInfo *info = [self normalCellForSel:selector target:target title:title rightValue:rightValue accessoryType:accessoryType];
    [info addUserInfoValue:imageName forKey:@"imageName"];
    
    return info;
}

+ (LYTableViewCellInfo *)centerCellForSel:(SEL)selector target:(id)target title:(NSString *)title{
    
    LYTableViewCellInfo *info = [LYTableViewCellInfo new];
    
    info.makeTarget = info;
    info.makeSel = @selector(makeCenterCell:);
    
    info.actionTarget = target;
    info.actionSel = selector;
    
    info.fCellHeight = 44.0;
    info.accessoryType = UITableViewCellAccessoryNone;
    info.cellStyle = UITableViewCellStyleDefault;
    
    [info addUserInfoValue:title forKey:@"title"];
    
    return info;
}

+ (LYTableViewCellInfo *)switchCellForTitle:(NSString *)title on:(BOOL)isOn{
    
    LYTableViewCellInfo *info = [LYTableViewCellInfo new];
    
    info.makeTarget = info;
    info.makeSel = @selector(makeSwitchCell:);
    
    info.fCellHeight = 44.0;
    info.selectionStyle = UITableViewCellSelectionStyleNone;
    info.accessoryType = UITableViewCellAccessoryNone;
    
    [info addUserInfoValue:title forKey:@"title"];
    [info addUserInfoValue:[NSNumber numberWithBool:isOn] forKey:@"on"];
    
    return info;
}
+ (LYTableViewCellInfo *)switchCellForSel:(SEL)selector target:(id)target title:(NSString *)title on:(BOOL)isOn{
    
    LYTableViewCellInfo *info = [self switchCellForTitle:title on:isOn];
    
    info.ActionTargetForSwitchCell = target;
    info.actionSel = selector;
    
    return info;
}

+ (LYTableViewCellInfo *)cellForMakeSel:(SEL)makeSel makeTarget:(id)makeTarget actionSel:(SEL)actionSel actionTarget:(id)actionTarget height:(CGFloat)height userInfo:(NSDictionary *)userInfo accessoryType:(UITableViewCellAccessoryType)accessoryType{
    
    LYTableViewCellInfo *info = [LYTableViewCellInfo new];
    
    info.makeSel = makeSel;
    info.makeTarget = makeTarget;
    
    info.actionTarget = actionTarget;
    info.actionSel = actionSel;
    
    info.fCellHeight = height;
    info.accessoryType = accessoryType;
    
    [info setUserInfo:userInfo];
    
    return info;
}

#pragma mark - Set up
- (void)makeCenterCell:(LYTableViewCell *)cell{
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
}
- (void)makeSwitchCell:(LYTableViewCell *)cell{
    
    NSNumber *num_isOn = [self getUserInfoValueForKey:@"on"];
    BOOL isOn = num_isOn.boolValue;
    
    NSNumber *num_switchTag = [self getUserInfoValueForKey:@"switchTag"];
    NSInteger switchTag = num_switchTag.integerValue;
    
    UISwitch *switchView = [[UISwitch alloc] init];
    [cell setAccessoryView:switchView];
    [switchView addTarget:self action:@selector(actionSwitchCell:) forControlEvents:(UIControlEventValueChanged)];
    [switchView setOn:isOn];
    [switchView setTag:switchTag];
    
    [cell setSelectionStyle:_selectionStyle];
}

#pragma mark - Event
- (void)actionSwitchCell:(UISwitch *)sender{
    NSNumber *isOn = [NSNumber numberWithBool:sender.isOn];
    [self addUserInfoValue:isOn forKey:@"on"];
    if ([_ActionTargetForSwitchCell respondsToSelector:_actionSel]) {
        [_ActionTargetForSwitchCell performSelector:_actionSel withObject:self withObject:_indexPath];
    }
}

@end
