//
//  DMImageViewAnimation.m
//  MyProject
//
//  Created by liangqiang on 15/12/8.
//  Copyright (c) 2015年 liangqiang. All rights reserved.
//

#import "DMImageViewAnimation.h"

@implementation DMImageViewAnimation

+(void)favoriteAnimation:(UIImageView*)imageView image:(UIImage*)image color:(UIColor*)color{
//    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    shake.fromValue = [NSNumber numberWithFloat:-M_PI/32];
//    shake.toValue = [NSNumber numberWithFloat:+M_PI/32];
//    shake.duration = 0.1;
//    shake.autoreverses = YES; //是否重复
//    shake.repeatCount = 4;
//    shake.delegate = self;
//    
//    [imageView.layer addAnimation:shake forKey:@"shakeAnimation"];
//    imageView.image = image;
    
    
    imageView.layer.sublayers = nil;
    
    CGRect imageFrame = CGRectMake(imageView.width/2-8, imageView.hidden/2-8, 16, 16);
    CGPoint imgCenterPoint = CGPointMake(CGRectGetMidX(imageFrame), CGRectGetMidY(imageFrame));
    CGRect lineFrame = CGRectMake(imageFrame.origin.x - imageFrame.size.width / 4, imageFrame.origin.y - imageFrame.size.height / 4 , imageFrame.size.width * 1.5, imageFrame.size.height * 1.5);
    
    CAShapeLayer *circleShape = [CAShapeLayer new];
    circleShape.bounds = imageFrame;
    circleShape.position = imgCenterPoint;
    circleShape.path = [UIBezierPath bezierPathWithRect:imageFrame].CGPath;
    circleShape.fillColor = color.CGColor;
    circleShape.transform = CATransform3DMakeScale(0.0, 0.0, 1.0);
    [imageView.layer addSublayer:circleShape];
    
    CAShapeLayer *circleMask = [CAShapeLayer new];
    circleMask.bounds = imageFrame;
    circleMask.position = imgCenterPoint;
    circleMask.fillRule = kCAFillRuleEvenOdd;
    circleShape.mask = circleMask;

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRect:imageFrame];
    [maskPath addArcWithCenter:imgCenterPoint radius:0.1 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    circleMask.path = maskPath.CGPath;

    CAKeyframeAnimation *circleTransform = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    //==============================
    // circle transform animation
    //==============================
    circleTransform.duration = 0.333; // 0.0333 * 10
    circleTransform.values = @[
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(0.0,  0.0,  1.0)],    //  0/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(0.5,  0.5,  1.0)],    //  1/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(1.0,  1.0,  1.0)],    //  2/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(1.2,  1.2,  1.0)],    //  3/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(1.3,  1.3,  1.0)],    //  4/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(1.37, 1.37, 1.0)],    //  5/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(1.4,  1.4,  1.0)],    //  6/10
                              [NSValue valueWithCATransform3D: CATransform3DMakeScale(1.4,  1.4,  1.0)],     // 10/10
                              ];
    circleTransform.keyTimes = @[
                                @(0.0),    //  0/10
                                @(0.1),    //  1/10
                                @(0.2),    //  2/10
                                @(0.3),    //  3/10
                                @(0.4),    //  4/10
                                @(0.5),    //  5/10
                                @(0.6),    //  6/10
                                @(1.0)     // 10/10
                                ];
    
//    circleMaskTransform.duration = 0.333; // 0.0333 * 10
//    circleMaskTransform.values = [
//                                  NSValue(CATransform3D: CATransform3DIdentity),                                                              //  0/10
//                                  NSValue(CATransform3D: CATransform3DIdentity),                                                              //  2/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 1.25,  imageFrame.height * 1.25,  1.0)),   //  3/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 2.688, imageFrame.height * 2.688, 1.0)),   //  4/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 3.923, imageFrame.height * 3.923, 1.0)),   //  5/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 4.375, imageFrame.height * 4.375, 1.0)),   //  6/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 4.731, imageFrame.height * 4.731, 1.0)),   //  7/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 5.0,   imageFrame.height * 5.0,   1.0)),   //  9/10
//                                  NSValue(CATransform3D: CATransform3DMakeScale(imageFrame.width * 5.0,   imageFrame.height * 5.0,   1.0))    // 10/10
//                                  ]
//    circleMaskTransform.keyTimes = [
//                                    0.0,    //  0/10
//                                    0.2,    //  2/10
//                                    0.3,    //  3/10
//                                    0.4,    //  4/10
//                                    0.5,    //  5/10
//                                    0.6,    //  6/10
//                                    0.7,    //  7/10
//                                    0.9,    //  9/10
//                                    1.0     // 10/10
//                                    ]

    [circleShape addAnimation:circleTransform forKey:@"transform"];
//    circleShape.addAnimation(circleTransform, forKey: "transform")

}

@end
