//
//  MyCollectionViewLayoutBase.m
//  Prediscore
//
//  Created by Hamidreza Vaklian on 7/31/16.
//  Copyright © 2016 pxlmind. All rights reserved.
//

#import "_collectionViewLayoutBase.h"

@implementation _collectionViewLayoutBase

- (NSString *)layoutKeyForIndexPath:(NSIndexPath *)indexPath
{
	return (NSString*)@( indexPath.section*100 + indexPath.row);
}

- (NSString *)layoutKeyForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    return [NSString stringWithFormat:@"s_%ld_%ld", indexPath.section, indexPath.row];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *headerKey = [self layoutKeyForHeaderAtIndexPath:indexPath];
    return _layoutAttributes[headerKey];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self layoutKeyForIndexPath:indexPath];
    return _layoutAttributes[key];
}

- (CGSize)collectionViewContentSize
{
    return _contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {
        UICollectionViewLayoutAttributes *layoutAttribute = _layoutAttributes[evaluatedObject];
        return CGRectIntersectsRect(rect, [layoutAttribute frame]);
    }];
    
    NSArray *matchingKeys = [[_layoutAttributes allKeys] filteredArrayUsingPredicate:predicate];
    return [_layoutAttributes objectsForKeys:matchingKeys notFoundMarker:[NSNull null]];
}

// just prevent from creating a NSMutableDictionary every time prepareLayout executes
-(NSMutableDictionary *)layoutAttributes
{
	if (!_layoutAttributes)
		_layoutAttributes = [NSMutableDictionary new];
	return _layoutAttributes;
}

-(NSMutableArray*)elementsInRectArray
{
	static NSMutableArray* elementsInRectArray;
	if (!elementsInRectArray)
		elementsInRectArray = [NSMutableArray new];
	return elementsInRectArray;
}

@end
