//
//  Helper_Connectivity.m
//  Palette
//
//  Created by Ali Soume`e on 1/12/1396 AP.
//  Copyright © 1396 Ali-Soume. All rights reserved.
//

#import "Helper_Connectivity.h"
#import "ServerErrors.h"





@implementation Helper_Connectivity

static AFHTTPSessionManager *httpManager;

+ (AFHTTPSessionManager*)getAFHTTPSessoinManager {
    if (!httpManager) {
        NSURL *url = [NSURL URLWithString:_server_address];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        httpManager = [[AFHTTPSessionManager alloc]initWithBaseURL:url sessionConfiguration:configuration];
        httpManager.requestSerializer = [AFJSONRequestSerializer serializer];
        httpManager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions: NSJSONReadingMutableContainers];
        
        [httpManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    
    return httpManager;
}

+ (void)getGalleyDictionaryWithParameter:(NSMutableDictionary *)parameters andSuccessHandler:(void (^)(NSMutableDictionary *dic))successHandler andFailHandler:(void (^)(void))failHandler {

    
    [[Helper_Connectivity getAFHTTPSessoinManager] POST:@"/gallery/" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSMutableDictionary class]]) {
            successHandler(responseObject);
        }
        else
            successHandler([NSMutableDictionary new]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [ServerErrors handleErrorWithTask:task andError:error fromPart:@"Profile"];
        
        failHandler();
    }];
    
    
}

+ (void)searchByDictionary:(NSMutableDictionary *)parameters andSuccessHandler:(void (^)(NSMutableDictionary *dic))successHandler andFailHandler:(void (^)(void))failHandler {
    
//    parameters[@"statement"] = @"";
    
    [[Helper_Connectivity getAFHTTPSessoinManager] POST:@"/search/" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSMutableDictionary class]]) {
            successHandler(responseObject);
        }
        else
            successHandler([NSMutableDictionary new]);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        [ServerErrors handleErrorWithTask:task andError:(NSError*)error fromPart:(NSString*)@"Serach"];
        
        failHandler();
        
    }];
    
}
@end
