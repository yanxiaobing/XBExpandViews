//
//  XBGradientLabel.h
//  XBExpandViews
//
//  Created by XBingo on 2017/12/28.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

typedef NS_ENUM(NSInteger,XBGradientColorDirection){
    XBGradientColorDirectionLeftToRight = 0,
    XBGradientColorDirectionTopToBottom = 1,
    XBGradientColorDirectionLeftTopToRightBottom = 2,
    XBGradientColorDirectionLeftBottomToRightTop = 3
} ;

@interface XBGradientLabel : UIView

@property (nonatomic ,strong) id string;
@property (nonatomic ,strong) UIFont *font;
@property (nonatomic ,assign) NSTextAlignment textAlignment;

@property (nonatomic ,assign) XBGradientColorDirection direction;
@property (nonatomic ,strong) NSArray <UIColor *>*colors;
@property (nonatomic ,strong) NSArray<NSNumber *> *locations;

@end
