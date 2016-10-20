//
//  DisPublishCell.m
//  BZTrip
//
//  Created by zhouMR on 16/10/20.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "DisPublishCell.h"


@interface DisPublishCell()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UIButton *btnAdd;
@end
@implementation DisPublishCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _ivImg = [[UIImageView alloc]init];
        _ivImg.layer.cornerRadius = 5;
        _ivImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_ivImg];
        
        
        _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnAdd setImage:[UIImage imageNamed:@"Discover_Add_Btn"] forState:UIControlStateNormal];
        _btnAdd.layer.cornerRadius = 5;
        _btnAdd.layer.masksToBounds = YES;
        _btnAdd.hidden = YES;
        _btnAdd.layer.borderWidth = 1;
        _btnAdd.layer.borderColor = [UIColor grayColor].CGColor;
        [self.contentView addSubview:_btnAdd];
    }
    return self;
}

- (void)updateData:(NSString*)img{
    if ([img isEqualToString:@"DIS_ADD"]) {
        self.btnAdd.hidden = NO;
    }else{
        self.ivImg.image = [UIImage imageNamed:img];
        self.btnAdd.hidden = YES;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r =  self.ivImg.frame;
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.height;
    self.ivImg.frame = r;
    
    r.origin.x = 0;
    r.origin.y = 0;
    r.size.width = self.width;
    r.size.height = self.height;
    self.btnAdd.frame = r;
}

@end
