//
//  UIView_TouchEdgeExtend.m
//  TouchEdgeExtendView
//
//  Created by zhuxiangpeng on 2017/9/5.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import "UIView_TouchEdgeExtend.h"
#import <objc/runtime.h>

NSString *responseInsetsKey = @"responseInsets";

#pragma mark - UIViewEdgeInsets

UIViewEdgeInsets * UIViewEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
	return [[UIViewEdgeInsets alloc] initWithTop:top left:left bottom:bottom right:right];
}

@interface UIViewEdgeInsets ()
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@end

@implementation UIViewEdgeInsets

- (instancetype)initWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right
{
	self = [super init];
	if (self) {
		self.top = top;
		self.left = left;
		self.bottom = bottom;
		self.right = right;
	}
	return self;
}

@end


#pragma mark - TouchEdgeExtend
@implementation UIView (TouchEdgeExtend)

- (UIViewEdgeInsets *)responseInsets
{
	return (UIViewEdgeInsets *)objc_getAssociatedObject(self, &responseInsetsKey);
}

- (void)setResponseInsets:(UIViewEdgeInsets *)responseInsets
{
	objc_setAssociatedObject(self, &responseInsetsKey, responseInsets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
	UIViewEdgeInsets *edgeInsets = self.responseInsets;
	if (edgeInsets == nil) {
		edgeInsets = UIViewEdgeInsetsMake(0, 0, 0, 0);
	}
	
	CGPoint parentLocation = [self convertPoint:point toView:self.superview];
	CGRect responseRect = self.frame;
	
	responseRect.origin.x -= edgeInsets.left;
	responseRect.origin.y -= edgeInsets.top;
	responseRect.size.width += (edgeInsets.left + edgeInsets.right);
	responseRect.size.height += (edgeInsets.top + edgeInsets.bottom);
	return CGRectContainsPoint(responseRect, parentLocation);
}

@end
