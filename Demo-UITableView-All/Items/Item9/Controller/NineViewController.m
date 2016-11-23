//
//  NineViewController.m
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "NineViewController.h"

#import "Masonry.h"

@interface NineViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * leftTableView;
@property (nonatomic, strong) UITableView * rightTableView;

@property (nonatomic, strong) NSMutableArray * leftArrayM;
@property (nonatomic, strong) NSMutableArray * rightArrayM;

@end

@implementation NineViewController

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self createLeftData];
    
    [self addLeftTableView];
    
    [self createRightData];
    
    [self addRightTableView];
}


#pragma mark - 系统代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.leftTableView)
    {
        return 1;
    }
    else
    {
        return self.rightArrayM.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView)
    {
        return self.leftArrayM.count;
    }
    else
    {
        return [self.rightArrayM[section] count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor orangeColor];
    label.text = [NSString stringWithFormat:@"第 %ld section",section];
    
    return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView)
    {
        static NSString * identifier_left = @"leftCell";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier_left];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier_left];
        }
        
        
        cell.textLabel.text = self.leftArrayM[indexPath.row];
        
        return cell;
    }
    else
    {
        static NSString * identifier_right = @"righttCell";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier_right];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier_right];
        }
        
        
        cell.textLabel.text = self.rightArrayM[indexPath.section][indexPath.row];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == self.leftTableView)
    {
        // 判断是不是最后一行
        if ((self.leftArrayM.count - 1) == indexPath.row)
        {
            return;
        }
        
        [self.leftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
    else if (tableView == self.rightTableView)
    {
        /** 原理:
         1. 获取当前的section和row
         2. 有几个section
         3. 每个section中有几个row
         4. 判断
            4.1 不是最后一个section
         */
        
        NSInteger currentSection = indexPath.section;
        NSInteger currentRow = indexPath.row;
        
        NSUInteger sectionCount = [self.rightTableView numberOfSections];
        
        if (sectionCount)
        {
            NSUInteger rowCount = [self.rightTableView numberOfRowsInSection:indexPath.section];
            
            // 不是最后一个section
            if (indexPath.section != (sectionCount - 1))
            {
                //不是最后一行
                if (indexPath.row != rowCount - 1)
                {
                    currentRow += 1;
                }
                // 是最后一行
                else
                {
                    currentRow = 0;
                    currentSection += 1;
                }
            }
            // 是最后一个section
            else
            {
                //不是最后一行
                if (indexPath.row != rowCount - 1)
                {
                    currentRow += 1;
                }
                // 是最后一行
                else
                {
                    return;
                }
            }
        }
        
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:currentRow inSection:currentSection] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}

#pragma mark - 点击事件

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"cell-滚动";
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)createLeftData
{
    NSString * str;
    for (int i = 0; i < 30; i ++)
    {
        str = [NSString stringWithFormat:@"第%d行",i];
        
        [self.leftArrayM addObject:str];
    }
}

- (void)addLeftTableView
{
    [self.view addSubview:self.leftTableView];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, self.view.bounds.size.width / 2 - 5));
    }];
}

- (void)createRightData
{
    for (int i = 0; i < 5; i ++)
    {
        NSMutableArray * subArr = [NSMutableArray arrayWithCapacity:0];
        
        NSString * str;
        for (int j = 0; j < 40; j ++)
        {
            str = [NSString stringWithFormat:@"第%d行 - 第%d组",i,j];
            [subArr addObject:str];
        }
        
        [self.rightArrayM addObject:subArr];
    }
    
    NSLog(@"%@",self.rightArrayM);
}

- (void)addRightTableView
{
    [self.view addSubview:self.rightTableView];
    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, self.view.bounds.size.width / 2 + 5, 49, 0));
    }];
}

#pragma mark - setter & getter

- (UITableView *)leftTableView
{
    if (!_leftTableView)
    {
        self.leftTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.leftTableView.delegate = self;
        self.leftTableView.dataSource = self;
    }
    return _leftTableView;
}

- (UITableView *)rightTableView
{
    if (!_rightTableView)
    {
        self.rightTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        self.rightTableView.delegate = self;
        self.rightTableView.dataSource = self;
    }
    return _rightTableView;
}

- (NSMutableArray *)leftArrayM
{
    if (!_leftArrayM)
    {
        self.leftArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _leftArrayM;
}

- (NSMutableArray *)rightArrayM
{
    if (!_rightArrayM)
    {
        self.rightArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _rightArrayM;
}


@end
