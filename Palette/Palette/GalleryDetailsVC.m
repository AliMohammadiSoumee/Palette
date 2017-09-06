//
//  GalleryDetailsVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/15/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "GalleryDetailsVC.h"
#import "GalleryDetailsCV.h"

@interface GalleryDetailsVC ()

@property (nonatomic) UIImageView *backImageView;
@property (nonatomic) UIVisualEffectView *visualEffectV;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UIView *contentView;
@property (nonatomic) GalleryDetailsCV *collectionView;
@property (nonatomic) MyVerticalStackView *stackView;

@property (nonatomic) NSMutableDictionary *dataSet;

@end




@implementation GalleryDetailsVC

@synthesize backImageView;
@synthesize visualEffectV;
@synthesize stackView;
@synthesize scrollView;
@synthesize contentView;
@synthesize collectionView;
@synthesize dataSet;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


///////////////////// Data Set /////////////////////

- (void)prepareDataSetWithDictionary:(NSMutableDictionary *)dic {
    dataSet = dic;
    if (!dataSet) {
        dataSet = [NSMutableDictionary new];
    }
    
    [self prepareBackgournd];
    [self prepareScrollView];
    [self prepareCollectionView];
    [self prepareStackView];
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




///////////////////// Background View /////////////////////

- (void)prepareBackgournd {
    backImageView = [UIImageView new];
    [self.view addSubview:backImageView];
    backImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [backImageView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    visualEffectV = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    [self.view addSubview:visualEffectV];
    visualEffectV.translatesAutoresizingMaskIntoConstraints = NO;
    [visualEffectV sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    if (_str_ok2(dataSet[@"image"])) {
        NSString *url = _strfmt(@"%@", dataSet[@"image"]);
        [backImageView HyperCacheSetImageWithURL:url];
    }
}


///////////////////// Scroll View /////////////////////

- (void)prepareScrollView {
    scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    scrollView.backgroundColor = [UIColor clearColor];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(74,
                                           0.0,
                                           54,
                                           0.0);
    scrollView.contentInset = insets;
    
    _defineDeviceWidth;
    
    contentView = [UIView new];
    [scrollView addSubview:contentView];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [contentView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    [self.view layoutIfNeeded];
    [contentView sdc_pinWidth:w];
}


///////////////////// Stack View /////////////////////

- (void)prepareStackView {
    stackView = [MyVerticalStackView new];
    
    [contentView addSubview:stackView];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [stackView sdc_alignSideEdgesWithSuperviewInset:10];
    [stackView sdc_alignEdge:UIRectEdgeTop withEdge:UIRectEdgeBottom ofView:collectionView inset:50];
    
    stackView.backgroundColor = [UIColor clearColor];
    
    [self prepareInformationsView];
    
    [stackView sdc_alignEdge:UIRectEdgeBottom withEdge:UIRectEdgeBottom ofView:contentView];
}


- (void)prepareInformationsView {
    if (_str_ok2(dataSet[@"title"])) {
        [self navigationTitleWithString:dataSet[@"title"]];
    }
 
    if (_str_ok2(dataSet[@"address"])) {
        [self prepareSubViewWithCaption:@"آدرس:" ansDesc:dataSet[@"address"]];
    }
    
    if (_str_ok2(dataSet[@"phone"])) {
        [self prepareSubViewWithCaption:@"آدرس:" ansDesc:[Helper_Palette convertEnNumberToFarsi:dataSet[@"phone"]]];
    }
    
    if (dataSet[@"date"] && [dataSet[@"date"] isKindOfClass:[NSMutableDictionary class]]) {
        [self prepareSubViewWithCaption:@"تاریخ:" ansDesc:@"tooodooo"];
    }
    
    if (dataSet[@"hour"] && [dataSet[@"hour"] isKindOfClass:[NSMutableDictionary class]]) {
        [self prepareSubViewWithCaption:@"ساعت:" ansDesc:@"tooodooo"];
    }
    
    if (_str_ok2(dataSet[@"desc"])) {
        [self prepareSubViewWithCaption:@"توضیحات:" ansDesc:dataSet[@"desc"]];
    }
}


- (void)prepareSubViewWithCaption:(NSString *)cap ansDesc:(NSString *)des {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
    view.layer.cornerRadius = 5;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = 5;
    view.layer.shadowOpacity = 0.5;
    
    
    UILabel *caption = [UILabel new];
    
    [view addSubview:caption];
    caption.translatesAutoresizingMaskIntoConstraints = NO;
    [caption sdc_alignEdgesWithSuperview:UIRectEdgeRight insets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [caption sdc_pinWidth:75];
    
    caption.text = cap;
    caption.font = [UIFont fontWithName:@"IRANYekanMobile-Bold" size:15];
    caption.textColor = turquoiseColor;
    caption.textAlignment = NSTextAlignmentLeft;
    
    
    
    
    //    NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
    //    paragraphStyles.alignment = NSTextAlignmentJustified;
    //    paragraphStyles.firstLineHeadIndent = 15.0;
    //    [paragraphStyles setAlignment:NSTextAlignmentJustified];
    //
    //    NSDictionary *attributes = @{NSParagraphStyleAttributeName: paragraphStyles, NSFontAttributeName: [UIFont fontWithName:@"IRANYekanMobile-Light" size:15] , NSForegroundColorAttributeName: [UIColor blackColor], };
    //
    //    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString: des attributes: attributes];
    //
    
    
    
    UILabel *desc = [UILabel new];
    
    [view addSubview:desc];
    desc.translatesAutoresizingMaskIntoConstraints = NO;
    [desc sdc_alignEdgesWithSuperview:UIRectEdgeAll ^ UIRectEdgeRight insets:UIEdgeInsetsMake(10, 10, -5, 0)];
    [desc sdc_alignEdge:UIRectEdgeRight withEdge:UIRectEdgeLeft ofView:caption inset:0];
    [desc sdc_alignEdge:UIRectEdgeTop withEdge:UIRectEdgeTop ofView:caption];
    
    
    [desc setAttributedText:[Helper_Palette MakeJustified_Text:des Font:[UIFont fontWithName:@"IRANYekanMobile-Light" size:15]]];
    
    //    desc.text = des;
    //    desc.font = [UIFont fontWithName:@"IRANYekanMobile-Light" size:15];
    //    desc.textColor = [UIColor blackColor];
    //
    //    desc.adjustsFontSizeToFitWidth = YES;
    
    //    desc.textAlignment = NSTextAlignmentJustified;
    
    //    desc.attributedText = attributedString;
    
    desc.numberOfLines = 0;
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [stackView addArrangedSubview:view margins:UIEdgeInsetsMake(10, 10, 10, 10) animated:NO fillMode:MyVerticalStackViewFillModeFill initiallyHidden:NO];
}

- (void)navigationTitleWithString:(NSString*)str {
    self.title = str;
    
}



///////////////////// Collection View /////////////////////

- (void)prepareCollectionView {
    _defineDeviceHeight;
    
    collectionView = [[GalleryDetailsCV alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewLayout new]];
    [contentView addSubview:collectionView];
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [collectionView sdc_alignEdgesWithSuperview:UIRectEdgeAll ^ UIRectEdgeBottom];
    [collectionView sdc_pinHeight:h / 3];
    
    collectionView.backgroundColor = [UIColor clearColor];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:dataSet[@"image"], nil];
    
    [collectionView configureWithArray:array];
}

@end
