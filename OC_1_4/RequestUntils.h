//
//  RequestUntils.h
//  OC_1_4
//
//  Created by 赵鑫 on 16/3/23.
//  Copyright © 2016年 赵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestDelegate.h"

@interface RequestUntils : NSObject

+(void) getJson: (NSString *)url : (NSDictionary *)parpam : (id<RequestDelegate>) requestDelegate;


@end

