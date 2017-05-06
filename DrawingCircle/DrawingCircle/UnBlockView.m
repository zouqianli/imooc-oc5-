//
//  UnBlockView.m
//  DrawPrj
//
//  Created by lily on 16/11/19.
//  Copyright © 2016年 lily. All rights reserved.
//

#import "UnBlockView.h"
#import "NodeView.h"
@interface UnBlockView ()

@property (nonatomic, assign) CGMutablePathRef path;

@property (nonatomic, strong) NSMutableArray *nodeViews;
@property (nonatomic, strong) NSMutableArray *throughNodeViews;
@property BOOL isValidateGesture;

@property (nonatomic, strong) NSMutableString *secret;

@end

@implementation UnBlockView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
        self.nodeViews = [NSMutableArray array];
        self.throughNodeViews = [NSMutableArray array];
        self.secret = [[NSMutableString alloc] init];
        
        [self initNodeViews];
    }
    return self;
}

- (void)initNodeViews {
    CGFloat x = self.frame.size.width/4;
    CGFloat startY = (self.frame.size.height - self.frame.size.width)/2;
    CGFloat y = x;
    
    for (int i = 0; i < 9; i++) {
        NodeView *node = [[NodeView alloc] init];
        node.userInteractionEnabled = NO;
        node.center = CGPointMake(x*(i%3+1), startY + y*(i/3+1));
        node.bounds = CGRectMake(0, 0, 50, 50);
        node.image = [UIImage imageNamed:@"gesture_node_normal"];
        node.number = [NSString stringWithFormat:@"%d", i+1];
        [self addSubview:node];
        [self.nodeViews addObject:node];
    }
}

- (NodeView *)throughNodeViewByPoint:(CGPoint)pt {
    
    __block NodeView *nodeView = nil;
    [self.nodeViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NodeView *node = obj;
        CGRect rect = node.frame;
        if (CGRectContainsPoint(rect, pt)) {
            nodeView = node;
            *stop = YES;
        }
    }];
    return nodeView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    
    //判断该点是否落在了手势点中
    NodeView *nodeView = [self throughNodeViewByPoint:pt];
    if (nodeView) {
        //只有第一个点是有效的，才能继续执行后续操作
        self.isValidateGesture = YES;
        self.path = CGPathCreateMutable();
        CGPathMoveToPoint(self.path, NULL, nodeView.center.x, nodeView.center.y);
        [self.throughNodeViews addObject:nodeView];
        
        nodeView.image = [UIImage imageNamed:@"gesture_node_highlighted"];
        
        //密码赋值
        [self.secret appendString:nodeView.number];
    }
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isValidateGesture) {
        return;
    }
    
    
    UITouch *touch = touches.anyObject;
    CGPoint pt = [touch locationInView:touch.view];
    
    //判断该点是否落在了手势点中
    NodeView *nodeView = [self throughNodeViewByPoint:pt];
    if (nodeView) {
        //是否该点已经出现过，出现过则不做任何处理
        if (![self.throughNodeViews containsObject:nodeView]) {
            CGPathAddLineToPoint(self.path, NULL, nodeView.center.x, nodeView.center.y);
            [self setNeedsDisplay];
            [self.throughNodeViews addObject:nodeView];
            
            nodeView.image = [UIImage imageNamed:@"gesture_node_highlighted"];

            
            //密码赋值
            [self.secret appendString:nodeView.number];
        }
        
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isValidateGesture) {
        return;
    }
    
    CGPathRelease(self.path);
    self.path = nil;
    
    //密码校验
    [self validateSecret];
}

- (void)drawRect:(CGRect)rect {
    if (self.path) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, self.path);
        CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextSetLineWidth(context, 4);
        CGContextDrawPath(context, kCGPathStroke);
    }
}

- (void)validateSecret {
    BOOL succ = NO;
    if ([self.secret isEqualToString:@"1478"]) {
        succ = YES;
    }
    if (self.unblockViewBlock) {
        self.unblockViewBlock(self, succ);
    }
}

- (void)reset {
    [self.throughNodeViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NodeView *node = obj;
        node.image = [UIImage imageNamed:@"gesture_node_normal"];
    }];
    [self.throughNodeViews removeAllObjects];
    self.isValidateGesture = NO;
    [self.secret setString:@""];
    
    [self setNeedsDisplay];
}

@end
