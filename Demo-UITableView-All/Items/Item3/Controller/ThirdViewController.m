//
//  ThirdViewController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ThirdViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ThirdViewController () <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    BOOL    _isSearch;  //用来判断是否为搜索状态
}

@property (nonatomic, strong) UITableView      * tableView;

@property (nonatomic, strong) NSMutableArray * dataSourceArray;   //所有的表格数据

@property (nonatomic, strong) NSMutableArray * searchData;        //搜索之后的数据

@end

@implementation ThirdViewController


#pragma mark - 实现方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self createData];
    
    [self addTableView];
    
    [self createSearchBar];
}

#pragma mark 基本设置
- (void)basicSetting
{
    self.title = @"搜索";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化
    self.searchData = [NSMutableArray arrayWithCapacity:0];
    self.dataSourceArray = [NSMutableArray arrayWithCapacity:0];
}

#pragma mark 添加表格视图
- (void)addTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

#pragma mark 构建所有表格数据
- (void)createData
{
    // 先循环创建A - Z 26个英文字母
    for (int i = 0; i < 26; i ++)
    {
        NSMutableArray * litterArray = [NSMutableArray arrayWithCapacity:0];
        
        // 再循环创建0 - 19 的数字数据
        for (int j = 0; j < 20; j ++)
        {
            //最后在随机生成一个0 - 4 的随机数  --> arc4random() % 5
            
            // 最终构成了一个字母开头的长度为3的字符串
            NSString * str = [NSString stringWithFormat:@"%c%i%i",'A' + i,j, arc4random() % 5];
            
            
            [litterArray addObject:str];
        }

        [self.dataSourceArray addObject:litterArray];
    }
}

#pragma mark 创建搜索条
- (void)createSearchBar
{
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    searchBar.placeholder = @"输入搜索内容";
    searchBar.showsCancelButton = YES;
    searchBar.returnKeyType = UIReturnKeyDone;
    
    searchBar.delegate = self;
    
    self.tableView.tableHeaderView = searchBar;
}

#pragma mark - UITableView 的代理和数据源

#pragma mark 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _isSearch ? 1 : self.dataSourceArray.count;
}

#pragma mark 每行个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _isSearch ? _searchData.count : [self.dataSourceArray[section] count];
}

#pragma mark 创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (_isSearch)
    {
        cell.textLabel.text = self.searchData[indexPath.row];
    }
    else
    {
    cell.textLabel.text = self.dataSourceArray[indexPath.section][indexPath.row];
    }
    
    return cell;
}
#pragma mark - UISearchBar Delegate
#pragma mark 取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    //清空搜索框
    searchBar.text = @"";
    
    //退出键盘
    [searchBar resignFirstResponder];
    
    //设置是否搜索
    _isSearch = NO;
    
    //刷新表格视图
    [self.tableView reloadData];
}
#pragma mark 搜索文本框修改的时候
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    if (searchText.length == 0)
    {
        [searchBar resignFirstResponder];
        
        _isSearch = NO;
    }
    else
    {
        _isSearch = YES;
    }
    
    //清空数据
    [self.searchData removeAllObjects];
    
    //循环匹配数据是否类似searchText
    for (NSMutableArray * array in self.dataSourceArray)
    {
        for (NSString * str in array)
        {
            bool b  = [str containsString:searchText];
            
            if (b == YES)
            {
                [self.searchData addObject:str];
            }
        }
    }
    [self.tableView reloadData];
}
#pragma mark 点击了确定按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{    
    _isSearch = NO;
    
    searchBar.text = @"";
    
    [searchBar resignFirstResponder];
    
    [self.tableView reloadData];
}

#pragma mark - 退出键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end
