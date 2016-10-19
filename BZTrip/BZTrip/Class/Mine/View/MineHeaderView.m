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
        [self addSubview:_lbName];
    }
    return self;
}

- (void)updateData{
    self.ivImg.image = [UIImage imageNamed:@"abc"];
    self.lbName.text = @"SIMPLE";
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
}


+ (CGFloat)calHeight{
    return 154;
}
@end
