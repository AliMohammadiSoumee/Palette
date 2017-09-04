//
//  EventCVL.m
//  Palette
//
//  Created by Ali Soume`e on 6/12/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "EventCVL.h"

@interface EventCVL()

@property (nonatomic) CGFloat horSpace;
@property (nonatomic) CGFloat verSpace;
@property (nonatomic) CGFloat yOffsetL;
@property (nonatomic) CGFloat yOffsetR;
@property (nonatomic) CGFloat xOffsetL;
@property (nonatomic) CGFloat xOffsetR;
@property (nonatomic) CGFloat cellWidth;
@property (nonatomic) CGFloat collectoinWidth;

@end


@implementation EventCVL

@synthesize delegate;

@synthesize horSpace;
@synthesize verSpace;
@synthesize yOffsetL;
@synthesize yOffsetR;
@synthesize xOffsetL;
@synthesize xOffsetR;
@synthesize cellWidth;
@synthesize collectoinWidth;



- (void)prepareLayout {
    self.layoutAttributes = [NSMutableDictionary new];
    
    collectoinWidth = self.collectionView.bounds.size.width;
    horSpace = 15;
    verSpace = 15;
    cellWidth = (collectoinWidth - horSpace) / 2;
    yOffsetL = 0;
    yOffsetR = 0;
    xOffsetL = 0;
    xOffsetR = cellWidth + horSpace;
    
    
    for (int section = 0; section < self.collectionView.numberOfSections; section++) {
        
        NSIndexPath *headerIndexPath = [NSIndexPath indexPathForRow:0 inSection:section];
        UICollectionViewLayoutAttributes *headerAtt = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:headerIndexPath];
        
        CGFloat headerY = MAX(yOffsetL, yOffsetR);
        CGFloat headerX = 0;
        CGFloat headerWidth = collectoinWidth;
        CGFloat headerHeight = 40;
        if ([delegate respondsToSelector:@selector(heightForHeaderForSection:)]) {
            headerHeight = [delegate heightForHeaderForSection:section];
        }
        
        headerAtt.frame = CGRectMake(headerX, headerY, headerWidth, headerHeight);
        NSString *headerKey = [self layoutKeyForHeaderAtIndexPath:headerIndexPath];
        self.layoutAttributes[headerKey] = headerAtt;
        
        yOffsetL = headerHeight + headerY + verSpace;
        yOffsetR = headerHeight + headerY + verSpace;
        
        
        for (int row = 0; row < [self.collectionView numberOfItemsInSection:section]; row++) {
            
            NSIndexPath *cellIndexPath = [NSIndexPath indexPathForRow:row inSection:section];
            UICollectionViewLayoutAttributes *cellAtt = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:cellIndexPath];
            
            CGRect cellFrame = CGRectZero;
            if (yOffsetL <= yOffsetR) {
                
                CGFloat cellHeigth = 200;
                if ([delegate respondsToSelector:@selector(heightForCellWithIndexPath:andWidth:)]) {
                    cellHeigth = [delegate heightForCellWithIndexPath:cellIndexPath andWidth:cellWidth];
                }
                cellFrame = CGRectMake(xOffsetL, yOffsetL, cellWidth, cellHeigth);
                
                yOffsetL += cellHeigth + verSpace;
            }
            
            else {
                CGFloat cellHeigth = 200;
                if ([delegate respondsToSelector:@selector(heightForCellWithIndexPath:andWidth:)]) {
                    cellHeigth = [delegate heightForCellWithIndexPath:cellIndexPath andWidth:cellWidth];
                }
                cellFrame = CGRectMake(xOffsetR, yOffsetR, cellWidth, cellHeigth);
                
                yOffsetR += cellHeigth + verSpace;
            }
            
            cellAtt.frame = cellFrame;
            NSString *cellKey = [self layoutKeyForIndexPath:cellIndexPath];
            self.layoutAttributes[cellKey] = cellAtt;
        }
    }
    
    self.contentSize = CGSizeMake(collectoinWidth, MAX(yOffsetL, yOffsetR) + 10);
}












@end
