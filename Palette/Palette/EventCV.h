//
//  EventCV.h
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EventCVDelegate <NSObject>

- (void)didSelectCellWithDictionary:(NSMutableDictionary *)dic;

@end

@interface EventCV : UICollectionView

@property (nonatomic, weak) id <EventCVDelegate> delegat;

- (void)configurationWithDataSet:(NSMutableArray *)data;

@end
