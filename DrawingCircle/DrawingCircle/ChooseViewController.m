//
//  ChooseViewController.m
//  DrawPrj
//
//  Created by 邹前立 on 2017/3/31.
//  Copyright © 2017年 lily. All rights reserved.
//
/**
 * 选择进入绘图板还是环形图
 *
 */
#import "ChooseViewController.h"
#import "CanvasViewController.h"
#import "DrawingCircleViewController.h"

@interface ChooseViewController ()

@end

@implementation ChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init {
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor grayColor];
        UIButton *drawingBoard = [[UIButton alloc] initWithFrame:CGRectMake(100, 360, 100, 40)];
        drawingBoard.layer.cornerRadius = 20;
        [drawingBoard setTitle:@"绘图板" forState:UIControlStateNormal];
        [drawingBoard setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [drawingBoard addTarget:self action:@selector(jumpToDrawingBoard) forControlEvents:UIControlEventTouchUpInside];
        drawingBoard.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:drawingBoard];
        
        
        UIButton *drawingCircle = [[UIButton alloc] initWithFrame:CGRectMake(214, 360, 100, 40)];
        drawingCircle.layer.cornerRadius = 20;
        [drawingCircle setTitle:@"环形图" forState:UIControlStateNormal];
        [drawingCircle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [drawingCircle addTarget:self action:@selector(jumpTodrawingCircle) forControlEvents:UIControlEventTouchUpInside];
        drawingCircle.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:drawingCircle];
        
    }
    return self;
}

- (void) jumpToDrawingBoard {
    //跳转到一个新的绘图板页面
    CanvasViewController *vc = [[CanvasViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [nav setNavigationBarHidden:YES];
    [self presentViewController:vc animated:YES completion:nil];

}

- (void) jumpTodrawingCircle {
    //跳转到一个新的环形图页面
    DrawingCircleViewController *vc = [[DrawingCircleViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
