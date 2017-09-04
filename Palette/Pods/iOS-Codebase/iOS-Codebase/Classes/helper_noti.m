//
//  helper_noti.m
//  Pods
//
//  Created by hAmidReza on 8/17/17.
//
//

#import "helper_noti.h"
#import "Codebase_definitions.h"

@implementation helper_noti

+(NSMutableDictionary*)lookupTable
{
	static NSMutableDictionary* lookup_table;
	if (!lookup_table)
		lookup_table = [NSMutableDictionary new];
	return lookup_table;
}

+(void)noti:(NSString *)name owner:(id)owner block:(void (^)(NSNotification *))block
{
	NSMutableDictionary* lookup = [self lookupTable];
	if (owner)
	{
		NSString* key = _strfmt(@"%p", owner);
		if (lookup[key])
		{
			NSMutableDictionary* innerLookup = lookup[_strfmt(@"%p", owner)];
			innerLookup[name] = block;
		}
		else
		{
			NSMutableDictionary* innerLookup = [NSMutableDictionary new];
			innerLookup[key] = block;
			lookup[key] = innerLookup;
		}
	}
	else
	{
		
	}
	
}

+(void)removeNotisForOwner:(id)owner
{
	
}

+(helper_noti*)mainInstance
{
	static helper_noti* instance;
	if (!instance)
		instance = [helper_noti new];
	return instance;
}

//+(void)load
//{
//	[self mainin]
//}

-(instancetype)init
{
	self = [super init];
	if (self)
	{
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:nil object:nil];
	}
	return self;
}

-(void)noti:(NSNotification*)noti
{
	
}

@end
