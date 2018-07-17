//
//  XBExpandButton.h
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBExpandButton : UIButton


/**
 按钮点击范围在原有基础上增量（单位pt）
 */
@property(nonatomic, assign) CGFloat expandMargin;


/**
 按钮点击间隔时长（单位秒）
 */
@property(nonatomic, assign) NSTimeInterval interval;

@end
