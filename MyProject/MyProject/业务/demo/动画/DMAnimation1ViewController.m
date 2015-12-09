//
//  DMAnimation1ViewController.m
//  MyProject
//
//  Created by liangqiang on 15/12/7.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMAnimation1ViewController.h"
#import "DMImageViewAnimation.h"
#import "APRoundedButton.h"

@interface DMAnimation1ViewController ()

@end

@implementation DMAnimation1ViewController

-(void)createViews{
    [super createViews];
    
    self.title = @"动画测试";
    [self createAnimationViews];
    [self createAnimationButtons];
    [self createAnimationButtons2];
}

-(void)updateViews{
    [super updateViews];
}

-(void)createAnimationViews{
    UIView *view = [UIView new];
    view.size = CGSizeMake(100, 100);
    view.backgroundColor = [UIColor redColor];
    view.tag = tag(AnimationView);
    [self.scrollView addSubview:view];
    layoutInParent(view, 50, EAuto, 100, EAuto);
    
    UIImageView *image = createImageView(DMIconFontExpert2, UIViewContentModeCenter);
    [self.scrollView addSubview:image];
    image.tag = tag(AnimationImageNormal);
    layoutInParent(image, 50, EAuto, 300, EAuto);
    [image handleClick:^(UIView *view) {
        UIImageView *image = (UIImageView*)view;
        if (image.tag == tag(AnimationImageNormal)) {
            [DMImageViewAnimation favoriteAnimation:image image:DMIconFontExpertSelect2 color:nil];
//            image.image = DMIconFontExpertSelect2;
            image.tag = tag(AnimationImageSelected);
        }else{
            [DMImageViewAnimation favoriteAnimation:image image:DMIconFontExpert2 color:nil];
//            image.image = DMIconFontExpert2;
            image.tag = tag(AnimationImageNormal);
        }
    }];
    
    APRoundedButton *btn = [APRoundedButton new];
    btn.size = CGSizeMake(100, 50);
    [btn setTitle:@"回到未来" forState:UIControlStateNormal];
    btn.fillColor = [UIColor orangeColor];
    btn.topLeft = YES;
    btn.cornerRadius = 20;
    [self.scrollView addSubview:btn];
    layoutInParent(btn, 50, EAuto, 500, EAuto);
   
}

-(void)createAnimationButtons{
    UIButton *button1 = [self createButton:@"动画1" selector:@"onButton1Clicked"];
    UIButton *button2 = [self createButton:@"图片动画" selector:@"onButton2Clicked"];
    UIButton *button3 = [self createButton:@"动画3" selector:@"onButton3Clicked"];
    UIButton *button4 = [self createButton:@"动画4" selector:@"onButton4Clicked"];
    UIButton *button5 = [self createButton:@"动画5" selector:@"onButton5Clicked"];
    
    UIView *section = createSection(44, @[button1, button2, button3, button4, button5], ELineNone);
    layoutInParent(button1, 15, EAuto, EAuto, EAuto);
    layoutInParent(button2, button1.right+15, EAuto, EAuto, EAuto);
    layoutInParent(button3, button2.right+15, EAuto, EAuto, EAuto);
    layoutInParent(button4, button3.right+15, EAuto, EAuto, EAuto);
    layoutInParent(button5, button4.right+15, EAuto, EAuto, EAuto);
    [self.scrollView addSection:section];
}

-(void)createAnimationButtons2{
    UIButton *button6 = [self createButton:@"动画6" selector:@"onButton6Clicked"];
    UIButton *button7 = [self createButton:@"抖动" selector:@"onButton7Clicked"];
    UIButton *button8 = [self createButton:@"旋转" selector:@"onButton8Clicked"];
    UIButton *button9 = [self createButton:@"动画9" selector:@"onButton9Clicked"];
    UIButton *button10 = [self createButton:@"动画10" selector:@"onButton10Clicked"];
    
    UIView *section = createSection(44, @[button6, button7, button8, button9, button10], ELineNone);
    layoutInParent(button6, 15, EAuto, EAuto, EAuto);
    layoutInParent(button7, button6.right+15, EAuto, EAuto, EAuto);
    layoutInParent(button8, button7.right+15, EAuto, EAuto, EAuto);
    layoutInParent(button9, button8.right+15, EAuto, EAuto, EAuto);
    layoutInParent(button10, button9.right+15, EAuto, EAuto, EAuto);
    [self.scrollView addSection:section];
}


-(UIButton*)createButton:(NSString*)title selector:(NSString*)sel{
    UIButton *button = createTextButton(title, kFont12, kGrayTextColor, kBlackTextColor);
    button.size = CGSizeMake(60, 30);
    button.layer.cornerRadius = button.height/2.0;
    button.layer.borderColor = [kGrayTextColor CGColor];
    button.layer.borderWidth = kOnePixel;
    button.extraData = sel;
    
    WEAKSELF
    [button handleEvent:UIControlEventTouchUpInside withBlock:^(UIControl *control) {
        SEL selector = NSSelectorFromString(control.extraData);
        if ([weakSelf respondsToSelector:selector]) {
//            [weakSelf performSelector:selector withObject:nil];
            IMP imp = [weakSelf methodForSelector:selector];
            void (*func)(id, SEL) = (void *)imp;
            func(weakSelf, selector);
        }
 
//        执行带参数的selector
//        SEL selector = NSSelectorFromString(@"processRegion:ofView:");
//        IMP imp = [_controller methodForSelector:selector];
//        CGRect (*func)(id, SEL, CGRect, UIView *) = (void *)imp;
//        CGRect result = _controller ?
//        func(_controller, selector, someRect, someView) : CGRectZero;

    }];
    
    return button;
}

