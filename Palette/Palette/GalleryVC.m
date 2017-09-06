//
//  GalleryVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "GalleryVC.h"
#import "GalleryTV.h"
#import "GalleryDetailsVC.h"

@interface GalleryVC () <GalleryCVDelegate>

@property (nonatomic)GalleryTV *tableView;
@property (nonatomic)NSMutableArray *dataSet;

@end




@implementation GalleryVC

@synthesize tableView;
@synthesize dataSet;


- (void)viewDidLoad {
    [super viewDidLoad];

    [self configNavBar];
    [self prepareDataSet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


///////////////////// Data Set /////////////////////
- (void)prepareDataSet {
    dataSet = [NSMutableArray new];
    
    [self showPageLoadingAnimated:YES completion:nil];
    
    [Helper_Connectivity getGalleyDictionaryWithParameter:nil andSuccessHandler:^(NSMutableArray *dic) {
        
        dataSet = dic;
        [self prepareTableView];
        [self hidePageLoadingAnimated:YES completion:nil];
        
    } andFailHandler:^{
        
        [self hidePageLoadingAnimated:YES completion:nil];
        
    }];
}


///////////////////// Navigation Bar /////////////////////

- (void)configNavBar {
    self.title = @"پالت";
    self.tabBarItem.title = @"";
    
    self.hideNavBarOnLoading = NO;
    self.hideVisualEffectViewOnLoading = NO;
    
    UIColor *color = [UIColor colorWithRed:232.0/255 green:232.0/255 blue:232.0/255 alpha:1];
    [helper hairlineBottomOfView:self.visualEffectView margin:0 backColor:color];
    
    UIView *overlayView = [UIView new];
    overlayView.backgroundColor = [UIColor colorWithRed:255.0/255 green:255.0/255 blue:255.0/255 alpha:0.5];
    
    [self.visualEffectView addSubview:overlayView];
    overlayView.translatesAutoresizingMaskIntoConstraints = NO;
    [overlayView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
}

- (UIVisualEffect *)effectForVisualEffectView {
    return [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
}

- (BOOL)reserveSpaceForLeftNavBarItem {
    return NO;
}

///////////////////// Table View /////////////////////

- (void)prepareTableView {
    tableView = [GalleryTV new];
    
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [tableView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    [tableView configurationWithDataSet:dataSet];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(self.topLayoutGuide.length,
                                           0.0,
                                           self.bottomLayoutGuide.length,
                                           0.0);
    tableView.contentInset = insets;
    
    tableView.delegat = self;
    
}


- (void)didSelectCellWithDictionary:(NSMutableDictionary *)dic {
    GalleryDetailsVC *galleryDetailsVC = [GalleryDetailsVC new];
    
    [self.navigationController pushViewController:galleryDetailsVC animated:YES];
    
    [galleryDetailsVC prepareDataSetWithDictionary:dic];
}



@end
