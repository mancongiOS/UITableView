//
//  FifthViewController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "FifthViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface FifthViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView    * tableView;

@property (nonatomic, strong) NSMutableArray * dataArr;

@property (nonatomic, strong) UIBarButtonItem * editButton;

@property (nonatomic, strong) UIBarButtonItem * doneButton;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self createData];
    
    [self createTableView];
}

- (void)basicSetting
{
    self.title = @"编辑模式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化
    self.dataArr = [NSMutableArray arrayWithCapacity:0];
    
    //开始显示的编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButton;
}

#pragma mark - UITableView 的 Delegate & DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.dataArr[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark 确认能否编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark 编辑操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     只要实现了这个方法，cell默认会有左划效果，默认的编辑样式是删除
     */
    
    // 删除
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // 1. 先改变数据模型
        NSMutableArray * littleArray = self.dataArr[indexPath.section];
        [littleArray removeObjectAtIndex:indexPath.row];
        
        // 2. 刷新页面 (刷新某一行)
        
        // 3. 删除某一行
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    // 插入
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // 1. 添加
        NSMutableArray * littleArray = self.dataArr[indexPath.section];
        NSString * str = [NSString stringWithFormat:@"%ld%i",'A' + indexPath.section,arc4random() % 10];
        [littleArray insertObject:str atIndex:indexPath.row];
        
        // 2. 刷新页面
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

#pragma mark 编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return UITableViewCellEditingStyleDelete;
    }
    else
    {
        return UITableViewCellEditingStyleInsert;
    }
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /**
     UITableViewRowActionStyleDefault 是红色
     UITableViewRowActionStyleNormal  灰色
     */
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"添加" handler:nil];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"移动" handler:nil];
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
     
        // 事件处理
        
    }];
    NSArray *actionArray = @[action1,action2,action3];
    return actionArray;
}

#pragma mark 确定是否能移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark 移动的代理方法
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 1.  改变模型层数据
    // 1.1 取出来原位置数据
    NSString * str = self.dataArr[sourceIndexPath.section][sourceIndexPath.row];
    // 1.2 移除原位置对象
    NSMutableArray * sourceLittleArray = self.dataArr[sourceIndexPath.section];
    [sourceLittleArray removeObject:str];
    
    // 1.3 加入到新的位置
    NSMutableArray * distinationAttay = self.dataArr[destinationIndexPath.section];
    [distinationAttay insertObject:str atIndex:destinationIndexPath.row];
    
    // 2.  刷新页面
    // 2.1 不需要手动刷新
}

#pragma mark 返回索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray * lettleArr = [NSMutableArray arrayWithCapacity:0];
    
    [lettleArr addObject:@"Start"];
    
    for (char c = 'A'; c <= 'Z'; c ++)
    {
        NSString * letterStr = [NSString stringWithFormat:@"%c",c];
        
        [lettleArr addObject:letterStr];
    }
    
    [lettleArr addObject:@"End"];
    
    return lettleArr;
}

#pragma mark 设置索引对应的下标
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if ([title isEqualToString:@"Start"])
    {
        return index;
    }
    else if ([title isEqualToString:@"End"])
    {
        return index - 2;
    }
    else
    {
        return index - 1;
    }
}

#pragma mark - 点击事件
- (void)done
{
    self.navigationItem.rightBarButtonItem = self.editButton;
    
    // 结束编辑
    [self.tableView setEditing:NO animated:YES];
}

- (void)edit
{
    self.navigationItem.rightBarButtonItem = self.doneButton;
    
    // 进入编辑模式
    [self.tableView setEditing:YES animated:YES];
}

#pragma mark - 实现方法
- (void)createData
{
    for (int i = 0; i < 26; i ++)
    {
        NSMutableArray * littleArr = [NSMutableArray arrayWithCapacity:0];
        
        for (int j = 0; j < 5; j ++)
        {
            NSString * str = [NSString stringWithFormat:@"%c%d",'A'+ i,j + 1];
            
            [littleArr addObject:str];
        }
        
        [self.dataArr addObject:littleArr];
    }
}

- (void)createTableView
{
    [self.view addSubview:self.tableView];
}

#pragma mark - setter & getter
- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStyleGrouped];
        
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
    
    }
    return _tableView;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        self.dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArr;
}
- (UIBarButtonItem *)doneButton
{
    if (!_doneButton)
    {
        self.doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    }
    return _doneButton;
}
- (UIBarButtonItem *)editButton
{
    if (!_editButton)
    {
        self.editButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    }
    return _editButton;
}

@end
