//
//  ViewController.m
//  DrawPrj
//
//  Created by lily on 16/11/17.
//  Copyright © 2016年 lily. All rights reserved.
//

#import "ViewController.h"
#import "UnBlockView.h"
//#import "CanvasViewController.h"
#import "ChooseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UnBlockView *blockView = [[UnBlockView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:blockView];
    
    blockView.unblockViewBlock = ^(UnBlockView *bView, BOOL success) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:success?@"解锁成功":@"解锁失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [bView reset];
            if (success) {
                //跳转到一个新的页面
//                CanvasViewController *vc = [[CanvasViewController alloc] init];
                ChooseViewController *vc = [[ChooseViewController alloc] init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
                
                
                
                [nav setNavigationBarHidden:YES];
                [self presentViewController:nav animated:YES completion:nil];
            }
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    };
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
