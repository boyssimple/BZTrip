//
//  SectionLocNative.m
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "SectionLocNative.h"

@interface SectionLocNative()
@property (nonatomic, strong) UIView *vLine;
@end
@implementation SectionLocNative

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _vLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vLine.backgroundColor = BASE_COLOR;
        [self addSubview:_vLine];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbName.font = [UIFont systemFontOfSize:18];
        _lbName.textColor = [UIColor blackColor];
        [self addSubview:_lbName];
    }
    return self;
}

- (void)layoutSubviews{
    CGRect r = self.vLine.frame;
    r.origin.x = 11;
    r.origin.y = 10;
    r.size.width = 4;
    r.size.height = 18;
    self.vLine.frame = r;
    
    CGSize size = [self.lbName sizeThatFits:CGSizeMake(MAXFLOAT, 18)];
    r = self.lbName.frame;
    r.origin.x = self.vLine.left+10;
    r.origin.y = self.vLine.y-1;
    r.size.width = size.width;
    r.size.height = 18;
    self.lbName.frame = r;
}

@end
