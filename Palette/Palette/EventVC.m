//
//  EventVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "EventVC.h"
#import "EventCV.h"

@interface EventVC ()

@property (nonatomic) EventCV *eventCV;

@end



@implementation EventVC

@synthesize eventCV;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavBar];
    [self prepareCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////// Navigation Bar /////////////////////

- (void)configNavBar {
    UILabel *title = [UILabel new];
    
    title.text = @"پالت";
    title.font = [UIFont fontWithName:@"IRANYekanMobile-Bold" size:20];
    title.textColor = [UIColor blackColor];
    title.textAlignment = NSTextAlignmentCenter;
    
    title.frame = CGRectMake(0, 0, 60, 50);
    self.navigationItem.titleView = title;
}


///////////////////// Collection View /////////////////////

- (void)prepareCollectionView {
    eventCV = [[EventCV alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    
    [self.view addSubview:eventCV];
    eventCV.translatesAutoresizingMaskIntoConstraints = NO;
    [eventCV sdc_alignEdgesWithSuperview:UIRectEdgeAll insets:UIEdgeInsetsMake(0, 15, 0, -15)];
    
    
    //junk
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < 2; i++) {
        NSMutableArray *arrr = [NSMutableArray new];
        
        for (int j = 0; j < 50; j++) {
            NSMutableDictionary *arrrr = [NSMutableDictionary new];
            arrrr[@"width"] = @([Helper_Palette getRandomNumberBetween:100 to:200]);
            arrrr[@"height"] = @([Helper_Palette getRandomNumberBetween:150 to:250]);
            [arrr addObject:arrrr];
        }
        [arr addObject:arrr];
    }
    
    
    [eventCV configurationWithDataSet:arr];
}


@end
