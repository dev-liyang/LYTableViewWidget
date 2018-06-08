//
//  LYTableViewInfo.h
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTableView.h"
#import "LYTableViewSectionInfo.h"
#import "LYTableViewCellInfo.h"
#import "LYTableViewCell.h"

@interface LYTableViewInfo : NSObject

///实例化
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

///添加section
- (void)addSection:(LYTableViewSectionInfo *)sectionInfo;

///获取tableView
- (LYTableView *)getTableView;

@end


