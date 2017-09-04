//
//  helper_noti.h
//  Pods
//
//  Created by hAmidReza on 8/17/17.
//
// NOT COMPLETED: i thought i can make the nsnotificationcenter easier but it seems it will cause retain cycle.

#import <Foundation/Foundation.h>

@interface helper_noti : NSObject

+(void)noti:(NSString*)name owner:(id)owner block:(void (^)(NSNotification* noti))block;
+(void)removeNotisForOwner:(id)owner;

@end
