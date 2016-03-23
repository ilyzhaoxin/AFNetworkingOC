//
//  RequestDelegate.h
//  OC_1_4
//
//  Created by 赵鑫 on 16/3/23.
//  Copyright © 2016年 赵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestDelegate <NSObject>

@optional

///请求成功
-(void) requestSuccess: (NSObject *)json :(NSString *) message;
///请求数据为空
-(void) requestDataNull: (NSString *)message;
/// 请求失败
-(void) requestFailure: (NSString *) message;

@end


