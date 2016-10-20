//
//  Http.m
//  
//
//  Created by Aisino on 16/7/18.
//
//

#import "Http.h"
#import "AFNetworking.h"

@implementation Http


+(void)NetWorkGETWithRequestURL:(NSString *)requestURL WithPara:(NSDictionary *)dict WithSuccessBlock:(SuccessBlock) block WithErroBlock:(ErroBlock)errorBlock WithFailure:(FailureBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer  serializer];
    [manager GET:requestURL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        block(dict);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        failureBlock(error);
    
    }];
    
}


+(void)NetWorkPOSTWithRequestURL:(NSString *)requestURL WithPara:(NSDictionary *)dict WithSuccessBlock:(SuccessBlock)block WithErroBlock:(ErroBlock)errorBlock WithFailure:(FailureBlock)blcok{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer  serializer];
    [manager POST:requestURL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        blcok(dict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        blcok(error);
        
    }];
    
}

@end
