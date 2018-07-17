//
//  XBGradientColorView.m
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import "XBGradientColorView.h"

@interface XBGradientColorView()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation XBGradientColorView

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer new];
        [self.layer addSublayer:_gradientLayer];
    }
    return _gradientLayer;
}

- (void)setColors:(NSArray *)colors {
    NSMutableArray *CGColors = [NSMutableArray array];
    [colors enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIColor *color = obj;
        [CGColors addObject:(id)color.CGColor];
    }];
    
    if (_forbidDefaultAnimation) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.gradientLayer.colors = CGColors;
        [CATransaction commit];
    }else{
        self.gradientLayer.colors = CGColors;
    }
    
}

- (void)setLocations:(NSArray *)locations {
    
    if (_forbidDefaultAnimation) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.gradientLayer.locations = locations;
        [CATransaction commit];
    }else{
        self.gradientLayer.locations = locations;
    }
    
}

- (void)setDirection:(XBGradientColorDirection)direction {
    _direction = direction;
    
    if (_forbidDefaultAnimation) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [self dealWithDirection:direction];
        [CATransaction commit];
    }else{
        [self dealWithDirection:direction];
    }
}

-(void)dealWithDirection:(XBGradientColorDirection)direction{
    
    switch (direction) {
        case XBGradientColorDirectionLeftToRight:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 0);
        }
            break;
        case XBGradientColorDirectionTopToBottom:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(0, 1);
        }
            break;
        case XBGradientColorDirectionLeftTopToRightBottom:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 1);
        }
            break;
        case XBGradientColorDirectionLeftBottomToRightTop:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 1);
            self.gradientLayer.endPoint = CGPointMake(1, 0);
        }
            break;
        default:
            break;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_forbidDefaultAnimation) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.gradientLayer.frame = self.bounds;
        [CATransaction commit];
    }else{
        self.gradientLayer.frame = self.bounds;
    }
}
@end
