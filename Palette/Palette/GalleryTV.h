//
//  GalleryTV.h
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GalleryCVDelegate <NSObject>

- (void)didSelectCellWithDictionary:(NSMutableDictionary *)dic;

@end


@interface GalleryTV : UITableView

@property (nonatomic, weak) id <GalleryCVDelegate> delegat;

- (void)configurationWithDataSet:(NSMutableArray *)data;

@end
