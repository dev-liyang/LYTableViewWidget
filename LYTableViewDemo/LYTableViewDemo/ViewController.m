//
//  ViewController.m
//  LYTableViewDemo
//
//  Created by liyang on 2018/5/30.
//  Copyright © 2018年 liyang. All rights reserved.
//

#import "ViewController.h"
#import "LYTableViewInfo.h"
#import "ExampleViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    LYTableViewInfo *_tableViewInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";
    
    [self creatTableView];
    
    [self reloadTableView];
}

#pragma mark - Creat View
- (void)creatTableView{
    _tableViewInfo = [[LYTableViewInfo alloc] initWithFrame:CGRectMake(0, kTopHeight, kMainScreenWidth, kMainScreenHeight - kTopHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:[_tableViewInfo getTableView]];
}

- (void)makeProfileCell:(LYTableViewCell *)cell cellInfo:(LYTableViewCellInfo *)cellInfo{
    
    NSDictionary *userInfo = cellInfo.userInfo;
    
    UIImageView *headImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headImg"]];
    headImageV.frame = CGRectMake(10, 10, 68, 68);
    [cell.contentView addSubview:headImageV];
    
    UILabel *nicknameLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageV.frame) + 10, CGRectGetMinY(headImageV.frame)+10, 120, 17)];
    nicknameLab.text = userInfo[@"nickname"];
    nicknameLab.textColor = [UIColor blackColor];
    [cell.contentView addSubview:nicknameLab];
    
    UILabel *wxidLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImageV.frame) + 10, CGRectGetMaxY(headImageV.frame)-15-10, 150, 15)];
    wxidLab.text = [NSString stringWithFormat:@"微信号:%@",userInfo[@"wxid"]];
    wxidLab.textColor = [UIColor blackColor];
    wxidLab.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:wxidLab];
    
    UIImageView *qrcodeImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qrcodeImg"]];
    qrcodeImageV.frame = CGRectMake(0, 0, 20, 20);
    qrcodeImageV.center = CGPointMake(kMainScreenWidth - 10 - 30, 88*0.5);
    [cell.contentView addSubview:qrcodeImageV];
}

#pragma mark - Reload Data
- (void)reloadTableView{
    
    //清除所有section（按情况调用）
    [_tableViewInfo clearAllSection];
    
    //添加section
    [self addProfileSection];
    [self addWCMallSection];
    [self addFunctionSection];
    [self addSettingSection];
    
    //刷新tableView
    [[_tableViewInfo getTableView] reloadData];
}

- (void)addProfileSection{
    LYTableViewCellInfo *profileCell = [LYTableViewCellInfo cellForMakeSel:@selector(makeProfileCell:cellInfo:) makeTarget:self actionSel:@selector(showProfileView:indexPath:) actionTarget:self height:88 userInfo:@{@"nickname" : @"暖阳", @"wxid":@"yang123456"} accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewSectionInfo *profileSection = [LYTableViewSectionInfo sectionInfoDefaut];
    [profileSection addCell:profileCell];
    
    [_tableViewInfo addSection:profileSection];
}
- (void)addWCMallSection{
    LYTableViewCellInfo *wcpayCell = [LYTableViewCellInfo normalCellForSel:@selector(showWCPayView:) target:self title:@"钱包" rightValue:nil imageName:@"MoreMyBankCard_25x25_" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewSectionInfo *cardSection = [LYTableViewSectionInfo sectionInfoDefaut];
    [cardSection addCell:wcpayCell];
    
    [_tableViewInfo addSection:cardSection];
}
- (void)addFunctionSection{
    LYTableViewCellInfo *favoriteCell = [LYTableViewCellInfo normalCellForSel:@selector(showFavoriteView) target:self title:@"收藏" rightValue:nil imageName:@"MoreMyFavorites_25x25_" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewCellInfo *albumCell = [LYTableViewCellInfo normalCellForSel:@selector(showAlbumView) target:self title:@"相册" rightValue:nil imageName:@"MoreMyAlbum_25x25_" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewCellInfo *cardCell = [LYTableViewCellInfo normalCellForSel:@selector(showWCCardView) target:self title:@"卡包" rightValue:nil imageName:@"MyCardPackageIcon_25x25_" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewCellInfo *expressionCell = [LYTableViewCellInfo normalCellForSel:@selector(showEmoticonStoreView) target:self title:@"表情" rightValue:nil imageName:@"MoreExpressionShops_25x25_" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewSectionInfo *generalSection = [LYTableViewSectionInfo sectionInfoDefaut];
    [generalSection addCell:favoriteCell];
    [generalSection addCell:albumCell];
    [generalSection addCell:cardCell];
    [generalSection addCell:expressionCell];
    
    [_tableViewInfo addSection:generalSection];
}
- (void)addSettingSection{
    LYTableViewCellInfo *settingCell = [LYTableViewCellInfo normalCellForSel:@selector(showSettingView) target:self title:@"设置" rightValue:nil imageName:@"MoreSetting_25x25_" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    LYTableViewSectionInfo *settingSection = [LYTableViewSectionInfo sectionInfoDefaut];
    [settingSection addCell:settingCell];
    
    [_tableViewInfo addSection:settingSection];
}

#pragma mark - Event
- (void)showProfileView:(LYTableViewCellInfo *)cellInfo indexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = cellInfo.userInfo;
    NSLog(@"点击了第%zd组-第%zd行-昵称:%@", indexPath.section, indexPath.row, dic[@"nickname"]);
    [self gotoExampleVC];
}
- (void)showWCPayView:(LYTableViewCellInfo *)cellInfo{
    NSLog(@"点击了:%@", [cellInfo getUserInfoValueForKey:@"title"]);
    [self gotoExampleVC];
}
- (void)showFavoriteView{
    [self gotoExampleVC];
}
- (void)showAlbumView{
    [self gotoExampleVC];
}
- (void)showWCCardView{
    [self gotoExampleVC];
}
- (void)showEmoticonStoreView{
    [self gotoExampleVC];
}
- (void)showSettingView{
    [self gotoExampleVC];
}

- (void)gotoExampleVC{
    ExampleViewController *vc = [[ExampleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end

