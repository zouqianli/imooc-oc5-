//
//  ColorView.h
//  DrawPrj
//
//  Created by lily on 16/11/19.
//  Copyright © 2016年 lily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UIView

@property (nonatomic, copy) void(^selectColorBlock)(UIColor *color);

- (void)showAnimation;
@end
