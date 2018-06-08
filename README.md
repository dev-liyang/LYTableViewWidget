# LYTableViewWidget
逆向微信-分析学习微信是如何快速构建静态TableView界面的


博客有详细的分析讲解<br>
博客地址:https://www.jianshu.com/p/f6adbfe9ab87

![](https://github.com/dev-liyang/LYTableViewWidget/blob/master/Images/example_detail.png)

```
- (void)creatTableView{
    _tableViewInfo = [[LYTableViewInfo alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:[_tableViewInfo getTableView]];
    
    //cell数据
    LYTableViewCellInfo *noactionCell = [LYTableViewCellInfo normalCellForTitle:@"无点击事件" rightValue:@"没有"];
    LYTableViewCellInfo *actionCell = [LYTableViewCellInfo normalCellForSel:@selector(actionCellClick) target:self title:@"有点击事件" rightValue:@"" accessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    //section数据
    LYTableViewSectionInfo *sectionInfo = [LYTableViewSectionInfo sectionInfoDefaut];
    
    //添加
    [sectionInfo addCell:noactionCell];
    [sectionInfo addCell:actionCell];
    [_tableViewInfo addSection:sectionInfo];
    
    //刷新
    [[_tableViewInfo getTableView] reloadData];
}
```
通过以上一段代码就可创建一个如下的tableView界面:<br>
![](https://github.com/dev-liyang/LYTableViewWidget/blob/master/Images/example_easy.png)
