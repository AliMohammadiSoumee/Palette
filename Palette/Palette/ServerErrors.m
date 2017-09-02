//
//  ServerErrors.m
//  Palette
//
//  Created by Ali Soume`e on 5/6/1396 AP.
//  Copyright © 1396 Ali-Soume. All rights reserved.
//

#import "ServerErrors.h"

@implementation ServerErrors

+ (void)handleErrorWithTask:(NSURLSessionDataTask*)task andError:(NSError*)error fromPart:(NSString*)part {
    
    NSDictionary *responseDic = [NSDictionary new];
    NSError *responseError = nil;
    if (error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey]){
        responseDic = [NSJSONSerialization JSONObjectWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:NSJSONReadingMutableContainers error:&responseError];
    }
    
    NSLog(@"%@", responseDic);
    NSLog(@"%@", responseError);
    
    if (!responseError) {
        
        NSString *errDesc = [NSString stringWithFormat: @"%@", responseDic[@"errorDescription"]];
        
        if ([errDesc isEqualToString:_internalServerError]) {
            NSLog(@"%@Error  --- > ", _internalServerError);
        }
        else if ([errDesc isEqualToString:_badRequestError]) {
            NSLog(@"%@Error  --- > ", _badRequestError);
        }
        else if ([errDesc isEqualToString:_wrongDeviceToken]) {
            NSLog(@"%@Error  --- > ", _wrongDeviceToken);
        }
        else if ([errDesc isEqualToString:_wrongUsernameOrPassword]) {
            NSLog(@"%@Error  --- > ", _wrongUsernameOrPassword);
        }
        else if ([errDesc isEqualToString:_invalidPhoneNumber]) {
            NSLog(@"%@Error  --- > ", _invalidPhoneNumber);
        }
        else if ([errDesc isEqualToString:_phoneNumberExists]) {
            NSLog(@"%@Error  --- > ", _phoneNumberExists);
        }
        else if ([errDesc isEqualToString:_wrongPhoneNumberOrVerificationCode]) {
            NSLog(@"%@Error  --- > ", _wrongPhoneNumberOrVerificationCode);
        }
        else if ([errDesc isEqualToString:_usernameExists]) {
            NSLog(@"%@Error  --- > ", _usernameExists);
        }
        else if ([errDesc isEqualToString:_userIsNotRegistered]) {
            NSLog(@"%@Error  --- > ", _userIsNotRegistered);
        }
        else {
            NSLog(@"%@  --- > inja responseError darim", part);
        }
    }
    else {
        NSLog(@"%@  --- > inja responseError darim", part);
    }
}
@end
