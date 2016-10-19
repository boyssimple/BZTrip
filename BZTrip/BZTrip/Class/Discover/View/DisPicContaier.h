//
//  DisPicContaier.h
//  BZTrip
//
//  Created by zhouMR on 16/10/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisPicContaier : UIView
@property (nonatomic, strong) NSArray *imgArray;
+(CGFloat)calHeight:(NSArray*)imgArray;
@end
