//
//  UIView+FindSuper.h
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FindSuper)

/**
 在某个 view 的层级树中寻找 class 匹配的 superview.

 @param aClass 寻找的 superview 的 class 类型
 @return 如果能找到一个目标实例就将其返回，否则返回 nil.
 */
- (__kindof UIView * _Nullable)fs_findSuperviewWithClass:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
