//
//  MaskSwitchView.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "MaskSwitchView.h"
#include "MaskUtils.h"


@interface MaskSwitchView ()

@property (nonatomic) UIView *aMaskView;

@end

@implementation MaskSwitchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView0 = [[UIImageView alloc] initWithFrame:frame];
        _imageView0.backgroundColor = [UIColor whiteColor];
        _imageView0.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView0.contentMode = UIViewContentModeScaleAspectFill;
        _imageView0.clipsToBounds = YES;
        [self addSubview:_imageView0];
        
        _imageView1 = [[UIImageView alloc] initWithFrame:frame];
        _imageView1.backgroundColor = [UIColor whiteColor];
        _imageView1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView1.contentMode = UIViewContentModeScaleAspectFill;
        _imageView1.clipsToBounds = YES;
        [self addSubview:_imageView1];
        
        _aMaskView = [[UIView alloc] initWithFrame:CGRectZero];
        _aMaskView.backgroundColor = [UIColor blackColor];
        _imageView1.maskView = _aMaskView;
    }
    
    return self;
}


- (MaskPaddingInset)paddingInset {
    CGFloat height = CGRectGetHeight(self.frame) / 2;
    MaskPaddingInset inset = { .top = height, .bottom = height };
    return inset;
}

- (void)didUpdateProgress:(CGFloat)progress {
    [super didUpdateProgress:progress];
    CGFloat offset = CGRectGetHeight(self.frame) / 3;
    CGFloat radius = sqrt(pow(CGRectGetWidth(self.frame) - offset, 2) + pow(CGRectGetHeight(self.frame) - offset, 2)) * (1 - progress);
    _aMaskView.frame = CGRectFromCenterSize(CGPointMake(CGRectGetMaxX(self.frame) - offset,
                                                        CGRectGetMaxY(self.frame) - offset),
                                            CGSizeMake(radius * 2, radius * 2));
    _aMaskView.layer.cornerRadius = radius;
}



@end
