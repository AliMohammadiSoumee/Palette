//
//  GalleryDetailsCV.m
//  Palette
//
//  Created by Ali Soume`e on 6/15/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "GalleryDetailsCV.h"
#import "GalleryDetailsCVC.h"

@interface GalleryDetailsCV()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSMutableArray *dataSet;

@end


@implementation GalleryDetailsCV

@synthesize dataSet;

- (void)configureWithArray:(NSMutableArray *)dic {
    dataSet = dic;
    if (!dataSet)
        dataSet = [NSMutableArray new];
    
    [self registerClass:[GalleryDetailsCVC class] forCellWithReuseIdentifier:@"GalleryDetailsCVC"];
    
    self.delegate = self;
    self.dataSource = self;
    
    UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionViewLayout = flow;
    
    self.contentInset = UIEdgeInsetsMake(5, 20, 5, 20);
    
    self.transform = CGAffineTransformMakeScale(-1, 1);
}


///////////////////// Collection Delegate /////////////////////


///////////////////// Collection Data Source /////////////////////

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [dataSet count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GalleryDetailsCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GalleryDetailsCVC" forIndexPath:indexPath];
    
    cell.contentView.transform = CGAffineTransformMakeScale(-1, 1);
    
    if ([dataSet isKindOfClass:[NSMutableArray class]]) {
        
        NSInteger num = [dataSet count];
        NSString *url = _strfmt(@"%@", dataSet[indexPath.row % num]);
        
        [cell configureWithURL:url];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = collectionView.bounds.size.height - collectionView.contentInset.top - collectionView.contentInset.bottom;
    CGFloat width = height / sqrt(2);
    return CGSizeMake(width, height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

@end
