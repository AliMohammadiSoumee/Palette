//
//  MainTBC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "MainTBC.h"
#import "GalleryVC.h"
#import "EventVC.h"
#import "MyHomeBaseNavC.h"

@interface MainTBC ()

@property (nonatomic) MyHomeBaseNavC *galleryNavC;
@property (nonatomic) MyHomeBaseNavC *eventNavC;

@end





@implementation MainTBC

@synthesize galleryNavC;
@synthesize eventNavC;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.tabBar.tintColor = turquoiseColor;

    [self prepareViewControllers];
}


///////////////////// View Controllers /////////////////////

- (void)prepareViewControllers {
    
    GalleryVC *galleryVC = _vc_from_storyboard(@"Gallery", @"GalleryVC");
    galleryNavC = [[MyHomeBaseNavC alloc] initWithRootViewController:galleryVC];
    galleryVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"unframe"] tag:10];
    galleryVC.tabBarItem.selectedImage = [UIImage imageNamed:@"frame"];
    galleryVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    [self addChildViewController:galleryNavC];
    
    
    EventVC *eventVC = _vc_from_storyboard(@"Event", @"EventVC");
    eventNavC = [[MyHomeBaseNavC alloc] initWithRootViewController:eventVC];
    eventVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"uncalendar"] tag:20];
    eventVC.tabBarItem.selectedImage = [UIImage imageNamed:@"calendar"];
    eventVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    [self addChildViewController:eventNavC];
}

@end
