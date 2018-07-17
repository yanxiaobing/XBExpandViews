//
//  XBExpandButton.m
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import "XBExpandButton.h"

@interface XBExpandButton()

@property (nonatomic ,assign) BOOL isIgnoreAction;

@end

@implementation XBExpandButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpDefaultData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUpDefaultData];
    }
    return self;
}

-(void)setUpDefaultData{
    _expandMargin = 0;
    _interval = 0;
    _isIgnoreAction = NO;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect area = CGRectInset(self.bounds, -self.expandMargin, -self.expandMargin);
    return CGRectContainsPoint(area, point);
}

-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (_isIgnoreAction) {
        return;
    }
    
    if (_interval > 0){
        _isIgnoreAction = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _isIgnoreAction = NO;
        });
    }
    
    [super sendAction:action to:target forEvent:event];
}

@end
