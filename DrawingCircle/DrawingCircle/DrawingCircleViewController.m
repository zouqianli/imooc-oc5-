//
//  DrawingCircleViewController.m
//  DrawPrj
//
//  Created by 邹前立 on 2017/3/31.
//  Copyright © 2017年 lily. All rights reserved.
//
/**
 * 环形图
 *
 */
#import "DrawingCircleViewController.h"

@interface DrawingCircleViewController ()
@property (nonatomic,assign) float strokeStart;
@property (nonatomic,assign) float strokeEnd;
@end

@implementation DrawingCircleViewController
float margin = 0.005f;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 绘制环形图
    NSArray *colorsArray = @[[UIColor redColor],[UIColor greenColor],
                             [UIColor blueColor],[UIColor orangeColor]]; // 颜色
    self.strokeStart = 0.0; // 起始角度
    self.strokeEnd = 0.0; // 结束角度
    
    for (int i=0; i<4; i++) {
        
        //        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(207, 180) radius:100 startAngle:0-M_PI_2 endAngle:M_PI*2-M_PI_2 clockwise:YES];
        CAShapeLayer *cur = [CAShapeLayer layer];
        //        cur.frame = CGRectMake(0, 0, 200, 200);
        //        cur.position = CGPointMake(207, 368);
        cur.path = path.CGPath;
        
        cur.strokeStart = self.strokeStart;
        cur.strokeEnd = cur.strokeStart + (i+1)*0.1-margin;
        cur.strokeColor = [colorsArray[i] CGColor];
        cur.fillColor = [UIColor clearColor].CGColor;
        cur.lineWidth = 50.0;
        
        [self.view.layer addSublayer:cur];
        self.strokeStart = cur.strokeEnd + margin;
        
    }
    // 0  0    0.1-0.005
    // 1  0.1  0.3-0.005
    // 2  0.3  0.6-0.005
    // 3  0.6  1.0-0.005
    
    // 绘制环形图2
    self.strokeStart = 0.0; // 重置
    NSArray *scaleArray = @[@"0.35",@"0.15",@"0.25",@"0.25"]; // 比例
    for (int i=0; i<4; i++) {
        
        UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(207, 580) radius:100 startAngle:0-M_PI_2 endAngle:M_PI*2-M_PI_2 clockwise:YES];
        CAShapeLayer *cur2 = [CAShapeLayer layer];
        cur2.path = path2.CGPath;
        
        cur2.strokeStart = self.strokeStart;
        cur2.strokeEnd = cur2.strokeStart + [scaleArray[i] floatValue]-margin;
        cur2.strokeColor = [colorsArray[i] CGColor];
        cur2.fillColor = [UIColor clearColor].CGColor;
        cur2.lineWidth = 50.0;
        
        [self.view.layer addSublayer:cur2];
        self.strokeStart = cur2.strokeEnd + margin;
        
    }

    // 添加返回按钮
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    [cancel setImage:[UIImage imageNamed:@"chahao"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancel];
}
- (void) goBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
