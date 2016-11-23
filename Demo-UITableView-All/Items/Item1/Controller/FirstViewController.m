//
//  FirstViewController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#define 知识点
/** 知识点
 1. 一个表格视图,可以有一个头部视图,一个尾部视图.每一个分组也有一个组头和组尾.
 2. 自定义cell的指示视图.
 3. 自定义选中的cell被选中的背景视图.
 */

#import "FirstViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHieght [UIScreen mainScreen].bounds.size.height

@interface FirstViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self basicSetting];
    
    [self addTableView];
}

- (void)basicSetting
{
    self.title = @"基本知识";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHieght) style:UITableViewStyleGrouped];
    
    //代理和数据源
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 每组的高度, 组头组尾的高度
    tableView.rowHeight = 50.0f;
    tableView.sectionHeaderHeight = 20;
    tableView.sectionFooterHeight = 20;
    
    //设置头部视图和尾部视图
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    headerLabel.backgroundColor = [UIColor redColor];
    headerLabel.text = @"头部视图";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    tableView.tableHeaderView = headerLabel;
    
    UILabel * footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    footerLabel.text = @"这是尾部视图";
    footerLabel.backgroundColor = [UIColor redColor];
    footerLabel.textAlignment = NSTextAlignmentCenter;
    tableView.tableFooterView = footerLabel;
    
    [self.view addSubview:tableView];
}

#pragma mark - 数据源和代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    /**
     UITableViewCellStyleDefault 图片和大标题
     UITableViewCellStyleValue1  图片居左 大标题居中 小标题居右
     UITableViewCellStyleValue2  大标题居左 小标题居右
     UITableViewCellStyleSubtitle 图片居左 大标题居上 小标题居下
     */
    
    cell.textLabel.text = [NSString stringWithFormat:@"标题-第%ld组第%ld行",(long)indexPath.section,(long)indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"详情文字-第%ld组第%ld行",indexPath.section,(long)indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"2_%d.jpg",arc4random() % 15 + 1]];
    
    //cell 被选中的样式
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    // 指示视图的类型
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //自定义指示视图
    UIView * accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    accessoryView.backgroundColor = [UIColor orangeColor];
    cell.accessoryView = accessoryView;
    
    //自定义cell被选中的背景
    UIView * backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor purpleColor];
    cell.selectedBackgroundView = backgroundView;
    
    return cell;
}

#pragma mark 返回每组的头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 宽度为屏幕宽度, 高度是代理方法返回的高度.
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    headerLabel.backgroundColor = [UIColor yellowColor];
    headerLabel.text = @"这是每组的头部视图";
    
    return headerLabel;
    
}

#pragma mark 返回每组的尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    // 宽度为屏幕宽度, 高度是代理方法返回的高度.
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    footerLabel.backgroundColor = [UIColor brownColor];
    footerLabel.text = @"这是每组的尾部视图";
    
    return footerLabel;
}

#pragma mark 返回组头的高度 : 第一组的头部一定要通过代理设置
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

#pragma mark 返回组尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40.0f;
}

@end
