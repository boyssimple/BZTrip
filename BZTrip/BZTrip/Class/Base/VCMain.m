//
//  VCMain.m
//  LifeChat
//
//  Created by simple on 16/4/23.
//  Copyright © 2016年 com.sean. All rights reserved.
//

#import "VCMain.h"
#import "VCNavBase.h"
#import "VCHome.h"
#import "VCDest.h"
#import "VCDiscover.h"
#import "VCCause.h"
#import "VCMine.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface VCMain ()<UITabBarControllerDelegate>

@end

@implementation VCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"VCHome",
                                   kTitleKey  : @"主页",
                                   kImgKey    : @"Main_Tab_Selected_01",
                                   kSelImgKey : @"Main_Tab_Selected_01"},
                                 
                                 @{kClassKey  : @"VCDest",
                                   kTitleKey  : @"目的地",
                                   kImgKey    : @"Main_Tab_Normal_02",
                                   kSelImgKey : @"Main_Tab_Normal_02"},
                                 
                                 @{kClassKey  : @"VCCause",
                                   kTitleKey  : @"事业",
                                   kImgKey    : @"Main_Tab_Normal_03",
                                   kSelImgKey : @"Main_Tab_Normal_03"},
                                 
                                 @{kClassKey  : @"VCDiscover",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"Main_Tab_Normal_04",
                                   kSelImgKey : @"Main_Tab_Normal_04"} ,
                                 
                                 @{kClassKey  : @"VCMine",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"Main_Tab_Normal_05",
                                   kSelImgKey : @"Main_Tab_Normal_05"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        VCNavBase *nav = [[VCNavBase alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [UIImage imageNamed:dict[kSelImgKey]];
//        [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
}

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    NSInteger index = tabBarController.selectedIndex;
//    if (index == 0) {
//        tabBarController.navigationItem.title = @"消息";
//    }else if (index == 1){
//        tabBarController.navigationItem.title = @"好友";
//    }else if (index == 2){
//        tabBarController.navigationItem.title = @"我";
//    }
//}

@end
