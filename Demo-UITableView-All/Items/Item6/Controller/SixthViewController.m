//
//  SixthViewController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SixthViewController.h"

#import "Friend.h"
#import "Group.h"
#import "GroupHeaderView.h"

#import "Masonry.h"

@interface SixthViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView    * tableView;

@property (nonatomic, strong) NSMutableArray * groupsArrM;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self createData];
    
    [self initUI];
}

#pragma mark - 系统代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupsArrM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Group * group = self.groupsArrM[section];
    
    // 如果是展开,返回真实好友数, 否则返回0 个好友数
    return group.isExpand ? [[group friends] count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    // 取出好友模型
    Friend * friend = [self.groupsArrM[indexPath.section] friends][indexPath.row];
    
    // 填充cell 视图
    cell.imageView.image = [UIImage imageNamed:friend.iconName];
    cell.textLabel.textColor = friend.isVip ? [UIColor redColor] : [UIColor blackColor];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.sign;
    
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    Group * group = self.groupsArrM[section];
    
    GroupHeaderView * headerView = [GroupHeaderView headerViewWithTitle:group.name rotation:group.isExpand tag:section];
    [headerView addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

#pragma mark - 点击事件
- (void)btnClicked:(UIButton *)btn
{
    Group * group = self.groupsArrM[btn.tag];
    group.expand = !group.expand;
    
    NSIndexSet* sex = [NSIndexSet indexSetWithIndex:btn.tag];
    
    [self.tableView reloadSections:sex withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - 实现方法
- (void)basicSetting
{
    self.title = @"好友展示";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.groupsArrM = [NSMutableArray arrayWithCapacity:0];
}

- (void)createData
{
    NSArray * groupsName = @[@"我的好友",@"同事",@"附近的人"];
    
    for (int i = 0; i < 3; i ++)
    {
        NSMutableArray * friendsArrM = [NSMutableArray arrayWithCapacity:0];
        
        for (int j = 0; j < 10; j ++)
        {
            Friend * friend = [Friend friendWithIconName:[NSString stringWithFormat:@"%i.jpg",arc4random() % 11 + 1] name:[NSString stringWithFormat:@"%@-%i",groupsName[i],j + 1] sign:[NSString stringWithFormat:@"%@%@",groupsName[i],@"哈哈哈哈,晋级了"]];
            
            if (0 == i)
            {
                friend.vip = YES;
            }
            
            [friendsArrM addObject:friend];
        }
        
        Group * group  = [Group groupWithName:groupsName[i] friends:friendsArrM];
        group.expand = YES;
        
        [self.groupsArrM addObject:group];
    }
}

- (void)initUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
}

#pragma mark - setter & getter 
- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)groupsArrM
{
    if (!_groupsArrM)
    {
        self.groupsArrM = [NSMutableArray arrayWithCapacity:0];
    }
    return _groupsArrM;
}

@end
