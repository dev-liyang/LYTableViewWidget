//
//  LYTableViewCell.h
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYTableViewCellInfo;

@interface LYTableViewCell : UITableViewCell

@property(nonatomic, weak) LYTableViewCellInfo *cellInfo;

@end
