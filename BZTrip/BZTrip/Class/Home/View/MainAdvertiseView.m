//
//  MainAdvertiseView.m
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "MainAdvertiseView.h"

static NSUInteger showTime = 3;
@interface MainAdvertiseView()
@property (nonatomic, strong) UIImageView *ivImage;
@property (nonatomic, strong) UILabel *lbSecond;
@property (nonatomic, strong) dispatch_source_t timer;
@end
@implementation MainAdvertiseView

- (instancetype)init{
    self = [super init];
    self.frame = [UIScreen mainScreen].bounds;
    if (self) {
        [self initUI];
        //倒计时
        [self startTimer];
    }
    return self;
}

- (void)initUI{
    _ivImage = [[UIImageView alloc]initWithFrame:self.bounds];
    [_ivImage downloadImage:@"http://img.meelive.cn/NDg4ODQxNDc2NjI2Nzc1.jpg"];
    [self addSubview:_ivImage];
    
    _lbSecond = [[UILabel alloc]initWithFrame:CGRectMake(DEVICEWIDTH-60, 20, 50, 20)];
    _lbSecond.font = [UIFont systemFontOfSize:14];
    _lbSecond.textColor = [UIColor whiteColor];
    _lbSecond.textAlignment = NSTextAlignmentCenter;
    _lbSecond.backgroundColor = [UIColor grayColor];
    [self addSubview:_lbSecond];
}

- (void)startTimer{
    __block NSUInteger timeout = showTime + 1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeout <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                self.lbSecond.text = [NSString stringWithFormat:@"跳过%zd",timeout];
            });
        }
        timeout--;
    });
    dispatch_resume(timer);
}

- (void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
