//
//  EventVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "EventVC.h"
#import "EventCV.h"
#import "EventDetailsVC.h"

@interface EventVC () <EventCVDelegate>

@property (nonatomic) EventCV *eventCV;
@property (nonatomic) NSMutableArray *dataSet;

@end



@implementation EventVC

@synthesize eventCV;
@synthesize dataSet;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavBar];
    [self prepareDataSet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////// Data Set /////////////////////
- (void)prepareDataSet {
    dataSet = [NSMutableArray new];
    
    [self showPageLoadingAnimated:YES completion:nil];
    
    [Helper_Connectivity getEventDictionaryWithParameter:nil andSuccessHandler:^(NSMutableArray *dic) {
        
        dataSet = dic;
        [self prepareCollectionView];
        [self hidePageLoadingAnimated:YES completion:nil];
        
    } andFailHandler:^{
        
        [self hidePageLoadingAnimated:YES completion:nil];
        
    }];
}


///////////////////// Navigation Bar /////////////////////

- (void)configNavBar {
    self.title = @"پالت";
    self.tabBarItem.title = @"";
    
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

///////////////////// Collection View /////////////////////

- (void)prepareCollectionView {
    eventCV = [[EventCV alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    eventCV.delegat = self;
    
    [self.view addSubview:eventCV];
    eventCV.translatesAutoresizingMaskIntoConstraints = NO;
    [eventCV sdc_alignEdgesWithSuperview:UIRectEdgeAll insets:UIEdgeInsetsMake(0, 15, 0, -15)];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(self.topLayoutGuide.length,
                                           0.0,
                                           self.bottomLayoutGuide.length,
                                           0.0);
    eventCV.contentInset = insets;
    
    
    [eventCV configurationWithDataSet:dataSet];
}

- (void)didSelectCellWithDictionary:(NSMutableDictionary *)dic {
    EventDetailsVC *eventDetailsVC = [EventDetailsVC new];
    
    [self.navigationController pushViewController:eventDetailsVC animated:YES];
    
    [eventDetailsVC prepareDataSetWithDictionary:dic];
}


@end
