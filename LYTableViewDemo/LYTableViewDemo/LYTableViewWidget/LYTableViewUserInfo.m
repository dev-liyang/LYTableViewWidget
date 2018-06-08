//
//  LYTableViewUserInfo.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewUserInfo.h"

@implementation LYTableViewUserInfo

- (void)addUserInfoValue:(id)value forKey:(NSString *)key{
    if (!_dicInfo) {
        _dicInfo = [[NSMutableDictionary alloc] init];
    }
    if (value && key) {
        [_dicInfo setObject:value forKey:key];
    }
}

- (id)getUserInfoValueForKey:(NSString *)key{
    if (key) {
        return _dicInfo[key];
    }
    return nil;
}

@end
