//
//  GalleryTVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "GalleryTVC.h"

@interface GalleryTVC()

@property (nonatomic) UIView *contentV;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *descLb;
@property (nonatomic) UIImageView *imageV;
@property (nonatomic) _UIControlBase *locationBtn;
@property (nonatomic) NSMutableDictionary *dataSet;
@property (nonatomic) UIView *hairLine;

@end



@implementation GalleryTVC

@synthesize contentV;
@synthesize imageV;
@synthesize descLb;
@synthesize titleLb;
@synthesize locationBtn;
@synthesize dataSet;
@synthesize hairLine;




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initilize];
    }
    return self;
}

- (void)initilize {
    
    [self prepareContentView];
    [self prepareImageView];
    [self prepareLocationButton];
    [self prepareLabel];
    [self prepareHairLine];
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}


///////////////////// Content View /////////////////////

- (void)prepareContentView {
    contentV = [UIView new];
    [self.contentView addSubview:contentV];
    contentV.translatesAutoresizingMaskIntoConstraints = NO;
    [contentV sdc_alignEdgesWithSuperview:UIRectEdgeAll insets:UIEdgeInsetsMake(0, 0, 0, 0)];
}


///////////////////// Image View /////////////////////
- (void)prepareImageView {
    imageV = [UIImageView new];
    [contentV addSubview:imageV];
    imageV.translatesAutoresizingMaskIntoConstraints = NO;
    [imageV sdc_alignEdgesWithSuperview:UIRectEdgeRight insets:UIEdgeInsetsMake(0, 0, 0, -15)];
    [imageV sdc_pinHeight:80];
    [imageV sdc_pinHeightWidthRatio:1 constant:0];
    [imageV sdc_verticallyCenterInSuperview];
    
    imageV.layer.cornerRadius = 5;
    
    imageV.clipsToBounds = YES;
    
    imageV.backgroundColor = [UIColor redColor];
}



///////////////////// Lcation Button /////////////////////

- (void)prepareLocationButton {
    locationBtn = [_UIControlBase new];
    [contentV addSubview:locationBtn];
    locationBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [locationBtn sdc_alignEdgesWithSuperview:UIRectEdgeLeft insets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [locationBtn sdc_pinHeight:45];
    [locationBtn sdc_pinHeightWidthRatio:1 constant:0];
    [locationBtn sdc_verticallyCenterInSuperview];
    
    [locationBtn addTarget:self action:@selector(locationButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    locationBtn.backgroundColor = [UIColor clearColor];
    locationBtn.contentMode = UIViewContentModeScaleAspectFit;
    locationBtn.clipsToBounds = YES;
    [locationBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [locationBtn setImage:[UIImage imageNamed:@"GPSPin"] forState:UIControlStateNormal];
    locationBtn.backgroundColor = [UIColor clearColor];
    locationBtn.highlightedBackgroundColor = [UIColor clearColor];
}


- (void)locationButtonTouched {
//    if ([self.delegate respondsToSelector:@selector(goToLocationWithX:andY:)]) {
//        [self.delegate goToLocationWithX:[dataSet[@"x"] floatValue] andY:[dataSet[@"y"] floatValue]];
//    }
}


///////////////////// Labels /////////////////////

- (void)prepareLabel {
    titleLb = [UILabel new];
    [contentV addSubview:titleLb];
    titleLb.translatesAutoresizingMaskIntoConstraints = NO;
    [titleLb sdc_alignEdge:UIRectEdgeLeft withEdge:UIRectEdgeRight ofView:locationBtn inset:20];
    [titleLb sdc_alignEdge:UIRectEdgeRight withEdge:UIRectEdgeLeft ofView:imageV inset:-20];
    [titleLb sdc_alignEdge:UIRectEdgeTop withEdge:UIRectEdgeTop ofView:imageV inset:15];
    
//    titleLb.font = [UIFont fontWithName:@"IRANSansMobile-Medium" size:18];
    titleLb.font = [UIFont fontWithName:@"IRANYekanMobile-Bold" size:18];
    titleLb.textColor = turquoiseColor;
    titleLb.textAlignment = NSTextAlignmentRight;
    titleLb.text = @"گالری ایرانشهر";
    titleLb.backgroundColor = [UIColor clearColor];
    titleLb.adjustsFontSizeToFitWidth = YES;
    
    
    descLb = [UILabel new];
    [contentV addSubview:descLb];
    descLb.translatesAutoresizingMaskIntoConstraints = NO;
    [descLb sdc_alignEdge:UIRectEdgeLeft withEdge:UIRectEdgeRight ofView:locationBtn inset:10];
    [descLb sdc_alignEdge:UIRectEdgeRight withEdge:UIRectEdgeLeft ofView:imageV inset:-20];
    [descLb sdc_alignEdge:UIRectEdgeBottom withEdge:UIRectEdgeBottom
                   ofView:imageV inset:-15];
    
    descLb.font = [UIFont fontWithName:@"IRANYekanMobile-Light" size:13];
    descLb.textColor = [UIColor blackColor];
    descLb.textAlignment = NSTextAlignmentRight;
    descLb.text = @"هیچ رویدادی ثبت نشده است.";
    descLb.backgroundColor = [UIColor clearColor];
    descLb.adjustsFontSizeToFitWidth = YES;
}

- (void)prepareHairLine {
//    hairLine = [helper horizontalHairlineWithColor:[UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:0.4]];
    hairLine = [helper horizontalHairlineWithColor:[UIColor darkGrayColor]];
    [contentV addSubview:hairLine];
    hairLine.translatesAutoresizingMaskIntoConstraints = NO;
    [hairLine sdc_alignEdgesWithSuperview:UIRectEdgeBottom |
     UIRectEdgeLeft insets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [hairLine sdc_alignEdge:UIRectEdgeRight withEdge:UIRectEdgeRight ofView:titleLb];
}

@end
