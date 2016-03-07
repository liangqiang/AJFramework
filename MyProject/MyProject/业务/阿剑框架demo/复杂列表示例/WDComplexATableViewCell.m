//
//  WDComplexATableViewCell.m
//  MyProject
//
//  Created by liangqiang on 16/3/2.
//  Copyright © 2016年 liangqiang. All rights reserved.
//

#import "WDComplexATableViewCell.h"
#import "WDComplexCellItem.h"

@interface WDComplexATableViewCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@end

@implementation WDComplexATableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initContentView];
    }
    return self;
}

-(void)initContentView{
    self.titleLabel = [UILabel newWith:kFont16, kLightBlackColor, @"标题", @(NSTextAlignmentCenter), nil];
    self.contentLabel = [UILabel newWith:kFont14, kGrayColor, nil];
    
    [self.contentView addSubviews:self.titleLabel, self.contentLabel, nil];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel layoutWithInsets:UIEdgeInsetsZero];
}

-(void)updateWithItem:(WDComplexCellItem*)cellItem{
    self.titleLabel.text = cellItem.title;
    self.contentLabel.text = cellItem.content;
}

@end
