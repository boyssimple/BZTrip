//
//  MainTravel.h
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainTravel : NSObject
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *shareBack;
@property (nonatomic, assign) NSInteger shareCount;
@property (nonatomic, strong) NSString *desc;

@end
