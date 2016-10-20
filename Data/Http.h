//
//  Http.h
//  
//
//  Created by Aisino on 16/7/18.
//
//

#import <Foundation/Foundation.h>
typedef void(^SuccessBlock)(id returnValue);
typedef void(^ErroBlock)(id erroCode);
typedef void(^FailureBlock)(id error);
typedef void(^NetWorkBlock)(BOOL netConnectStatus);
@interface Http : NSObject

#pragma  mark - 网络监测
//+(BOOL)netWorkReachabilityURLString:(NSString*)strURL;

#pragma mark POST请求
+(void)NetWorkPOSTWithRequestURL:(NSString *)requestURL WithPara:(NSDictionary *)dict WithSuccessBlock:(SuccessBlock)block WithErroBlock:(ErroBlock)errorBlock WithFailure:(FailureBlock)blcok;
#pragma mark GET请求
+(void)NetWorkGETWithRequestURL:(NSString *)requestURL WithPara:(NSDictionary *)dict WithSuccessBlock:(SuccessBlock)block WithErroBlock:(ErroBlock)errorBlock WithFailure:(FailureBlock)failureBlock;

@end
