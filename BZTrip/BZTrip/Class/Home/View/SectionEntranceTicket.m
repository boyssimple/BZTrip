//
//  SectionEntranceTicket.m
//  BZTrip
//
//  Created by zhouMR on 16/11/24.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "SectionEntranceTicket.h"
@interface SectionEntranceTicket()
@property (nonatomic, strong) UIView *vLine;
@property (nonatomic, strong) UILabel *lbName;
@end
@implementation SectionEntranceTicket

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _vLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vLine.backgroundColor = BASE_COLOR;
        [self addSubview:_vLine];
        
        _lbName = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbName.font = [UIFont systemFontOfSize:24];
        _lbName.textColor = [UIColor blackColor];
        [self addSubview:_lbName];
    }
    return self;
}

@end
