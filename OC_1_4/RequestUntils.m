//
//  RequestUntils.m
//  OC_1_4
//
//  Created by 赵鑫 on 16/3/23.
//  Copyright © 2016年 赵鑫. All rights reserved.
//

#import "RequestUntils.h"
#import "AFNetworking.h"

@implementation RequestUntils

+(void) getJson: (NSString *)url : (NSDictionary *)parpam : (id<RequestDelegate>) requestDelegate{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parpam options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSDictionary *parameters = @{@"data":jsonString};

        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
            NSString *code = [responseObject valueForKey:@"code"];
            NSString *message = [responseObject valueForKey:@"message"];
            NSLog(@"1code:%@",code);
            NSLog(@"1message:%@",message);


            
            if ([code isEqualToString:@"E01"]) {
            
                [requestDelegate requestFailure:message];
            }
            
            else if ([code isEqualToString:@"N01"]){
                
                NSLog(@"code:%@",code);
            
                NSObject *content = [responseObject valueForKey:@"contents"];
                
                if (content) {
                
                    [requestDelegate requestSuccess:content :message];
                    
                }
                
                else {
                
                    [requestDelegate requestDataNull:message];
                }
            }
            
                
    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
            
            [requestDelegate requestFailure:@"错误"];
        }];
    
}
@end
