//
//  tools.h
//  Spray
//
//  Created by luoxian on 16/4/26.
//  Copyright © 2016年 luoxian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBProgressHUD.h"
@interface tools : NSObject
+ (NSString *)Date2StrV:(NSDate *)indate;
+ (NSString *)Date2Str:(NSDate *)indate;
+ (void)MsgBox:(NSString *)msg;

+ (NSDateComponents *)DateInfo:(NSDate *)indate;

+ (void)OpenUrl:(NSString *)inUrl;

+ (void)showHUD:(NSString *)msg;
+ (void)removeHUD;

@end
