//
//  MaskBasicView.h
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    CGFloat top;
    CGFloat bottom;
} MaskPaddingInset NS_AVAILABLE_IOS(8.0);


NS_ASSUME_NONNULL_BEGIN

NS_AVAILABLE_IOS(8.0)
@interface MaskBasicView : UIView

/**
 指定可视区域的上下间距
 */
@property (nonatomic, readonly) MaskPaddingInset paddingInset;

- (void)didUpdateProgress:(CGFloat)progress;
- (void)setNeedsResetProgress;

@end

NS_ASSUME_NONNULL_END
