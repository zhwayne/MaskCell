//
//  MaskUtils.h
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#ifndef MaskUtils_h
#define MaskUtils_h

#import <CoreGraphics/CoreGraphics.h>

extern CGRect CGRectFromCenterSize(CGPoint center, CGSize size)
{
    return CGRectMake(center.x - size.width / 2,
                      center.y - size.height / 2,
                      size.width,
                      size.height);
}

#endif /* MaskUtils_h */

