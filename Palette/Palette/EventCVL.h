//
//  EventCVL.h
//  Palette
//
//  Created by Ali Soume`e on 6/12/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewLayoutBase.h"

@protocol EventCVLDelegate <NSObject>

- (CGFloat)heightForCellWithIndexPath:(NSIndexPath *)indexPath andWidth:(CGFloat)width;
- (CGFloat)heightForHeaderForSection:(int)section;

@end


@interface EventCVL : MyCollectionViewLayoutBase

@property (nonatomic, weak) id <EventCVLDelegate> delegate;

@end
