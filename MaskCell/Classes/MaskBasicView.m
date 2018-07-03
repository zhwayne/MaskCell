//
//  MaskBasicView.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "MaskBasicView.h"
#import "UIView+FindSuper.h"

@interface MaskBasicView ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic) CGFloat maskProgress;

@end

@implementation MaskBasicView

- (void)dealloc {
    if (_scrollView) [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    NSCAssert(![self isMemberOfClass:[MaskBasicView class]], @"不允许直接使用 MaskBasicView，你需要派生一个子类。");
    [super willMoveToSuperview:newSuperview];
}

- (void)setScrollView:(UIScrollView *)scrollView {
    if (_scrollView == scrollView || [_scrollView isEqual:scrollView]) return;
    
    if (_scrollView) [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    _maskProgress = -1;
    if (_scrollView) [_scrollView addObserver:self forKeyPath:@"contentOffset" options:0x01 | 0x02 context:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIScrollView *targetView = [self fs_findSuperviewWithClass:[UIScrollView class]];
    if (targetView) {
        self.scrollView = targetView;
        self.scrollView.contentOffset = self.scrollView.contentOffset;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    UIView *refrenceView = _scrollView.superview;
    if (refrenceView == nil)
        return;
    
    CGRect frame = self.frame;
    CGRect relativeFrame = [self convertRect:frame toView:refrenceView];
    MaskPaddingInset inset = self.paddingInset;
    CGFloat start = CGRectGetMinY(relativeFrame) - (CGRectGetMinY(_scrollView.frame) - CGRectGetMinY(refrenceView.frame)) - inset.top;
    CGFloat distance = CGRectGetHeight(_scrollView.frame) - CGRectGetHeight(self.frame) - inset.bottom - inset.top;
    CGFloat progress = MIN(1, MAX(start / distance, 0));
    _maskProgress = progress;
    [self didUpdateProgress:progress];
}

#pragma mark - Public

- (void)didUpdateProgress:(CGFloat)progress { }

- (void)setNeedsResetProgress {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.scrollView == nil)
            return;
        
        CGPoint point = [self.scrollView.panGestureRecognizer translationInView:self.scrollView];
        if (point.y <= 0)
            [self didUpdateProgress:1];
        else
            [self didUpdateProgress:0];
    });
}

@end
