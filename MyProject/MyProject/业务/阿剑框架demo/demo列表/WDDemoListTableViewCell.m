//
//  WDDemoListTableViewCell.m
//  MyProject
//
//  Created by liangqiang on 16/3/1.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDDemoListTableViewCell.h"

@interface WDDemoListTableViewCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation WDDemoListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    self.titleLabel = [UILabel newWith:kFont14, kLightBlackColor, @"标题", @(NSTextAlignmentCenter), nil];
    [self.contentView addSubview:self.titleLabel];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel layoutWithInsets:UIEdgeInsetsZero];
}

-(void)updateWithItem:(AJNormalItem*)cellItem{
    self.titleLabel.text = cellItem.title;
}

@end
