//
//  FourthViewController.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "FourthViewController.h"

#import "HeroCell.h"
#import "HeroFrame.h"
#import "HeroModel.h"

@interface FourthViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * _dataSource;
}
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self createData];
    
    [self createTableView];
    
}

- (void)createData
{
    NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil]];
    
    NSLog(@"%@",array);
    
    for (NSDictionary * dict in array)
    {
        HeroModel * model = [[HeroModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dict];
        
        HeroFrame * heroFrame = [[HeroFrame alloc] init];
        heroFrame.heroModel = model;
        
        [_dataSource addObject:heroFrame];
    }
}

- (void)basicSetting
{
    self.title = @"Cell-Frame模型";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataSource = [NSMutableArray arrayWithCapacity:0];
}



- (void)createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:tableView];
}

#pragma mark - UITableView的代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCell * cell = [HeroCell heroCellWithTableView:tableView];
    
    cell.heroFrame = _dataSource[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dataSource[indexPath.row] cellHeight];
}

@end
