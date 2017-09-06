//
//  EventDetailsCVC.m
//  Palette
//
//  Created by Ali Soume`e on 6/13/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "EventDetailsCVC.h"

@interface EventDetailsCVC()
{
    bool isInitialized;
}

@property (nonatomic) UIImageView *imageView;

@end


@implementation EventDetailsCVC

@synthesize imageView;

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
}

- (void)configureWithURL:(NSString *)url {
    
    [self.contentView sdc_removeAllSubViews];
    
    [self.contentView addSubview:imageView];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView sdc_alignEdgesWithSuperview:UIRectEdgeAll];
    
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 5;
    
    [imageView HyperCacheSetImageWithURL:url];
}


@end
