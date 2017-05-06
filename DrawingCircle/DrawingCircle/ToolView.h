//
//  ToolView.h
//  DrawPrj
//
//  Created by lily on 16/11/19.
//  Copyright © 2016年 lily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolView : UIView
@property (nonatomic, copy) void(^penBlock)();
@property (nonatomic, copy) void(^eraaseBlock)();
@property (nonatomic, copy) void(^colorBlock)();
@property (nonatomic, copy) void(^undoBlock)();
@property (nonatomic, copy) void(^clearBlock)();
@property (nonatomic, copy) void(^saveBlock)();
@property (nonatomic, copy) void(^sliderBlock)(CGFloat width);



@end
