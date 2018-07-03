# 介绍

这个 Demo 演示了如何在 UIScrollView 中快速实现 subview 的遮罩功能。核心功能代码已封装成一个容器类 View:  MaskBasicView。你可以将你原有的 view 作为 MaskBasicView 的 subview。

# 用法

MaskBasicView 不能够直接使用，你需要派生一个子类实现你想要的效果。比如这里实现了两个 imageView 滑动时切换的效果：

``` Objective-C
@interface MaskSwitchView : MaskBasicView

@property (nonatomic) UIImageView *imageView0;
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UIView *aMaskView;

@end

@implementation MaskSwitchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView0 = ...
        [self addSubview:_imageView0];
        
        _imageView1 = ...
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
    CGFloat width = CGRectGetWidth(self.frame);
    CGFLoat height = CGRectGetHeight(self.frame);
    CGFloat radius = sqrt(
        pow(width - offset, 2) + pow(height - offset, 2)
	) * (1 - progress);
    _aMaskView.layer.cornerRadius = radius;
    _aMaskView.frame = CGRectFromCenterSize(
        CGPointMake(width - offset, height - offset),
        CGSizeMake(radius * 2, radius * 2)
    );
}

@end
```

# 其他自定义效果预览

![](./demo.gif)