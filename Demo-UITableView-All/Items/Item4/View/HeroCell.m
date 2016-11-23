//
//  HeroCell.m
//  Demo-UITableView-All
//
//  Created by quhaola on 16/4/25.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "HeroCell.h"

#import "HeroModel.h"
#import "HeroFrame.h"

@interface HeroCell ()
{
    UIImageView     *_iconIV;
    UILabel         *_nameLabel;
    UILabel         *_typeLabel;
    UILabel         *_introLabel;
}
@end

@implementation HeroCell

+ (instancetype)heroCellWithTableView:(UITableView *)tableView
{
    static NSString * identifier = @"cell";
    
    HeroCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[HeroCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        [cell createSubViews];
    }
    return cell;
}

- (void)createSubViews
{
    _iconIV = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconIV];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.contentView addSubview:_nameLabel];
    
    _typeLabel = [[UILabel alloc] init];
    _typeLabel.font = [UIFont systemFontOfSize:20.0f];
    [self.contentView addSubview:_typeLabel];
    
    _introLabel = [[UILabel alloc] init];
    _introLabel.font = kIntroLabelFont;
    _introLabel.numberOfLines = 0;
    [self.contentView addSubview:_introLabel];
}

- (void)setHeroFrame:(HeroFrame *)heroFrame
{
    _iconIV.frame = heroFrame.iconFrame;
    _nameLabel.frame = heroFrame.nameFrame;
    _typeLabel.frame = heroFrame.typeFrame;
    _introLabel.frame = heroFrame.introFrame;
    
    _iconIV.image = [UIImage imageNamed:heroFrame.heroModel.icon];
    _nameLabel.text = heroFrame.heroModel.name;
    _typeLabel.text = heroFrame.heroModel.type;
    _introLabel.text = heroFrame.heroModel.intro;
}

@end
