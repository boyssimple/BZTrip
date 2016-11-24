//
//  CollCellHeaderLocNative.m
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CollCellHeaderLocNative.h"

@interface CollCellHeaderLocNative()
@property (nonatomic, strong) UILabel *lbText;
@property (nonatomic, strong) UIView *vHorLine;
@property (nonatomic, strong) UIView *vVerLine;
@end
@implementation CollCellHeaderLocNative
- (instancetype)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        
        _lbText = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbText.font = [UIFont systemFontOfSize:14];
        _lbText.textColor = RGB3(51);
        _lbText.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lbText];
        
        _vHorLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vHorLine.backgroundColor = RGB3(217);
        [self.contentView addSubview:_vHorLine];
        
        _vVerLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vVerLine.backgroundColor = RGB3(191);
        [self.contentView addSubview:_vVerLine];
    }
    return self;
}

- (void)updateData{
    self.lbText.text = @"新鲜水果";
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.lbText.frame;
    r.origin.x = 5;
    r.origin.y = 5;
    r.size.width = self.width - 10;
    r.size.height = self.height - 10;
    self.lbText.frame = r;
    
    r = self.vHorLine.frame;
    r.origin.x = 0;
    r.origin.y = self.height - 1;
    r.size.width = self.width;
    r.size.height = 1;
    self.vHorLine.frame = r;
    
    r = self.vVerLine.frame;
    r.origin.x = self.width-1;
    r.origin.y = 5;
    r.size.width = 1;
    r.size.height = self.height-10;
    self.vVerLine.frame = r;

}
@end
