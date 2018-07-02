//
//  MaskSwitchView.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "MaskSwitchView.h"
#include "MaskUtils.h"


@implementation MaskSwitchItem
@end


@interface MaskSwitchView ()

@property (nonatomic, readwrite) UIImageView *imageView0;
@property (nonatomic, readwrite) UIImageView *imageView1;

@property (nonatomic) UIView *aMaskView;

@end

@implementation MaskSwitchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView0 = [[UIImageView alloc] initWithFrame:frame];
        _imageView0.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView0.contentMode = UIViewContentModeScaleAspectFill;
        _imageView0.clipsToBounds = YES;
        [self addSubview:_imageView0];
        
        _imageView1 = [[UIImageView alloc] initWithFrame:frame];
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

- (void)setItem:(MaskSwitchItem *)item {
    _item = item;
    _imageView0.image = _item.image0;
    _imageView1.image = _item.image1;
}

- (MaskPaddingInset)paddingInset {
    CGFloat height = CGRectGetHeight(self.frame) / 2;
    MaskPaddingInset inset = { .top = height, .bottom = height };
    return inset;
}

- (void)didUpdateProgress:(CGFloat)progress {
    [super didUpdateProgress:progress];
    CGFloat radius = sqrt(pow(CGRectGetWidth(self.frame), 2) + pow(CGRectGetHeight(self.frame), 2)) * (1 - progress);
    _aMaskView.frame = CGRectMakeCenterSize(CGPointMake(CGRectGetMaxX(self.frame),
                                                        CGRectGetMaxY(self.frame)),
                                            CGSizeMake(radius * 2, radius * 2));
    _aMaskView.layer.cornerRadius = radius;
}



@end
