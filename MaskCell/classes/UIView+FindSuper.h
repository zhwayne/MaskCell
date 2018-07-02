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

- (__kindof UIView * _Nullable)fs_findSuperviewWithClass:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
