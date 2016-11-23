//
//  EightViewController.m
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/16.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "EightViewController.h"
#import "Masonry.h"

#import "EightModel.h"
#import "EightCell.h"

@interface EightViewController () <UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isSelectedAll;
}
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * arrayM;

@end

@implementation EightViewController


/**  button的复用
 1. 在model中设置一个标记button状态的属性BOOL类型b;
 2. 设置数据. BOOL类型的数组,用来标记每一个cell上button的选中状态.
 3. cell中的button 设置正常和选择状态.
 4. 在cell 的setModel方法中 设置button的选中状态.
 5. 到此出就按照数据结构里面BOOL类型,设置button的状态.
 6. 在button的点击事件里面:
    6.1 切换button的状态
    6.2 更改model的状态与button的状态保持一致.
 */

/** button的全选
 1. 在controller上的全选按钮点击事件里面改变model的状态
 2. 刷新tableView.
 */

#pragma mark - 生命周期
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self createData];
    
    [self createTableView];
}


#pragma mark - 系统代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayM.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    EightCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[EightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.model = self.arrayM[indexPath.row];
    
    return cell;
}


#pragma mark - 点击事件
- (void)rightItemClicked
{
    for (EightModel * model in self.arrayM)
    {
        
        model.b = _isSelectedAll;
    }
    
    _isSelectedAll = !_isSelectedAll;
    
    [self.tableView reloadData];
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"cell-button复用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _isSelectedAll = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"全选" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked)];
}

- (void)createData
{
    NSArray * array = @[
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO},
  @{@"b":@NO}
  ];
    
    for (NSDictionary * dict in array)
    {
        EightModel * model = [[EightModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dict];
        
        [self.arrayM addObject:model];
    }
    [self.tableView reloadData];
}

- (void)createTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}



#pragma mark - setter & getter
- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)arrayM
{
    if (!_arrayM)
    {
        self.arrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _arrayM;
}

@end
