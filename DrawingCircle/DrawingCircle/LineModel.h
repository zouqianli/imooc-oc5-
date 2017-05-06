//
//  LineModel.h
//  DrawPrj
//
//  Created by lily on 16/11/19.
//  Copyright © 2016年 lily. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LineModel : NSObject

@property (nonatomic, assign) CGMutablePathRef path;
@property (nonatomic, strong) UIColor *color;
@property CGFloat lineWidth;

@end
