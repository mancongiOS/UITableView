//
//  SevenCell.h
//  Demo-UITableView-All
//
//  Created by goulela on 16/6/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SevenModel;

@protocol SevenProtocolDelegate <NSObject>

- (void)sevenProrocolMethod:(UIViewController *)viewController and:(NSInteger)cellRow;

@end

@interface SevenCell : UITableViewCell

@property (nonatomic, weak) id<SevenProtocolDelegate> customDelegate;

@property (nonatomic, strong) UIViewController  * viewController;
@property (nonatomic, assign) NSInteger  cellRow;

@property (nonatomic, strong) SevenModel * model;

@end
