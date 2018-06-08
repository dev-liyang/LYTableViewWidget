//
//  LYTableViewCell.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "LYTableViewCell.h"

@implementation LYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
        self.textLabel.font = [UIFont systemFontOfSize:17];
        
        self.detailTextLabel.textColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
        self.detailTextLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}


@end
