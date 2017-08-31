//
//  DarkGradientView.h
//  macTehran
//
//  Created by Hamidreza Vaklian on 2/8/16.
//  Copyright © 2016 Hamidreza Vaklian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientView : UIView

@property (retain, nonatomic) NSArray* colors; //order: top to bottom
@property (retain, nonatomic) NSArray* locations; //order: top to bottom

@end
