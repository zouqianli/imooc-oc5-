//
//  CanvasView.h
//  DrawPrj
//
//  Created by lily on 16/11/19.
//  Copyright © 2016年 lily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasView : UIView

@property (nonatomic, strong) UIColor *color;
@property CGFloat lineWidth;


- (void)undo;
- (void)clear;
@end
