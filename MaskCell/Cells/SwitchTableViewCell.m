//
//  SwitchTableViewCell.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "SwitchTableViewCell.h"
#import "MaskSwitchView.h"

@interface SwitchTableViewCell ()

@property (nonatomic) MaskSwitchView *maskView;

@end

@implementation SwitchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _maskView = [MaskSwitchView new];
        _maskView.frame = self.contentView.bounds;
        _maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        MaskSwitchItem *item = [MaskSwitchItem new];
        item.image0 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"0" ofType:@"png"]];
        item.image1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]];
        _maskView.item = item;
        
        [self.contentView addSubview:_maskView];
    }
    
    return self;
}

- (void)prepareForReuse {
    [_maskView setNeedsResetProgress]; 
    [super prepareForReuse];
}

@end