-(void)onButton1Clicked{
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:2];
    //动画的内容
    if (view.left < 200) {
        view.origin = CGPointMake(200, 200);
    }else{
        view.origin = CGPointMake(50, 150);
    }
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:view cache:YES]; //only one per begin/commit block
    //动画结束
    [UIView commitAnimations]; 

}

-(void)onButton2Clicked{
    UIImageView *myAnimatedView = (UIImageView*)[self.view viewWithTag:tag(AnimationImage)];
    if ( myAnimatedView != nil) {
        myAnimatedView.hidden = !myAnimatedView.hidden;
        return;
    }
    
    NSArray *myImages = [NSArray arrayWithObjects:
                         DMIconFontService,
                         DMIconFontServiceSelect,
                         DMIconFontMine,
                         DMIconFontMineSelect, nil];
    
    myAnimatedView = [UIImageView new];
    myAnimatedView.size = CGSizeMake(26*3, 26*3);
    myAnimatedView.animationImages = myImages; //animationImages属性返回一个存放动画图片的数组
    myAnimatedView.animationDuration = 1; //浏览整个图片一次所用的时间
    myAnimatedView.animationRepeatCount = 0; // 0 = loops forever 动画重复次数
    myAnimatedView.tag = tag(AnimationImage);
    [myAnimatedView startAnimating]; 
    [self.scrollView addSubview:myAnimatedView];
    layoutInParent(myAnimatedView, EAuto, EAuto, EAuto, EAuto);
}

-(void)onButton3Clicked{
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:2];
    //动画的内容
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:view cache:NO]; //only one per begin/commit block
//    view.backgroundColor = (view.backgroundColor==[UIColor redColor]) ? [UIColor yellowColor] : [UIColor redColor];
    view.hidden = NO;
    //动画结束
    [UIView commitAnimations];
    
//    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCurlUp;
//    [UIView transitionFromView:view toView:view duration:2 options:options completion:^(BOOL finished) {
//    }];
}

-(void)onButton4Clicked{
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:2];
    //动画的内容
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:NO]; //only one per begin/commit block
    view.hidden = YES;
    //动画结束
    [UIView commitAnimations];
    
    //    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCurlUp;
    //    [UIView transitionFromView:view toView:view duration:2 options:options completion:^(BOOL finished) {
    //    }];
}

-(void)onButton5Clicked{
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0;
    transition.type = kCATransitionReveal;
    transition.type = @"pageCurl";
//    transition.subtype = kCATransitionFromTop;
    view.hidden = YES;
    [view.layer addAnimation:transition forKey:@"animation"];
}

-(void)onButton6Clicked{
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    [UIView animateWithDuration:2 animations:^{
        if (view.left < 200) {
            view.origin = CGPointMake(200, 200);
        }else{
            view.origin = CGPointMake(50, 150);
        }
    }];
}

-(void)onButton7Clicked{
    //抖动
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:-M_PI/32];
    shake.toValue = [NSNumber numberWithFloat:+M_PI/32];
    shake.duration = 0.1;
    shake.autoreverses = YES; //是否重复
    shake.repeatCount = 4;
    shake.delegate = self;
    
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    [view.layer addAnimation:shake forKey:@"shakeAnimation"];
    
    
}

- (void)animationDidStop:(CAPropertyAnimation *)anim finished:(BOOL)flag{
    if ([anim.keyPath isEqualToString:@"transform.rotation.z"]) {
        UIView *view = [self.view viewWithTag:tag(AnimationView)];
        UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction;
        [UIView animateWithDuration:2.0 delay:0.0 options:options animations:^{
            view.alpha = 0.5; //透明度变0则消失
        } completion:nil];
    }
}


-(void)onButton8Clicked{
    //旋转
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:0];
    shake.toValue = [NSNumber numberWithFloat:2*M_PI];
    shake.duration = 0.8;
    shake.autoreverses = NO;
    shake.repeatCount = 10;
    
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    [view.layer addAnimation:shake forKey:@"shakeAnimation"];
}

-(void)onButton9Clicked{
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    CGMutablePathRef aPath =CGPathCreateMutable();
    CGPathMoveToPoint(aPath, nil, view.center.x, view.center.y);
    CGPathAddCurveToPoint(aPath, nil, 160, 30, 220, 220, 240, 420);
//    CGPathAddLineToPoint(aPath, nil, 260, 380);
    animation.path = aPath;
    animation.autoreverses = YES;
    animation.duration = 2;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.rotationMode = @"auto";
    
//    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    [view.layer addAnimation:animation forKey:@"position"];
    
}

-(void)onButton10Clicked{
    CABasicAnimation *flip = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    flip.toValue = [NSNumber numberWithDouble:-M_PI];
    flip.duration = 1.0;
    flip.repeatCount = 10;
  
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    shake.fromValue = [NSNumber numberWithFloat:0];
    shake.toValue = [NSNumber numberWithFloat:2*M_PI];
    shake.duration = 0.8;
    shake.autoreverses = NO;
    shake.repeatCount = 10;
    
    CABasicAnimation *scale= [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.toValue = [NSNumber numberWithDouble:5];
    scale.duration = 1.5;
    scale.autoreverses = YES;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:flip, scale, shake, nil];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.duration = 3;
    group.fillMode = kCAFillModeForwards;      
    group.removedOnCompletion =NO;
    
    UIView *view = [self.view viewWithTag:tag(AnimationView)];
    [view.layer addAnimation:group forKey:@"position"];
    
}

@end
