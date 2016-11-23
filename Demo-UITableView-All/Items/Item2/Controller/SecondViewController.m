//
//  SecondViewController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#pragma 知识点
/** 不自定义cell,怎么改变系统的cell样式? 
 1. 用系统的UITableViewCell.
 2. 创建cell的 创建cell上除了系统的样式之外需要的控件.,并且加在cell上.
 3. 如果给添加的控件赋值操作,可以给该控件一个tag值.然后出来赋值.
 */

/** 怎么读取plist文件中的数据?
 */

#import "SecondViewController.h"

#import "SecondModel.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHieght [UIScreen mainScreen].bounds.size.height

@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataSource;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
    
    [self createDataSource];
}

- (void)basicSetting
{
    self.title = @"MVC模式";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHieght) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.rowHeight = 70.0f;
    
    [self.view addSubview:tableView];
}

- (void)createDataSource
{
    _dataSource = [NSMutableArray arrayWithCapacity:0];
    
    NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil]];
    
    for (NSDictionary * dict in array)
    {
        SecondModel * model = [[SecondModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        
        [_dataSource addObject:model];
    }
}

#pragma mark - Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    //右上角英雄种类
    UILabel * typeLabel;
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth - 70, 0, 50, 20)];
        typeLabel.backgroundColor = [UIColor redColor];
        typeLabel.tag = 100;
        
        [cell addSubview:typeLabel];
    }
    
    
    // 给cell 赋值
    SecondModel * model = _dataSource[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.intro;
    
    // 取出标识为100的标签重新给它的文本赋值.
    UILabel * label = (UILabel *)[cell viewWithTag:100];
    label.text = model.type;
    
    return cell;
}

@end
