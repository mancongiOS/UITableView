//
//  SevenCell.m
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SevenCell.h"
#import "SevenModel.h"

#import "Masonry.h"

@interface SevenCell ()

@property (nonatomic, strong) UIView    * bgView;
@property (nonatomic, strong) UIButton  * button;

@end


@implementation SevenCell

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
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
    
    [self.bgView addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.bgView).with.offset(10);
        make.top.mas_equalTo(self.bgView).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
}

- (void)buttonClicked
{
    
    if (self.customDelegate != nil && [self.customDelegate respondsToSelector:@selector(sevenProrocolMethod:and:)])
    {
        [self.customDelegate sevenProrocolMethod:self.viewController and:self.cellRow];
    }
}

#pragma mark - setter & getter 
- (UIView *)bgView
{
    if (!_bgView)
    {
        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UIButton *)button
{
    if (!_button)
    {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.layer.masksToBounds = YES;
        self.button.layer.cornerRadius = 20.0f;
        
        self.button.backgroundColor = [UIColor orangeColor];
        
        self.button.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        [self.button setTitle:@"button点击事件跳转下一个页面" forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
