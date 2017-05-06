//
//  UnBlockView.h
//  DrawPrj
//
//  Created by lily on 16/11/19.
//  Copyright © 2016年 lily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnBlockView : UIView

@property (nonatomic, copy) void(^unblockViewBlock)(UnBlockView *bView, BOOL success);
- (void)reset;
@end
