//
//  DMAutoLayoutViewController.m
//  MyProject
//
//  Created by liangqiang on 15/11/6.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMAutoLayoutViewController.h"

@implementation DMAutoLayoutViewController

-(void)createViews{
    [super createViews];
    
    [self testAutoLayout];
}

-(void)testAutoLayout{
    UIView *parent = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    parent.backgroundColor = [UIColor grayColor];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 60, 60)];
    view1.backgroundColor = [UIColor redColor];
    [parent addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 0, 40, 40)];
    view2.backgroundColor = [UIColor yellowColor];
    [parent addSubview:view2];
    
    UIButton *button = createImageButton(DMIconFontService, DMIconFontServiceSelect);
//    button.size = CGSizeMake(50, 50);
    button.backgroundColor = [UIColor greenColor];
    [parent addSubview:button];
    dmPosInParent(button, POS_AUTO, POS_AUTO, POS_AUTO, POS_AUTO);
    
    UIButton *button2 = createTextButton(@"保存", kFont16, kGrayTextColor, kBlackTextColor);
    button2.size = CGSizeMake(40, 40);
    button2.backgroundColor = [UIColor greenColor];
    [parent addSubview:button2];
    dmPosByBrother(button2, button, 10, 10, POS_AUTO, 30);
    

    [self.scrollView addSubview:parent];
    
//    parent.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;

    NSDictionary *views = NSDictionaryOfVariableBindings(view1, view2);
    NSArray* constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1]-|" options:0 metrics:nil views:views];
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[view1]-20-|" options:0 metrics:nil views:views];

    NSArray *constraints3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view2(30)]" options:0 metrics:nil views:views];
    NSArray *constraints4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[view2(==30)]" options:0 metrics:nil views:views];

    [parent addConstraints:constraints1];
    [parent addConstraints:constraints2];
    [parent addConstraints:constraints3];
    [parent addConstraints:constraints4];
    
    [view1 handleClick:^(UIView *view) {
        NSLog(@"%@", view);
    }];
    
}
@end
