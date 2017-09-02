//
//  ServerErrors.h
//  Palette
//
//  Created by Ali Soume`e on 5/6/1396 AP.
//  Copyright © 1396 Ali-Soume. All rights reserved.
//

#import <Foundation/Foundation.h>

#define _internalServerError @"internalServerError"
#define _badRequestError @"badRequestError"
#define _wrongDeviceToken @"wrongDeviceToken"
#define _wrongUsernameOrPassword @"wrongUsernameOrPassword"
#define _invalidPhoneNumber @"invalidPhoneNumber"
#define _phoneNumberExists @"phoneNumberExists"
#define _wrongPhoneNumberOrVerificationCode @"wrongPhoneNumberOrVerificationCode"
#define _usernameExists @"usernameExists"
#define _userIsNotRegistered @"userIsNotRegistered"

@interface ServerErrors : NSObject

+ (void)handleErrorWithTask:(NSURLSessionDataTask*)task andError:(NSError*)error fromPart:(NSString*)part;

@end
