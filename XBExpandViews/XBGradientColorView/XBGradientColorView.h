//
//  XBGradientColorView.h
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 渐变方向

 - XBGradientColorDirectionLeftToRight: 从左到右
 - XBGradientColorDirectionTopToBottom: 从上到下
 - XBGradientColorDirectionLeftTopToRightBottom: 从左上到右下
 - XBGradientColorDirectionLeftBottomToRightTop: 从左下到右上
 */
typedef NS_ENUM(NSInteger,XBGradientColorDirection){
    XBGradientColorDirectionLeftToRight = 0,
    XBGradientColorDirectionTopToBottom = 1,
    XBGradientColorDirectionLeftTopToRightBottom = 2,
    XBGradientColorDirectionLeftBottomToRightTop = 3
} ;

@interface XBGradientColorView : UIView

/**
 是否禁止隐式动画
 */
@property (nonatomic ,assign) BOOL forbidDefaultAnimation;

/**
 渐变方向
 */
@property (nonatomic, assign) XBGradientColorDirection direction;

/**
 渐变颜色
 */
@property (nonatomic, strong) NSArray<UIColor *> *colors;     // 渐变的颜色

/**
 渐变分割位置
 */
@property (nonatomic, strong) NSArray<NSNumber *> *locations;  // 颜色分割的位置

@end
