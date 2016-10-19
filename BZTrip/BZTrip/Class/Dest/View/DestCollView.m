//
//  DestCollView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/19.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "DestCollView.h"

@interface DestCollView()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbName;
@end
@implementation DestCollView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        _ivImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_ivImg];
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:13];
        _lbName.textColor = [UIColor blackColor];
        _lbName.textAlignment = NSTextAlignmentCenter;
        _lbName.adjustsFontForContentSizeCategory = YES;
        [self.contentView addSubview:_lbName];
    }
    return self;
}


- (void)updateData:(NSDictionary*)data{
    self.ivImg.image = [UIImage imageNamed:[data objectForKey:@"img"]];
    self.lbName.text = [data objectForKey:@"name"];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = (self.width-50)/2.0;
    r.origin.y = (self.height-70)/2.0;
    r.size.width = 50;
    r.size.height = 50;
    self.ivImg.frame = r;
    
    r = self.lbName.frame;
    r.origin.x = 0;
    r.origin.y = self.ivImg.top +3;
    r.size.width = self.width;
    r.size.height = 17;
    self.lbName.frame = r;
}
@end
