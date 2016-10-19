//
//  CauseHeaderView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CauseHeaderView.h"

@interface CauseHeaderView()
@property (nonatomic, strong) UILabel *lbTips;
@property (nonatomic, strong) UIImageView *ivArrow;
@property (nonatomic, strong) UILabel *lbAmmount;
@end

@implementation CauseHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _lbTips = [[UILabel alloc]init];
        _lbTips.font = [UIFont boldSystemFontOfSize:14];
        _lbTips.textColor = RGB3(82);
        _lbTips.text = @"今日收益";
        _lbTips.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbTips];
        
        _ivArrow = [[UIImageView alloc]init];
        [self addSubview:_ivArrow];
        
        _lbAmmount = [[UILabel alloc]init];
        _lbAmmount.font = [UIFont boldSystemFontOfSize:16];
        _lbAmmount.textColor = RGB(254, 72, 0);
        _lbAmmount.textAlignment = NSTextAlignmentCenter;
        _lbAmmount.text = @"￥0.0";
        [self addSubview:_lbAmmount];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = [self.lbTips sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    CGRect r =  self.lbTips.frame;
    r.origin.x = (self.width-size.width)/2.0;
    r.origin.y = 30;
    r.size.width = size.width;
    r.size.height = 14;
    self.lbTips.frame = r;
    
//    r = self.ivArrow.frame;
//    r.origin.x = 0;
//    r.origin.y = self.lbTips.top +3;
//    r.size.width = self.width;
//    r.size.height = 17;
//    self.ivArrow.frame = r;
    
    size = [self.lbAmmount sizeThatFits:CGSizeMake(MAXFLOAT, 16)];
    r = self.lbAmmount.frame;
    r.origin.x = (self.width -size.width)/2.0;
    r.origin.y = self.lbTips.top + 15;
    r.size.width = size.width;
    r.size.height = 16;
    self.lbAmmount.frame = r;
}

@end
