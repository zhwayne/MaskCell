//
//  UIView+FindSuper.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "UIView+FindSuper.h"

@implementation UIView (FindSuper)

- (__kindof UIView *)fs_findSuperviewWithClass:(Class)aClass {
    UIView *superView = self.superview;
    
    if ([superView isKindOfClass:aClass]) {
        return superView;
    }
    
    return [superView fs_findSuperviewWithClass:aClass];
}

@end
