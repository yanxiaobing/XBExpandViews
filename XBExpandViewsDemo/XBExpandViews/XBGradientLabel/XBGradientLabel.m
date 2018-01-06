//
//  XBGradientLabel.m
//  XBExpandViews
//
//  Created by XBingo on 2017/12/28.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import "XBGradientLabel.h"

@interface XBGradientLabel()

@property (nonatomic ,strong) NSMutableArray *gradientColors;
@property (nonatomic ,strong) CAGradientLayer *gradientLayer;
@property (nonatomic ,strong) CATextLayer *textLayer;

@end

@implementation XBGradientLabel

-(void)layoutSubviews{
    [super layoutSubviews];

    self.textLayer.frame = self.bounds;
    
    // set layer font
    CFStringRef fontName = (__bridge CFStringRef)self.font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textLayer.font = fontRef;
    self.textLayer.fontSize = self.font.pointSize;
    CGFontRelease(fontRef);
    
    // set layer alignmentMode
    switch (self.textAlignment) {
        case NSTextAlignmentLeft:
            self.textLayer.alignmentMode = kCAAlignmentLeft;
            break;
        case NSTextAlignmentRight:
            self.textLayer.alignmentMode = kCAAlignmentRight;
            break;
        case NSTextAlignmentCenter:
            self.textLayer.alignmentMode = kCAAlignmentCenter;
            break;
        case NSTextAlignmentNatural:
            self.textLayer.alignmentMode = kCAAlignmentNatural;
            break;
        case NSTextAlignmentJustified:
            self.textLayer.alignmentMode = kCAAlignmentJustified;
            break;
        default:
            break;
    }
    
    // set layer text
    self.textLayer.string = self.string;

    // add textlayer to superLayer
    [self.layer addSublayer:self.textLayer];
    
    
    if ([self.string isKindOfClass:NSString.class]) {
        NSMutableParagraphStyle* paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary* attribute = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle};
        CGSize size = [self.string sizeWithAttributes:attribute];
        self.gradientLayer.frame = CGRectMake((self.bounds.size.width - size.width)/2.0, (self.bounds.size.height - size.height)/2.0, size.width, size.height);
    }else{
        self.gradientLayer.frame = self.bounds;
    }

    self.gradientLayer.colors = self.gradientColors;
    self.gradientLayer.locations = self.locations;
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(1, 0);
    
    // set gradient direction
    switch (self.direction) {
        case XBGradientColorDirectionLeftToRight:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 0);
        }
            break;
        case XBGradientColorDirectionTopToBottom:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
        }
            break;
        case XBGradientColorDirectionLeftTopToRightBottom:
        {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 1);
        }
            break;
        case XBGradientColorDirectionLeftBottomToRightTop:
        {
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(1, 0);
        }
            break;
            
        default:
            break;
    }
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
    
    //set mask
    self.gradientLayer.mask = self.textLayer;
    [self.layer addSublayer:self.gradientLayer];
}

-(CATextLayer *)textLayer{
    if (!_textLayer) {
        _textLayer = [CATextLayer layer];
        _textLayer.contentsScale = [UIScreen mainScreen].scale;
    }
    return _textLayer;
}

-(NSArray *)gradientColors{
    if (!_gradientColors) {
        _gradientColors = [[NSMutableArray alloc]init];
    }
    return _gradientColors;
}

-(void)setString:(id)string{
    _string = string;
    [self setNeedsLayout];
}

-(void)setFont:(UIFont *)font{
    _font = font;
    [self setNeedsLayout];
}

-(void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    [self setNeedsLayout];
}


-(CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}

-(void)setColors:(NSArray<UIColor *> *)colors{
    _colors = colors;
    [self.gradientColors removeAllObjects];
    __weak typeof(self) weakSelf = self;
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.gradientColors addObject:(__bridge id)obj.CGColor];
    }];
    [self setNeedsLayout];
}

-(void)setLocations:(NSArray<NSNumber *> *)locations{
    _locations = locations;
    [self setNeedsLayout];
}

-(void)setDirection:(XBGradientColorDirection)direction{
    _direction = direction;
    [self setNeedsLayout];
}

@end
