//
//  EightCell.m
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/16.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "EightCell.h"

#import "EightModel.h"

#import "Masonry.h"

@interface EightCell ()

@property (nonatomic, strong) UIButton * button;

@end

@implementation EightCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews
{
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

#pragma mark - 点击事件
- (void)buttonClicked
{
    self.button.selected = !self.button.isSelected;
    
    self.model.b = self.button.isSelected;
}

#pragma mark - setter & getter 

- (void)setModel:(EightModel *)model
{
    _model = model;
    
    self.button.selected = model.b;
}

- (UIButton *)button
{
    if (!_button)
    {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.backgroundColor = [UIColor orangeColor];
        [self.button setTitle:@"未被选择" forState:UIControlStateNormal];
        [self.button setTitle:@"已被选择" forState:UIControlStateSelected];
        
        [self.button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
