//
//  ViewController.m
//  OC_1_4
//
//  Created by 赵鑫 on 16/3/17.
//  Copyright © 2016年 赵鑫. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

        - (void)viewDidLoad {
            [super viewDidLoad];
            
            NSString *urlString = @"http://121.43.112.141:8081/api/1.0/coach/coachinfo/changePassword";
            
            NSDictionary *param = @{@"coachPhone":@"12345678",@"coachPassword":@"123456"};
            
           
            [RequestUntils  getJson:urlString :param :self ];
            


            // Do any additional setup after loading the view, typically from a nib.
        }

        -(void)requestSuccess:(NSObject *)json :(NSString *)message {

            NSLog(@"1.%@",message);
        }

        -(void)requestDataNull:(NSString *)message{

            NSLog(@"2.%@",message);
        }

        -(void) requestFailure:(NSString *)message{

            NSLog(@"3.%@",message);
        }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
