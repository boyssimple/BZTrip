//
//  MineHeaderView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MineHeaderView.h"
@interface MineHeaderView()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UIButton *btnSetting;
@end
@implementation MineHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _ivImg = [[UIImageView alloc]init];
        _ivImg.layer.cornerRadius = 35;
        _ivImg.layer.masksToBounds = YES;
        [self addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = RGB3(102);
        _lbName.textAlignment = NSTextAlignmentCenter;
        _lbName.userInteractionEnabled = TRUE;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [_lbName addGestureRecognizer:tap];
        [self addSubview:_lbName];
        
        _btnSetting = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSetting setTitle:@"设置" forState:UIControlStateNormal];
        _btnSetting.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btnSetting setTitleColor:RGB(139, 144, 137) forState:UIControlStateNormal];
        [self addSubview:_btnSetting];
    }
    return self;
}

- (void)tapAction{
    if ([self.delegate respondsToSelector:@selector(loginActin)]) {
        [self.delegate loginActin];
    }
}

- (void)updateData{
    self.ivImg.image = [UIImage imageNamed:@"abc"];
    self.lbName.text = @"登录/注册";
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = (self.width-70)/2.0;
    r.origin.y = 20;
    r.size.width = 70;
    r.size.height = 70;
    self.ivImg.frame = r;
    
    r = self.lbName.frame;
    r.origin.x = 0;
    r.origin.y = self.ivImg.top +20;
    r.size.width = self.width;
    r.size.height = 14;
    self.lbName.frame = r;
    
    r.origin.x = self.width - 60;
    r.origin.y = 0;
    r.size.width = 55;
    r.size.height = 40;
    self.btnSetting.frame = r;
}


+ (CGFloat)calHeight{
    return 154;
}
@end
