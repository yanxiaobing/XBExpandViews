//
//  XBGradientColorView.h
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,XBGradientColorDirection){
    XBGradientColorDirectionLeftToRight = 0,
    XBGradientColorDirectionTopToBottom = 1
} ;

@interface XBGradientColorView : UIView

@property (nonatomic, assign) XBGradientColorDirection direction;
@property (nonatomic, strong) NSArray *colors;     // 渐变的颜色
@property (nonatomic, strong) NSArray *locations;  // 颜色分割的位置

@end
