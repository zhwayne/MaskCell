//
//  MaskSwitchView.h
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "MaskBasicView.h"

@interface MaskSwitchItem: NSObject

@property (nonatomic) UIImage *image0;
@property (nonatomic) UIImage *image1;

@end

@interface MaskSwitchView : MaskBasicView

@property (nonatomic) MaskSwitchItem *item;

@end
