//
//  LYTableViewUserInfo.h
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTableViewUserInfo : NSObject
{
    NSMutableDictionary *_dicInfo;
}

@property (nonatomic, copy) NSDictionary *userInfo;

- (void)addUserInfoValue:(id)value forKey:(NSString *)key;
- (id)getUserInfoValueForKey:(NSString *)key;

@end
