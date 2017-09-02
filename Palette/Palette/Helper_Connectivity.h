//
//  Helper_Connectivity.h
//  Palette
//
//  Created by Ali Soume`e on 1/12/1396 AP.
//  Copyright © 1396 Ali-Soume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

#define _server_address @"http://207.154.234.68:8000"
//#define _server_address @"http://192.168.43.30:8000"

@interface Helper_Connectivity : NSObject

+ (void)getGalleyDictionaryWithParameter:(NSMutableDictionary *)parameters andSuccessHandler:(void (^)(NSMutableDictionary *dic))successHandler andFailHandler:(void (^)(void))failHandler;

+ (void)searchByDictionary:(NSMutableDictionary *)parameters andSuccessHandler:(void (^)(NSMutableDictionary *dic))successHandler andFailHandler:(void (^)(void))failHandler;
@end
