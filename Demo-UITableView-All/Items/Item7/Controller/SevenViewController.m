//
//  SevenViewController.m
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SevenViewController.h"
#import "SevenModel.h"
#import "SevenCell.h"

#import "Seven_oneViewController.h"

#import "Masonry.h"

@interface SevenViewController () <UITableViewDelegate,UITableViewDataSource,SevenProtocolDelegate>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation SevenViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
}


#pragma mark - 系统代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    SevenCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[SevenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.customDelegate = self;
    cell.viewController = self;
    cell.cellRow = indexPath.row;
    
    return cell;
}

#pragma mark - 点击事件

#pragma mark - 实现方法

#pragma mark - 自定义协议
- (void)sevenProrocolMethod:(UIViewController *)viewController and:(NSInteger)cellRow
{
    // 可以通过 cellRow 区分哪个cell上的button跳转对应的页面
    
    if (cellRow == 0 || cellRow == 1)
    {
        Seven_oneViewController * seven_one = [[Seven_oneViewController alloc] init];
        
        [self.navigationController pushViewController:seven_one animated:YES];
    }
}

#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"cell上button页面跳转";
}

- (void)addTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 0, 0, 0));
    }];
}

#pragma mark - setter & getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}

@end
