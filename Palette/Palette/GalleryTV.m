//
//  GalleryTV.m
//  Palette
//
//  Created by Ali Soume`e on 6/11/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "GalleryTV.h"
#import "GalleryTVC.h"


@interface GalleryTV() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *dataSet;

@end


@implementation GalleryTV

@synthesize dataSet;


- (void)configurationWithDataSet:(NSMutableArray *)data {
    dataSet = data;
    
    if (dataSet) {
        dataSet = [NSMutableArray new];
    }
    
    [self registerClass:[GalleryTVC class] forCellReuseIdentifier:@"GalleryTVC"];
    
    self.delegate = self;
    self.dataSource = self;
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.showsVerticalScrollIndicator = NO;
}

///////////////////// Delegate /////////////////////

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}



///////////////////// Data Source /////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [dataSet count];
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GalleryTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"GalleryTVC" forIndexPath:indexPath];
    
    return cell;
}




@end
