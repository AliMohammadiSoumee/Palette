//
//  EventCV.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "EventCV.h"
#import "EventCVC.h"
#import "EventCVL.h"

@interface EventCV() <UICollectionViewDelegate, UICollectionViewDataSource, EventCVLDelegate>

@property (nonatomic) NSMutableArray *dataSet;
@property (nonatomic) EventCVL *layout;

@end


@implementation EventCV

@synthesize dataSet;
@synthesize layout;


- (void)configurationWithDataSet:(NSMutableArray *)data {
    dataSet = data;

    if (!dataSet) {
        dataSet = [NSMutableArray new];
    }
    
    [self registerClass:[EventCVC class] forCellWithReuseIdentifier:@"EventCVC"];
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
    self.showsVerticalScrollIndicator = NO;
    
    layout = [EventCVL new];
    self.collectionViewLayout = layout;
    layout.delegate = self;
    
    self.delegate = self;
    self.dataSource = self;
    
    self.backgroundColor = [UIColor clearColor];
}


///////////////////// Collection Delegate /////////////////////

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegat respondsToSelector:@selector(didSelectCellWithDictionary:)]) {
        [self.delegat didSelectCellWithDictionary:dataSet[indexPath.row]];
    }
}

///////////////////// Collection Data Source /////////////////////

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return [dataSet count];
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    id array = dataSet[section];
//    if ([array isKindOfClass:[NSMutableArray class]])
//        return [array count];
    
//    return 0;
    return [dataSet count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EventCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventCVC" forIndexPath:indexPath];
    
    [cell configurationWithDictionary:dataSet[indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        [header sdc_removeAllSubViews];
        
        UILabel *label = [UILabel new];
        [header addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [label sdc_alignEdgesWithSuperview:UIRectEdgeAll];
        
        label.backgroundColor = [UIColor clearColor];
        
        label.font = [UIFont fontWithName:@"IRANYekanMobile-Bold" size:24];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"رویدادهای حال";

        
        return header;
    }
    return nil;
}



///////////////////// Collection Delegate /////////////////////

- (CGFloat)heightForCellWithIndexPath:(NSIndexPath *)indexPath andWidth:(CGFloat)width {
    
    //junk
    CGFloat w = [@([Helper_Palette getRandomNumberBetween:100 to:200]) floatValue];
    CGFloat h = [@([Helper_Palette getRandomNumberBetween:150 to:250]) floatValue];

//    dataSet[indexPath.section][indexPath.row][@"width"] = @([Helper_Palette getRandomNumberBetween:100 to:200]);
//    dataSet[indexPath.section][indexPath.row][@"height"] = @([Helper_Palette getRandomNumberBetween:150 to:250]);
    
//    CGFloat w = [dataSet[indexPath.section][indexPath.row][@"width"] floatValue];
//    CGFloat h = [dataSet[indexPath.section][indexPath.row][@"height"] floatValue];
    
    if (w != 0)
        return h * width / w + 70;

    return 200;
}

- (CGFloat)heightForHeaderForSection:(int)section {
    return 50;
}

@end
