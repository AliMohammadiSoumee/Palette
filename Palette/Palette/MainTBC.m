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

@interface MainTBC ()

@property (nonatomic) UINavigationController *galleryVC;
@property (nonatomic) UINavigationController *eventVC;

@end





@implementation MainTBC

@synthesize galleryVC;
@synthesize eventVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self prepareViewControllers];
}


///////////////////// View Controllers /////////////////////

- (void)prepareViewControllers {
    
//    UITabBarItem *galleryItem = [UITabBarItem new];
    
//    [galleryItem setImage:[UIImage imageNamed:@"selectedGallery"]];
//    [galleryItem setSelectedImage:[UIImage imageNamed:@"unselectedGallery"]];
//    galleryItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
//    
    
//    galleryItem.title = @"گالری";
//    
//    NSMutableDictionary *unselected = [NSMutableDictionary new];
//    unselected[NSForegroundColorAttributeName] = [UIColor blackColor];
//    unselected[NSFontAttributeName] = [UIFont fontWithName:@"IRANSansMobile-Medium" size:18.0];
//    [galleryItem setBadgeTextAttributes:unselected forState:UIControlStateNormal];
//    
//    NSMutableDictionary *selected = [NSMutableDictionary new];
//    selected[NSForegroundColorAttributeName] = turquoiseColor;
//    selected[NSFontAttributeName] = [UIFont fontWithName:@"IRANSansMobile-Medium" size:18.0];
//    [galleryItem setBadgeTextAttributes:selected forState:UIControlStateSelected];
    
    galleryVC = _vc_from_storyboard(@"Gallery", @"GalleryNavC");
    [self addChildViewController:galleryVC];
    
    
    eventVC = _vc_from_storyboard(@"Event", @"EventNavC");
    [self addChildViewController:eventVC];
}

@end
