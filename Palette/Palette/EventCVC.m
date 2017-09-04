//
//  EventCVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "EventCVC.h"

@interface EventCVC()
{
    bool isInitialized;
}

@property (nonatomic) NSMutableDictionary *dataSet;

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *eventLb;
@property (nonatomic) UILabel *galleryLb;
@property (nonatomic) UILabel *artistLb;


@end


@implementation EventCVC

@synthesize dataSet;

@synthesize imageView;
@synthesize eventLb;
@synthesize artistLb;
@synthesize galleryLb;


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    
    if (isInitialized) {
        return;
    }
    isInitialized = true;
    
    [self allocation];
}


- (void)allocation {
    imageView = [UIImageView new];
    eventLb = [UILabel new];
    artistLb = [UILabel new];
    galleryLb = [UILabel new];
}


- (void)configurationWithDictionary:(NSMutableDictionary *)dic {
    [self prepareImageView];
    [self prepareEventLabel];
    [self prepareArtistLabel];
    [self prepareGalleryLabel];
}


///////////////////// Image View /////////////////////

- (void)prepareImageView {
//    CGFloat height = [dataSet[@"height"] floatValue];
    
//    NSLog(@"%@ ------- %@", self, self.contentView);
    
    [self addSubview:imageView];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView sdc_removeAllConstraints];
    [imageView sdc_alignEdgesWithSuperview:UIRectEdgeAll ^ UIRectEdgeBottom];
//    [imageView sdc_pinHeight:height];
    [imageView sdc_pinHeight:self.bounds.size.height - 70];
    
    imageView.backgroundColor = [UIColor yellowColor];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
}


///////////////////// Event Label /////////////////////

- (void)prepareEventLabel {
    
    [self addSubview:eventLb];
    eventLb.translatesAutoresizingMaskIntoConstraints = NO;
    [eventLb sdc_removeAllConstraints];
    [eventLb sdc_alignEdgesWithSuperview:UIRectEdgeLeft | UIRectEdgeRight];
    [eventLb sdc_alignEdge:UIRectEdgeTop withEdge:UIRectEdgeBottom ofView:imageView inset:10];
    [eventLb sdc_pinHeight:18];
    
    eventLb.backgroundColor = [UIColor clearColor];
    
    eventLb.font = [UIFont fontWithName:@"IRANYekanMobile-Bold" size:14];
    eventLb.textColor = turquoiseColor;
    eventLb.textAlignment = NSTextAlignmentRight;
    eventLb.text = @"خوک های دشت خزر";
}


///////////////////// Artist Label /////////////////////

- (void)prepareArtistLabel {
    
    [self addSubview:artistLb];
    artistLb.translatesAutoresizingMaskIntoConstraints = NO;
    [artistLb sdc_removeAllConstraints];
    [artistLb sdc_alignEdgesWithSuperview:UIRectEdgeLeft | UIRectEdgeRight];
    [artistLb sdc_alignEdge:UIRectEdgeTop withEdge:UIRectEdgeBottom ofView:eventLb];
    [artistLb sdc_pinHeight:18];
    
    artistLb.backgroundColor = [UIColor clearColor];
    
    artistLb.font = [UIFont fontWithName:@"IRANYekanMobile-Light" size:12];
//    artistLb.font = [UIFont fontWithName:@"IRANSansMobileFaNum-Light" size:12];
    artistLb.textColor = [UIColor blackColor];
    artistLb.textAlignment = NSTextAlignmentRight;
    artistLb.text = @"محمود فراهانی";
}


///////////////////// Gallery Label /////////////////////

- (void)prepareGalleryLabel {
    
    [self addSubview:galleryLb];
    galleryLb.translatesAutoresizingMaskIntoConstraints = NO;
    [galleryLb sdc_removeAllConstraints];
    [galleryLb sdc_alignEdgesWithSuperview:UIRectEdgeLeft | UIRectEdgeRight];
    [galleryLb sdc_alignEdge:UIRectEdgeTop withEdge:UIRectEdgeBottom ofView:artistLb];
    [galleryLb sdc_pinHeight:18];
    
    galleryLb.backgroundColor = [UIColor clearColor];
    
    galleryLb.font = [UIFont fontWithName:@"IRANYekanMobile-Light" size:12];
    galleryLb.textColor = [UIColor blackColor];
    galleryLb.textAlignment = NSTextAlignmentRight;
    galleryLb.text = @"گالری ایرانشهر";
}


@end
