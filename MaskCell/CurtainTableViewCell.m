//
//  CurtainTableViewCell.m
//  MaskCell
//
//  Created by 张尉 on 2018/7/2.
//  Copyright © 2018年 Wayne. All rights reserved.
//

#import "CurtainTableViewCell.h"
#import "MaskCurtainView.h"

@interface CurtainTableViewCell ()

@property (nonatomic) MaskCurtainView *maskView;

@end


@implementation CurtainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _maskView = [MaskCurtainView new];
        _maskView.frame = self.contentView.bounds;
        _maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _maskView.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpeg"]];
        
        [self.contentView addSubview:_maskView];
    }
    
    return self;
}

- (void)prepareForReuse {
    [_maskView setNeedsResetProgress];
    [super prepareForReuse];
}

@end
