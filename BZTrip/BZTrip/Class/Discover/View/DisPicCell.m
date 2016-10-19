//
//  DisPicCell.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "DisPicCell.h"

@interface DisPicCell()
@property (nonatomic, strong) UIImageView *ivImg;
@end
@implementation DisPicCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_ivImg];
    }
    return self;
}

- (void)updateData:(NSString*)img{
    self.ivImg.image = [UIImage imageNamed:img];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.height;
    self.ivImg.frame = r;
}

@end
