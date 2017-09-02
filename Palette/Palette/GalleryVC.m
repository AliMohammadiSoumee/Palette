//
//  GalleryVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "GalleryVC.h"
#import "GalleryTV.h"

@interface GalleryVC ()

@property (nonatomic)GalleryTV *tableView;

@end

@implementation GalleryVC

@synthesize tableView;


- (void)viewDidLoad {
    [super viewDidLoad];

    [self configNavBar];
    [self prepareTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


///////////////////// Nav Bar /////////////////////

- (void)configNavBar {
    UILabel *title = [UILabel new];

    title.text = @"پالت";
    title.font = [UIFont fontWithName:@"IRANYekanMobile-Bold" size:20];
    title.textColor = [UIColor blackColor];
    title.textAlignment = NSTextAlignmentCenter;
    
    title.frame = CGRectMake(0, 0, 60, 50);
    self.navigationItem.titleView = title;
}

///////////////////// Table View /////////////////////

- (void)prepareTableView {
    tableView = [GalleryTV new];
    
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [tableView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    [tableView configurationWithDataSet:nil];
}

@end
