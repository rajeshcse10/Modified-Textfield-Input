//
//  MyTextFieldUtils.h
//  LiveTracking
//
//  Created by Rajesh Karmaker on 3/6/18.
//  Copyright © 2018 Rajesh Karmaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTextFieldUtils : NSObject
+(NSLocale *)getKeyboardLocale;
+(NSLocale *)getDeviceLocale;
+(NSNumberFormatter *)getFormatterWithLocale:(NSLocale *)locale;
+(NSString *)getDecimalSeparator;
+(NSRegularExpression *)createLocalizedRegEx;
+(NSString *)convertToDeviceString:(NSString *)string;
@end
