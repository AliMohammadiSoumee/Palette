//
//  _tableViewHeaderFooterBase.m
//  FieldBooker
//
//  Created by hAmidReza on 5/12/17.
//  Copyright © 2017 innovian. All rights reserved.
//

#import "_tableViewHeaderFooterBase.h"

@interface _tableViewHeaderFooterBase ()
{
	BOOL initialized;
}

@end

@implementation _tableViewHeaderFooterBase

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithReuseIdentifier:reuseIdentifier];
	if (self)
	{
		[self _initialize];
	}
	return self;
}

-(void)_initialize
{
	if (!initialized)
	{
		[self initialize];
		initialized = YES;
	}
}

-(void)initialize
{
	
}

+(NSString*)reuseIdentifier
{
	static NSString* cellReuseIdentifier;
	if (!cellReuseIdentifier)
		cellReuseIdentifier = NSStringFromClass([self class]);
	return cellReuseIdentifier;
}


@end
