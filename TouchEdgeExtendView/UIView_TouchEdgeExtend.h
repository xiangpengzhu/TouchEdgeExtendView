//
//  UIView_TouchEdgeExtend.h
//  TouchEdgeExtendView
//
//  Created by zhuxiangpeng on 2017/9/5.
//  Copyright © 2017年 xpz. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - UIViewEdgeInsets

@class UIViewEdgeInsets;

/**
 生成UIViewEdgeInsets的快捷函数

 @param top 上
 @param left 左
 @param bottom 下
 @param right 右
 @return UIViewEdgeInsets实例
 */
extern UIViewEdgeInsets * _Nonnull UIViewEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);

/**
 定义上下左右边距的类
 */
@interface UIViewEdgeInsets : NSObject

@property (nonatomic, assign, readonly) CGFloat top;
@property (nonatomic, assign, readonly) CGFloat left;
@property (nonatomic, assign, readonly) CGFloat bottom;
@property (nonatomic, assign, readonly) CGFloat right;


/**
 构造函数

 @param top 上
 @param left 左
 @param bottom 下
 @param right 右
 @return 实例
 */
- (instancetype _Nonnull )initWithTop: (CGFloat)top left: (CGFloat)left bottom: (CGFloat)bottom right: (CGFloat)right;
@end


#pragma mark - TouchEdgeExtend


/**
 定义UIView的扩展，通过给view赋值responseInsets属性，从而扩大UIView的可响应区域
 */
@interface UIView (TouchEdgeExtend)


/**
 需要扩大的可响应区域边距。比如我想把一个按钮的点击区域上下左右都扩大10像素，那么这个属性的值应该是UIViewEdgeInsetsMake(10, 10, 10, 10)
 */
@property (nonatomic, strong, nullable) UIViewEdgeInsets *extendedResponseInsets;
@end
