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
    self.gradientLayer.colors = CGColors;
}

- (void)setLocations:(NSArray *)locations {
    self.gradientLayer.locations = locations;
}

- (void)setDirection:(XBGradientColorDirection)direction {
    _direction = direction;
    if (direction == XBGradientColorDirectionLeftToRight) {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(1, 0);
    } else {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}
@end
