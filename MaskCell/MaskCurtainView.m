//
//  MaskCurtainView.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "MaskCurtainView.h"
#import "UIView+FindSuper.h"

@interface MaskCurtainView ()

@end

@implementation MaskCurtainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
    }
    return self;
}

- (MaskPaddingInset)paddingInset {
    CGFloat height = CGRectGetHeight(self.frame);
    MaskPaddingInset inset = { .top = -height, .bottom = -height };
    return inset;
}

- (void)didUpdateProgress:(CGFloat)progress {
    [super didUpdateProgress:progress];
    
    UIView *targetView = [self fs_findSuperviewWithClass:[UIScrollView class]];
    if (targetView == nil)
        return;
    
    CGRect rect = [self convertRect:targetView.bounds fromView:targetView];
    rect.origin.y += progress * self.frame.size.height;
    _imageView.frame = rect;
}

@end
