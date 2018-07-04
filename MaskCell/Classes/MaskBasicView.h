//
//  MaskBasicView.h
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <CoreGraphics/CGBase.h>

struct MaskPaddingInset {
    CGFloat top;
    CGFloat bottom;
} NS_AVAILABLE_IOS(8.0);
typedef struct CG_BOXABLE MaskPaddingInset MaskPaddingInset;


NS_ASSUME_NONNULL_BEGIN

/**
 MaskBasicView 作为一个底层根类提供了两个非常简单的接口来帮助你实现想要的效果。
 但是你不应该直接使用它，而是派生一个子类，自行实现自己需要的效果。
 */

NS_AVAILABLE_IOS(8.0)
@interface MaskBasicView : UIView

/**
 指定可视区域的上下间距。`可视区域`是指 UIScrollView 及其子类的可视区域，也就是其 bounds.
 */
@property (nonatomic, readonly) MaskPaddingInset paddingInset;

/**
 当我们在滑动 UIScrollView 及其子类时，其中的某个 view 会在可视区域内移动，出现或者消失。
 这个 view 右下至上（或者相反）在可视区域上下间距之间出现的位置在这段距离中的比值称之为进度。
 其取值范围为 [0, 1]。
 
 该方法默认为空实现，不必手动调用，需要在子类中重载实现。

 @param progress 位置和距离的比值。
 */
- (void)didUpdateProgress:(CGFloat)progress;

/**
 该方法用于将进度重置。一般来讲，当 MaskBasicView 被用于可复用的滚动视图（如 `UITableView`
 和 `UICollectionView`）时，由于其中 `cell` 的复用机制的影响，其进度可能由最大值变为最小值
 （或者相反），这个过程非常突兀，因此你需要在 `cell` 开始复用时手动调用该方法以重置进度。
 */
- (void)setNeedsResetProgress;

@end

NS_ASSUME_NONNULL_END
