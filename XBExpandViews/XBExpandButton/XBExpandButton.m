//
//  XBExpandButton.m
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import "XBExpandButton.h"

@implementation XBExpandButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.expandMargin = 0;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.expandMargin = 0;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect area = CGRectInset(self.bounds, -self.expandMargin, -self.expandMargin);
    return CGRectContainsPoint(area, point);
}

@end
