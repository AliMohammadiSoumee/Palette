//
//  FullHeightTable.m
//  mactehrannew
//
//  Created by hAmidReza on 8/12/17.
//  Copyright © 2017 archibits. All rights reserved.
//

#import "FullHeightTable.h"
#import "UIView+SDCAutoLayout.h"

@implementation FullHeightTable

-(void)layoutSubviews
{
	[super layoutSubviews];
	
	CGFloat h = self.contentSize.height;
	
	NSLayoutConstraint* possibleHeightCon = [self sdc_get_height];
	if (!possibleHeightCon)
		possibleHeightCon = [self sdc_pinHeight:h];
	else if (fabs(possibleHeightCon.constant - h) > 0.001)
	{
		possibleHeightCon.constant = h;
		[self setNeedsLayout];
	}
	
	self.scrollEnabled = NO;
}

@end
