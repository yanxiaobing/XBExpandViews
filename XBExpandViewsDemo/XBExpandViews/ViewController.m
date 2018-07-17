//
//  ViewController.m
//  XBExpandViews
//
//  Created by XBingo on 2017/12/20.
//  Copyright © 2017年 XBingo. All rights reserved.
//

#import "ViewController.h"
#import "XBGradientLabel.h"
#import "XBExpandButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet XBGradientLabel *xbtestlabel;
@property (weak, nonatomic) IBOutlet XBGradientLabel *xbtestLabel2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 富文本
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"你是我的小呀小苹果"];
    UIFont *font1 = [UIFont systemFontOfSize:15];
    //convert UIFont to a CTFont
    CFStringRef fontName1 = (__bridge CFStringRef)font1.fontName;
    CGFloat fontSize1 = font1.pointSize;
    CTFontRef fontRef1 = CTFontCreateWithName(fontName1, fontSize1, NULL);
    
    //set text attributes
    NSDictionary *attribs = @{
                              (__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,
                              (__bridge id)kCTFontAttributeName: (__bridge id)fontRef1
                              };
    
    [string setAttributes:attribs range:NSMakeRange(0, [@"你是我的小呀小苹果" length])];
    CFRelease(fontRef1);
    
    UIFont *font = [UIFont systemFontOfSize:23];
    //convert UIFont to a CTFont
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    attribs = @{
                (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
                (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle),
                (__bridge id)kCTFontAttributeName: (__bridge id)fontRef
                };
    [string setAttributes:attribs range:NSMakeRange(2, 3)];
    CFRelease(fontRef);
    
    _xbtestlabel.string = string;
    _xbtestlabel.font = [UIFont systemFontOfSize:23];
    _xbtestlabel.direction = XBGradientColorDirectionLeftToRight;
    _xbtestlabel.textAlignment = NSTextAlignmentCenter;
    _xbtestlabel.colors = @[[UIColor blueColor],[UIColor orangeColor]];
    
    _xbtestLabel2.string = @"我是渐变色的呀呀-hahaha";
    _xbtestLabel2.font = [UIFont systemFontOfSize:23];
    _xbtestLabel2.direction = XBGradientColorDirectionLeftToRight;
    _xbtestLabel2.textAlignment = NSTextAlignmentCenter;
    _xbtestLabel2.colors = @[[UIColor blackColor],[UIColor orangeColor]];
    
    XBGradientLabel* testLabel = [[XBGradientLabel alloc] init];
    testLabel.string = @"我是渐变色的呀呀呀呀--label";
    testLabel.font = [UIFont systemFontOfSize:23];
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.frame = CGRectMake(0, 300, 375, 30);
    [self.view addSubview:testLabel];
    testLabel.colors = @[[UIColor blackColor],[UIColor orangeColor]];
    
    XBExpandButton *testBtn = [[XBExpandButton alloc]initWithFrame:CGRectMake(0, 400, 200, 50)];
    testBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:testBtn];
    testBtn.interval = 1;
    [testBtn setTitle:@"测试按钮点击间隔时间" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)testBtnAction{
    NSLog(@"date:%@",[NSDate date]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
