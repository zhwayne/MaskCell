//
//  MaskUtils.h
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#ifndef MaskUtils_h
#define MaskUtils_h

#include <CoreGraphics/CGBase.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_ASSUME_NONNULL_BEGIN

CG_INLINE
CGRect CGRectFromCenterSize(CGPoint center, CGSize size)
{
    return CGRectMake(center.x - size.width / 2,
                      center.y - size.height / 2,
                      size.width,
                      size.height);
}

OS_OVERLOADABLE
CG_INLINE
CGRect CGRectMake(CGPoint center, CGSize size)
{
    return CGRectFromCenterSize(center, size);
}


CF_ASSUME_NONNULL_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* MaskUtils_h */

